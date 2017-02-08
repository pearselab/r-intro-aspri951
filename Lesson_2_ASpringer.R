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

#BESTEST PRIME FUNCTION EVER:
  
prime <- function(n){
  if (n < 0){
    stop("Number must be greater than zero!")
  }
  if (n == 1 | n == 2){
    return(TRUE)
  } else {
    for (i in (n-1):2){
      if (n %% i == 0){
        return(FALSE)
      }
    }
    for (i in (n-1):2){
      if (n %% i != 0){
        return(TRUE)
      }
    }
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

for(i in 1:20){
  if(i %% 5 == 0){
    cat("Good:", i, "\n")
  }
}
#This part works...next...

for(i in 1:20){
  if(i %% 5 == 0){
    cat("Good:", i, "\n")
  }
  if(prime(i) == TRUE){
    cat("Job:", i, "\n")
  }
}
#evil error

for(i in 1:20){
  if(prime(i) == TRUE){
    cat("Job:", i, "\n")
  }
}
#also error. Argument of length zero. What?
#internet says the actual value of prime(i) is null, which makes R flip out
#WEll, perhaps it's because the prime function isn't in the console...

#TEst:
if(prime(5) == TRUE){print("life sucks")}
#[1] "life sucks"
prime(1)
#Error in if (n%%i == 0) { : missing value where TRUE/FALSE needed
#So my prime function doesn't handle the number one. problem. 

for(i in 1:20){
  if(i %% 5 == 0){
    cat("Good:", i, "\n")
  }
  if(prime(i) == TRUE)
    cat("Job:", i, "\n")
}
#Oh well look... now that my function handles the number one, everything works... well then.


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

Gompertz.plot <- function(ti, tf, a, b, c){
  x.coordinates = seq(from = ti, to = tf, by = 0.1)
  y.coordinates = a*exp(-b*exp(-c*x.coordinates))
  plot(x.coordinates, y.coordinates, type = "l")
}
#Ha. Take that, plot function of pure evil.

Gompertz.plot <- function(ti, tf, a, b, c){
  x.coordinates = seq(from = ti, to = tf, by = 0.1)
  y.coordinates = a*exp(-b*exp(-c*x.coordinates))
  if(y.coordinates < a){
    plot(x.coordinates, y.coordinates, type = "l")
  }
  if(y.coordinates > a){
    plot(x.coordinates, y.coordinates, type = "l", col = 444)
  }
  plot(x.coordinates, y.coordinates, type = "l")
}
#NOoooooooooo. Screw loops. 

Gompertz.plot <- function(ti, tf, a, b, c){
  x.coordinates = seq(from = ti, to = tf, by = 0.1)
  y.coordinates = a*exp(-b*exp(-c*x.coordinates))
  for(i in ti:a){
    plot(x.coordinates, y.coordinates, type = "l")
  }
  for(j in a:tf){
    plot(x.coordinates, y.coordinates, type = "l", col = 444)
  }
}
#Also doesn't work...

Gompertz.plot(1, 100, 1000, 4, 0.1)
#par() function in R will tell R NOT to delete whatever was last on a plot

Gompertz.plot.colors <- function(ti, tf, a, b, c){
  lower.x.coordinates = seq(from = ti, to = a, by = 0.1)
  lower.y.coordinates = a*exp(-b*exp(-c*lower.x.coordinates))
  upper.x.coordinates = seq(from = a, to = tf, by = 0.1)
  upper.y.coordinates = a*exp(-b*exp(-c*upper.x.coordinates))
  plot(lower.x.coordinates, lower.y.coordinates, type = "l")
  par(new = TRUE)
  plot(upper.x.coordinates, upper.y.coordinates, type = "l", col = 444)
}
#parameters don't work at all this way if a > tf

Gompertz.plot <- function(ti, tf, a, b, c){
  colvals <- rep("NA", (tf-ti))
  x.coordinates = seq(from = ti, to = tf, by = 0.1)
  y.coordinates = a*exp(-b*exp(-c*x.coordinates))
  if(y.coordinates < a){
    plot(x.coordinates, 
         y.coordinates,
         type = "l")
  } else{
    plot(x.coordinates, 
         y.coordinates, 
         type = "l", 
         lty = 2,
         col = 444)
  }
}
#Nope.

#MAL'S SUGGESTION: USE VECTOR FOR COLOR, SO INSTEAD OF CALLING A SINGLE COLOR, YOU'RE CALLING A VECTOR THAT ASSIGNS A COLOR TO EACH POINT

Gompertz.plot <- function(ti, tf, a, b, c){
  color.vector <- c(rep("future color", (tf-ti)))
  x.coordinates = seq(from = ti, to = tf, by = 0.1)
  y.coordinates = a*exp(-b*exp(-c*x.coordinates))
  for(i in y.coordinates){
    if(i > 5){
      print("yaya")
    }
  }
  plot(x.coordinates, y.coordinates, type = "l")
}
#works, surprisingly. Replace with color. 

Gompertz.plot <- function(ti, tf, a, b, c){
  color.vector <- c(rep("future color", (tf-ti)))
  x.coordinates = seq(from = ti, to = tf, by = 0.1)
  y.coordinates = a*exp(-b*exp(-c*x.coordinates))
  for(i in y.coordinates){
    if(i > a){
      color.vector[i] == "blue"
    } else {
      color.vector[i] == "black"
    }
  }
  plot(x.coordinates, y.coordinates, type = "l", col = color.vector)
}
#error: invalid color name 'future color'
#this would be because the plot function is outside the for-loop and therefore doesn't know the color vector changed

Gompertz.plot <- function(ti, tf, a, b, c){
  color.vector <- c(rep("future color", (tf-ti)))
  x.coordinates = seq(from = ti, to = tf, by = 0.1)
  y.coordinates = a*exp(-b*exp(-c*x.coordinates))
  for(i in y.coordinates){
    if(i > a){
      color.vector[i] == "blue"
    } else {
      color.vector[i] == "black"
    }
    plot(x.coordinates, y.coordinates, type = "l", col = color.vector)
  }
}
#Nope.




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

#Will's comments: try using cat(), \n breaks to a new line

stars <- cat("*", "*")
#prints two asterisks
stars
#returns NULL. Apparently asterisks stand for placeholders within the cat() function? Check:
length(stars)
#Yes, vector of length zero. 

stars <- cat("*", "*", "*", \n "*")
#Error: doesn't like \n
stars <- cat("*", "*", "*")\n cat("*")
#Also error, doesn't like \n
stars <- cat("*", "*", "*", "\n", "*")
#Ta da.
stars <- cat("*", "*", "*", "\n", "*", "*")
#misaligned
stars <- cat("", "*", "*", "*", "\n", "*", "", "*", "\n", "*", "*", "*")
#still misaligned
stars.BOX <- cat("", "*", "*", "*", "\n", "*", "", "", "*", "\n", "*", "*", "*")

star.line <- function(w){
  top.of.box <- w*cat("*")
  return(top.of.box)
}
#Return isn't working for this
star.line <- function(w){
  top.of.box <- cat("*", "*")
}
#I now have a) a function in terms of w that b) prints stars. Need to find a way to make # asterisks dependent on w

#better box:
cat(" ****", "\n", "*  *", "\n", "****")
#?cat help file: fill = a logic or positive numeric controlling how output is broken into lines. Default FALSE. 
#if fill = TRUE, then option of using width to control when a hard return is printed

cat("********************", fill = TRUE, width = 5)
#doesn't work. Help file example: 
iter <- stats::rpois(1, lambda = 10)
## print an informative message
cat("iteration = ", iter <- iter + 1, "\n")
#can put equations inside cat() that don't print...

star.line <- function(w){
  singlestar <- "*"
  top.of.box <- cat(singlestar * w)
}
#doesn't like because you can't multiply a star by a number. Only numbers can be multiplied by numbers
#from intro r 1 assignment:
rep(not_enough_cowbell, 5)
#"cowbell" "cowbell" "cowbell" "cowbell" "cowbell"
#Yes.
star.line <- function(w){
  singlestar <- "*"
  top.of.box <- cat(rep(singlestar, w))
}
#printing asterisks as separate characters (with space in between). How to remove space? Paste joins stuff together.
star.line <- function(w){
  singlestar <- "*"
  top.of.box <- cat(paste(rep(singlestar, w)))
}
#nope. Try different order:
star.line <- function(w){
  singlestar <- "*"
  top.of.box <- paste(cat(rep(singlestar, w)))
}
#still no. Moving on...
box <- function(w){
  star <- "*"
  horizontal.sides.of.box <- cat(rep(star, w), "\n", rep(star, w))
}
#top and bottom of box
box <- function(w){
  star <- "*"
  lid.of.box <- rep(star, w)
  side.of.box <- rep(star, 2)
  box <- cat("", lid.of.box, "\n", side.of.box, "\n", lid.of.box)
}
#Aligned, but need space in box
box <- function(w){
  star <- "*"
  space <- ""
  lid.of.box <- rep(star, w)
  inside.of.box <- rep(space, w-2)
  side.of.box <- c(star, inside.of.box, star)
  box <- cat("", lid.of.box, "\n", side.of.box, "\n", lid.of.box)
}
#Sweet. Make height of box alterable next:
box <- function(w, h){
  star <- "*"
  space <- ""
  lid.of.box <- rep(star, w)
  inside.of.box <- rep(space, w-2)
  side.of.box <- c(star, inside.of.box, star)
  box <- cat("", lid.of.box, "\n", rep(side.of.box, h-2), lid.of.box)
}
#good, but need to have returns. 
box <- function(w, h){
  star <- "*"
  space <- ""
  new.line <- "\n"
  lid.of.box <- rep(star, w)
  inside.of.box <- rep(space, w-2)
  side.of.box <- c(star, inside.of.box, star, new.line)
  box <- cat("", lid.of.box, "\n", rep(side.of.box, h-2), lid.of.box)
}
#Hell yes. Still need to figure out paste though... use collapse?
star <- "*"
stars <-rep(star, 6)
#stars yields asterisks with quotation marks. Vector of length six. Use paste to make it a vector of length one:
paste(stars)
#still has quotations and spaces... use collapse to change separators?
paste(stars, collapse = TRUE)
#error... incorrect use of collapse function. Need collapse = "KIND OF SEPARATION" I want NONE, so collapse = ""
paste(stars, collapse = "")
#YES.

box <- function(w, h){
  star <- "*"
  space <- ""
  new.line <- "\n"
  lid.of.box <- paste(rep(star, w), collapse = "")
  inside.of.box <- rep(space, w-2)
  side.of.box <- c(star, inside.of.box, star, new.line)
  box <- cat("", lid.of.box, "\n", rep(side.of.box, h-2), lid.of.box)
}
#width is wrong. Does cat() put a space between elements? Test: 
cat(4, 5, 6)
#Yes it does. Must account for in width:
box <- function(w, h){
  star <- "*"
  space <- ""
  new.line <- "\n"
  lid.of.box <- paste(rep(star, w), collapse = "")
  inside.of.box <- rep(space, w-3)
  side.of.box <- c(star, inside.of.box, star, new.line)
  box <- cat("", lid.of.box, "\n", rep(side.of.box, h-2), lid.of.box)
}




#10: Modify box to put text centered in box:

box <- function(w, h, word){
  star <- "*"
  space <- ""
  new.line <- "\n"
  phrase <- "word"
  lid.of.box <- paste(rep(star, w), collapse = "")
  half.inside.of.box <- rep(space, ((w-3-length(phrase))/2))
  side.of.box <- c(star, half.inside.of.box, phrase, half.inside.of.box, star, new.line)
  box <- cat("", lid.of.box, "\n", rep(side.of.box, h-2), lid.of.box)
}
#makes a box with "word" written in the middle of each line, but kind of close

box <- function(w, h, word){
  star <- "*"
  space <- ""
  new.line <- "\n"
  lid.of.box <- paste(rep(star, w), collapse = "")
  inside.of.box <- rep(space, (w-3))
  side.of.box <- c(star, inside.of.box, star, new.line)
  word.in.box <- c(star, rep(space, (w-length(word)-4)/2), word, rep(space, (w-length(word)-4)/2), star, new.line)
  box <- cat("", lid.of.box, "\n", rep(side.of.box, (h-3)/2), word.in.box, rep(side.of.box, (h-3)/2), lid.of.box)
}
#LENGTH OF WORD DOESN'T WORK BECAUSE LENGTH OF WORD = LENGTH OF THE VECTOR WORD = ONE. ALWAYS. 
#USE NCHAR TO DETERMINE NUMBER OF CHARACTERS IN A CHARACTER VECTOR (WIDTH)

box <- function(w, h, word){
  star <- "*"
  space <- ""
  new.line <- "\n"
  lid.of.box <- paste(rep(star, w), collapse = "")
  inside.of.box <- rep(space, (w-3))
  side.of.box <- c(star, inside.of.box, star, new.line)
  word.in.box <- c(star, rep(space, (w-nchar(word)-4)/2), word, rep(space, ceiling(w-nchar(word)-4)/2), star, new.line)
  box <- cat("", lid.of.box, "\n", rep(side.of.box, (h-3)/2), word.in.box, rep(side.of.box, (h-3)/2), lid.of.box)
}

#Fix for non-center-able boxes:

box <- function(w, h, word){
  if(h %% 2 == 0){
    stop("Word inside box cannot be centered. Height of box needs to be an odd integer.")
  }
  star <- "*"
  space <- ""
  new.line <- "\n"
  lid.of.box <- paste(rep(star, w), collapse = "")
  inside.of.box <- rep(space, (w-3))
  side.of.box <- c(star, inside.of.box, star, new.line)
  word.in.box <- c(star, rep(space, (w-nchar(word)-4)/2), word, rep(space, (w-nchar(word)-4)/2), star, new.line)
  box <- cat("", lid.of.box, "\n", rep(side.of.box, (h-3)/2), word.in.box, rep(side.of.box, (h-3)/2), lid.of.box)
}

#So. If the word inside the box is even but the width of the box is odd (or vice. versa), then the word cannot be centered.
#The word can only be truly centered in the box (left-right) if w is even AND word is even OR if w is odd AND word is odd. Edit:

box <- function(w, h, word){
  if(h %% 2 == 0){
    stop("Word inside box cannot be centered. Height of box needs to be an odd integer.")
  }
  if(w %% 2 != 0 & nchar(word) %% 2 == 0 | w %% 2 == 0 & nchar(word) %% 2 != 0){
    stop("Word inside box and width of box must BOTH be even or BOTH be odd in order to center word in box.")
  }
  star <- "*"
  space <- ""
  new.line <- "\n"
  lid.of.box <- paste(rep(star, w), collapse = "")
  inside.of.box <- rep(space, (w-3))
  side.of.box <- c(star, inside.of.box, star, new.line)
  word.in.box <- c(star, rep(space, (w-nchar(word)-4)/2), word, rep(space, (w-nchar(word)-4)/2), star, new.line)
  box <- cat("", lid.of.box, "\n", rep(side.of.box, (h-3)/2), word.in.box, rep(side.of.box, (h-3)/2), lid.of.box)
}

#What the heck is different about & and &&............... I may never understand this
#Final step: preventing user from making word too big for box

box <- function(w, h, word){
  if(h %% 2 == 0){
    stop("Word inside box cannot be centered. Height of box needs to be an odd integer.")
  }
  if(w %% 2 != 0 & nchar(word) %% 2 == 0 | w %% 2 == 0 & nchar(word) %% 2 != 0){
    stop("Word inside box and width of box must BOTH be even or BOTH be odd in order to center word in box.")
  }
  if(nchar(word) > (w-2)){
    stop("Word inside of box cannot be greater than the width of the box minus two!")
  }
  star <- "*"
  space <- ""
  new.line <- "\n"
  lid.of.box <- paste(rep(star, w), collapse = "")
  inside.of.box <- rep(space, (w-3))
  side.of.box <- c(star, inside.of.box, star, new.line)
  word.in.box <- c(star, rep(space, (w-nchar(word)-4)/2), word, rep(space, (w-nchar(word)-4)/2), star, new.line)
  box <- cat("", lid.of.box, "\n", rep(side.of.box, (h-3)/2), word.in.box, rep(side.of.box, (h-3)/2), lid.of.box)
}
#Additional problem: if word = w-2, causes an error when calculating the spaces. Can fix.

box <- function(w, h, word){
  star <- "*"
  space <- ""
  new.line <- "\n"
  lid.of.box <- paste(rep(star, w), collapse = "")
  inside.of.box <- rep(space, (w-3))
  side.of.box <- c(star, inside.of.box, star, new.line)
  small.word.in.box <- c(star, rep(space, (w-nchar(word)-4)/2), word, rep(space, (w-nchar(word)-4)/2), star, new.line)
  big.word.in.box <- c(star, word, star, new.line)
  if(h %% 2 == 0){
    stop("Word inside box cannot be centered. Height of box needs to be an odd integer.")
  }
  if(w %% 2 != 0 & nchar(word) %% 2 == 0 | w %% 2 == 0 & nchar(word) %% 2 != 0){
    stop("Word inside box and width of box must BOTH be even or BOTH be odd in order to center word in box.")
  }
  if(nchar(word) > (w-2)){
    stop("Word inside of box cannot be greater than the width of the box minus two!")
  }
  if(nchar(word) == (w-2)){
    box <- cat("", lid.of.box, "\n", rep(side.of.box, (h-3)/2), big.word.in.box, rep(side.of.box, (h-3)/2), lid.of.box)
  }
  box <- cat("", lid.of.box, "\n", rep(side.of.box, (h-3)/2), small.word.in.box, rep(side.of.box, (h-3)/2), lid.of.box)
}
#Problem = ordering? Trying to execute w-nchar(word)-4/2 blah blah in FIRST time it appears?

box <- function(w, h, word){
  star <- "*"
  space <- ""
  new.line <- "\n"
  lid.of.box <- paste(rep(star, w), collapse = "")
  inside.of.box <- rep(space, (w-3))
  side.of.box <- c(star, inside.of.box, star, new.line)
  if(h %% 2 == 0){
    stop("Word inside box cannot be centered. Height of box needs to be an odd integer.")
  }
  if(w %% 2 != 0 & nchar(word) %% 2 == 0 | w %% 2 == 0 & nchar(word) %% 2 != 0){
    stop("Word inside box and width of box must BOTH be even or BOTH be odd in order to center word in box.")
  }
  if(nchar(word) > (w-2)){
    stop("Word inside of box cannot be greater than the width of the box minus two!")
  }
  if(nchar(word) == (w-2)){
    big.word.in.box <- c(star, word, star, new.line)
    box <- cat("", lid.of.box, "\n", rep(side.of.box, (h-3)/2), big.word.in.box, rep(side.of.box, (h-3)/2), lid.of.box)
  } else {
    small.word.in.box <- c(star, rep(space, (w-nchar(word)-4)/2), word, rep(space, (w-nchar(word)-4)/2), star, new.line)
    box <- cat("", lid.of.box, "\n", rep(side.of.box, (h-3)/2), small.word.in.box, rep(side.of.box, (h-3)/2), lid.of.box)
  }
}
#Ordering fixed problem. But new problem: catenate puts spaces between things. Fix using collapse thinger:

box <- function(w, h, word){
  star <- "*"
  space <- ""
  new.line <- "\n"
  lid.of.box <- paste(rep(star, w), collapse = "")
  inside.of.box <- rep(space, (w-3))
  side.of.box <- c(star, inside.of.box, star, new.line)
  if(h %% 2 == 0){
    stop("Word inside box cannot be centered. Height of box needs to be an odd integer.")
  }
  if(w %% 2 != 0 & nchar(word) %% 2 == 0 | w %% 2 == 0 & nchar(word) %% 2 != 0){
    stop("Word inside box and width of box must BOTH be even or BOTH be odd in order to center word in box.")
  }
  if(nchar(word) > (w-2)){
    stop("Word inside of box cannot be greater than the width of the box minus two!")
  }
  if(nchar(word) == (w-2)){
    big.word.vector <- c(star, word, star)
    big.word.in.box <- c(paste(big.word.vector, collapse = ""), new.line)
    box <- cat("", lid.of.box, "\n", rep(side.of.box, (h-3)/2), big.word.in.box, rep(side.of.box, (h-3)/2), lid.of.box)
  } else {
    small.word.in.box <- c(star, rep(space, (w-nchar(word)-4)/2), word, rep(space, (w-nchar(word)-4)/2), star, new.line)
    box <- cat("", lid.of.box, "\n", rep(side.of.box, (h-3)/2), small.word.in.box, rep(side.of.box, (h-3)/2), lid.of.box)
  }
}

#HA. TAKE THAT, EVIL BOX OF EVIL HORROR!


#11) Modify box function to build boxes out of arbitrary text:
#Will need to split the text into individual components, then can use rep to have it recycle that a given number of times?

word <- "abcd"
strsplit(word, "")

#makes a list. Don't want a list... can't repeat a list...

letters.stuff <- c("a", "b", "c")
rep(letters.stuff, length.out = 29)
#This is helpful, recycles vector elements given number of times...

#unlist() function takes a list and turns it into a vector. Excellent. Combine these things:
rep(unlist(strsplit(word, "")), 8)
#oops. Need LENGTH, not # times total vector is repeated...
rep(unlist(strsplit(word, "")), length.out = 8)
#sweet.

#Test for side walls of box:
unlist(strsplit(word, ""))[1]
#Excellent. Returns "a" only. 

box <- function(line.type, w, h, word){
  space <- ""
  new.line <- "\n"
  lid.of.box <- paste(rep(unlist(strsplit(line.type, "")), length.out = w), collapse = "")
  inside.of.box <- rep(space, (w-3))
  edge.of.box <- unlist(strsplit(line.type, ""))[1]
  side.of.box <- c(edge.of.box, inside.of.box, edge.of.box, new.line)
  if(h %% 2 == 0){
    stop("Word inside box cannot be centered. Height of box needs to be an odd integer.")
  }
  if(w %% 2 != 0 & nchar(word) %% 2 == 0 | w %% 2 == 0 & nchar(word) %% 2 != 0){
    stop("Word inside box and width of box must BOTH be even or BOTH be odd in order to center word in box.")
  }
  if(nchar(word) > (w-2)){
    stop("Word inside of box cannot be greater than the width of the box minus two!")
  }
  if(nchar(word) == (w-2)){
    big.word.vector <- c(edge.of.box, word, edge.of.box)
    big.word.in.box <- c(paste(big.word.vector, collapse = ""), new.line)
    box <- cat("", lid.of.box, "\n", rep(side.of.box, (h-3)/2), big.word.in.box, rep(side.of.box, (h-3)/2), lid.of.box)
  } else {
    small.word.in.box <- c(edge.of.box, rep(space, (w-nchar(word)-4)/2), word, rep(space, (w-nchar(word)-4)/2), edge.of.box, new.line)
    box <- cat("", lid.of.box, "\n", rep(side.of.box, (h-3)/2), small.word.in.box, rep(side.of.box, (h-3)/2), lid.of.box)
  }
}

#What's inside my ex-roommate's box?!
box("Melbeast ", 29, 17, "vodka")
#Priceless.
#Another fun box:
box("hell yeah ", 39, 17, "What hath science wrought")