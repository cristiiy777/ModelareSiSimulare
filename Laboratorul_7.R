#A multiple linear regression (MLR) model that describes a dependent variable y by independent
#variables x1, x2, ..., xp (p > 1) is expressed by the equation as follows, where the numbers
#α and βk (k = 1, 2, ..., p) are the parameters, and ϵ is the error term.

#For example, in the built-in data set stackloss from observations of a chemical plant operation
#, if we assign stackloss as the dependent variable, and assign Air.Flow (cooling air flow),
#Water.Temp (inlet water temperature) and Acid.Conc. (acid concentration) as independent variables

#__Estimated Multiple Regression Equation

#If we choose the parameters α and βk (k = 1, 2, ..., p) in the multiple linear regression model
#so as to minimize the sum of squares of the error term ϵ, we will have the so called estimated
#multiple regression equation. It allows us to compute fitted values of y based
#on a set of values of xk (k = 1, 2, ..., p) .

#Apply the multiple linear regression model for the data set stackloss, and predict the stack
#loss if the air flow is 72, water temperature is 20 and acid concentration is 85.

#We apply the lm function to a formula that describes the variable stack.loss by the variables
#Air.Flow, Water.Temp and Acid.Conc. And we save the linear regression model in a new variable stackloss.lm.

stackloss.lm = lm(stack.loss ~ Air.Flow + Water.Temp + Acid.Conc., data=stackloss)

#We also wrap the parameters inside a new data frame named newdata.


newdata = data.frame(Air.Flow=72, Water.Temp=20, Acid.Conc.=85) # wrap the parameters

#Lastly, we apply the predict function to stackloss.lm and newdata.

predict(stackloss.lm, newdata) 


#__Multiple Coefficient of Determination


#The coefficient of determination of a multiple linear regression model is the quotient of the
#variances of the fitted values and observed values of the dependent variable. If we denote yi
#as the observed values of the dependent variable, ¯y as its mean, and yˆi as the fitted value,
#then the coefficient of determination is:
  
  
#Find the coefficient of determination for the multiple linear regression model of the data set stackloss.


#We apply the lm function to a formula that describes the variable stack.loss by the variables Air.Flow,
#Water.Temp and Acid.Conc. And we save the linear regression model in a new variable stackloss.lm.


stackloss.lm = lm(stack.loss ~ Air.Flow + Water.Temp + Acid.Conc., data=stackloss)

#Then we extract the coefficient of determination from the r.squared attribute of its summary.


summary(stackloss.lm)$r.squared 


#The coefficient of determination of the multiple linear regression model for the data set stackloss is 0.91358.




#__Adjusted Coefficient of Determination


#The adjusted coefficient of determination of a multiple linear regression model is defined in terms of
#the coefficient of determination as follows, where n is the number of observations in the data set, and
#p is the number of independent variables.


#Find the adjusted coefficient of determination for the multiple linear regression model of the data set
#stackloss.


#We apply the lm function to a formula that describes the variable stack.loss by the variables Air.Flow,
#Water.Temp and Acid.Conc. And we save the linear regression model in a new variable stackloss.lm.



stackloss.lm = lm(stack.loss ~ Air.Flow + Water.Temp + Acid.Conc., data=stackloss)


#Then we extract the coefficient of determination from the adj.r.squared attribute of its summary.


summary(stackloss.lm)$adj.r.squared 


#The adjusted coefficient of determination of the multiple linear regression model for the data set stackloss is 0.89833.



#__Significance Test for MLR


#Assume that the error term ϵ in the multiple linear regression (MLR) model is independent of xk (k = 1, 2, ..., p),
#and is normally distributed, with zero mean and constant variance. We can decide whether there is any significant
#relationship between the dependent variable y and any of the independent variables xk (k = 1, 2, ..., p).


#Decide which of the independent variables in the multiple linear regression model of the data set stackloss are
#statistically significant at .05 significance level.


#We apply the lm function to a formula that describes the variable stack.loss by the variables Air.Flow, Water.Temp
#and Acid.Conc. And we save the linear regression model in a new variable stackloss.lm.


stackloss.lm = lm(stack.loss ~ Air.Flow + Water.Temp + Acid.Conc., data=stackloss)

