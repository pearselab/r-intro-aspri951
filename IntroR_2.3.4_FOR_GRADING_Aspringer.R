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




#7: Plot line as red if y>a, plot line as blue if y>b

Gompertz.plot <- function(ti, tf, a, b, c){
  x.coordinates = seq(from = ti, to = tf, by = 0.1)
  y.coordinates = a*exp(-b*exp(-c*x.coordinates))
  plot(x.coordinates[1:max(which(y.coordinates < b))], y.coordinates[1: max(which(y.coordinates < b))], type = "l")
  lines(x.coordinates[max(which(y.coordinates < b)):max(which(y.coordinates < a))], y.coordinates[max(which(y.coordinates < b)):max(which(y.coordinates < a))], col = "red")
  lines(x.coordinates[max(which(y.coordinates < a)):length(x.coordinates)], y.coordinates[max(which(y.coordinates < a)):length(y.coordinates)], col = "blue")
}




#9: write a function that draws boxes out of *** given a width and height

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




#11: Modify box function to build boxes out of arbitrary text:

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

#Test:
box("hell yeah ", 39, 17, "What hath science wrought")




#12: Hurdle models first decide if a species is present (yes/no), and if so, decide their abundance level (how many)
#Write a function that models if a species (ONE species) is present at any of n sites, and if so, how many are there
#use bernoulli determine presence (0,1, user chosen probability of 1 (like coin flip)), and poisson for abundance (user-chosen lambda)
#Want output of abundance at each site (so, prob of presence multiplied by abundance value?)

hurdle.model <- function(numb.sites, prob.presence, expected.abundance){
  if(prob.presence > 1 | prob.presence < 0){
    stop("Probabilities must have a value between 0 and 1")
  }
  presence <- rbinom(numb.sites, 1, prob.presence)
  abundance <- rpois(numb.sites, expected.abundance)
  adjusted.abundance <- (presence * abundance)
  return(adjusted.abundance)
}

#Test:
hurdle.model(10, 0.5, 50)
hurdle.model(10, 12, 50)




#13:  Write a hurdle model that simulates lots of of species with their own p and lambda on n sites
#return results in a matrix with species as columns, sites as rows
#My function takes vectors of length n for species, prob.presence, and expected.abundance

hurdle.model.expanded <- function(numb.sites, species, prob.presence, expected.abundance){
  for(i in 1:length(numb.sites)){
    if(any(prob.presence[i] > 1) | any(prob.presence[i] < 0)){
      stop("Probabilities must have a value between 0 and 1")
    }
  }
  if(length(species) != length(prob.presence) | length(species) != length(expected.abundance)){
    stop("There must be a probability of presence and expected abundance for each species")
  }
  abundance.matrix <- matrix(nrow = numb.sites, ncol = length(species), dimnames = list(1:numb.sites, species))
  for(i in 1:length(species)){
    presence <- rbinom(numb.sites, 1, prob.presence[i])
    abundance <- rpois(numb.sites, expected.abundance[i])
    adjusted.abundance <- (presence * abundance)
    abundance.matrix[, i] <- adjusted.abundance
  }
  return(abundance.matrix)
}

#Test:
hurdle.model.expanded(4, c("boba", "jil", "yef"), c(0.5, 0.9, 0.1), c(10, 50, 100))




#14: Progress through time, professor moves a random, normally-distributed distance N-S and E-W every five minutes.
#Simulate process 100 times and plot. 

random.walk <- plot(0, 0, xlim = c(-40, 40), ylim = c(-40, 40), type = "l")
start.point <- c(0,0)
for(i in 1:100){
  start.point.prior <- start.point
  start.point <- start.point + c(rnorm(1, 0, 2), rnorm(1, 0, 2))
  lines(c(start.point.prior[1], start.point[1]), c(start.point.prior[2], start.point[2]))
}




#15: #15) Run simulation to see how long, on average, until faculty member falls of cliff (approx 5 miles away in all directions)
#Need scale: Assume person walks 4 mi/h. This means person walks 0.33 miles in 5 min. Thus, set SD = 0.33 for more accurate model
#Assume 1 on the plot = 1 mile
#need distance formula:

