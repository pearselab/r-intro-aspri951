#Session 2 Exercises



#PRE-EXERCISES



value <- 5
if(value <= 5){
  print("less than five")
}
#If value is greater than five, R returns nothing

for(i in 4:8){
  print(i + 10)
} 
#gives (14, 15, 16, 17, 18); effectively takes every element in range and transforms it. Potentially useful for diff-eq

#Want a sequence of numbers: 11:20 followed by 1:10
for(i in 1:20){
  if(i <= 10){
    print(i + 10)
  } else {
    print(i - 10)
  }
}
#Can parse for loop into different actions. Can define pathways like a dichotomous key: if character 1, go here, if 2, go here...

#What numbers in a set when transformed by the function i + 5 yield a value less than 20? 
for(i in 1:400)
  if(i + 5 < 20){
    print (i)
  } else {
    break
  }
#Can parse a set of numbers based on their properties and return only those with properties you want.
#Break allows you to truncate a function rather than running the whole thing once a set criterion is met

#Write a function giving area of a circle given radius
area <- function(r){
  area = (r^2 * pi)
  return(area)
}
#Now I can write area(4) and my function will return the area of a circle with radius 4. Function(r) indicates that r is the single ARGUMENT/VARIABLE in the function



#ACTUAL EXERCISES



#1: Write loop that prints 20-->10

value <- 21
for (i in 1:11){
  print(value <- value-1)
}

#better way:

for(i in 20:10){
  print(i)
}

# i CANNOT be in square brackets or an error is returned



#2: Write loop that prints 20-->10, evens only

sort(seq(from = 10, to = 20, by = 2), decreasing = TRUE)

# not a loop, but gives the right answer...
# new strange, foreign arithmetic operator I've never heard of before: https://en.wikipedia.org/wiki/Modulo_operation
# In R, %% represents the modulo operator. Hooray.

for (i in 20:10){
  if (i %% 2 <- 0)
  print(i)
}

# More bracket problems. Closing curly bracket returns error. Why?

for (i in 20:10){
  if (i %% 2 == 0){print(i)}
}

# cannot use <- with %%
#WHAT IS THE DIFFERENCE BETWEEN = AND == ? = RETURNS AN ERROR, == DOES NOT.



#3: Write a function that calculates whether a number is prime

#prime <- function(n)
#I have a function named prime. Prime takes one input argument: n (number).
#definition: prime numbers are divisible only by 1 and themselves
#Method: divide n by all numbers less than themselves. If one of those is a factor (gives a remainder of 0), then NOT PRIME
#If loop reaches 1, then break, number is PRIME

prime <- function(n){
  if (n == 2){
    print("PRIME")
  } 
}
#Hooray. Tells you that 2 is prime. 

prime <- function(n){
  if (n == 2){
    print("PRIME")
  } else { 
    for (i in (n-1):2){
      if(n %% i == 0)
        print("NOT PRIME")
      } else {
      print("PRIME")
    }
  }
}
#ERROR: missing a set of brackets somewhere... after "(if n %% i == 0)" need "{" before "print"

prime <- function(n){
  if (n ==2){print("PRIME")} else {
    for (i in (n-1):2)
    if(n %% i == 0){print("NOT PRIME")} else {
      print("PRIME")
    }
  }
}
#Function works, but prints "PRIME" for every single number between n-1 and 2 that does not give remainder 0.

prime <- function(n){
  if (n == 2){print("PRIME")} else {
    for (i in (n-1):2)
      if(n %% i == 0){print("NOT PRIME")
        break} 
  }
}
#Does exactly the opposite of what is being asked. Tells when a number is NOT prime.

prime <- function(n){
  if (n == 2){print("PRIME")} else {
    for (i in (n-1):2)
      if(n %% i == 0){print("NOT PRIME")
        break} 
      if(n %% i != 0){print("PRIME")}
  }
}
#Needed an operator I didn't know existed: != is NOT EQUAL

#Will's comment: more options if you use return(TRUE) etc. rather than print("character"). Can't use a character in a future function. Can use a logical. 

prime <- function(n){
  if (n == 2){return(TRUE)} else {
    for (i in (n-1):2)
      if (n %% i == 0){return(FALSE)
        break}
    if (n %% i != 0){return(TRUE)}
  }
}

#test function within function:

for (i in 1:20){
  if (prime(i) == TRUE){
    print("Job", i)
  }
}
#returns error: missing value where TRUE/FALSE needed... because I set things as == 0 in the prime function, not == TRUE...
#Or maybe it's because it runs into a FALSE and chokes... test without the block that returns FALSE... nope, same error.

for (i in 1:20){
  prime(i)
  if(TRUE){
    print("JOB")
  }
}
#same error.
#Can prime(i) == TRUE ? Test:
prime(3) == TRUE
#Yes, returns TRUE. Therefore, prime(i) == TRUE should be a valid phrase to write? 

#Maybe R expects a TRUE where it finds "return". Test:
prime <- function(n){
  if (n == 2){TRUE} else {
    for (i in (n-1):2)
      if (n %% i == 0){FALSE
        break}
    if (n %% i != 0){TRUE}
  }
}

