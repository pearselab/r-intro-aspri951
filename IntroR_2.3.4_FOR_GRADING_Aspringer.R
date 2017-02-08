#LESSON 2:
  
#1: Write loop that prints 20-->10

for(i in 20:10){
  print(i)
}



#2: Write loop that prints 20-->10, evens only

for (i in 20:10){
  if (i %% 2 == 0){print(i)}
}



#3: Write a function that calculates whether a number is prime

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

for(i in 1:20){
  if(i %% 5 == 0){
    cat("Good:", i, "\n")
  }
  if(prime(i) == TRUE)
    cat("Job:", i, "\n")
}




#5: Gompertz curve is y(t) = a*e^(-b*e^(-c*t)); create function calculating y (pop size) given any parameters
# exp(x) = e^x in R

Gompertz.population <- function(t, a, b, c){
  y = a*exp(-b*exp(-c*t))
  return(y)
}




#6: Function to plot Gompertz curve over time

Gompertz.plot <- function(ti, tf, a, b, c){
  x.coordinates = seq(from = ti, to = tf, by = 0.1)
  y.coordinates = a*exp(-b*exp(-c*x.coordinates))
  plot(x.coordinates, y.coordinates, type = "l")
}

#Test:
Gompertz.plot(1, 80, 1000, 8, 0.15)



#7 Plot line as red if y>a, plot line as blue if y>b
#MAL'S SUGGESTION: USE VECTOR FOR COLOR, SO INSTEAD OF CALLING A SINGLE COLOR, YOU'RE CALLING A VECTOR THAT ASSIGNS A COLOR TO EACH POINT