time.to.death <- function(n){
  timestep.to.death <- numeric(n)
  time.to.death <- 5 * timestep.to.death
  start.point <- c(0,0)
  distance.from.origin <- (start.point[1]^2 + start.point[2]^2)^(1/2)
  for (j in 1:n){
    for(i in 1:10000){
      if (distance.from.origin <= 5){
        start.point.prior <- start.point
        start.point <- start.point + c(rnorm(1, 0, 0.33), rnorm(1, 0, 0.33))
      }
      if (distance.from.origin > 5){
        timestep.to.death[j] <- (i-1)
      }
    }
  }
  print(time.to.death)
  cat("Average time to death with a sample size of", n, ":")
  return(mean(time.to.death))
}



#LESSON 3:


#1: Implement cat class with arbitrary slots, methods = print and race

# Constructor function:

new.cat <- function(weight, color, hair_length, polydactyl){
  object <- list(weight = weight, color = color, hair_length = hair_length, polydactyl = polydactyl)
  class(object) <- "cat"
  return(object)
}

# Some cats:

Milo <- new.cat(12, "flamepoint", "short", FALSE)
Remy <- new.cat(4, "grey tabby", "long", TRUE)
Remus <- new.cat(8, "black", "short", FALSE)
Darwin <- new.cat(11, "blue", "short", FALSE)

# Print method:

print.cat <- function(cat.name, ...){
  if(!inherits(cat.name, "cat")){
    stop("This creature is not a cat, and is grieviously insulted that you should insinuate otherwise")
  } else if(cat.name$polydactyl == TRUE){
    cat("This creature is a", cat.name$color, "cat with", cat.name$hair_length, "hair", "and far too many toes.")
  } else if(cat.name$polydactyl == FALSE){
    cat("This creature is a", cat.name$color, "cat with", cat.name$hair_length, "hair", "and a normal number of toes.")
  }
}

# Race method:
#Suppose that if cat A weighs less than cat B, cat A wins.
#Suppose that if cat A and cat B weigh the same, then the cat with more toes is faster and wins.
#Suppose that if the two cats are the same weight and have the same number of toes, it's a tie.

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




#2: Implement a point class, holds a coordinate pair (x,y)

new.point <- function(x,y){
  point <- c(x,y)
  class(point) <- "point"
  return(point)
}

#Test:

point.a <- new.point(3,4)
class(point.a)



#3: Write a distance method calculating distance between two points

distance.point <- function(first.point, second.point){
  if(!inherits(first.point, "point") | !inherits(second.point, "point")){
    stop("At least one of the objects is not a point.")
  } else{
    distance <- ((second.point[1] - first.point[1])^2 + (second.point[2] - first.point[2])^2)^(1/2)
    return(distance)
  }
}

#Test:

point.a <- new.point(3,4)
point.b <- new.point(10,10)
distance.point(point.a, point.b)



#4: Make a line class: takes two point objects, makes line between them

new.line <- function(first.point, second.point){
  if(!inherits(first.point, "point") | !inherits(second.point, "point")){
    stop("At least one object is not a point.")
  }
  line <- list(first.point, second.point)
  class(line) <- "line"
  return(line)
}


#5: Make a polygon class that stores polygon from point objects

new.polygon <- function(first.point, second.point, ...){
  polygon <- list(first.point, second.point, ..., first.point)
  class.check <- sapply(polygon, class)
  if(any((class.check) != "point")){
    stop("At least one object is not a point.")
  } else {
    class(polygon) <- "polygon"
    return(polygon)
  }
}

#Test:
point.a <- new.point(3,4)
point.b <- new.point(10,10)
point.c <- new.point(0,0)

polygon.a <- new.polygon(point.a, point.b, point.c)
new.polygon(point.a, point.b, c(4,5), point.c)



#6: Write plot methods for point and line objects

#Plot point objects:

plot.point <- function(point){
  if(!inherits(point, "point")){
    stop("Object must be of class 'point'!")
  } else {
    plot(point[1], point[2])
  }
}

#Plot line objects:

plot.line <- function(line){
  if(!inherits(line, "line")){
    stop("Object must be of class 'line'!")
  } else {
    first.point <- unlist(line[1])
    second.point <- unlist(line[2])
    x.coordinates <- c(first.point[1], second.point[1])
    y.coordinates <- c(first.point[2], second.point[2])
    plot(x.coordinates, y.coordinates, type = "l")
  }
}




#7: Plot methods for polygon objects

plot.polygon <- function(polygon){
  if(!inherits(polygon, "polygon")){
    stop("Object must be of class 'polygon'!")
  } else {
    x.coordinates <- numeric(length(polygon))
    y.coordinates <- numeric(length(polygon))
    for(i in 1:length(polygon)){
      point <- unlist(polygon[i])
      x.coordinates[i] <- point[1]
      y.coordinates[i] <- point[2]
    }
    plot(x.coordinates, y.coordinates, type = "l")
  }
}

#Test: 
point.a <- new.point(3,4)
point.b <- new.point(10,10)
point.c <- new.point(0,0)
point.d <- new.point(-1, 4)
polygon.b <- new.polygon(point.a, point.b, point.c, point.d)
plot.polygon(polygon.b)



#9: 

#Circle object: takes a POINT object and a number (radius)

new.circle <-  function(point, radius){
  if(!inherits(point, "point")){
    stop("Point object must be of class 'point'!")
  } else {
    circle <- list(point, radius)
    class(circle) <- "circle"
    return(circle)
  }
}

#Plot method for circle objects:

plot.circle <- function(circle){
  if(!inherits(circle, "circle")){
    stop("Object must be of class 'circle'!")
  } else {
    point <- unlist(circle[1])
    radius <- unlist(circle[2])
    pos.x.coordinates = seq((point[1] - radius), (point[1] + radius), by = 0.1)
    neg.x.coordinates = seq((point[1] + radius), (point[1] - radius), by = -0.1)
    total.x.coordinates = c(pos.x.coordinates, neg.x.coordinates)
    pos.y.coordinates = c(point[2] + (radius^2 - (pos.x.coordinates - point[1])^2)^(1/2))
    neg.y.coordinates = c(point[2] - (radius^2 - (pos.x.coordinates - point[1])^2)^(1/2))
    total.y.coordinates = c(pos.y.coordinates, neg.y.coordinates)
    plot(total.x.coordinates, total.y.coordinates, type = "l", asp = 1)
  }
}

#Test: 
point.a <- new.point(3,4)
circle.test <- new.circle(point.a, 5)
plot.circle(circle.test)



#8: create a canvas object that the "add" function can add point, line, circle, and polygon objects to. 
#Create plot and print methods for this class.

#Canvas object:

new.canvas <- function(object, ...){
  canvas <- list(object, ...)
  class.check <- sapply(canvas, class)
  for(i in 1:length(class.check)){
    if(class.check[i] != "point"){
      if(class.check[i] != "circle"){
        if(class.check[i] != "line"){
          if(class.check[i] != "polygon"){
            stop("All canvas objects must be of class point, line, circle, or polygon!")
          }
        }
      }
    } 
  }
  class(canvas) <- "canvas"
  return(canvas)
}

#Test: 
point.a <- new.point(3,4)
point.b <- new.point(10,10)
point.c <- new.point(0,0)
point.d <- new.point(-1, 4)
circle.test <- new.circle(point.a, 5)
polygon.a <- new.polygon(point.a, point.b, point.c)

new.canvas(point.a, point.b, point.c, point.d, circle.test, polygon.a)
new.canvas(point.a, point.b, circle.test, c(1, 5))

#Add function(add more objects to canvas):

add.to.canvas <- function(canvas, new.object, ...){
  if(class(canvas) != "canvas"){
    stop("Canvas object must be of class canvas!")
  }
  new.objects <- list(new.object, ...)
  class.check <- sapply(new.objects, class)
  for(i in 1:length(class.check)){
    if(class.check[i] != "point"){
      if(class.check[i] != "circle"){
        if(class.check[i] != "line"){
          if(class.check[i] != "polygon"){
            stop("All canvas objects must be of class point, line, circle, or polygon!")
          }
        }
      }
    } 
  }
  for (i in 1:length(new.objects)){
  canvas[length(canvas) + i] <- new.objects[i]
  return(canvas) 
  }
}

