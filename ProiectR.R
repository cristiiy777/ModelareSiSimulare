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




