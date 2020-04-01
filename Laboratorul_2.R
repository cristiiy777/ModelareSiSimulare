#~~~~~Laboratorul 2~~~~

#__Exercitii


#1. Exercitiu 1, de la sectiunea 3.7 din "A Beginner's Guide to R" - vezi resursa pe site.

#The file BirdFlu.xls contains the annual number of confirmed cases of human
#Avian Influenza A/(H5N1) for several countries reported to the World Health
#Organization (WHO). The data were taken from the WHO website
#(www.who.int/en/) and reproduced for educational purposes. Prepare the
#spreadsheet and import these data into R. If you are a non-Windows user,
#start with the file BirdFlu.txt. Note that you will need to adjust the column
#names and some of the country names.
#Use the names and str command in R to view the data. Print the number of
#bird flu cases in 2003. What is the total number of bird flu cases in 2003 and in
#2005? Which country has had the most cases? Which country has had the least
#bird flu deaths?
#Using methods from Chapter 2, what is the total number of bird flu cases per
#country? What is the total number of cases per year?

directory  <- "C:/Users/Lenovo/Desktop/ModelareSiSimulare"

fisierBirdFlu <- file.path(directory, "BirdFluCases.txt")

birdflu <- read.table(file = fisierBirdFlu, header = TRUE, fill = TRUE)

names(birdflu)
str(birdflu)
an <- c(birdflu$Year)

nrcoloane = 0;
for(x in names(birdflu))
  nrcoloane=nrcoloane+1 #calculam cate coloane sunt

print(birdflu[1,2:nrcoloane]) #printam prima linie fara coloana 1 adica Year

print("Total cazuri 2003")
print(sum(birdflu[1,2:nrcoloane])) #suma de pe prima linie (2003) incepand cu coloana 2 (fara Year) pana la ultima coloana (nrcoloane)

print("Total cazuri 2005")
print(sum(birdflu[3,2:nrcoloane])) #2005 e a 3-a linie, prima coloana e anu deci incepem de la 2 pana la ultima coloana = nrcoloane

sume_coloane <- c(colSums(birdflu[2:nrcoloane])) #prima coloana e anu

nrmaxCazuri=max(sume_coloane)
print(nrmaxCazuri)

nrminCazuri=min(sume_coloane)
print(nrminCazuri)

index_coloana = which.max(sume_coloane)
print("Tara cu cele mai multe cazuri")
names(birdflu[index_coloana+1])

index_coloana = which.min(sume_coloane)
print("Tara cu cele mai putine cazuri")
names(birdflu[index_coloana+1])

#2. Exercitiile 1 si 2 de la sectiune 4.6  din "A Beginner's Guide to R" - vezi resursa pe site.

fisierTemperatura <- file.path(directory, "Temperature.txt")

TP <- read.table(file = fisierTemperatura, header = TRUE, dec = ".")

names(TP)
str(TP)
TempYearMonth <- matrix(nrow = 16, ncol = 12)
unique(TP$Year)

AllYears <- unique(TP$Year)
for (i in 1:16) {
  ThisYear <- AllYears[i]
  TPi <- TP[TP$Year == ThisYear ,]
  TempYearMonth[i,] <- tapply(TPi$Temperature, FUN=mean, INDEX =TPi$Month , na.rm = TRUE)
}
print(TempYearMonth)

#Using the data in Exercise 1, determine the number of observations per
#station. How many observations were made per year? How many observations
#were made at each station per year?

table(TP$Station, TP$Year)

#3. Exercitiul 1 de la sectiunea 5.5. din "A Beginner's Guide to R" - vezi resursa pe site.

#In Chapter 16 of Zuur et al. (2009), a study is presented analysing numbers of amphibians
#killed along a road in Portugal using generalised additive mixed modelling
#techniques. In this exercise, we use the plot command to visualise a segment
#of the data. Open the file Amphibian_road_Kills.xls, prepare a spreadsheet, and
#import the data into R.
#The variable, TOT_N, is the number of dead animals at a sampling site,
#OLIVE is the number of olive groves at a sampling site, 
#and D Park is the distance from each sampling point to the nearby natural park. 
#Create a plot of TOT_N versus D_park. Use appropriate labels. Add a smoothing curve. Make
#the same plot again, but use points that are proportional to the value of OLIVE
#(this may show whether there is an OLIVE effect).

fisierRoadKills <- file.path(directory, "Amphibian_road_Kills.txt")

RK <- read.table(file = fisierRoadKills, header = TRUE, dec = ".")

names(RK)
str(RK)

TOT_N  <- RK$TOT.N
D.Park <- RK$D.PARK

par(mfrow = c(1,2))
plot(TOT_N,  main ="Dead animals", xlab="TOT_N", ylab=" ")
plot(D.Park, main ="Distance between samples", xlab="D.Park", ylab=" ")