#Test: 

test.canvas <- new.canvas(point.a, point.b, circle.test)
add.to.canvas(new.canvas, point.c)

#Plot methods:

plot.canvas <- function(canvas){
  plot(c(0, 0, 15, 15, 0), c(0, 15, 15, 0, 0), type = "l", asp = 1, col = "white")
  for(i in 1:length(canvas)){
    if(class(canvas[[i]]) == "point"){
      point <- canvas[[i]]
      points(point[1], point[2])
    } else if(class(canvas[[i]]) == "circle"){
      circle <- canvas[[i]]
      point <- unlist(circle[1])
      radius <- unlist(circle[2])
      pos.x.coordinates = seq((point[1] - radius), (point[1] + radius), by = 0.1)
      neg.x.coordinates = seq((point[1] + radius), (point[1] - radius), by = -0.1)
      total.x.coordinates = c(pos.x.coordinates, neg.x.coordinates)
      pos.y.coordinates = c(point[2] + (radius^2 - (pos.x.coordinates - point[1])^2)^(1/2))
      neg.y.coordinates = c(point[2] - (radius^2 - (pos.x.coordinates - point[1])^2)^(1/2))
      total.y.coordinates = c(pos.y.coordinates, neg.y.coordinates)
      lines(total.x.coordinates, total.y.coordinates)
    } else if (class(canvas[[i]]) == "polygon"){
      x.coordinates <- numeric(length(polygon))
      y.coordinates <- numeric(length(polygon))
      for(i in 1:length(polygon)){
        point <- unlist(polygon[i])
        x.coordinates[i] <- point[1]
        y.coordinates[i] <- point[2]
      }
      lines(x.coordinates, y.coordinates)
    } else if(class(canvas[[i]]) == "line"){
      line <- canvas[[i]]
      first.point <- unlist(line[1])
      second.point <- unlist(line[2])
      x.coordinates <- c(first.point[1], second.point[1])
      y.coordinates <- c(first.point[2], second.point[2])
      lines(x.coordinates, y.coordinates, type = "l")
    }
  }
}

#Test:

test.canvas <- new.canvas(point.a, point.b, circle.test)
plot.canvas(test.canvas)

#Finally, print methods for canvas objects:

print.canvas <- function(canvas){
  if(class(canvas) != "canvas"){
    stop("Object must be of class 'canvas'!")
  } else {
    cat("There are", length(canvas), "objects on this canvas.", "\n")
    for(i in 1:length(canvas)){
      cat("Object", paste("#", i, collapse = ""), "is a", paste(class(canvas[[i]]), ".", collapse = ""), "\n")
    }
  }
}



#13: Add OPTIONAL color support to canvas plot

plot.canvas <- function(canvas, point.color = "black", line.color = "black", circle.color = "black", polygon.color = "black"){
  plot(c(0, 0, 15, 15, 0), c(0, 15, 15, 0, 0), type = "l", asp = 1, col = "white")
  for(i in 1:length(canvas)){
    if(class(canvas[[i]]) == "point"){
      point <- canvas[[i]]
      points(point[1], point[2], col = point.color)
    } else if(class(canvas[[i]]) == "circle"){
      circle <- canvas[[i]]
      point <- unlist(circle[1])
      radius <- unlist(circle[2])
      pos.x.coordinates = seq((point[1] - radius), (point[1] + radius), by = 0.1)
      neg.x.coordinates = seq((point[1] + radius), (point[1] - radius), by = -0.1)
      total.x.coordinates = c(pos.x.coordinates, neg.x.coordinates)
      pos.y.coordinates = c(point[2] + (radius^2 - (pos.x.coordinates - point[1])^2)^(1/2))
      neg.y.coordinates = c(point[2] - (radius^2 - (pos.x.coordinates - point[1])^2)^(1/2))
      total.y.coordinates = c(pos.y.coordinates, neg.y.coordinates)
      lines(total.x.coordinates, total.y.coordinates, col = circle.color)
    } else if (class(canvas[[i]]) == "polygon"){
      x.coordinates <- numeric(length(polygon))
      y.coordinates <- numeric(length(polygon))
      for(i in 1:length(polygon)){
        point <- unlist(polygon[i])
        x.coordinates[i] <- point[1]
        y.coordinates[i] <- point[2]
      }
      lines(x.coordinates, y.coordinates, col = polygon.color)
    } else if(class(canvas[[i]]) == "line"){
      line <- canvas[[i]]
      first.point <- unlist(line[1])
      second.point <- unlist(line[2])
      x.coordinates <- c(first.point[1], second.point[1])
      y.coordinates <- c(first.point[2], second.point[2])
      lines(x.coordinates, y.coordinates, type = "l", col = line.color)
    }
  }
}




