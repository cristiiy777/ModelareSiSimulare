#~~~~~Laboratorul 4~~~~

#__Exercitii - Partea 1

#__variabile aleatoare cu distributia Binomiala
# http://www.r-tutor.com/elementary-statistics/probability-distributions/binomial-distribution

#Suppose there are twelve multiple choice questions in an English class quiz. 
# Each question has five possible answers, and only one of them is correct.
#Find the probability of having four or less correct answers if a student attempts to answer every question at random.

#Since only one out of five possible answers is correct, the probability of answering a question correctly by random is 1/5=0.2.
#We can find the probability of having exactly 4 correct answers by random attempts 

dbinom(4, size=12, prob=0.2)

#To find the probability of having four or less correct answers by random attempts, we apply the function dbinom with x = 0,…,4.

dbinom(0, size=12, prob=0.2) + 
  + dbinom(1, size=12, prob=0.2) + 
  + dbinom(2, size=12, prob=0.2) + 
  + dbinom(3, size=12, prob=0.2) + 
  + dbinom(4, size=12, prob=0.2) 

#The probability of four or less questions answered correctly by random in a twelve question multiple choice quiz is 92.7%.

#__variabile aleatoare cu distributia Poisson
#http://www.r-tutor.com/elementary-statistics/probability-distributions/poisson-distribution

#If there are twelve cars crossing a bridge per minute on average, 
#find the probability of having seventeen or more cars crossing the bridge in a particular minute.

#The probability of having sixteen or less cars crossing
#the bridge in a particular minute is given by the function ppois.

ppois(16, lambda=12)   # lower tail

#Hence the probability of having seventeen or more cars
#crossing the bridge in a minute is in the upper tail of the probability density function.

ppois(16, lambda=12, lower=FALSE)   # upper tail

#If there are twelve cars crossing a bridge per minute on average, 
#the probability of having seventeen or more cars crossing the bridge in a particular minute is 10.1%


#__variabile aleatoare cu distributia Uniforma de tip continuu
#http://www.r-tutor.com/elementary-statistics/probability-distributions/continuous-uniform-distribution


#Select ten random numbers between one and three.
#We apply the generation function runif of the uniform distribution to generate ten random numbers between one and three.

runif(10, min=1, max=3) 

#__variabile aleatoare cu distributia Exponentiala
#http://www.r-tutor.com/elementary-statistics/probability-distributions/exponential-distribution

#Suppose the mean checkout time of a supermarket cashier is three minutes.
#Find the probability of a customer checkout being completed by the cashier in less than two minutes.

#The checkout processing rate is equals to one divided by the mean checkout completion time.
#Hence the processing rate is 1/3 checkouts per minute. We then apply the function pexp of the exponential distribution with rate=1/3.

pexp(2, rate=1/3) 

#The probability of finishing a checkout in under two minutes by the cashier is 48.7%

#__variabile aleatoare cu  distributia Normala
#http://www.r-tutor.com/elementary-statistics/probability-distributions/normal-distribution

#Assume that the test scores of a college entrance exam fits a normal distribution.
#Furthermore, the mean test score is 72, and the standard deviation is 15.2. 
#What is the percentage of students scoring 84 or more in the exam?

#We apply the function pnorm of the normal distribution with mean 72 and standard deviation 15.2. 
#Since we are looking for the percentage of students scoring higher than 84, we are interested in the upper tail of the normal distribution.

pnorm(84, mean=72, sd=15.2, lower.tail=FALSE)

#The percentage of students scoring 84 or more in the college entrance exam is 21.5%.

#__variabile aleatoare cu  distributia Chi-patrat
#http://www.r-tutor.com/elementary-statistics/probability-distributions/chi-squared-distribution

#Find the 95th percentile of the Chi-Squared distribution with 7 degrees of freedom.
#We apply the quantile function qchisq of the Chi-Squared distribution against the decimal values 0.95.

qchisq(.95, df=7)        # 7 degrees of freedom 

#The 95th percentile of the Chi-Squared distribution with 7 degrees of freedom is 14.067.

#__variabile aleatoare cu  distributia Student (t)
# http://www.r-tutor.com/elementary-statistics/probability-distributions/student-t-distribution

#Find the 2.5th and 97.5th percentiles of the Student t distribution with 5 degrees of freedom.

#We apply the quantile function qt of the Student t distribution against the decimal values 0.025 and 0.975.

qt(c(.025, .975), df=5)   # 5 degrees of freedom 

#The 2.5th and 97.5th percentiles of the Student t distribution with 5 degrees of freedom are -2.5706 and 2.5706 respectively.

#__variabile aleatoare cu  distribtuia F 
#http://www.r-tutor.com/elementary-statistics/probability-distributions/f-distribution

#Find the 95th percentile of the F distribution with (5, 2) degrees of freedom.

#We apply the quantile function qf of the F distribution against the decimal value 0.95.

qf(.95, df1=5, df2=2) 

#The 95th percentile of the F distribution with (5, 2) degrees of freedom is 19.296.




#~~~~~~~~~~~~~~~~~~~~~~




