#~~~~~Laboratorul 1~~~~

#__Observatii
#...

#__Intrebari

#1.Limbajul R este: 
#2.Numele unui obiect R poate incepe cu:
#3.Limbajul R este:
#4.Numele unui obiect R poate contine:
#5.Operator valid de asignare in R este:
#6.Vectorii pot contine elemente de tipuri diferite:
#7.Listele (list) pot contine elemente de tipuri diferite:
#8.R este un limbaj:

#__Exercitii

#Exercitiul 1

#Acest exercițiu folosește date epidemiologice. Vicente et al. (2006) a analizat datele din
#observații ale mistreților și cerbului din mai multe paduri din Spania. Setul de date conține
#informații despre tuberculoză (Tb) la ambele specii și parazitul Elaphostrongylus cervi,
#care infectează doar căprioarele. În Zuur și colab. (2009), Tb a fost modelat în funcție de
#continuu variabilă explicativă, lungimea animalului, notată cu lungimea CT (CT este un an
#prezentate ca un vector de zerouri și cele reprezentând absența sau prezența Tb și larve E. cervi.                                                                           prescurtarea de cabeza-tronco, care este spaniolă pentru cap-corp). Tb și Ecervi sunt

#a) Utilizând funcția c, creați o variabilă care conține valorile lungimii celor șapte animale. 
#   De asemenea, creați o variabilă care conține valorile Tb. Includeți valorile NA.


directory  <- "C:/Users/Lenovo/Desktop/ModelareSiSimulare"

fisierDeer <- file.path(directory, "Deer.txt")

deer       <- read.table(file = fisierDeer, header = TRUE)

head(deer, 7) #primele 7 animale

tb <- c(head(deer, 7)$Tb) #Tb-u primelor 7

#b) Puteti folosi functia vector in locul functiei c ?

as.vector(head(deer, 7)$Tb) #ca vector
is.vector(head(deer, 7)$Tb) #este vector?

#c) Care este lungimea medie a celor șapte animale? Indicatie. Folositi functia mean().

lungime <- c(head(deer, 7)$LCT)

medieLungime <- mean(lungime)

#Exercitiul 2. (functia cbind)

#Continuăm cu aceleasi date din exercițiul 1. Creăm mai întâi variabile Farm și Month 
#Rețineți că Farm este un șir de de caractere. Utilizați comanda cbind pentru a combina
#datele din coloanele Month, LCT și Tb, și stocați rezultatele în variabila Boar.

Farm  <- head(deer, 7)$Farm
Month <- head(deer, 7)$Month
Tb    <- head(deer, 7)$Tb
LCT   <- head(deer, 7)$LCT

Boar  <- cbind(Month, LCT, Tb)

#Exercitiul 3. (matrice)

#Creați următoarea matrice în R și determinați transpunerea ei, inversa ei și inmultiti D 
#cu inversul său (rezultatul ar trebui să fie matricea identitate).
#Indicatii. Folositi functiile matrix, det (pentru a calcula determinantul), solve (pentru a calcula inversa).

D <- matrix(c(1, 2, 3, 4, 2, 1, 2, 3, 0), ncol = 3, nrow = 3, byrow = TRUE)

t(D)     #transpusa

det(D)   #determinantul

solve(D) #inversa

D %*% solve(D) #D * inversa

#Exercitiul 4 (Functiile data.frame si list)

#Alcătuiți un data.frame care conține toate datele prezentate în tabelul de la exercițiul 1.
#Repetati cerinta folosind ca structura de date un list.

Tb    <- head(deer, 7)$Tb
LCT   <- head(deer, 7)$LCT

data.frame(Tb, LCT) #data.frame

list(Tb, LCT) #list

#Exercitiul 5

#Să presupunem că urmăriți timpurile petrecut in autobuz timp de două săptămâni (10 zile)
#și găsiți următoarele durate în minute
#17 16 20 24 22 15 21 15 17 22

#a) Introduceți aceste date în R. Folosiți funcția max pentru a găsi cea mai lunga durata,
#   funcția mean pentru a găsi media, iar funcția min pentru a găsi minimul.

listaMinute = list(17, 16, 20, 24, 22, 15, 21, 15, 17, 22)

max(unlist(listaMinute))
min(unlist(listaMinute))
mean(unlist(listaMinute))

#b) Ups, nr 24 a fost o greșeală. Ar fi trebuit să fie 18. Cum puteți rezolva asta? Faceți acest
#   lucru și apoi găsiți noua medie.

listaMinute[[which(24 == listaMinute)]] <- 18 #18 pus pe indexul elementului 24 gasit cu which
mean(unlist(listaMinute))

#c) De câte ori a fost naveta dvs. de 20 de minute sau mai mult? Pentru a răspunde, puteți încerca

naveta<-c(17, 16, 20, 24, 22, 15, 21, 15, 17, 22)
sum(naveta)
sum(naveta>20)

procent <- (sum(naveta<17)/length(naveta)) * 100

#Exercitiul 6
#Factura telefonului mobil variază de la lună la lună. Să presupunem că aveti următoarele sume lunare
#46 33 39 37 46 30 48 32 49 35 30 48
#Introduceți aceste date într-o variabilă numită factură.
#Folosiți comanda sum pentru a afla suma cheltuită în acest an cu telefonul mobil.
#Care este cea mai mică sumă cheltuită într-o lună? Care este cea mai mare?
#In cate luni suma era mai mare de 40 $? Ce procent a fost acesta? 

factura <- c(46, 33, 39, 37, 46, 30, 48, 32, 49, 35, 30, 48)

min(factura)
max(factura)
sum(factura>40)
procent <- (sum(factura>40)/length(factura)) * 100

#Exercitiul 7
#Fie vectorul x de mai jos

x <- c(1, 8, 2, 6, 3, 8, 5, 5, 5, 5)

#Folosind R, calculati: (obs. X1 reprezinta primul element al lui X) 
#1. (X1 + X2 + · · · + X10 )/10 (folositi sum)

sum(x)/10

#2. Find log 10 (Xi ) for each i. (folositi log, care e logaritm natural)
x <- c(1, 8, 2, 6, 3, 8, 5, 5, 5, 5)

for (i in x) {
  print(log(i, base=10))
  
}

#3. Find (Xi − 4.4)/2.875 for each i.

for (i in x) {
  print((i - 4.4)/2.875)
  
}

#4. Aflati diferenta intre cea mai mare si cea mai mica dintre valorile lui x (max, min).

diferenta = max(x) - min(x)


