
if (!require('ggplot2')) install.packages('ggplot2'); library('ggplot2')
if (!require('dplyr')) install.packages('dplyr'); library('dplyr')



train <- read.csv("train.csv", stringsAsFactors = TRUE)
test <- read.csv("test.csv", stringsAsFactors = TRUE)



dim(train)
str(train)



summary(train)



colSums(is.na(train))
colSums(train==0)



if (!require('VIM')) install.packages('VIM'); library('VIM')
#La nueva base imputada por vecinos más cercanos, usando la distancia de Gower
train<-kNN(train, variable = "Age", dist_var = c("Sex", "SibSp", "Parch", "Pclass"), imp_var=FALSE)
#Comprobamos que se han eliminado los valores nulos
colSums(is.na(train))



boxplot(train$Fare)



train$Fare[train$Fare %in% boxplot(train$Fare)$out]<-NA
#La nueva base imputada por vecinos más cercanos, usando la distancia de Gower
train<-kNN(train, variable = "Fare", dist_var = "Pclass", imp_var=FALSE)
#Comprobamos que se han eliminado los valores extremos
boxplot(train$Fare)



if (!require('reshape2')) install.packages('reshape2'); library('reshape2')
if (!require('ggplot2')) install.packages('ggplot2'); library('ggplot2')
ggplot(data = melt(abs(round(cor(train[,c(2,3,6,10)]),2))), aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile()



#Gráfico para la variable género
ggplot(data = train, aes(x = Sex, fill = factor(Survived))) +
    geom_bar()
#Gráfico para la variable de embarque
ggplot(data = train, aes(x = Embarked, fill = factor(Survived))) +
    geom_bar()
#Gráfico para la variable de Parch
ggplot(data = train, aes(x = Parch, fill = factor(Survived))) +
    geom_bar()
#Gráfico para la variable de SibPs
ggplot(data = train, aes(x = SibSp, fill = factor(Survived))) +
    geom_bar()
#Gráfico para la variable de Clase
ggplot(data = train, aes(x = Pclass, fill = factor(Survived))) +
    geom_bar()



model <- glm(Survived ~Sex+Fare+Parch,family=binomial(link='logit'),data=train)
summary(model)
anova(model, test = "Chisq")



round(mean(model$residuals),2)



if (!require('lmtest')) install.packages('lmtest'); library('lmtest')
bptest(model)



plot(model,2)



#Sacamos las predicciones del modelo de regresión logística
predict_glm <- predict (model, train[,c(5,10,8)],type='response')
#Convertimos las probabilidades en los resultados de supervivencia 0 y 1
binary_predict_glm <- ifelse(predict_glm > 0.5,1,0)
#Matriz de confusión
table(Real=as.factor(train[,2]), Predicted=as.factor(binary_predict_glm))
#Matriz de confusión en porcentaje
table(Real=as.factor(train[,2]), Predicted=as.factor(binary_predict_glm))/nrow(train)



subtrain <- train[c(6,7)]
if (!require('fpc')) install.packages('fpc'); library('fpc')
model2 <-  kmeans(subtrain, 2)
plot(subtrain[c(1,2)],col=model2$cluster, main="Clasificacion k-means")
plot(subtrain[c(1,2)],col=train$Survived+1, main="Clasificación Real")



if (!require('C50')) install.packages('C50'); library('C50')
train3y <- as.factor(train$Survived)
train3x <- train[c(3,6,5)]
arbol1plot <- C50::C5.0(train3x, train3y)
plot(arbol1plot)



test3y <- as.factor(train$Survived)
test3x <- train[c(3,6,5)]
predict3 <- predict (arbol1plot, test3x, type="class")
mat_conf3 <- table(test3y, Predicted=predict3)
mat_conf3


write.csv(train, file = "train_clean.csv")

