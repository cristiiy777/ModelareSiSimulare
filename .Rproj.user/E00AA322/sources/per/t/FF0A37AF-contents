#~~~~~Laboratorul 6~~~~

#__Exercitii

#__Setul 1

#A simple linear regression model that describes the relationship 
#between two variables x and y can be expressed by the following
#equation. The numbers α and β are called parameters, and ϵ is the error term.
#For example, in the data set faithful, it contains sample data 
#of two random variables named waiting and eruptions. 
#The waiting variable denotes the waiting time until the next 
#eruptions, and eruptions denotes the duration 

#__Estimated Simple Regression Equation

#Apply the simple linear regression model for the data set faithful, 
#and estimate the next eruption duration if the waiting time since the last eruption has been 80 minutes.

#We apply the lm function to a formula that describes the variable 
#eruptions by the variable waiting, and save the linear regression model in a new variable eruption.lm.

eruption.lm = lm(eruptions ~ waiting, data=faithful)

#Then we extract the parameters of the estimated regression equation with the coefficients function.

coeffs = coefficients(eruption.lm)
coeffs 

#We now fit the eruption duration using the estimated regression equation.

waiting = 80           # the waiting time
duration = coeffs[1] + coeffs[2]*waiting 
duration 

#Based on the simple linear regression model, if the waiting time 
#since the last eruption has been 80 minutes, we expect the next one to last 4.1762 minutes.


#__Coefficient of Determination

#The coefficient of determination of a linear regression model is 
#the quotient of the variances of the fitted values and observed values of the dependent variable. 

#Find the coefficient of determination for the simple linear regression model of the data set faithful.

#We apply the lm function to a formula that describes the variable 
#eruptions by the variable waiting, and save the linear regression model in a new variable eruption.lm.


eruption.lm = lm(eruptions ~ waiting, data=faithful)


#Then we extract the coefficient of determination from the r.squared attribute of its summary.


summary(eruption.lm)$r.squared 

#The coefficient of determination of the simple linear 
#regression model for the data set faithful is 0.81146.

#__Significance Test for Linear Regression


#Assume that the error term ϵ in the linear regression model is 
#independent of x, and is normally distributed, with zero mean and
#constant variance. We can decide whether there is any significant
#relationship between x and y by testing the null hypothesis that β = 0.

#Decide whether there is a significant relationship between the 
#variables in the linear regression model of the data set faithful at .05 significance level.

#We apply the lm function to a formula that describes the variable
#eruptions by the variable waiting, and save the linear regression model in a new variable eruption.lm.

eruption.lm = lm(eruptions ~ waiting, data=faithful)

#Then we print out the F-statistics of the significance test with the summary function.


summary(eruption.lm) 


#As the p-value is much less than 0.05, we reject the null 
#hypothesis that β = 0. Hence there is a significant relationship 
#between the variables in the linear regression model of the data set faithful.


#__Confidence Interval for Linear Regression

#Assume that the error term ϵ in the linear regression model is 
#independent of x, and is normally distributed, with zero mean 
#and constant variance. For a given value of x, the interval 
#estimate for the mean of the dependent variable, ¯y , is called 
#the confidence interval.

#In the data set faithful, develop a 95% confidence interval of 
#the mean eruption duration for the waiting time of 80 minutes.



#We apply the lm function to a formula that describes the 
#variable eruptions by the variable waiting, and save the linear 
#regression model in a new variable eruption.lm.

attach(faithful)     # attach the data frame 
eruption.lm = lm(eruptions ~ waiting)

#Then we create a new data frame that set the waiting time value.

newdata = data.frame(waiting=80)

#We now apply the predict function and set the predictor variable in the newdata argument. We also set the interval type as "confidence", and use the default 0.95 confidence level.

predict(eruption.lm, newdata, interval="confidence") 

#The 95% confidence interval of the mean eruption duration for 
#the waiting time of 80 minutes is between 4.1048 and 4.2476 minutes.


#__Prediction Interval for Linear Regression


#Assume that the error term ϵ in the simple linear regression 
#model is independent of x, and is normally distributed, with 
#zero mean and constant variance. For a given value of x, 
#the interval estimate of the dependent variable y is called the 
#prediction interval.


#In the data set faithful, develop a 95% prediction interval of 
#the eruption duration for the waiting time of 80 minutes.


#We apply the lm function to a formula that describes the 
#variable eruptions by the variable waiting, and save the 
#liniar regression model in a new variable eruption.lm.


attach(faithful)     # attach the data frame 
eruption.lm = lm(eruptions ~ waiting)


#Then we create a new data frame that set the waiting time value.


newdata = data.frame(waiting=80)


#We now apply the predict function and set the predictor variable 
#in the newdata argument. We also set the interval type as "predict", and use the default 0.95 confidence level.


predict(eruption.lm, newdata, interval="predict") 


#The 95% prediction interval of the eruption duration for 
#the waiting time of 80 minutes is between 3.1961 and 5.1564 minutes.



