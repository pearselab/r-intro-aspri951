#1) Implement cat class, slot = race, methods = print

class(cat) <- "race"

#How does R define the slots for an class? It appears that you have to define an object first and then R uses that instance as the example/model that defines the class? In other words, you cannot define a class without first giving an instance? 
#Apparently you can't just define a class. Attempt to use an instance to define a class:

Milo <- list(race = "siamese")
class(Milo) <- "cat"

#Again, this is NOT intuitive to me. Just looking at the code, it appears that I have just taken a specific case and generalized it to the entire class (induction). In this case, it looks like I just said "because Milo is Siamese, and Milo is a cat, all cats are siamese." 

Darwin <- list(race = "Russian blue")

#I have given a second object the same property (slot) as my first instance of cat. However, R does NOT appear to assign "Darwin" to class "cat." 
#CONSTRUCTOR FUNCTION:

new.cat <- function(weight, color, hair_length, polydactyl){
  object <- list(weight = weight, color = color, hair_length = hair_length, polydactyl = polydactyl)
  class(object) <- "cat"
  return(object)
}
#doesn't work unless you have return(object) in the function!
#Test: 
Milo <- new.cat(12, "flamepoint", "short", FALSE)
Remy <- new.cat(4, "grey tabby", "long", TRUE)
Remus <- new.cat(8, "black", "short", FALSE)
Darwin <- new.cat(11, "blue", "short", FALSE)

#functional. 
#Print methods:

print.cat <- function(cat.name, ...){
  if(!inherits(cat.name, "cat")){
    stop("Not a cat.")
  } else if(cat.name$polydactyl == TRUE){
    cat(cat.name, "is a", cat.name$color, "cat with", cat.name$hair_length, "hair", "and too many toes.")
  } else if(cat.name$polydactyl == FALSE){
    cat(cat.name, "is a", cat.name$color, "cat with", cat.name$hair_length, "hair", "and a normal number of toes.")
  }
}
#error: catenate cannot handle a list. Problem: cat.name is a FUNCTION, so how to call just the NAME of a function instead?!
#function: as.character coerces the name of something into a character string. Test:

print.cat <- function(cat.name, ...){
  if(!inherits(cat.name, "cat")){
    stop("Not a cat.")
  } else if(cat.name$polydactyl == TRUE){
    cat(as.character(cat.name), "is a", cat.name$color, "cat with", cat.name$hair_length, "hair", "and too many toes.")
  } else if(cat.name$polydactyl == FALSE){
    cat(as.character(cat.name), "is a", cat.name$color, "cat with", cat.name$hair_length, "hair", "and a normal number of toes.")
  }
}
#Okay... works, but prints the CONTENTS of the cat object instead of the NAME of the cat object
#Also appears to overwrite what USED to be the print function for the cat? So creating a new print method from the GENERIC already present in R?
#try deparse or substitute functions? Deparse says "used to create informative labels for data sets and plots..." Test:

print.cat <- function(cat.name, ...){
  if(!inherits(cat.name, "cat")){
    stop("Not a cat.")
  } else if(cat.name$polydactyl == TRUE){
    cat(deparse(cat.name), "is a", cat.name$color, "cat with", cat.name$hair_length, "hair", "and too many toes.")
  } else if(cat.name$polydactyl == FALSE){
    cat(deparse(cat.name), "is a", cat.name$color, "cat with", cat.name$hair_length, "hair", "and a normal number of toes.")
  }
}

#Screw this.

print.cat <- function(cat.name, ...){
  if(!inherits(cat.name, "cat")){
    stop("This creature is not a cat, and is grieviously insulted that you should insinuate otherwise")
  } else if(cat.name$polydactyl == TRUE){
    cat("This creature is a", cat.name$color, "cat with", cat.name$hair_length, "hair", "and far too many toes.")
  } else if(cat.name$polydactyl == FALSE){
    cat("This creature is a", cat.name$color, "cat with", cat.name$hair_length, "hair", "and a normal number of toes.")
  }
}
#NOTE: this re-writes the exist print function in R such that IF an object is of class "cat," THEN R uses print.cat as the method for "print!"



#Race method:
#To add complexity, suppose first that if the first cat weighs less than the second cat, then the first cat is faster and wins.
#Suppose second that if the two cats are the same weight, then the cat with more toes is faster and wins.
#Suppose third that if the two cats are the same weight and have the same number of toes, it's a tie.

race <- function(first, second){
  if(!inherits(first, "cat") | !inherits(second, "cat")){
    stop("At least one of these creatures is not a cat, thus the two cannot race.")
  } else if(first$weight < second$weight){
    print("First cat won the race.")
  } else if(first$weight > second$weight){
    print("Second cat won the race.")
  }
}
#Working. Cool. Now to add the second condition: if weights are equal, then look at polydactyly status.

race <- function(first, second){
  if(!inherits(first, "cat") | !inherits(second, "cat")){
    stop("At least one of these creatures is not a cat, thus the two cannot race.")
  } else if(first$weight < second$weight){
    print("First cat won the race.")
  } else if(first$weight > second$weight){
    print("Second cat won the race.")
  } else if(first$weight == second$weight){
    if(first$polydactyl == TRUE && second$polydactyl == FALSE){
      print("First cat won the race.")
    } else if(first$polydactyl == FALSE && second$polydactyl == TRUE){
      print("Second cat won the race.")
    } 
  }
}
#Oh yes. Functional nested heirarchy. Final bit:

race <- function(first, second){
  if(!inherits(first, "cat") | !inherits(second, "cat")){
    stop("At least one of these creatures is not a cat, thus the two cannot race.")
  } else if(first$weight < second$weight){
    print("First cat won the race.")
  } else if(first$weight > second$weight){
    print("Second cat won the race.")
  } else if(first$weight == second$weight){
    if(first$polydactyl == TRUE && second$polydactyl == FALSE){
      print("First cat won the race.")
    } else if(first$polydactyl == FALSE && second$polydactyl == TRUE){
      print("Second cat won the race.")
    } else if(first$polydactyl == second$polydactyl){
      print("These cats are the same weight and have the same number of toes. It's a tie.")
    }
  }
}

#Test:

fat.black.polydactyl <- new.cat(15, "black", "short", TRUE)
skinny.polydactyl <- new.cat(5, "grey", "long", TRUE)
fat.normal <- new.cat(15, "calico", "long", FALSE)
skinny.normal <- new.cat(5, "sealpoint", "rex", FALSE)
fat.calico.polydactyl <- new.cat(15, "calico", "long", TRUE)

race(fat.black.polydactyl, fat.calico.polydactyl)
race(fat.calico.polydactyl, fat.black.polydactyl)
race(fat.calico.polydactyl, fat.normal)
race(fat.normal, skinny.normal)

#Yessssssssss.



#2) Implement a point class, holds a coordinate pair (x,y)

instance.of.point <- c(3,4)
class(instance.of.point) <- "point"

#No way to reference parts of the point...

instance.of.point <- c(x = 0, y = 0)

#Okay, take two:

new.point <- function(x,y){
  point <- c(x,y)
  class(point) <- "point"
  return(point)
}

point.a <- new.point(3,4)
class(point.a)
#returns "point." Sweet.



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

distance.point <- function(first.point, second.point){
  if(!inherits(first.point, "point") | !inherits(second.point, "point")){
    stop("At least one of the objects is not a point.")
  } else{
    distance <- ((second.point[1] - first.point[1])^2 + (second.point[2] - first.point[2])^2)^(1/2)
    return(distance)
  }
}
#better.


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

new.line <- function(first.point, second.point){
  if(!inherits(first.point, "point") | !inherits(second.point, "point")){
    stop("At least one object is not a point.")
  }
  line <- list(first.point, second.point)
  class(line) <- "line"
  return(line)
}


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

#Try again...

new.polygon <- function(first.point, second.point, ...){
  if(!inherits(first.point, "point") | !inherits(second.point, "point") | !inherits(..., "point")){
    stop("At least one object is not a point.")
  }
  polygon <- list(first.point, second.point, ..., first.point)
  class(polygon) <- "polygon"
  return(polygon)
}
#Returns an error. Doesn't like "..." in the inherits function
#But will it actually test all of the items to see if they're point objects without accounting for this?

new.polygon <- function(first.point, second.point, ...){
  if(!inherits(first.point, "point") | !inherits(second.point, "point")){
    stop("At least one object is not a point.")
  }
  polygon <- list(first.point, second.point, ..., first.point)
  class(polygon) <- "polygon"
  return(polygon)
}
#Nope. Doesn't work. How to make an arbitrary number of variables and check an arbitrary number of variables?
#Also want to add caveat that no two points can be equal to each other... loop?
#Try using argument function to capture all arguments of new.polygon? Self-referential, but...

new.polygon <- function(first.point, second.point, ...){
  if(!inherits(args(new.polygon), "point")){
    stop("At least one object is not a point.")
  }
  polygon <- list(first.point, second.point, ..., first.point)
  class(polygon) <- "polygon"
  return(polygon)
}
#Awwww. Doesn't recognize ANY argument as a point.
#Reason why: class(args(new.polygon)) = FUNCTION. The class is FUNCTION. NOT point. 
#How to call a given argument in a function?

new.polygon <- function(first.point, second.point, ...){
  if(!inherits(first.point, "point") | !inherits(second.point, "point") | ...){
    stop("At least one object is not a point.")
  }
  polygon <- list(first.point, second.point, ..., first.point)
  class(polygon) <- "polygon"
  return(polygon)
}
#nope, still doesn't work...

new.polygon <- function(first.point, second.point, ...){
  if(any(mapply(first.point, second.point, ..., class)) != "point"){
    stop("At least one object is not a point.")
  }
  polygon <- list(first.point, second.point, ..., first.point)
  class(polygon) <- "polygon"
  return(polygon)
}

#Nope.

new.polygon <- function(first.point, second.point, ...){
  if(!inherits(first.point, "point") | !inherits(second.point, "point")){
    stop("At least one object is not a point.")
  }
  if(any(sapply(..., class)) != "point"){
    stop("At least one object is not a point.")
  }
  polygon <- list(first.point, second.point, ..., first.point)
  class(polygon) <- "polygon"
  return(polygon)
}




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
