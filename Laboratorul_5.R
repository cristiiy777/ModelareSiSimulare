#~~~~~Laboratorul 4~~~~

#__Exercitii

#Linear Congruential Generator
#parameters for LCG

#__Exercitiul 1


#1. Sa se genereze minim doua siruri de numere aleatoare de lungimi diferite,
#   cu cel putin 3 generatori, dintre cei prezentati in scriptul de pe site.


lcg = function(a0, a1, m, x0, n) #linear congruential generator (LCG)
{
  x = rep(0,n+1)  # rep(x, times) or replicate (x, length.out) – replicate the values in x  (how many times 
  #or the length of replicate
  x[1] = x0
  for(i in 1:n+1)
  {
    if(i == 1)
      x[i] = x0
    else
      x[i] = (a0 + (a1 * x[i-1])) %% m
  }
  return(x)
}

lcg_1 <- lcg(a0 = 1467945236, a1 = 2698231, m = 2^32 , x0 = 2768923, n = 500)
lcg_1
lcg_2 <- lcg(a0 = 1972891241, a1 = 2579842, m = 2^32 , x0 = 3567742, n = 400)
lcg_2


mcg = function(a1, m, x0, n) 
{
  x = rep(0,n+1)
  x[1] = x0
  for(i in 1:n+1)
  {
    if(i == 1)
      x[i] = x0
    else
      x[i] = (a1 * x[i-1]) %% m
  }
  return(x)
}
mcg_1 <- mcg(a1 = 261, m = 155, x0 = 91, n = 700)
mcg_1
mcg_2 <- mcg(a1 = 233, m = 121, x0 = 187, n = 500)
mcg_2


#RANDU (a special case of MCG)

randu = function(x0, n) 
{
  x = rep(0,n+1)
  x[1] = x0
  for(i in 1:n+1)
  {
    if(i == 1)
      x[i] = x0
    else
      x[i] = (65539 * x[i-1]) %% (2^31)
  }
  return(x[-1])
}

randu_1 <- randu(233,700)
randu_1

randu = function(x0, n) 
{
  x = rep(0,n+1)
  x[1] = x0
  for(i in 1:n+1)
  {
    if(i == 1)
      x[i] = x0
    else
      x[i] = (567313 * x[i-1]) %% (2^37)
  }
  return(x[-1])
}
randu_2 <- randu(16,800)
randu_2


#__Exercitiul 2

#2. Reprezentarea grafica a secventelor rezultate.

barplot(lcg_1)
barplot(lcg_2)

barplot(mcg_1)
barplot(mcg_2)

barplot(randu_1)
barplot(randu_2)

#__Exercitiul 3

#3. Trasati histogramele pentru fiecare sir de numere in parte.

hist(lcg_1)
hist(lcg_2)

hist(mcg_1)
hist(mcg_2)

hist(randu_1)
hist(randu_2)

#__Exercitiul 5

#5. Studiati autocorelatia fiecarei serii de numere aleatoare. Verificati daca secventele sunt cu adevarat aleatoare.

acf(lcg_1)
acf(lcg_2)

acf(mcg_1)
acf(mcg_2)

acf(randu_1)
acf(randu_2)
