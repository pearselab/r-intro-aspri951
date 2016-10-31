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
  area <- (r^2 * pi)
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
  if (n ==2){print("PRIME")} else {
    for (i in (n-1):2)
      if(n %% i == 0){print("NOT PRIME")
        break} 
  }
}
#Does exactly the opposite of what is being asked. Tells when a number is NOT prime.

