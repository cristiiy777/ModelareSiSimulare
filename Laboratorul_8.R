#~~~~~Laboratorul 6~~~~

#__Exercitii

#Tema laboratorului de astazi este modelul de regresie logistica (Logistic Regression) si modelul Logit. 
#Modellul logit  insa isi dovedeste utilitatea in probleme de clasificare. Astfel, daca avem o variabila dihotomica, 
#sa spunem Y (cu doar 2 valori posibile, pe care le vom nota, pentru simplitate 0, respectiv 1) si alte variabile despre 
#care (credem) ca o influenteaza (sa spunem X1, X2, ...,Xn), putem determina un model prin care obtinem o functie prin 
#care se calculeaza  P(Y=0 | X1=x1, X2=x2, ...Xn=xn), respectiv P(Y=1 | X1=x1, X2=x2, ...Xn=xn)

#Observatie. Prin P(Y=0 | X1=x1, X2=x2, ...Xn=xn) intelegem probabilitatea ca Y are valoarea 0,
#stiind ca Xi are valoarea xi, cu i = 1...n. (X1 este variabila, xi este valoarea).


#__Setul 1

#http://www.r-tutor.com/elementary-statistics/logistic-regression.


#We use the logistic regression equation to predict the probability of a dependent variable taking the dichotomy values 0 or 1.
#Suppose x1, x2, ..., xp are the independent variables, Î± and Î²k (k = 1, 2, ..., p) are the parameters,
#and E(y) is the expected value of the dependent variable y

#For example, in the built-in data set mtcars, 
#the data column am represents the transmission type 
#of the automobile model (0 = automatic, 1 = manual). 

#__Estimated Logistic Regression Equation

#Using the generalized linear model, an estimated logistic regression equation can be formulated as below.
#The coefficients a and bk (k = 1, 2, ..., p) are determined according to a maximum likelihood approach, 
#and it allows us to estimate the probability of the dependent
#variable y taking on the value 1 for given values of xk (k = 1, 2, ..., p).

#Problem
#By use of the logistic regression equation of 
#vehicle transmission in the data set mtcars, estimate the probability 
#of a vehicle being fitted with a manual 
#transmission if it has a 120hp engine and weights 2800 lbs.

#We apply the function glm to a formula that describes the transmission type (am) by the horsepower (hp) and weight (wt). 
# This creates a generalized linear model (GLM) in the binomial family.

am.glm = glm(formula=am ~ hp + wt, data=mtcars, family=binomial)
am.glm

#We then wrap the test parameters inside a data frame newdata.

newdata = data.frame(hp=120, wt=2.8)
newdata

#Now we apply the function predict to the generalized linear model am.glm along with newdata.
#We will have to select response prediction type in order to obtain the predicted probability.

predict(am.glm, newdata, type="response")

#Answer
#For an automobile with 120hp engine and 2800 lbs weight, the probability of it being
#fitted with a manual transmission is about 64%.


#__Significance Test for Logistic Regression

#We can decide whether there is any significant relationship between the dependent variable y
#and the independent variables xk (k = 1, 2, ..., p) in the logistic regression equation.
#In particular, if any of the null hypothesis that Î²k = 0 (k = 1, 2, ..., p) is valid, then xk is
#statistically insignificant in the logistic regression model.

#Problem
#At .05 significance level, decide if any of the 
#independent variables in the logistic regression model
#of vehicle transmission in data set mtcars is statistically insignificant.

#We apply the function glm to a formula that describes the transmission type (am) by the
#horsepower (hp) and weight (wt). This creates a generalized linear model (GLM) in the
#binomial family.

am.glm = glm(formula=am ~ hp + wt, data=mtcars,  family=binomial)
am.glm

#We then print out the summary of the generalized 
#linear model and check for the p-values of the hp and wt variables.

summary(am.glm) 

#Answer
#As the p-values of the hp and wt variables are both less than 0.05, neither hp or wt is
#insignificant in the logistic regression model.


#https://stats.idre.ucla.edu/r/dae/logit-regression/


#LOGIT REGRESSION | R DATA ANALYSIS EXAMPLES


#Logistic regression, also called a logit model, is used to model dichotomous outcome variables. 
# In the logit model the log odds of the outcome is modeled 
#as a linear combination of the predictor variables.

