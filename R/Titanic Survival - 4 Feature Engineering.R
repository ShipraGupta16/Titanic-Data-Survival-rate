---
# title: "Titanic Survival - Feature Engineering"
---
    
# If a new feature becomes valuable from existing feature, then it's a good feature.

# Out of 11 given attributes, I'm making 3 new features which can be valuable for data analysis.
# 1) Age - Finding out how many children were aboard and survived
# 2) Title based on profession
# 3) Family size


## ----------------------------------------------------------------------------------------------------------------------------
# Creating a new attribute Child based on given Age data

Full.dataset$Child <- NA
Full.dataset$Child[Full.dataset$Age < 18] <- 1
Full.dataset$Child[Full.dataset$Age >= 18] <- 0
str(Full.dataset$Child)


## ----------------------------------------------------------------------------------------------------------------------------
ggplot(Full.dataset) + geom_bar(aes(x=Child), fill = "skyblue", colour = "black")


## ----------------------------------------------------------------------------------------------------------------------------
# Extracting and creating Professional Title
Full.dataset$Title <- sapply(Full.dataset$Name, 
                             FUN = function(x) {strsplit(x, split='[,..]') [[1]][2] })
Full.dataset$Title <- sub(' ', '', Full.dataset$Title)
table(Full.dataset$Title)



## ----------------------------------------------------------------------------------------------------------------------------
ggplot(Full.dataset) + geom_bar(aes(x=Title), fill = "skyblue", colour = "black")


## ----------------------------------------------------------------------------------------------------------------------------
# Combining into small title groups
Full.dataset$Title[Full.dataset$Title %in% c('Mme', 'Mlle')] <- 'Mlle'
Full.dataset$Title[Full.dataset$Title %in% c('Capt', 'Don', 'Major', 'Sir')] <- 'Sir'
Full.dataset$Title[Full.dataset$Title %in% c('Dona', 'Lady', 'the Countess', 'Jonkheer')] <- 'Lady'



## ----------------------------------------------------------------------------------------------------------------------------
# Convert to a factor
Full.dataset$Title <- factor(Full.dataset$Title)
table(Full.dataset$Title)


## ----------------------------------------------------------------------------------------------------------------------------
ggplot(Full.dataset) + geom_bar(aes(x=Title), fill = "skyblue", colour = "black")


## ----------------------------------------------------------------------------------------------------------------------------
# Family size survival rate

Full.dataset$FamilySize <- Full.dataset$SibSp + Full.dataset$Parch + 1
table(Full.dataset$FamilySize)


## ----------------------------------------------------------------------------------------------------------------------------
ggplot(Full.dataset) + geom_bar(aes(x=FamilySize), fill = "skyblue", colour = "black")



## ----------------------------------------------------------------------------------------------------------------------------
# Spliting back into test and training datasets
featured.training.dataset <- Full.dataset[1:891,]
featured.test.dataset <- Full.dataset[892:1309,]


## ----------------------------------------------------------------------------------------------------------------------------
featured.training.dataset$Survived <- as.factor(featured.training.dataset$Survived)
featured.training.dataset$Sex <- as.factor(featured.training.dataset$Sex)
featured.training.dataset$Embarked <- as.factor(featured.training.dataset$Embarked)



## ----------------------------------------------------------------------------------------------------------------------------
featured.test.dataset$Sex <- as.factor(featured.test.dataset$Sex)
featured.test.dataset$Embarked <- as.factor(featured.test.dataset$Embarked)


## ----------------------------------------------------------------------------------------------------------------------------
head(featured.test.dataset)

