##Setul de date state.x77 este deja preinstalat in RStudio.
##transformam matricea  state.x77 intr-o dataframe pe care o stocam in variabila denumita dataset
dataset <- as.data.frame(state.x77)

##Vom utiliza functia str() pentru a afisa structura interna a obiectului state.x77
str(dataset)

##In continuare folosim names() pentru a vedea coloanele setului de date

names(dataset)

##Datasetul contine 50 de linii de date, putem afisa doar primele 6 state americane din capul data setului cu functia head()
##si putem sa le facem un rezumat pentru fiecare dintre variabile cu functia summary()

head(dataset)
summary(head(dataset))



##Putem vizualiza variabilele. De exemplu sa vizualizam venitul primelor 6 state americane printr-un bar plot

##Rezumatul Income
summary(dataset$Income)

##Luam primele 6 nume de state americane pe care le stocam in stateUSA
stateUSA <- rownames(head(dataset[0]))
##Luam Income din dataset pe care il stocam in Venit
Venit    <- head(dataset$Income)
##facem un data frame cu venit si statele
bp = as.data.frame(Venit, stateUSA)

##bar-plotam data frame-ul 
barplot(head(bp$Venit), main = "Vizualizarea venitului primelor 6 state cu barplot", xlab   = "Stat", ylab   = "Venit", names.arg = rownames(head(bp[0])), col = rainbow(6))

##Vom vizualiza venitul primelor 6 state americane si printr-un piechart
slices <- head(bp$Venit)
lbls <-   rownames(head(bp[0]))
pie(slices, labels = lbls, main="Pie Chart al venitului primelor 6 state americane")

##Dupa aceste doua vizualizari, putem deduce ca dintre aceste state Alaska are cel mai mare venit

##Vom vizualiza venitul primelor 6 state americane si printr-un piechart
slices <- head(bp$Venit)
lbls <-   rownames(head(bp[0]))
pie(slices, labels = lbls, main="Pie Chart al venitului primelor 6 state americane")

##Dupa aceste doua vizualizari, putem vedea ca dintre aceste state Alaska are cel mai mare venit

##Vom face un barplor si pentru crime (coloana Murder) 
Crime <- head(dataset$Murder)
bp = as.data.frame(Crime, stateUSA)
barplot(head(bp$Crime), main = "Vizualizarea crimelor cu barplot", xlab   = "Stat", ylab   = "Frecventa Crime", names.arg = rownames(head(bp[0])), col = rainbow(6))


##Vom vizualiza crimele statelor si printr-un piechart
slices <- head(bp$Crime)
lbls <-   rownames(head(bp[0]))
pie(slices, labels = lbls, main="Pie Chart al crimelor")

##Este venitul pe cap de locuitor un factor ce reduce procentul crimelor? 
##Se pare ca statul cu cea mai mare criminalitate dintre acestea sase este Alabama, statul cu cel mai mic venit pe cap de locuitor;
##Totusi este urmat de Alaska, statul cu cel mai mare venit pe cap de locuitor;

############################################PANA AICI E PUS IN WORD########################################################

##Relatia dintre variabile

plot(dataset)


##Ne uitam la corelatia dintre variabile a datasetului
cor(dataset)


##Incepem sa facem modelul de regresie multipla. 
##Vom construi un model pentru Crime ca o functie pentru Income si Illiteracy, pentru a vedea cat influenteaza 
##analfabetismul si veniturile unui stat american nivelul de crime.


##Estimated Multiple Regression Equation


state.lm = lm(Murder ~ Income + Illiteracy, data =  dataset)

summary(state.lm)

newdata = data.frame(Murder=25 , Income = 4000, Illiteracy = 10)

predict(state.lm, newdata) 

##Bazandu-ne pe modelul de regresie liniar multiplu si pe parametrii dati, crima preconizata este de 46.95142 





##Multiple Coefficient of Determination

state.lm = lm(Murder ~ Income + Illiteracy, data =  dataset)

##Scoatem coeficientul de determinare din atributul r.squared din sumarul său

summary(state.lm)$r.squared 

##Coeficientul de determinare al modelului de regresie multipla pentru setul nostru de date este 0.5015367





##Adjusted Coefficient of Determination

##Scoatem coeficientul de determinare ajustat din atributul r.squared din sumarul său

summary(state.lm)$adj.r.squared 

##Coeficientul de determinare ajustat al modelului de regresie multipla pentru setul nostru de date este 0.4803255





##Significance Test for MLR

##Decidem care dinre variabilele independente in modelul de regresie liniara multiplu al setului nostru de date sunt
##semnificative din punct de vedere statistic

#Variabila t a variabilelor independente poate fi gasita in sumar

summary(state.lm)

##Cum p-valorile pentru  Income si Illiteracy sunt mai mici de 0.05 ambele sunt semnificative din punct de vedere statistic in setul nostru de date




##Confidence Interval for MLR

##Vom aplica functia predict si setam variabila predictor in argumentul variabilei newdata.
##Si vom seta intervalul type precum "confidenta" si vom folosi defalt-ul de 0.95 nivel de confidenta

predict(state.lm, newdata, interval="confidence") 

##Intervalul de 95% confidenta al datasetului cu parametrii dati este intre 34.86093 si 59.04192

##Plotarea rezultatelor