install.packages("aod")
install.packages("ggplot2")
library(aod)
library(ggplot2)

#__Examples

#Example 1. Suppose that we are interested in the 
#factors that influence whether a political candidate 
#wins an election. The outcome (response) variable is 
#binary (0/1); win or lose. The predictor variables of 
#interest are the amount of money spent on the campaign, 
#the amount of time spent campaigning negatively and 
#whether or not the candidate is an incumbent.

#Example 2. A researcher is interested in how variables,
#such as GRE (Graduate Record Exam scores), GPA 
#(grade point average) and prestige of the undergraduate 
#institution, effect admission into graduate school. 
#The response variable, admit/donât admit, is a binary variable.

#__Description of the data

#For our data analysis below, we are going to expand on 
#Example 2 about getting into graduate school. 
#We have generated hypothetical data, which can be 
#obtained from our website from within R. Note that R 
#requires forward slashes (/) not back slashes () 
#when specifying a file location even if the file is on 
#your hard drive.


mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
head(mydata)

#This dataset has a binary response (outcome, dependent)
#variable called admit. There are three predictor 
#variables: gre, gpa and rank. We will treat the 
#variables gre and gpa as continuous. The variable rank 
#takes on the values 1 through 4. Institutions with a 
#rank of 1 have the highest prestige, while those with a 
#rank of 4 have the lowest. We can get basic 
#descriptives for the entire data set by using summary. 
#To get the standard deviations, we use sapply to apply 
#the sd function to each variable in the dataset.

summary(mydata)

sapply(mydata, sd)

#two-way contingency table of categorical outcome and predictors we want
#to make sure there are not 0 cells
xtabs(~admit + rank, data = mydata)

#Analysis methods you might consider

#Below is a list of some analysis methods you may have 
#encountered. Some of the methods listed are quite 
#reasonable while others have either fallen out of 
#favor or have limitations.


#Logistic regression, the focus of this page.

#Probit regression. Probit analysis will produce results
#similar logistic regression. The choice of probit 
#versus logit depends largely on individual preferences.

#OLS regression. When used with a binary response 
#variable, this model is known as a linear probability 
#model and can be used as a way to describe conditional 
#probabilities. However, the errors (i.e., residuals) 
#from the linear probability model violate the 
#homoskedasticity and normality of errors assumptions 
#of OLS regression, resulting in invalid standard errors 
#and hypothesis tests. For a more thorough discussion 
#of these and other problems with the linear probability 
#model, see Long (1997, p. 38-40).

#Two-group discriminant function analysis. 
#A multivariate method for dichotomous outcome variables.

#Hotellingâs T2. The 0/1 outcome is turned into the 
#grouping variable, and the former predictors are 
#turned into outcome variables. 
#This will produce an overall test of significance 
#but will not give individual coefficients for each v
#ariable, and it is unclear the extent to which each 
#"predictor" is adjusted for the impact of the other
#"predictors."

#Using the logit model

#The code below estimates a logistic regression model 
#using the glm (generalized linear model) function.
#First, we convert rank to a factor to indicate that 
#rank should be treated as a categorical variable.

mydata$rank <- factor(mydata$rank)
mylogit <- glm(admit ~ gre + gpa + rank, data = mydata, family = "binomial")

summary(mylogit)

#In the output above, the first thing we see is the call, 
#this is R reminding us what the model we ran was, what 
#options we specified, etc.
#Next we see the deviance residuals, which are a 
#measure of model fit. This part of output shows the 
#distribution of the deviance residuals for individual 
#cases used in the model. Below we discuss how to use 
#summaries of the deviance statistic to assess model fit.
#The next part of the output shows the coefficients, 
#their standard errors, the z-statistic 
#(sometimes called a Wald z-statistic),
#and the associated p-values. Both gre and gpa are 
#statistically significant, as are the three terms for 
#rank. The logistic regression coefficients give the 
#change in the log odds of the outcome for a one unit 
#increase in the predictor variable.



#For every one unit change in gre, the log odds of 
#admission (versus non-admission) increases by 0.002.
#For a one unit increase in gpa, the log odds of being 
#admitted to graduate school increases by 0.804.
#The indicator variables for rank have a slightly 
#different interpretation. For example, having attended 
#an undergraduate institution with rank of 2, versus an
#institution with a rank of 1, changes the log odds of 
#admission by -0.675.