for (j in 1:20){
  prime(j)
  if(TRUE){
    print("JOB")
  }
}
#same error.

prime <- function(n){
  if (n == 2){return(TRUE)} else {
    for (i in (n-1):2)
      if(n %% i == 0){return(FALSE)
        break} 
      if(n %% i != 0){return(TRUE)}
  }
}
#This works.

prime <- function(n){
  if (n == 2){return(TRUE)} else {
    for (i in (n-1):2){
      if(n %% i == 0){return(FALSE)
        break} 
      if(n %% i != 0){return(TRUE)}
    }
  }
}
#this does not. Why?

prime <- function(n){
  if (n == 2){return(TRUE)} else {
    for (i in (n-1):2){
      if(n %% i == 0){return(FALSE)
        break}
    }
    for (i in (n-1):2){
      if(n %% i != 0){return(TRUE)}
    }
  }
}
#This works... why?!!

for (i in 1:20){
  if (prime(i) == TRUE){
    print("JOB")
  }
}



#4: Write loop printing out numbers 1:20, print "Good: NUMBER" if divisible by 5, "Job: NUMBER" if prime, nothing otherwise

#loop printing 1:20
for(i in 1:20){
  print(i)
}

#print "Good: NUMBER" if divisible by five
if (i %% 5 == 0){print("Good: NUMBER")}

#Combine first two: 
for(i in 1:20){
  if (i %% 5 == 0){print("Good: NUMBER")} else {
    print(i)
  }
}

#print "Job: NUMBER" if prime
if (i == 2){print("Job: NUMBER")} else {
  for (j in (i-1):2)
    if(j %% i != 0){print("Job: NUMBER")}
}

#Combine second and third:
for(i in 1:20){
  if (i %% 5 == 0){print("Good: NUMBER")} else {
    print(i)
  if (i == 2){print("Job: NUMBER")} else {
       if(j %% i != 0){print("Job: NUMBER")}
    }
  }
}
#Wrong order

for(i in 1:20){
  if (i %% 5 == 0){print("Good: NUMBER")}
  if (i == 2){print("Job: NUMBER")}
  for (j in (i-1):2)
    if(j %% i != 0){print("Job: NUMBER")} else {
      print(i)
    }
}
#This does not workkkk

for(i in 1:20){
  if (i %% 5 == 0){print("Good: NUMBER")}
  if (i == 2){print("Job: NUMBER")} else {
    print(i)
  }
}
#This works except for assigning the rest of the prime numbers

for(i in 1:20){
  if (i %% 5 == 0){print("Good: NUMBER")}
  if (i == 2){print("Job: NUMBER")} 
  for (j in (i-1):2)
    if (i %% j != 0){print("Job: NUMBER")} else {
    print(i)
  }
}
#Weird error.

for(i in 1:20){
  if (i %% 5 == 0){print("Good: NUMBER")}
  if (i == 2){print("Job: NUMBER")} 
  for (j in (i-1):2)
    if (i %% j != 0){print("Job: NUMBER")} else {
      return(i)
    }
}
#Still a weird error

for(i in 1:20){
  if (i %% 5 == 0){print("Good: NUMBER")} else {
    if (i == 2){print("Job: NUMBER")} else {
      for (j in (i-1):2)
        if (i %% j != 0){print("Job: NUMBER")} else {
          return(i)
        }
    }
  }
}
#Else statements did not fix anything.

for (i in 1:20){
  if (i %% 5 == 0){print("Good: NUMBER")}
  if (i == 2){ print("Job: NUMBER")} else {
    for (j in (i-1):2){
      if (i %% j != 0){print("Job: NUMBER")} else {
        return(i)
      }
    }
  }
}
#Same error despite bracket change.

for (i in 1:20){
  if (i %% 5 == 0){print("Good: NUMBER")}
  if (i == 2){print("Job: NUMBER")}
  for (j in (i-1):2){
    if (i %% j != 0){print("Job: NUMBER")} else {return(i)}
  }
}
#Same error. Apparently due to an NA being created that messes up the equation? 
#Maybe because prior things changed the values I'm trying to use to characters ("Good: NUMBER")?
#Maybe calculate the primes first, then fill in the rest?

for (i in 1:20){
  for (j in (i-1):2){
    if (i %% j != 0){print("Job: NUMBER")} else {return(i)}
  }
  if (i %% 5 == 0){print("Good: NUMBER")}
  if (i == 2){print("Job: NUMBER")} else {
    return(i)
  }
}
#Nope, same error.

for (i in 1:20){
  if (i == 2){print("Job: NUMBER")} 
  for (j in (i-1):2){
    if(j %% i != 0){print("Job: NUMBER")} else {
      return(i)
    }
  }
}
#Another error

for (i in 1:20){
  if (i == 2){print("Job: NUMBER")} else {
    for (j in (i-1):2){
      if(j %% i != 0){print("Job: NUMBER")} else {
        return(i)
      }
    }
  }
}
#More errors. 



