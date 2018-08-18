
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


images <- read.csv(file= "data.csv", header=TRUE, sep=",")

cov(images)

cor(images)

eigen(cor(images))




head(images)

str(images)

describe(images)

data_selected <- as.data.frame( select(images, -id, -mark))

boxplot(data_selected$correlation)
boxplot(data_selected$intersection)
boxplot(data_selected$chisquare)
boxplot(data_selected$bhattacharyya)

boxplot.stats(data_selected$correlation)

pr = prcomp(data_selected)
summary(pr)

biplot(pr)

hist(data_selected$correlation)
hist(data_selected$intersection)
hist(data_selected$chisquare)
hist(data_selected$bhattacharyya)


ggpairs(data_selected) 

reg = lm(mark~correlation+ intersection, data = images )

summary(reg)

library(rpart)

fit <- rpart(mark ~ correlation + intersection + chisquare + bhattacharyya,
             method="class", data=images)

printcp(fit) # display the results 
plotcp(fit) # visualize cross-validation results 
summary(fit) # detailed summary of splits

plot(fit, uniform=TRUE, main="Classification Tree for Kyphosis")
text(fit, use.n=TRUE, all=TRUE, cex=.8)

pred = predict(fit, type="class")
table(pred)



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

help(createFolds)


cv_splits <- createFolds(classes, k = 10, returnTrain = TRUE)

index = unlist( cv_splits[1] )

train_predictors <- predictors[ index , ]
train_classes <- classes[index]

train = cbind(train_predictors, train_classes)
test_predictors = predictors[ -index, ]
test_classes = classes[-index]

test = cbind(test_predictors, test_classes)

fit <- rpart(train_classes ~ correlation + intersection + chisquare + bhattacharyya,
             method="class", data=train)

pred = predict(fit, newdata =  test_predictors, type = c("vector"))

as.numeric(pred)

pred_data = cbind(id = as.numeric( rownames(as.matrix( pred )) ), pred = as.numeric(as.matrix( pred )[,1]) )
pred_real = cbind(id = as.numeric( rownames(as.matrix( pred )) ), pred = as.numeric(test_classes) ) 

confusionMatrix( table( as.numeric(pred) ,  test_classes) )



typeof(pred)

levels(colnames(pred[1])

str(pred)
dim(test)

table(pred, test_classes )

as.vector(pred)
as.matrix(pred)

cbind(length(test_classes), length( as.numeric(pred))
as.data.frame(pred)[1,1]

confusionMatrix(pred, pred )
help(predict)

predictors[ -index , ]

str(cv_splits)