#Below the table of coefficients are fit indices, 
#including the null and deviance residuals and the AIC. 
#Later we show an example of how you can use these 
#values to help assess model fit.



#We can use the confint function to obtain confidence 
#intervals for the coefficient estimates. Note that 
#for logistic models, confidence intervals are based 
#on the profiled log-likelihood function. We can also 
#get CIs based on just the standard errors by using the 
#default method.


confint(mylogit)

# CIs using standard errors
confint.default(mylogit)

#We can test for an overall effect of rank using
#the wald.test function of the aod library. 
#The order in which the coefficients are given 
#in the table of coefficients is 
#the same as the order of the terms in the model. 
#This is important because the wald.test function refers 
#to the coefficients by their order in the model. 
#We use the wald.test function. b supplies the 
#coefficients, while Sigma supplies the variance 
#covariance matrix of the error terms, finally Terms 
#tells R which terms in the model are to be tested, in 
#this case, terms 4, 5, and 6, are the three terms for 
#the levels of rank.


wald.test(b = coef(mylogit), Sigma = vcov(mylogit), Terms = 4:6)

#The chi-squared test statistic of 20.9, with three 
#degrees of freedom is associated with a p-value of 0.00011 indicating that the overall effect of rank is statistically significant.



#We can also test additional hypotheses about the 
#differences in the coefficients for the different 
#levels of rank. Below we test that the coefficient 
#for rank=2 is equal to the coefficient for rank=3. 
#The first line of code below creates a vector l that 
#defines the test we want to perform. In this case, we 
#want to test the difference (subtraction) of the 
#terms for rank=2 and rank=3 (i.e., the 4th and 5th terms in the model). 
#To contrast these two terms, we multiply one of them 
#by 1, and the other by -1. The other terms in the 
#model are not involved in the test, so they are 
#multiplied by 0. The second line of code below uses 
#L=l to tell R that we wish to base the test on the 
#vector l (rather than using the Terms option as we did above).


L <- cbind(0, 0, 0, 1, -1, 0)
wald.test(b = coef(mylogit), Sigma = vcov(mylogit), L = L)

#The chi-squared test statistic of 5.5 with 1 degree of 
#freedom is associated with a p-value of 0.019, 
#indicating that the difference between the 
#coefficient for rank=2 and the coefficient for
#rank=3 is statistically significant.

#You can also exponentiate the coefficients and 
#interpret them as odds-ratios. R will do this 
#computation for you. To get the exponentiated 
#coefficients, you tell R that you want to exponentiate 
#(exp), and that the object you want to exponentiate 
#is called coefficients and it is part of mylogit 
#(coef(mylogit)). We can use the same logic to get 
#odds ratios and their confidence intervals, by 
#exponentiating the confidence intervals from before. 
#To put it all in one table, we use cbind to bind the 
#coefficients and confidence intervals column-wise.

# odds ratios only
exp(coef(mylogit))

# odds ratios and 95% CI
exp(cbind(OR = coef(mylogit), confint(mylogit)))

#Now we can say that for a one unit increase in gpa, 
#the odds of being admitted to graduate school 
#(versus not being admitted) increase by a factor 
#of 2.23. For more information on interpreting odds 
#ratios see our FAQ page How do I interpret odds 
#ratios in logistic regression? . Note that while 
#R produces it, the odds ratio for the intercept is
#not generally interpreted.

##You can also use predicted probabilities to help you 
#understand the model. Predicted probabilities can be 
#computed for both categorical and continuous predictor
#variables. In order to create predicted probabilities
#we first need to create a new data frame with the 
#values we want the independent variables to take on 
#to create our predictions.

#We will start by calculating the predicted probability of admission at each value of rank, holding gre and gpa at their means. First we create and view the data frame.

newdata1 <- with(mydata, data.frame(gre = mean(gre), gpa = mean(gpa), rank = factor(1:4)))

## view data frame
newdata1

