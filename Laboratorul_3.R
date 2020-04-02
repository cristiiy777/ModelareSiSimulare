#~~~~~Laboratorul 3~~~~

#__Exercitii

#Exercitii cu setul de date faithful.txt (link pe pagina principala):

#1. Calculatii distributia frecventelor pentru perioadele de asteptare dintre eruptii (coloana waiting)

#We first find the range of eruption durations with the range function. It shows that the observed eruptions are between 1.6 and 5.1 minutes in duration
duration = faithful$eruptions 
range(duration) 
#Break the range into non-overlapping sub-intervals by defining a sequence of equal distance break points.
# If we round the endpoints of the interval [1.6, 5.1] to the closest half-integers, we come up with the interval [1.5, 5.5].
#Hence we set the break points to be the half-integer sequence { 1.5, 2.0, 2.5, ... }.
breaks = seq(1.5, 5.5, by=0.5)    # half-integer sequence 

#Classify the eruption durations according to the half-unit-length sub-intervals with cut. 
#As the intervals are to be closed on the left, and open on the right, we set the right argument as FALSE.
duration.cut = cut(duration, breaks, right=FALSE)

#Compute the frequency of eruptions in each sub-interval with the table function.
duration.freq = table(duration.cut)

#The frequency distribution of the eruption duration is:
duration.freq

#We apply the cbind function to print the result in column format.
cbind(duration.freq)

#2. Aflati care este subintervalul care are cele mai multe eruptii.

max(duration.freq)

#3. Trasati graficul histograma a duratei de asteptare (waiting)

duration = faithful$eruptions 
colors = c("red", "yellow", "green", "violet", "orange", "blue", "pink", "cyan")

#We apply the hist function to produce the histogram of the eruptions variable.
hist(duration, right=FALSE, col = colors, main = "Old Faithful Eruptions", xlab = "Duration minutes")
#apply the hist function
#intervals closed on the left
#set the color palette
#main title
#x-axis label

#4. Calculati frecventele relative ale duratei de asteptare (waiting)

#We first find the frequency distribution of the eruption durations as follows.
duration = faithful$eruptions 
breaks = seq(1.5, 5.5, by=0.5) 
duration.cut = cut(duration, breaks, right=FALSE)
duration.freq = table(duration.cut)
#Then we find the sample size of faithful with the nrow function, and divide the frequency distribution with it. As a result, the relative frequency distribution is:
duration.relfreq = duration.freq / nrow(faithful)
#The frequency distribution of the eruption variable is:
duration.relfreq 

old = options(digits=1) 
cbind(duration.freq, duration.relfreq) 

#5. Calculati frecventele cumulate ale duratei de asteptare.

#In the data set faithful, the cumulative frequency distribution of the eruptions variable shows the total number of eruptions whose durations are less than or equal to a set of chosen levels.
#We first find the frequency distribution of the eruption durations
duration = faithful$eruptions 
breaks = seq(1.5, 5.5, by=0.5) 
duration.cut = cut(duration, breaks, right=FALSE)
duration.freq = table(duration.cut)
#We then apply the cumsum function to compute the cumulative frequency distribution.
duration.cumfreq = cumsum(duration.freq)
#We apply the cbind function to print the result in column format.
cbind(duration.cumfreq) 

#6. Reprezentati grafic frecventele cumulate ale duratei de asteptare.

plot(duration.cumfreq)

#7. Trasati graficul stem-and-leaf pentru durata de asteptare.

#The stem-and-leaf plot of the eruption durations is
duration = faithful$eruptions
stem(duration) 


#8.Trasati graficul de tip scatter plot pentru acest set de date.
#  Trasati dreapta ce corespunde modelului de regresie liniara prin acest nor de puncte.

#In the data set faithful, we pair up the eruptions and waiting values in the same observation as (x,y) coordinates. 
#Then we plot the points in the Cartesian plane.
#Here is a preview of the eruption data value pairs with the help of the cbind function.

duration = faithful$eruptions      # the eruption durations
waiting = faithful$waiting         # the waiting interval
head(cbind(duration, waiting)) 

#We apply the plot function to compute the scatter plot of eruptions and waiting.
plot(duration, waiting, xlab = "Eruption duration", ylab = "Time waited")

#We can generate a linear regression model of the two variables with the lm function, and then draw a trend line with abline.
abline(lm(waiting ~ duration))

#9. Calculati media, mediana, dispersia, deviatia standard, coeficientul de aplatizare si coeficientul
#   de asimetrie pentru fiecare din variabilele din setul de date faithful.
#   Care este amplitudinea fiecarei observatii?

duration = faithful$eruptions      
waiting = faithful$waiting         

library(e1071)                    # load e1071
median(duration)
mean(duration)
sd(duration)
skewness(duration)

median(waiting)
mean(waiting)
sd(waiting)
skewness(waiting)



#10. Identificati valorile aberante din setul de date, coloane Waiting. Folositi regula deviatiei standard.
#    Apoi, folositi regula intervalului inter-cuartilic.

waiting = faithful$waiting 

sd(waiting) 

IQR(waiting)

#11. Trasati graficul de tip box-plot  pentru fiecare variabila din setul de date faithful.

boxplot(faithful$eruptions)
boxplot(faithful$waiting)

#12. Calculati coeficientul de corelatie dintre variabilele din setul faithful.

duration = faithful$eruptions
waiting = faithful$waiting
cor(duration, waiting)       # apply the cor function 

#__Exercitii suplimentare

#Incarcati in R setul de date Titanic (disponibil prin link de pe pagina principala). 
#Analizati datele din acest fisier, cuprinzand macar urmatoarele:

directory     <- "C:/Users/Lenovo/Desktop/ModelareSiSimulare"

fisierTitanic <- file.path(directory, "trainTitanic.csv")

titanic       <- read.csv(file = fisierTitanic, header = TRUE)

head(titanic)

#T1. Trasati grafic distributia pe clase a pasagerilor (atributul PClass)

hist(titanic$Pclass, main = "Distributia pasagerilor pe clase")


#T2. Trasati grafic distributia pasagerilor pe sexe.

sex <- titanic$Sex
sex <- sub("male", "1", sex)
sex <- sub("fe1",  "0", sex)
sex <- as.numeric(sex)
hist(sex, col = c("blue", "pink"),  xlim = c(0, 1), breaks = 2, main = "Distributia pasagerilor pe sexe")


  
#T3. Aflati media de varsta a femeilor de pe vas, respectiv a barbatilor de pe vas.
#    De asemenea, calculati deviatia standard a varstei femeilor si barbatilor.


mean(titanic$Age[titanic$Sex=="female"], na.rm = TRUE) #medie varsta femei
mean(titanic$Age[titanic$Sex=="male"], na.rm = TRUE) #medie varsta barbati

sd(titanic$Age[titanic$Sex=="female"], na.rm = TRUE) #deviatie standard femei
sd(titanic$Age[titanic$Sex=="male"], na.rm = TRUE) #deviatie standard barbati

#T4. Caracterizati, printr-un grafic potrviti, distributia pe sexe a supravietuitorilor.


sex <- titanic$Sex[titanic$Survived==1]
sex <- sub("male", "1", sex)
sex <- sub("fe1",  "0", sex)
sex <- as.numeric(sex)
hist(sex, col = c("blue", "pink"),  xlim = c(0, 1), breaks = 2, main = "Distributia supravietuitorilor pe sexe")

