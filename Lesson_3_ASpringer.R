#1) Implement cat class, slot = race, methods = print

class(cat) <- "race"

#How does R define the slots for an class? It appears that you have to define an object first and then R uses that instance as the example/model that defines the class? In other words, you cannot define a class without first giving an instance? 
#Apparently you can't just define a class. Attempt to use an instance to define a class:

Milo <- list(race = "siamese")
class(Milo) <- "cat"

#Again, this is NOT intuitive to me. Just looking at the code, it appears that I have just taken a specific case and generalized it to the entire class (induction). In this case, it looks like I just said "because Milo is Siamese, and Milo is a cat, all cats are siamese." 

Darwin <- list(race = "Russian blue")

#I have given a second object the same property (slot) as my first instance of cat. However, R does NOT appear to assign "Darwin" to class "cat." 

#2) Implement a point class, holds a coordinate pair (x,y)

instance.of.point <- c(3,4)
class(instance.of.point) <- "point"

#No way to reference parts of the point...

instance.of.point <- c(x = 0, y = 0)

#3) Write a distance method calculating distance between two points

distance.point <- function(a, b){
  distance <- ((b$x - a$x)^2 + (b$y - a$y)^2)^(1/2)
  return(distance)
}

#Test: 

point.a <- c(x = 0, y = 0)
point.b <- c(x = 10, y = 10)
distance.point(point.a, point.b)
#Error in b$x : $ operator is invalid for atomic vectors
#So.... how do you call parts of a vector? By index? Using square brackets? In which case x, y are irrelevant?

distance.point <- function(a, b){
  distance <- ((b[1] - a[1])^2 + (b[2] - a[2])^2)^(1/2)
  return(distance)
} 

#Test:

point.a <- c(0,0)
point.b <- c(10,10)
distance.point(point.a, point.b)

#Oh thank goodness.

#4) Make a line class: takes two point objects, makes line between them

instance.of.line <- (point.a, point.b)
class(instance.of.line) <- "line"

line_eqn.line <- function(a, b){
  m = ((b[2]-a[2])/(b[1]-a[1]))
  y = m*(x - a[1]) + a[2]
  return(y)
}
#Need a * between things being multiplied BECAUSE R thinks m(stuff) means m is a FUNCTION

plot(point.a, point.b)
plot(c(point.a, point.b))
plot(point.a, point.b, type = "l")
plot(x = c(point.a[1], point.b[1], y = c(point.a[2], point.b[2])))
#NONE OF THESE PLOT THINGERS WORKS. WHYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY

