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

plot.line <- function(a, b){
  plot(c(a[1], b[1]), c(a[2], b[2]), type = "l")
}
#better.

#5) Make a polygon class that stores polygon from point objects

plot.polygon <- function(a, b, ...){
  plot(c(a[1], b[1], ...), c(a[2], b[2], ...), type = "l")
}
#...nope.Test:
plot( c(3, 5, 8), c(6, 2, 0), type ="l")
plot(c(5, 8, 3), c(2, 0, 6), type = "l")
#plot function connects the three points with lines in order: first to second, second to third, but NOT third to first
#therefore need to repeat the first point at the end of the sequence to make a closed polygon!

plot.polygon <- function(a, b, ...){
  plot(c(a[1], b[1], ... , a[1]), c(a[2], b[2], ... , a[2]), type = "l")
}

#problem... no way to make lines not cross. Example:
plot(c(0, 4, -2, 4, 0), c(0, 2, 1, 3, 0), type = "l")

#6
#7
#8
#9) circle object: take point and radius, store circle

#eqn circle = k + or - sqrt(r^2 - (x-h)^2) where point = (h, k), so h = point[1], k = point[2]

plot.circle <- function(point, radius){
  for(i in (point[1] - radius):(point[1] + radius)){
    y.coordinates <- point[2] + (r^2 - (x - point[1])^2)^(1/2)
  }
  plot(c((point[1] - radius):(point[1] + radius)), c(y.coordinates)
}
#This is foolish. put plot in the for-loop and use i as a whatever placeholder.
 
plot.circle <- function(point, radius){
  for(i in (point[1] - radius):(point[1] + radius)){
    y.coordinates = point[2] + (radius^2 - (i - point[1])^2)^(1/2)
    plot(i, y.coordinates)
  }
}
#WHY WILL THIS ONLY PLOT A SINGLE POINT?! UGHHHHHHH

plot.circle <- function(point, radius){
  x.coordinates = c((point[1] - radius):(point[1] + radius))
  for(i in (point[1] - radius):(point[1] + radius)){
    y <- point[2] + (radius^2 - (i - point[1])^2)^(1/2)
  }
  y.coordinates = c(y)
  return(y.coordinates)
}
#more useless code

plot.circle <- function(point, radius){
  x.coordinates = c((point[1] - radius):(point[1] + radius))
  y.coordinates = c(point[2] + (radius^2 - (x.coordinates - point[1])^2)^(1/2))
  return(y.coordinates)
}

#successfully creted two vectors... NOW can plot the half circle

plot.circle <- function(point, radius){
  x.coordinates = c((point[1] - radius):(point[1] + radius))
  y.coordinates = c(point[2] + (radius^2 - (x.coordinates - point[1])^2)^(1/2))
  plot(x.coordinates, y.coordinates, type = "l")
}
#make other half of circle?

plot.circle <- function(point, radius){
  x.coordinates = c((point[1] - radius):(point[1] + radius))
  y.coordinates = c(point[2] + (radius^2 - (x.coordinates - point[1])^2)^(1/2))
  neg.y.coordinates = c(-y.coordinates)
  total.y.coordinates = c(y.coordinates, neg.y.coordinates)
  plot(x.coordinates, total.y.coordinates, type = "l")
}
#error, x and y lengths differ... doesn't just recycle... poop.

plot.circle <- function(point, radius){
  x.coordinates = c((point[1] - radius):(point[1] + radius))
  y.coordinates = c(point[2] + (radius^2 - (x.coordinates - point[1])^2)^(1/2))
  neg.y.coordinates = c(-y.coordinates)
  total.y.coordinates = c(y.coordinates, neg.y.coordinates)
  plot(rep(x.coordinates, 2), total.y.coordinates, type = "l")
}
#works, but draws a zig-zag through circle

plot.circle <- function(point, radius){
  pos.x.coordinates = c(seq((point[1] - radius), (point[1] + radius), by = 0.1))
  neg.x.coordinates = seq((point[1] + radius), (point[1] - radius), by = 0.1)
  total.x.coordinates = c(pos.x.coordinates, neg.x.coordinates)
  y.coordinates = c(point[2] + (radius^2 - (pos.x.coordinates - point[1])^2)^(1/2))
  neg.y.coordinates = c(-y.coordinates)
  total.y.coordinates = c(y.coordinates, neg.y.coordinates)
  plot(total.x.coordinates, total.y.coordinates, type = "l")
}
#error: wrong sign in "by" argument for neg.x.coordinates. Try - sign?

plot.circle <- function(point, radius){
  pos.x.coordinates = c(seq((point[1] - radius), (point[1] + radius), by = 0.1))
  neg.x.coordinates = seq((point[1] + radius), (point[1] - radius), by = -0.1)
  total.x.coordinates = c(pos.x.coordinates, neg.x.coordinates)
  y.coordinates = c(point[2] + (radius^2 - (pos.x.coordinates - point[1])^2)^(1/2))
  neg.y.coordinates = c(-y.coordinates)
  total.y.coordinates = c(y.coordinates, neg.y.coordinates)
  plot(total.x.coordinates, total.y.coordinates, type = "l")
}
#works ONLY for circles centered at the origin BECAUSE you can't just take the negative of y-coordinates. Flips across x-axis... not correct

plot.circle <- function(point, radius){
  pos.x.coordinates = c(seq((point[1] - radius), (point[1] + radius), by = 0.1))
  neg.x.coordinates = seq((point[1] + radius), (point[1] - radius), by = -0.1)
  total.x.coordinates = c(pos.x.coordinates, neg.x.coordinates)
  pos.y.coordinates = c(point[2] + (radius^2 - (pos.x.coordinates - point[1])^2)^(1/2))
  neg.y.coordinates = c(point[2] - (radius^2 - (pos.x.coordinates - point[1])^2)^(1/2))
  total.y.coordinates = c(pos.y.coordinates, neg.y.coordinates)
  plot(total.x.coordinates, total.y.coordinates, type = "l")
}
#fixed. Can plot make axes symmetrical? Same scale? asp = 1?
plot.circle <- function(point, radius){
  pos.x.coordinates = seq((point[1] - radius), (point[1] + radius), by = 0.1)
  neg.x.coordinates = seq((point[1] + radius), (point[1] - radius), by = -0.1)
  total.x.coordinates = c(pos.x.coordinates, neg.x.coordinates)
  pos.y.coordinates = c(point[2] + (radius^2 - (pos.x.coordinates - point[1])^2)^(1/2))
  neg.y.coordinates = c(point[2] - (radius^2 - (pos.x.coordinates - point[1])^2)^(1/2))
  total.y.coordinates = c(pos.y.coordinates, neg.y.coordinates)
  plot(total.x.coordinates, total.y.coordinates, type = "l", asp = 1)
}
#score. 



#10) Write generic area methods for circle & polygon objects

area.circle <- pi*r^2

area.polygon <- function(a, b, ..., n){
  single.vector.of.points <- c(a, b, ..., n)
  number.points <- 0.5*(length(single.vector.of.points))
  for(i in 1:number.points){
    sum.of.points <- sum(a[1]*b[2]: n-)
  }
}
  1/2*()