#The t values of the independent variables can be found with the summary function.


summary(stackloss.lm) 


#As the p-values of Air.Flow and Water.Temp are less than 0.05, they are both statistically significant
#in the multiple linear regression model of stackloss.


#__Confidence Interval for MLR

#Assume that the error term ϵ in the multiple linear regression (MLR) model is independent of xk (k = 1, 2, ..., p),
#and is normally distributed, with zero mean and constant variance. For a given set of values of xk (k = 1, 2, ..., p), the interval estimate for the mean of the dependent variable, ¯y , is called the confidence interval.

#In data set stackloss, develop a 95% confidence interval of the stack loss if the air flow is 72, water temperature
#is 20 and acid concentration is 85.

#We apply the lm function to a formula that describes the variable stack.loss by the variables Air.Flow, Water.Temp
#and Acid.Conc. And we save the linear regression model in a new variable stackloss.lm.


attach(stackloss)    # attach the data frame 
stackloss.lm = lm(stack.loss ~ Air.Flow + Water.Temp + Acid.Conc.)



#Then we wrap the parameters inside a new data frame variable newdata.


newdata = data.frame(Air.Flow=72, Water.Temp=20, Acid.Conc.=85)

#We now apply the predict function and set the predictor variable in the newdata argument. We also set the interval
#type as "confidence", and use the default 0.95 confidence level.


predict(stackloss.lm, newdata, interval="confidence") 


#The 95% confidence interval of the stack loss with the given parameters is between 20.218 and 28.945.


#__Prediction Interval for MLR


#Assume that the error term ϵ in the multiple linear regression (MLR) model is independent of xk (k = 1, 2, ..., p),
#and is normally distributed, with zero mean and constant variance. For a given set of values of xk (k = 1, 2, ..., p),
#the interval estimate of the dependent variable y is called the prediction interval.


#In data set stackloss, develop a 95% prediction interval of the stack loss if the air flow is 72, water temperature
#is 20 and acid concentration is 85.



#We apply the lm function to a formula that describes the variable stack.loss by the variables Air.Flow, Water.Temp
#and Acid.Conc. And we save the linear regression model in a new variable stackloss.lm.


attach(stackloss)    # attach the data frame 
stackloss.lm = lm(stack.loss ~ Air.Flow + Water.Temp + Acid.Conc.)


newdata = data.frame(Air.Flow=72, Water.Temp=20, Acid.Conc.=85)

#We now apply the predict function and set the predictor variable in the newdata argument. We also set the interval
#type as "predict", and use the default 0.95 confidence level.


predict(stackloss.lm, newdata, interval="predict") 
detach(stackloss)    # clean up


#The 95% confidence interval of the stack loss with the given parameters is between 16.466 and 32.697.


#__Setul 2


#Construiti modelul liniar pentru setul de date din fisierul atasat pe site,
#pentru a explica variabila cant-vanduta in functie de pret, venit_loc, pop, PIB.

#cant-vanduta = Y
#pret = X1
#venit_loc = X2
#pop = X3
#PIB = X4

directory            <- "C:/Users/Lenovo/Desktop/ModelareSiSimulare"
fisier               <- file.path(directory, "Model liniar multiplu.csv")
modelLiniarMultiplu  <- read.csv(file = fisier, header = TRUE)
modelLiniarMultiplu

scatter.smooth(modelLiniarMultiplu)

cantitate_vanduta <- modelLiniarMultiplu$cantitate_vanduta
pret              <- modelLiniarMultiplu$pret
venit_loc         <- modelLiniarMultiplu$venit_loc
pop               <- modelLiniarMultiplu$pop
PIB               <- modelLiniarMultiplu$PIB

modelLiniarMultiplu_lm = lm(cantitate_vanduta ~ pret + venit_loc + pop + PIB)

summary(modelLiniarMultiplu_lm) 

predict(modelLiniarMultiplu_lm)

summary(modelLiniarMultiplu_lm)$r.squared      #coeficient de determinare

summary(modelLiniarMultiplu_lm)$adj.r.squared  #coeficient de determinare ajustat

predict(modelLiniarMultiplu_lm, interval="confidence") #interval de confidenta

predict(modelLiniarMultiplu_lm, interval="predict") #interval de predictie








