---
# title: "Titanic Survival prediction Part 1: Data Prediction model"
---

## --------------------------------------------------------------------------------------------
## Data Dictionary                                      Key

## Variable    Definition                                  0 = No, 1 = Yes for survival
## survival    Survival                                    1 = 1st, 2 = 2nd, 3 = 3rd
## pclass      Ticket class                                pclass, 1st = Upper, 2nd = Middle, 3rd = Lower
## sex         Sex
## Age         Age in years
## sibsp       # of siblings / spouses aboard in Titanic - brother, sister, stepbrother/ sister, husband, wife
## parch       # of parents / children aboard in Titanic - mother, father, daughter, son, stepson/daughter
## ticket      Ticket number
## fare        Passenger fare
## cabin       Cabin number
## embarked    Port of Embarkment                          C= Cherbourg, Q = Queenstown, S = Southampton


## Steps in Analyzing Titanic data survival rate and other features

## 1) First prediction
## 2) Data preparation
## 3) Data Exploration
## 4) Feature Engineering
## 5) Logistic Regression

# Import the titanic dataset and test

training.dataset <- read.csv(file.choose(), stringsAsFactors = F, na.strings = c("", "NA", " ") )
test.dataset <- read.csv(file.choose(), stringsAsFactors = F, na.strings = c("", "NA", " ") )



## --------------------------------------------------------------------------------------------
str(training.dataset)
cat("\n\n")
str(test.dataset)


## --------------------------------------------------------------------------------------------
summary(training.dataset)
summary(test.dataset)


## --------------------------------------------------------------------------------------------
# To quickly test the survival rate with gender model

table(training.dataset$Sex, training.dataset$Survived)



## --------------------------------------------------------------------------------------------
# To find the percentage of survival rate based on gender model

prop.table(table(training.dataset$Sex, training.dataset$Survived))



## --------------------------------------------------------------------------------------------
# Lazy prediction based on zero survival of test dataset

table(training.dataset$Survived)

round( prop.table(table(training.dataset$Survived)), digits = 2)



## --------------------------------------------------------------------------------------------
# Lazy prediction based on zero survival of test dataset

test_one <- test.dataset



## --------------------------------------------------------------------------------------------
# Initialize a survived column to 0
test_one$Survived <- 0

my_solution <- data.frame(PassengerId = test.dataset$PassengerId, Survived = test_one$Survived)

nrow(my_solution)



## --------------------------------------------------------------------------------------------
# Creating an output file of lazy prediction
write.csv(my_solution, file = "My_prediction.csv", row.names = FALSE)