#__Residual Plot

#The residual data of the simple linear regression model 
#is the difference between the observed data of the dependent variable y and the fitted values ŷ.


#Plot the residual of the simple linear regression model of the data set 
#faithful against the independent variable waiting.


#We apply the lm function to a formula that describes the variable eruptions 
#by the variable waiting, and save the linear regression model in a 
#new variable eruption.lm. Then we compute the residual with the resid function.


eruption.lm = lm(eruptions ~ waiting, data=faithful) 
eruption.res = resid(eruption.lm)


#We now plot the residual against the observed values of the variable waiting.

plot(faithful$waiting, eruption.res, ylab="Residuals", xlab="Waiting Time", main="Old Faithful Eruptions") 

abline(0, 0)                  # the horizon


#__Standardized Residual

#The standardized residual is the residual divided by its standard deviation.

#Plot the standardized residual of the simple linear 
#regression model of the data set faithful against the independent variable waiting.

#We apply the lm function to a formula that describes the variable 
#eruptions by the variable waiting, and save the linear regression 
#model in a new variable eruption.lm. Then we compute the standardized
#residual with the rstandard function.

eruption.lm = lm(eruptions ~ waiting, data=faithful) 
eruption.stdres = rstandard(eruption.lm)

#We now plot the standardized residual against the observed values 
#of the variable waiting.


plot(faithful$waiting, eruption.stdres, ylab="Standardized Residuals", xlab="Waiting Time", main="Old Faithful Eruptions") 

abline(0, 0)                  # the horizon


#__Normal Probability Plot of Residuals


#The normal probability plot is a graphical tool for comparing
#a data set with the normal distribution. We can use it with the
#standardized residual of the linear regression model and see if the
#error term ϵ is actually normally distributed.


#Create the normal probability plot for the standardized residual of 
#the data set faithful.


#We apply the lm function to a formula that describes the variable
#eruptions by the variable waiting, and save the linear regression model
#in a new variable eruption.lm. Then we compute the standardized
#residual with the rstandard function.


eruption.lm = lm(eruptions ~ waiting, data=faithful) 
eruption.stdres = rstandard(eruption.lm)

#We now create the normal probability plot with the qqnorm function,
#and add the qqline for further comparison.

qqnorm(eruption.stdres, ylab="Standardized Residuals", xlab="Normal Scores", main="Old Faithful Eruptions") 

qqline(eruption.stdres)



#__Setul 2

#http://r-statistics.co/Linear-Regression.html

#Construiti modelul liniar pentru setul de date cars 
#(acest set de date se regaseste in distributia standard de R), 
#care identifica modelul ce explica variabila disst in functie 
#de variabila speed a setului de date.

#Pentru aceasta, parcurgeti pasii:


#Construiti grafice corespunzatoare, pentru a identifica tipul 
#relatiei (scatter plot, box-plot pentru fiecare variabila in parte, density plot).

scatter.smooth(cars$speed)
scatter.smooth(cars$dist)

boxplot(cars$speed)
boxplot(cars$dist)

density(cars$speed)
density(cars$dist)


#Calculati coeficientul de corelatie intre variabile.

viteza   <- cars$speed
distanta <- cars$dist

cor(distanta, viteza)

#Construiti modelul liniar. Afisati statisticile referitoare la 
#model (functia summary). Este modelul obtinut semnificativ dpdv statistic?


modelLiniar <- lm(dist ~ speed, data=cars) #model de regresie liniara

summary(modelLiniar) #diagnostic


#Pentru modelul obtinut, calculati scorul AIC, 
#respectiv BIC (Akaike’s information criterion - AIC (Akaike, 1974) 
#and the Bayesian information criterion - BIC (Schwarz, 1978) ).

AIC(modelLiniar)  # AIC
BIC(modelLiniar)  # BIC

#Folositi modelul pentru predictii. Pentru aceasta, impartiti setul de date original in :
#- date de antrenament (training): 80% dintre linii
#- date de test: 20% dintre linii
#Creati modelul folosind datele din primul set.
#Folosind functia predict, obtineti predictii pentru input-urile din setul de test.
#Calculati coeficientul de corelatie intre predictiile obtinute si valorile originale din setul de date de test.

set.seed(100) 
trainingRowIndex <- sample(1:nrow(cars), 0.8*nrow(cars))  
trainingData <- cars[trainingRowIndex, ] 
testData  <- cars[-trainingRowIndex, ]  

lmMod <- lm(dist ~ speed, data=trainingData) 
distPred <- predict(lmMod, testData)  #predict distance

summary (lmMod)  

actuals_preds <- data.frame(cbind(actuals=testData$dist, predicteds=distPred))  #dataframe valori originale si predictiile obtinute
correlation_accuracy <- cor(actuals_preds)  #coeficient corelatie dintre valorile originale si predictiile obtinute

head(actuals_preds)

scatter.smooth(actuals_preds)