#__Exercitii - Partea 2

#La fiecare lansare in executie, functiile generatoare de numere aleatoare vor genera valori diferite.
#Pentru a asigura controlul caracterului aleator si pentru reproductibilitate, lansati set.seed(1) 
#sau orice alta valoare, dar pe care sa o tineti minte/memorati pentru referinte ulterioare!

set.seed(1)

#__Exercitiul 1. Simularea aruncarii unui zar

#a) Generati 30 de numere aleatoare folosind functia runif cu parametrii potriviti. Salvati-le intr-un obiect
#   numit valori_aleatoare.Folositi apoi functia ceiling pentru a le rotunji la valori intregi. 
#   Puteti utiliza functia round?

valori_aleatoare <- runif(30, min = 1, max = 30) 
valori_aleatoare
valori_aleatoare_ceiling <- ceiling(valori_aleatoare)
valori_aleatoare_ceiling
valori_aleatoare_round   <- round(valori_aleatoare)
valori_aleatoare_round

#b) Realizati histograma valorilor generate. 

hist(valori_aleatoare_ceiling)

#c) Generati 300 de valori. Parcurgeti aceiasi pasi ca anterior. Trasati histograma.

valori_aleatoare <- runif(300, min = 1, max = 300) 
valori_aleatoare
valori_aleatoare_ceiling <- ceiling(valori_aleatoare)
valori_aleatoare_ceiling
hist(valori_aleatoare_ceiling)


#d) Generati 3000 de valori. Parcurgeti aceiasi pasi ca anterior. Trasati histograma.

valori_aleatoare <- runif(3000, min = 1, max = 3000) 
valori_aleatoare
valori_aleatoare_ceiling <- ceiling(valori_aleatoare)
valori_aleatoare_ceiling

hist(valori_aleatoare_ceiling)

plot(valori_aleatoare_ceiling, type = "l")


#__Exercitiul 2. Variabile binomiale

#Simulati un joc in care se arunca o moneda “necinstita”: pentru care probabilitatea de succes este 0.48.
#Consideram succes daca moneda nimereste cu banul in sus. Presupunem ca se arunca moneda de 10 ori. 
#La fiecare aruncare, daca fata este ban, castigi 10 puncte, iar altfel pierzi 10 puncte. Simulati acest joc de 1000 de ori.
#Folositi functia rbinom.
#Ce suma de bani veti castiga/pierde in cele 1000 de repetari?

theta    <- 0.48 #probabilitate succes moneda necinstita
N        <- 1000 #numar aruncari
aruncari <- rbinom(n = N, size = 1, prob = theta)
table(aruncari) 
#0 e cap 
#1 e pajura
#frecventa e numaru lor
aruncari <- as.data.frame(table(aruncari)) #il fac data.frame ca sa pot accesa frecventa
cap    <- aruncari$Freq[1] #primu e capu
pajura <- aruncari$Freq[2] #a doua e pajura

suma_castigata <- (cap * 10) - (pajura * 10)
suma_castigata

#__Exercitiul 3. Simularea de valori distribuite normal

#a) Consideram o populație în care înălțimea medie este de 1,70 m cu o abatere standard de 0,1. 
#   Folosind rnorm, simulați înălțimea a 100 de persoane și salvați datele într-un obiect numit înălțimi.

inaltimi <- rnorm(n = 100, mean = 1.70, sd = 0.1)
inaltimi

#b) Pentru a vă face o idee despre valorile înălțimii, utilizați functia summary.

summary(inaltimi)

#c) Aflati valoarea inaltimii h pentru care 90% dintre valori sunt mai mici decat aceasta valoare. Adica aflati h pentru care P(H<h) = 0.90
#   Indicatie: Consultati documentatia pentru qnorm. Folositi functia qnorm(.90, mean = 1.70, sd = .1)

qnorm(.90, mean = 1.70, sd = .1)

#d) Ce procent din populatie au inaltimea mai mare de 1.60 m? Adica, calculati P(H>1.6) = 1-P(H<1.6) Indicatie. Consultati documentatia pentru pnorm.

pnorm(1.60, mean = 1.70, sd = 0.1, lower.tail = FALSE)

#e) Executați următorul cod rând înainte de acest exercițiu. Aceasta va încărca o bibliotecă necesară exercițiului.

if (!'MASS' %in% installed.packages()) install.packages('MASS')
library(MASS)

#Simulati 1000 persoane cu inaltimea si greutatea distribuite conform unei distributii normale multivariate, astfel: 
#folositi functia mvrnorm cu mu = c(1.70, 60) si Sigma = matrix(c(.1,3.1,3.1,100), nrow = 2)

set.seed(1)
population <- mvrnorm(1000, mu = c(1.70, 60), Sigma = matrix( c(.1,3.1,3.1,100), nrow = 2) )
population <- as.data.frame(population) #o fac dataframe
colnames(population) <- c("Inaltime", "Greutate") #le pun un nume
population

#f) Cate persoane din populatia generata sunt mai inalte de 1.70 m si au greutatea mai mare decat 60 kg?