#5: Gompertz curve is y(t) = a*e^(-b*e^(-c*t)); create function calculating y (pop size) given any parameters
# exp(x) = e^x in R

Gompertz.population <- function(t, a, b, c){
  y = a*exp(-b*exp(-c*t))
  return(y)
}

Gompertz.population(100, 2, 3, 4)
#returns [1] 2
Gompertz.population(1000, 2, 3, 4)
#returns [1] 2

#Why? Because e^(-400) is such a small number apparently R cannot distinguish it from 0
#And of course 0 * anything = 0, therefore the entire function is a*e^(0) = a*1 = a, and in this case, I set a = 2

Gompertz.population(1, 2, 3, 4)
#returns [1] 1.893071
#check: a * stuff = 2 * 0.946 = 1.893..., so 2 is carrying capacity, and we're 94.6% of the way there
Gompertz.population(100, 2, 3, -4)
#returns [1] 0
Gompertz.population(10, 4, -2, -4)
#returns [1] Inf, negatives for b and c mess stuff up

#so... basically the gompertz curve is a super fussy function
#also appears that 'a' defines the asymptote, or carrying capacity in this case, of the population
#thus, I should be using a wayyy bigger a-value to make this less fussy, and positive values for b and c

Gompertz.population(50, 1000, 2, 3)
#returns [1] 1000
#So at t = 50, I've already reached max population size

Gompertz.population(5, 1000, 100, 100)
# returns [1] 1000
Gompertz.population(5, 1000, 0.1, 0.1)
#returns [1] 941.1497
Gompertz.population(5, 1000, 0.1, 5)
#returns [1] 1000
Gompertz.population(5, 1000, 5, 0.1)
#returns [1] 48.18761
#So both b and c need to be relatively small to be functional, and c should be smaller than b to make a sensible biological model

Gompertz.population(10, 1000, 4, 0.1)
# returns [1] 229.5768
#This actually seems like a reasonable model of population growth for some vertebrate population. Anyhow...



#6: Function to plot Gompertz curve over time

#will need a loop to generate values from curve for time ti to tf: since two values define a range, a for loop
#will need to use plot, takes values of x and y: plot(x, y)
#will need Gompertz.population function
#not sure whether loop then plot, or plot then loop (which is a subset of which?)

Gompertz.plot <- function(ti, tf, a, b, c){
  for (t in ti:tf)
    plot(y = a*exp(-b*exp(-c*t)))
}
#error: argument x is missing. Can fix.
Gompertz.plot <- function(ti, tf, a, b, c){
  for (t in ti:tf)
    plot(x = t, y = a*exp(-b*exp(-c*t)))
}
#well poo. Plots a single dot representing t = 10
for(i in 1:10)
 plot(x = i, y = i*5)
#This also gives a single dot representing i = 10

#curve: draws curve corresponding to function over an interval... sounds better

Gompertz.plot <- function(ti, tf, a, b, c){
    curve(y = a*exp(-b*exp(-c*t)), from = ti, to = tf)
}
#error: argument "sexpr" missing
Gompertz.plot <- function(ti, tf, a, b, c){
  curve(expr = a*exp(-b*exp(-c*t)), from = ti, to = tf)
}
#error: expr must call a function containing x
Gompertz.plot <- function(ti, tf, a, b, c){
  Gompertz.expr = a*exp(-b*exp(-c*x))
  curve(Gompertz.expr, from = ti, to = tf)
}
#error: object x not found
Gompertz.plot <- function(ti, tf, a, b, c){
  for(x in ti:tf){
    Gompertz.expr = a*exp(-b*exp(-c*x))
    curve(Gompertz.expr, from = ti, to = tf)
  }
}
#example from help file:
curve(x^3 - 3*x, -2, 2)
#This works. Will try with gompertz function
Gompertz.plot <- function(ti, tf, a, b, c){
  curve(a*exp(-b*exp(-c*x)), from = ti, to = tf)
}
#Ha! Take that, stupid curve.
Gompertz.plot(1, 100, 1000, 4, 0.1)
#very pretty.



#7 Plot line as red if y>a, plot line as blue if y>b
#So... from messing with this function above, a is the value of the HORIZONTAL ASYMPTOTE. Y should NEVER be greater than A.
Gompertz.plot <- function(ti, tf, a, b, c){
  curve(a*exp(-b*exp(-c*x)), from = ti, to = tf, col=333)
}
#successfully changes the color of the line to aqua
Gompertz.plot <- function(ti, tf, a, b, c){
  curve(a*exp(-b*exp(-c*x)), from = ti, to = tf, if(a*exp(-b*exp(-c*x))>b){
    col=333})
}
#error: object x not found



#8:

#9: write a function that draws boxes out of *** given a width and height

star.line <- function(w){
  top.of.box <- rep("*", w)
  return(top.of.box)
}
#works, but has quotations around the asterisks

star.line <- function(w){
  top.of.box <- "*"
  return(rep(top.of.box, w))
}
#same result. Try using print?

star.line <- function(w){
  for(i in 1:w){
    print("*")
  }
}
#prints vertical row of asterisks in quotations