#These objects must have the same names as the 
#variables in your logistic regression above 
#(e.g. in this example the mean for gre must be named 
#gre). Now that we have the data frame we want to 
#use to calculate the predicted probabilities, we 
#can tell R to create the predicted probabilities. 
#The first line of code below is quite compact, 
#we will break it apart to discuss what various 
#components do. The newdata1$rankP tells R that we
#want to create a new variable in the dataset 
#(data frame) newdata1 called rankP, the rest of the 
#command tells R that the values of rankP should be 
#predictions made using the predict( ) function. 
#The options within the parentheses tell R that the 
#predictions should be based on the analysis mylogit
#with values of the predictor variables coming from 
#newdata1 and that the type of prediction is a 
#predicted probability (type="response"). 
#The second line of the code lists the values in the
#data frame newdata1. Although not particularly pretty, 
#this is a table of predicted probabilities.

newdata1$rankP <- predict(mylogit, newdata = newdata1, type = "response")
newdata1


#In the above output we see that the predicted
#probability of being accepted into a graduate 
#program is 0.52 for students from the highest 
#prestige undergraduate institutions (rank=1), 
#and 0.18 for students from the lowest ranked 
#institutions (rank=4), holding gre and gpa at their 
#means. We can do something very similar to create a 
#table of predicted probabilities varying the value of
#gre and rank. We are going to plot these, so we will 
#create 100 values of gre between 200 and 800, at each 
#value of rank (i.e., 1, 2, 3, and 4).

newdata2 <- with(mydata, data.frame(gre = rep(seq(from = 200, to = 800, length.out = 100),
                                              4), gpa = mean(gpa), rank = factor(rep(1:4, each = 100))))

#The code to generate the predicted probabilities 
#(the first line below) is the same as before, 
#except we are also going to ask for standard errors 
#so we can plot a confidence interval. We get the 
#estimates on the link scale and back transform both 
#the predicted values and confidence limits into 
#probabilities.

newdata3 <- cbind(newdata2, predict(mylogit, newdata = newdata2, type = "link",
                                    se = TRUE))
newdata3 <- within(newdata3, {
  PredictedProb <- plogis(fit)
  LL <- plogis(fit - (1.96 * se.fit))
  UL <- plogis(fit + (1.96 * se.fit))
})

## view first few rows of final dataset
head(newdata3)


#It can also be helpful to use graphs of predicted 
#probabilities to understand and/or present the model. 
#We will use the ggplot2 package for graphing. 
#Below we make a plot with the predicted probabilities, 
#and 95% confidence intervals.

ggplot(newdata3, aes(x = gre, y = PredictedProb)) + geom_ribbon(aes(ymin = LL, ymax = UL, fill = rank), alpha = 0.2) + geom_line(aes(colour = rank), size = 1)

#We may also wish to see measures of how well our 
#model fits. This can be particularly useful when 
#comparing competing models. The output produced by 
#summary(mylogit) included indices of fit 
#(shown below the coefficients), including the null 
#and deviance residuals and the AIC. One measure of 
#model fit is the significance of the overall model. 
#This test asks whether the model with predictors 
#fits significantly better than a model with just an 
#intercept (i.e., a null model). The test statistic 
#is the difference between the residual deviance for
#the model with predictors and the null model. 
#The test statistic is distributed chi-squared with 
#degrees of freedom equal to the differences in degrees 
#of freedom between the current and the null model 
#(i.e., the number of predictor variables in the model).
#To find the difference in deviance for the two models 
#(i.e., the test statistic) we can use the command:

with(mylogit, null.deviance - deviance)

#The degrees of freedom for the difference between 
#the two models is equal to the number of predictor 
#variables in the mode, and can be obtained using

with(mylogit, df.null - df.residual)


#Finally, the p-value can be obtained using:
  
  
with(mylogit, pchisq(null.deviance - deviance, df.null - df.residual, lower.tail = FALSE))


#The chi-square of 41.46 with 5 degrees of freedom and 
#an associated p-value of less than 0.001 tells us 
#that our model as a whole fits significantly better 
#than an empty model. This is sometimes called a 
#likelihood ratio test (the deviance residual is -2*log likelihood). 
#To see the modelâs log likelihood, we type:
  
  
logLik(mylogit)

#__Things to consider

#Empty cells or small cells: You should check for 
empty or small cells by doing a crosstab between 
categorical predictors and the outcome variable. 
If a cell has very few cases (a small cell), 
the model may become unstable or it might not run at all.