nrow(population[population$Inaltime > 1.70 & population$Greutate > 60, ]) #population[rand (aici avem conditia pt rand), coloana(luam toate coloanele nu una specifica de asta e o virgula la urma)]

#SAU 

sum(population$Inaltime > 1.70 & population$Greutate > 60)


#g) Cate persoane din populatia generata sunt mai inalte de 1.75 si mai usoare de 65 kg?

nrow(population[population$Inaltime > 1.75 & population$Greutate < 65, ])


#Exercitiu 4. Simularea de valori distribuite normal

#a) Consideram o populație în care înălțimea medie este de 1,70 m cu o abatere standard de 0,1
#   Folosind rnorm, simulați înălțimea a 100 de persoane și salvați datele într-un obiect numit înălțimi.

inaltimi <- rnorm(n = 100, mean = 1.70, sd = 0.1)
inaltimi

#b) Generati 10000 de valori din aceasta distributie. Trasati graficul functiei densitate de probabilitate.
#   Indicatie. Folositi functia density cu parametru vectorul anterior.

inaltimi <- rnorm(n = 1000, mean = 1.70, sd = 0.1)
density(inaltimi)
plot(density(inaltimi))

#__Exercitiul 5

#Folosind functia rnorm, generati 100, 500, 1000, 5000, 10000, 100000, 1000000 de valori repartizate normal
#dintr-o distributie cu medie 0 si deviatie 1. Realizati histograme pentru fiecare esantion in parte.

hist(rnorm(n = 100, mean = 0, sd = 1))
hist(rnorm(n = 500, mean = 0, sd = 1))
hist(rnorm(n = 1000, mean = 0, sd = 1))
hist(rnorm(n = 5000, mean = 0, sd = 1))
hist(rnorm(n = 10000, mean = 0, sd = 1))
hist(rnorm(n = 100000, mean = 0, sd = 1))
hist(rnorm(n = 1000000, mean = 0, sd = 1))

#Folosind functia dnorm(), realizati graficul functiei de densitate de probabilitate a v.a. N(0,1). 

curve(dnorm(x),
      xlim = c(-4, 4),
      ylab = "Density", 
      main = "Standard Normal Density Function") 

#Trasati acest grafic peste histogramele obtinute la pasul anterior.

h <- hist(rnorm(n = 100, mean = 0, sd = 1))
x <- rnorm(n = 100, mean = 0, sd = 1)
xfit<-seq(min(x),max(x),length=4)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)


#Trasati graficul functie emoirice de distributie cumulative (indicatie folositi pnorm() ).

curve(pnorm(x), xlim = c(-4, 4), ylab = "Density")

#__Exercitiu 6

#Trasati graficul functiilor de densitate de probabilitate pentru repartitiile:

#Exponential cu parametru 0.5

x <- rexp(n=100, rate=0.5)
curve(rexp(x))

#Exponential cu parametru 1

x <- rexp(n=100, rate=1)
curve(rexp(x))


#Exponential cu parametru 2

x <- rexp(n=100, rate=2)
curve(rexp(x))


#Exponential cu parametru 10

x <- rexp(n=100, rate=10)
curve(rexp(x))


#Gamma  cu shape 1 scala 2

x <- rgamma(n=10, shape= 1, scale = 2)
curve(rgamma(x, shape = 1, scale = 2))

#Gamma  cu shape 2 scala 2

x <- rgamma(n=10, shape= 2, scale = 2)
curve(rgamma(x, shape = 2, scale = 2))

#Gamma  cu shape 5 scala 2

x <- rgamma(n=10, shape= 5, scale = 2)
curve(rgamma(x, shape = 5, scale = 2))

#Gamma  cu shape 5 scala 0.5

x <- rgamma(n=10, shape= 5, scale = 0.5)
curve(rgamma(x, shape = 5, scale = 0.5))

#Student cu 10 grade de libertate

curve(dt(x, 10), lwd=3, col= "blue")

#Student cu 5 grade de libertate

curve(dt(x, 5), lwd=3, col= "blue")

#Student cu 2 grade de libertate

curve(dt(x, 2), lwd=3, col= "blue")

#Student cu 1 grade de libertate

curve(dt(x, 2), lwd=3, col= "blue")


#Indicatii: https://en.wikibooks.org/wiki/R_Programming/Probability_Distributions


#__Exercitiul 7

#Descarcati setul de date Norm.t.data_.csv Trasati histogramele pentru fiecare variabila. Sunt similare?

directory  <- "C:/Users/Lenovo/Desktop/ModelareSiSimulare"
fisierNorm <- file.path(directory, "Norm.t.data_.csv")
norm       <- read.csv(file = fisierNorm, header = TRUE)

hist(norm$Process1)

hist(norm$Process2)


#Folosind ecdf() trasati graficul functiei empirice cumulative de distributie.

plot(ecdf(norm$Process1))

plot(ecdf(norm$Process2))


#Folositi testul ks.test() (Kolmogorov Smirnof) pentru a verifica daca cele 2 distributii sunt diferite din punct de vedere statistic.

ks.test(norm$Process1, norm$Process2)




