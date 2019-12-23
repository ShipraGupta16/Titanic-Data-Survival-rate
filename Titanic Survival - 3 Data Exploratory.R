---
## title: "Titanic Survival prediction Part 3: Data Exploration on cleaned Data"
---
    
# This includes the following steps:
# 1) Univariate EDA
# 2) Bivariate EDA
# 3) Multivariate EDA


## ----------------------------------------------------------------------------------------------------------------------------
############ Univariate EDA ##############
library(ggplot2)


## ----------------------------------------------------------------------------------------------------------------------------
# categorical variables
xtabs (~Survived, cleaned.training.dataset)



## ----------------------------------------------------------------------------------------------------------------------------
ggplot(cleaned.training.dataset) + 
    geom_bar(aes(x=Survived), fill = "skyblue", colour = "black")



## ----------------------------------------------------------------------------------------------------------------------------
ggplot(cleaned.training.dataset) + 
    geom_bar(aes(x=Sex), fill = "skyblue", colour = "black")


## ----------------------------------------------------------------------------------------------------------------------------
ggplot(cleaned.training.dataset) + 
    geom_bar(aes(x=Pclass), fill = "skyblue", colour = "black")



## ----------------------------------------------------------------------------------------------------------------------------
# numerical variables
ggplot(cleaned.training.dataset) + 
    geom_histogram(aes(x=Fare), fill = "limegreen", colour = "black")



## ----------------------------------------------------------------------------------------------------------------------------

ggplot(cleaned.training.dataset) + 
    geom_boxplot(aes(x=factor(0), y=Fare), 
                 fill = "salmon", colour = "black") + coord_flip()




## ----------------------------------------------------------------------------------------------------------------------------
ggplot(cleaned.training.dataset) + 
    geom_histogram(aes(x=Age), fill = "limegreen", colour = "black")



## ----------------------------------------------------------------------------------------------------------------------------
ggplot(cleaned.training.dataset) + 
    geom_boxplot(aes(x=factor(0), y=Age), 
                 fill = "salmon", colour = "black") + coord_flip()


## ----------------------------------------------------------------------------------------------------------------------------
############### Bivariate EDA ################
# Relationship between categories
# Gender survival rate
xtabs (~Survived+Sex, cleaned.training.dataset)



## ----------------------------------------------------------------------------------------------------------------------------
ggplot(cleaned.training.dataset) + 
    geom_bar(aes(x=Sex, fill = factor(Survived)) )


## ----------------------------------------------------------------------------------------------------------------------------
# Passenger class survival rate
xtabs (~Survived+Pclass, cleaned.training.dataset)


## ----------------------------------------------------------------------------------------------------------------------------
ggplot(cleaned.training.dataset) + 
    geom_bar(aes(x=Pclass, fill = factor(Survived)) )


## ----------------------------------------------------------------------------------------------------------------------------
# Embarked survival rate
xtabs (~Survived+Embarked, cleaned.training.dataset)

## ----------------------------------------------------------------------------------------------------------------------------
ggplot(cleaned.training.dataset) + 
    geom_bar(aes(x=Embarked, fill = factor(Survived)) )


## ----------------------------------------------------------------------------------------------------------------------------
##### Relationship between numerical and categorical variable
##    Age and factor

ggplot(cleaned.training.dataset) + 
    geom_boxplot(aes(x=factor(Survived), y = Age), fill = "pink" )




## ----------------------------------------------------------------------------------------------------------------------------

ggplot(cleaned.training.dataset) + 
    geom_histogram(aes(x=Age), fill = "skyblue", colour = "black")



## ----------------------------------------------------------------------------------------------------------------------------
ggplot(cleaned.training.dataset) + 
    geom_boxplot(aes(x=factor(factor(Survived)), y = Fare), fill = "pink" )




## ----------------------------------------------------------------------------------------------------------------------------
ggplot(cleaned.training.dataset) + 
    geom_histogram(aes(x=Fare), fill = "skyblue", colour = "black")



## ----------------------------------------------------------------------------------------------------------------------------
########## Multivariate EDA ###########

xtabs(~factor(Survived) + Pclass+Sex, cleaned.training.dataset)


## ----------------------------------------------------------------------------------------------------------------------------
ggplot(cleaned.training.dataset) + 
    geom_bar(aes(x=Sex, fill = factor(Survived)) ) + facet_grid(Pclass ~ .)



## ----------------------------------------------------------------------------------------------------------------------------
xtabs(~Survived+Embarked+Sex, cleaned.training.dataset)



## ----------------------------------------------------------------------------------------------------------------------------
ggplot(cleaned.training.dataset) + 
    geom_bar(aes(x=Sex, fill = factor(Survived)) ) + facet_grid(Embarked ~ .)


