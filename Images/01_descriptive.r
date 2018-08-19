
library(corrplot)
library(lars)
library(BLR)
library(glmnet)
library(caret)
library(MASS)
library(car)
library(stats) 
library(descr)
library(corrplot)
library(ggplot2)
library(dplyr)
library(psych)
library(pastecs)
library(dplyr)
library(ggpubr)
library(GGally)
library(lmtest)
library(gvlma)
library(MASS)

setwd("/Users/gregory/Documents/2018/corpus/")

setwd("F:/2018/sta_foundations/Images")

images <- read.csv(file= "data.csv", header=TRUE, sep=",")

images$mark  <- as.factor(images$mark)

# decide response variable and define his levels 

levels(images$mark) <- c(1,2,3,4,5,6,7,8,9,10)


cov(images)

cor(images)

eigen(cor(images))

head(images)

str(images)

psych::describe(images)


table(images$mark)
hist(images$mark)
boxplot(images$correlation)
boxplot(images$intersection)
boxplot(images$chisquare)
boxplot(images$bhattacharyya)

data_selected <- as.data.frame( select(images, -id, -mark))

pr = prcomp(data_selected)
summary(pr)

biplot(pr)

data_selected <- as.data.frame( select(images, -id))
ggpairs(data_selected) 

reg = lm(mark ~ ., data = data_selected )
summary(reg)

# descicion three
library(rpart)

fit <- rpart(mark ~ correlation + intersection + chisquare + bhattacharyya, method="class", data=images)

printcp(fit) # display the results 
plotcp(fit) # visualize cross-validation results 
summary(fit) # detailed summary of splits

plot(fit, uniform=TRUE)
text(fit, use.n=TRUE, all=TRUE, cex=.8)

install.packages("caret")
require(caret)

classes <- images[, "mark"]
predictors <- images[, -match(c("id", "mark"), colnames(images))]

train_set <- createDataPartition(classes, p = 0.8, list = FALSE)
str(train_set)

train_predictors <- predictors[train_set, ]
train_classes <- classes[train_set]
test_predictors <- predictors[-train_set, ]
test_classes <- classes[-train_set]




index = unlist(cv_splits[1])
train_predictors <- predictors[ index , ]
train_classes <- classes[index]
train = cbind(train_predictors, train_classes)
test_predictors = predictors[ -index, ]
test_classes = classes[-index]
test = cbind(test_predictors, test_classes)

fit <- rpart(train_classes ~ correlation + intersection + chisquare + bhattacharyya, method="class", data=train)

pred = predict(fit, newdata =  test_predictors, type = "class")

factor(pred)

levels(pred) <- levels(test_classes)
d <- pred
d[names(pred)] <- test_classes
levels(d)

table( pred, d )
confusionMatrix( pred, test_classes)


install.packages("C50")
library(C50)



summary(info)
plot(info)

acc <- matrix(NA,nrow=1,ncol=10)
folds <- createFolds(classes, k = 10, returnTrain = TRUE)

for(i in 1:10){
  index = unlist(folds[i])
  train_predictors <- predictors[index, ]
  train_classes <- classes[index]
  train = cbind(train_predictors, train_classes)
  test_predictors = predictors[ -index, ]
  test_classes = classes[-index]
  test = cbind(test_predictors, test_classes)
  
  # fit <- rpart(train_classes ~ correlation + intersection + chisquare + bhattacharyya, method="class", data=train)
  
  fit  = C5.0(train_classes ~ correlation + intersection + chisquare + bhattacharyya, data = train, trials=3)
  
  pred = predict(fit, newdata =  test_predictors, type = "class")  
  con = confusionMatrix( pred, test_classes)
  acc[1, i] = con$overall['Accuracy']
}

psych::describe( as.numeric(acc))
boxplot( as.numeric(acc))
rowMeans(acc)