#LESSON 4:



  
#1: Create a dataset of 10 variables, each drawn from normal distributions with DIFF MEANS AND SDs!

replicate(10, rnorm(1, mean = runif(1, -5, 5), sd = runif(1, 0, 10)))




#2: Make version of summary function for continuous datasets

summary.continuous <- function(data.vector){
  if(is.numeric(data.vector) == FALSE){
    stop("Data are not numeric.")
  }
  mean.data <- mean(data.vector)
  sd.data <- sd(data.vector)
  max.data <- max(data.vector)
  min.data <- min(data.vector)
  cat("", "Mean = ", mean.data, "\n", "Standard deviation =", sd.data, "\n", "Min. value =", min.data, "\n", "Max. value =", max.data)
}

#Test:

bunch.of.numbers <- replicate(20, rnorm(1, mean = runif(1, -5, 5), sd = runif(1, 0, 10)))
summary.continuous(bunch.of.numbers)



#3: Write summary function that summarizes only categorical data (NOT is.numeric, aka !is.numeric)
#Percentages, total count make sense for categorical data?
#In other words, you've got a vector of people who are male, female, etc. Can't take mean etc., but can say %male


summary.categorical <- function(data.vector){
  if(is.numeric(data.vector) == TRUE){
    stop("Data are not categorical.")
  }
  cat("N =", length(data.vector), "\n \n")
  instances.of.element.one <- length(which(data.vector == data.vector[1]))
  percent.element.one <- round(100*(instances.of.element.one/length(data.vector)), 2)
  cat("Percent", data.vector[1], "=", paste(c(percent.element.one, "%"), collapse = ""), "\n")
  for(i in 2:length(data.vector)){
    if(any(data.vector[i] == data.vector[1:(i-1)]) == FALSE){
      instances.of.i <- length(which(data.vector == data.vector[i]))
      percent.element.i <- round(100*(instances.of.i/length(data.vector)), 2)
      cat("Percent", data.vector[i], "=", paste(c(percent.element.i, "%"), collapse = ""), "\n")
    }
  }
}

#Test: 

horses <- c("arab", "arab", "Morgan", "saddlebred", "Friesian", "Haflinger", "paint", "appaloosa", "Friesian", "Peruvian Paso", "arab", "arab", "Welsh cob", "Knabstrupper", "arab")
summary.categorical(horses)




#4) summary function capable of both kinds of data

summary.general <- function(data.vector){
  if(is.numeric(data.vector) == TRUE){
    summary.continuous(data.vector)
  } else {
    summary.categorical(data.vector)
  }
}

#Test:

tf <- c(TRUE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE)

summary.general(horses)
#(character)
summary.general(tf)
#(logical)
summary.general(bunch.of.numbers)
#(numeric)



#5: write a function that will take an arbitrary input sequence of DNA and output the translated sequence

#First, lookup table construction:

bases <- c("A", "G", "T", "C")
codons <- expand.grid(bases, bases, bases)
rearranged.codons <- codons[c(3, 2, 1)]
amino.acids <- c("Lys", "Lys", "Asn", "Asn", "Arg", "Arg", "Ser", "Ser", "Ile", "Met", "Ile", "Ile", "Thr", "Thr", "Thr", "Thr", "Glu", "Glu", "Asp", "Asp", "Gly", "Gly", "Gly", "Gly", "Val", "Val", "Val", "Val", "Ala", "Ala", "Ala", "Ala", "stop", "stop", "Tyr", "Tyr", "stop", "Trp", "Cys", "Cys", "Leu", "Leu", "Phe", "Phe", "Ser", "Ser", "Ser", "Ser", "Gln", "Gln", "His", "His", "Arg", "Arg", "Arg", "Arg", "Leu", "Leu", "Leu", "Leu", "Pro", "Pro", "Pro", "Pro")
DNA.translation.lookup.table <- cbind(rearranged.codons, amino.acids)

merged.codons <- character(nrow(DNA.translation.lookup.table))

for(i in 1:nrow(DNA.translation.lookup.table)){
  merged.codons[i] <- paste(DNA.translation.lookup.table[i, 1], DNA.translation.lookup.table[i, 2], DNA.translation.lookup.table[i, 3], collapse = "")
}

merged.codons.final <- gsub(" ", "", merged.codons)
DNA.translation.lookup.table[,5] <- merged.codons.final

#Now I have a data frame with amino acids in col 4 and codons in col 5
#Second, split string into character vector with nchar == 3 for each element
#I tried using strsplit and substring and other stuff... no luck.

#DNA splitting function:

DNA.codons <- function(DNA.seq){
  single.nucleotides <- unlist(strsplit(DNA.seq, ""))
  if((length(single.nucleotides) %% 3) != 0){
    stop("DNA sequence must have a length that is a multiple of three!")
  }
  first.nuc.seq <- seq(1, length(single.nucleotides), by = 3)
  second.nuc.seq <- first.nuc.seq + 1
  third.nuc.seq <- first.nuc.seq + 2
  first.nucleotide <- single.nucleotides[first.nuc.seq]
  second.nucleotide <- single.nucleotides[second.nuc.seq]
  third.nucleotide <- single.nucleotides[third.nuc.seq]
  codons <- character(length(first.nuc.seq))
  for(i in 1:length(first.nuc.seq)){
    codons[i] <- paste(first.nucleotide[i], second.nucleotide[i], third.nucleotide[i], collapse = "")
  }
  codons.final <- gsub(" ", "", codons)
  return(codons.final)
}

#Finally, translate codons into amino acids:

DNA.translate <- function(DNA.seq){
  single.nucleotides <- unlist(strsplit(DNA.seq, ""))
  if((length(single.nucleotides) %% 3) != 0){
    stop("DNA sequence must have a length that is a multiple of three!")
  }
  first.nuc.seq <- seq(1, length(single.nucleotides), by = 3)
  second.nuc.seq <- first.nuc.seq + 1
  third.nuc.seq <- first.nuc.seq + 2
  first.nucleotide <- single.nucleotides[first.nuc.seq]
  second.nucleotide <- single.nucleotides[second.nuc.seq]
  third.nucleotide <- single.nucleotides[third.nuc.seq]
  codons <- character(length(first.nuc.seq))
  for(i in 1:length(first.nuc.seq)){
    codons[i] <- paste(first.nucleotide[i], second.nucleotide[i], third.nucleotide[i], collapse = "")
  }
  codons.final <- gsub(" ", "", codons)
  codon.ref <- unlist(DNA.translation.lookup.table[5])
  names(codon.ref) <-  unlist(DNA.translation.lookup.table[4])
  
  protein <- character(length(codons.final))
  for(i in 1:length(codons.final)){
    protein[i] <- names(codon.ref[match(codons.final[i], codon.ref)])
  }
  return(protein)
}

#Test:
DNA.real.test <- "GATTTCCCCAAACTGAAGCTA"
DNA.translate(DNA.real.test)





#6: write a function that will take multiple sequences, translate, and flag where they match up

DNA.seq.overlap <- function(DNA.seq.1, DNA.seq.2, ...){
  DNA.list <- list(DNA.seq.1, DNA.seq.2, ...)
  translated.seqs <- sapply(DNA.list, DNA.translate)
  for(i in 1:(length(DNA.seq.1)-1)){
    match <- which(DNA.list[[i]] == DNA.list[[i+1]])
  }
}

#...
