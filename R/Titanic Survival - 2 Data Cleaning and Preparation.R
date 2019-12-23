---
# title: "Titanic Survival prediction Part 2: Data cleaning and preparation"
---
    
# I'll be covering the following things:
# 1) Missing value imputation
# 2) Outlier detection
# 3) Imbalanced data treatment
# 4) Data type conversion
# 5) Data manipulation

# Dropping cabin variable as it has too many missing values and also,
# PassengerId, Name, and Ticket No since it is only an index.


## ----------------------------------------------------------------------------------------------------------------------------
# Combine and train dataset for cleaning and preparation
Full.dataset <- rbind(training.dataset, test_one)
str(Full.dataset)


## ----------------------------------------------------------------------------------------------------------------------------
# Survival rates in absolute numbers
table(Full.dataset$Survived)


## ----------------------------------------------------------------------------------------------------------------------------
# Survival rates in percentage
prop.table(table(Full.dataset$Survived))


## ----------------------------------------------------------------------------------------------------------------------------
# Data Type conversion
Full.dataset$Pclass <- as.factor(Full.dataset$Pclass)


## ----------------------------------------------------------------------------------------------------------------------------
# Get percentages of missing value of the attribute -another approach

sapply(Full.dataset, function(df) {
    
    sum(is.na(df) == T) / length(df)
    })



## ----------------------------------------------------------------------------------------------------------------------------
# Amelia Package approach to check missing values
install.packages("Amelia")



## ----------------------------------------------------------------------------------------------------------------------------
# Activating the Amelia package
library("Amelia")


## ----------------------------------------------------------------------------------------------------------------------------
missmap(Full.dataset, main = "Missing map")


## ----------------------------------------------------------------------------------------------------------------------------
# Missing value imputation - Age variable
Full.dataset$Age[is.na(Full.dataset$Age)] <- 
    mean(Full.dataset$Age, na.rm = T) 
sum(is.na(Full.dataset$Age))



## ----------------------------------------------------------------------------------------------------------------------------
# Missing value imputation - Embarked variable
table(Full.dataset$Embarked, useNA = "always")


## ----------------------------------------------------------------------------------------------------------------------------
# Substitute the missing values with mode value
Full.dataset$Embarked[is.na(Full.dataset$Embarked)] <- 'S'
sum(is.na(Full.dataset$Embarked))
table(Full.dataset$Embarked, useNA = "always")


## ----------------------------------------------------------------------------------------------------------------------------
# Missing value imputation - Fare variable
# Substitute the missing values with mean value
Full.dataset$Fare[is.na(Full.dataset$Fare)] <- 
    mean(Full.dataset$Fare, na.rm = T)
sum(is.na(Full.dataset$Fare))


## ----------------------------------------------------------------------------------------------------------------------------
# Missing value imputation - Cabin
# Substitute the missing values when more than 20%
# Hence removing the cabin variable
Full.dataset <- Full.dataset[-11]


## ----------------------------------------------------------------------------------------------------------------------------
# Checking again for NAs
sapply(Full.dataset, function(df){
    sum(is.na(df) == T / length(df))
    })



## ----------------------------------------------------------------------------------------------------------------------------
# Splitting the data into training and test dataset
cleaned.training.dataset <- Full.dataset[1:891,]
cleaned.test_one <- Full.dataset[892:1309,]


