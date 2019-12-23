---
# title: "Titanic Survival - Logistic Regression"
---

## ----------------------------------------------------------------------------------------------------------------------------
# Splitting the data into test and train

library(caTools)
set.seed(390)
split.dataset <- sample.split(featured.training.dataset, SplitRatio = 0.8)
split.dataset
class(split.dataset)


## ----------------------------------------------------------------------------------------------------------------------------

training.dataset <- subset(featured.training.dataset, split.dataset == TRUE)
test.dataset <- subset(featured.training.dataset, split.dataset== "FALSE")



## ----------------------------------------------------------------------------------------------------------------------------
str(training.dataset)
cat("\n\n")
str(test.dataset)


## ----------------------------------------------------------------------------------------------------------------------------
# Train model with logistics regression using glm function
# Step 1: Without feature engineering
# Removing PassengerID, Name and Ticket, Child, Title and Family Size

logistic.model.1 <- glm(Survived ~., family = binomial(link='logit'),
                        data = training.dataset[-c(1,4,9,12,13,14)])
summary(logistic.model.1)
# AIC: 626


## ----------------------------------------------------------------------------------------------------------------------------
# Step 2: With feature engineering

# Removing PassengerID, Name and Ticket
logistic.model.2 <- glm(Survived ~., family = binomial(link='logit'),
                        data = training.dataset[-c(1,4,9, 13)])
summary(logistic.model.2)
# AIC: 623, Pclass, Age, Sibsp, Parch


## ----------------------------------------------------------------------------------------------------------------------------
anova(logistic.model.1, logistic.model.2, test= "Chisq")


## ----------------------------------------------------------------------------------------------------------------------------
# with null deviance
anova(logistic.model.2, test = 'Chisq')


## ----------------------------------------------------------------------------------------------------------------------------
# Ste 3: Predict test data based on trained logistic.model.2

fitted.results <- predict(logistic.model.2, 
                          newdata = test.dataset, 
                          type = 'response')


## ----------------------------------------------------------------------------------------------------------------------------
# Step 4: Change Probabilities to class (0 or 1/ Yes or No)
# If prob > 0.5 then 1, else 0. Threshold can be set for better results

fitted.results <- ifelse(fitted.results > 0.5, 1, 0)


## ----------------------------------------------------------------------------------------------------------------------------
install.packages("caret", dependencies = c("Depends", "Suggests"))


## ----------------------------------------------------------------------------------------------------------------------------
# ROC - AUC Curve
install.packages("ROCR")



## ----------------------------------------------------------------------------------------------------------------------------
library(ROCR)
ROCRPred <- prediction(fitted.results, test.dataset$Survived)
ROCRPref <- performance(ROCRPred, measure = "tpr", x.measure = "fpr")



## ----------------------------------------------------------------------------------------------------------------------------
par(mfrow = c(1, 1))
plot(ROCRPref, colorize = TRUE, print.cutoffs.at = seq(0.1, by = 0.1), main = "ROC CURVE")
abline(a=0, b=1)

auc <- performance(ROCRPred, measure = "auc")
auc <- auc@y.values[[1]]
auc <- round(auc, 4)
legend (.6, .4, auc, title = "AUC", cex = 1)


## ----------------------------------------------------------------------------------------------------------------------------
# Making predictions on test dataset

my_prediction <- predict(logistic.model.2, featured.test.dataset, type = "response")


## ----------------------------------------------------------------------------------------------------------------------------
# If pro > 0.5 then 1, else 0, Threshold can be set for better results
my_prediction <- ifelse(my_prediction > 0.5, 1, 0)


## ----------------------------------------------------------------------------------------------------------------------------
# Finish the dataframe call
my_solution <- data.frame(PassengerID = featured.test.dataset$PassengerId,
                          Survived = my_prediction)
head(my_solution)


## ----------------------------------------------------------------------------------------------------------------------------
nrow(my_solution)


## ----------------------------------------------------------------------------------------------------------------------------
str(my_solution)


## ----------------------------------------------------------------------------------------------------------------------------
write.csv(my_solution, file = "My_solution.csv", row.names = FALSE)



## ----------------------------------------------------------------------------------------------------------------------------
############## Testing with featured.train.dataset ################
logistic.model.3 <- glm(Survived ~., family = binomial(link='logit'),
                        data = featured.training.dataset[-c(1,4,9)])
summary(logistic.model.3)
# AIC: 763


## ----------------------------------------------------------------------------------------------------------------------------
# Making predictions on test dataset

my_prediction <- predict(logistic.model.3, featured.test.dataset, type = "response")


## ----------------------------------------------------------------------------------------------------------------------------
# If pro > 0.5 then 1, else 0, Threshold can be set for better results
my_prediction <- ifelse(my_prediction > 0.5, 1, 0)


## ----------------------------------------------------------------------------------------------------------------------------
# Finish the dataframe call
my_solution2 <- data.frame(PassengerID = featured.test.dataset$PassengerId,
                          Survived = my_prediction)
head(my_solution2)


## ----------------------------------------------------------------------------------------------------------------------------
write.csv(my_solution, file = "My_solution2.csv", row.names = FALSE)