#Separation or quasi-separation (also called perfect 
prediction), a condition in which the outcome does not 
vary at some levels of the independent variables. 
See our page FAQ: What is complete or quasi-complete 
separation in logistic/probit regression and how do 
we deal with them? for information on models with 
perfect prediction.

#Sample size: Both logit and probit models require more 
#cases than OLS regression because they use maximum 
#likelihood estimation techniques. It is sometimes 
#datasets with only a small number of cases using exact 
#logistic regression. It is also important to keep in 
#mind that when the outcome is rare, even if the overall 
#dataset is large, it can be difficult to estimate a 
#logit model.

#Pseudo-R-squared: Many different measures of
#psuedo-R-squared exist. They all attempt to provide 
#information similar to that provided by R-squared in 
#OLS regression; however, none of them can be interpreted
#exactly as R-squared in OLS regression is interpreted. 
#For a discussion of various pseudo-R-squareds see Long 
#and Freese (2006) or our FAQ page What are pseudo 
#R-squareds?

#Diagnostics: The diagnostics for logistic regression
#are different from those for OLS regression.
#For a discussion of model diagnostics for logistic 
#regression, see Hosmer and Lemeshow (2000, Chapter 5). 
#Note that diagnostics done for logistic regression are 
#similar to those done for probit regression.

#__References
#Hosmer, D. & Lemeshow, S. (2000). Applied Logistic Regression (Second Edition). New York: John Wiley & Sons, Inc.
#Long, J. Scott (1997). Regression Models for Categorical and Limited Dependent Variables. Thousand Oaks, CA: Sage Publications.



#__Setul 2

#In sectiunea 2, veti parcurge aceiasi pasi de 
#construire a unui model de regresie logistica 
#pentru un set de date despre pacienti diabetici, 
#din pachetul MASS (setul Pima).

#__Exercitiul 1
#Încărcați pachetul MASS și combinați Pima.tr și Pima.tr2 într-un data.frame numit train și salvați Pima.te ca test. 
#Schimbați codarea variabilei noastre de interes (type) la 0 (non-diabetic) și 1 (diabetic). 
#Verificați și observati nota de valorile care lipsesc.

library(MASS)

train <- rbind(Pima.tr, Pima.tr2)

train$type<-ifelse(train$type=='Yes', 1, 0) #Din YES si NO in 1 si 0

head(train)

sum(is.na(train$type)) #valorile care lipsesc?


#Exercițiul 2
#Uitați-vă la date. Tramați grafice de tip scatterplot între toate variabilele explicative folosind functia pairs () 
#și codați  în funcție de clasificarea diabetică. În plus, încercați să faceti graficul type în funcție de age. 

pairs(subset(train, select = -c(type)), col = as.factor(train$type))

plot(train$type, train$age, type="o")

#Exercițiul 3
#Folosind glm () și datele din train construiti un 
#model logistic care explica variabila type in functie
#de age și bmi. Tipăriți coeficienții și valoarea lor p.
#Indicatie. functia summary

b <- factor(train$type)
fit <- glm(b ~ bmi+ age ,data=train,family=binomial())
summary(fit)

train$age_cat <- ifelse(train$age < 21, "<21", ifelse((train$age>=21) & (train$age<=25), "21-25",  ifelse((train$age>25) & (train$age<=30), "25-30",ifelse((train$age>30) & (train$age<=35), "30-35",ifelse((train$age>35) & (train$age<=40), "35-40",ifelse((train$age>40) & (train$age<=50), "40-50",ifelse((train$age>50) & (train$age<=60), "50-60",">60")))))))

train$age_cat <- factor(train$age_cat, levels = c('<21','21-25','25-30','30-35','35-40','40-50','50-60','>60'))
table(train$age)

#https://www.kaggle.com/ksp585/pima-indian-diabetes-logistic-regression-with-r
#ceva interesant

## MORTII LOR DE LABORATOARE CA NU NE ARATI NIMIC DA NE PUI SA DAM COPY PASTE FARA SA EXPLICI SAU SA DAI EXEMPLE...CUM PULA MEA SA STIU SA FAC CEVA CE N-AM LUCRAT NICIODATA? CUM POATE UN OM SA TAIE UN COPAC DACA NU-I ATRATI CUM ????

