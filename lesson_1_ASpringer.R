################################################
## Exercises ###################################
################################################

#ONLINE DICTIONARY:
# http://www.sr.bham.ac.uk/~ajrs/R/r-function_list.html

#PRE-EXERCISES:

letters[1:5]
letters[5:1]
#gives first five letters of alphabet in order; gives first five letters of alphabet in reverse order
letters[x<20]
#does not work because x is not defined
x <- letters
x[x < 20]
#does not work because the vector is made of characters, not numerics
x <- letters
x < 20
#still does not work. Vector is made of characters, so a < 20 is not logical, thus returning FALSE
#>letters[20:]
#Error: unexpected ']' in "letters[20:]" 
#Computer was expecting a number after the colon, thus ']' was unexpected. Doesn't care that a ']' WOULD be proper AFTER the number. Doesn't look ahead.

random.matrix <- matrix(1:25, nrow = 5, ncol = 5)
#typing random.matrix yields:
#[,1] [,2] [,3] [,4] [,5]
#[1,]    1    6   11   16   21
#[2,]    2    7   12   17   22
#[3,]    3    8   13   18   23
#[4,]    4    9   14   19   24
#[5,]    5   10   15   20   25
#Thus a matrix could be used to make a graphical display (perhaps the box in exercise 2)
#Also, matrix assigns values down columns. Effectively turns a linear vector into a matrix. 
crude.transpose.of.random.matrix <- matrix(c(1,6,11,16,21,2,7,12,17,22,3,8,13,18,23,4,9,14,19,24,5,10,15,20,25), nrow = 5, ncol = 5)
#crude.transpose.of.random.matrix yields:
#[,1] [,2] [,3] [,4] [,5]
#[1,]    1    2    3    4    5
#[2,]    6    7    8    9   10
#[3,]   11   12   13   14   15
#[4,]   16   17   18   19   20
#[5,]   21   22   23   24   25
random.matrix[1:2,]
#Yields first two rows (rows default before columns)
random.matrix[,1:2]
#Yields first two columns
random.matrix[-1,]
#GUESS: all but row 1 included... yup.
random.matrix[4:5, 4:5]
#lower corner of matrix

characters <- c("a", "f", "3")
characters %in% letters
#don't capitalize "c" when using catenate. Not good. 
# %in% is logical, checks whether values in the vector "characters" are ALSO members of the vector "letters". Finds the INTERSECTION.
match(characters, letters)
#returns 1 6 NA
#Tells you values in vector "characters" are a match for values in vector "letters" at positions 1, 6, and no intersection.
letters[!characters %in% letters]
# gives: [1] "c" "f" "i" "l" "o" "r" "u" "x"
#Apparently gives every third letter, no idea why.
characters.experiment <- c("a", "f", "4")
letters[!characters.experiment %in% letters]
#Same answer, so... NOT due to the third character in the vector being a "3"
characters.experiment.two <- c("a", "f", "3", "4")
letters[!characters %in% letters]
#Gives every 3rd and 4th letter... still have no idea what this is doing.

filly.race.records <- list(c = c("Zenyatta", "Rachel Alexandra"), n = c(19/20, 13/19))
filly.race.records$c
#Gives names of the best thoroughbred race fillies. Or the names of my retired female cockroaches. Take your pick.
filly.race.records$n
#Gives the number of first place wins as a fraction of total starts (of the horses, not the roaches... the roaches suck at racing)

fillies.df <- data.frame(names = c("Zenyatta", "Rachel Alexandra"), starts = c(19/20, 13/19))
#Can give names to your variables using a dataframe. 

#WHEN MAKING A DATA FRAME, COLUMN LABELS MUST BE GIVEN USING AN = SIGN, NOT A <- SIGN OR COLUMN NAMES DO NOT ASSIGN CORRECTLY
pony.frame = data.frame(name <- c("Vanna", "George", "Heidi"), height <- c(15, 13.2, 12), color <- c("grey", "chestnut overo", "palomino"))
#NO.
pony.frame = data.frame(name = c("Vanna", "George", "Heidi"), height = c(15, 13.2, 12), color = c("grey", "chestnut overo", "palomino"))
YES.

is.numeric(1:5)
#gives only ONE TRUE. Therefore checks to see if the ENTIRE vector is of a certain data type, not individual components. Thus, probably would give false for a list of mixed data types.
is.numeric(filly.race.records)
#Yup. Gives ONE FALSE rather than a vector of length four (FALSE FALSE TRUE TRUE)
as.numeric(c("1", "5"))
#COERCES the CHARACTERS "1" and "5" into numeric values 1 and 5
dangerous <- factor(c(1,5))
#> as.numeric(c("1", "5"))
#[1] 1 5
#> dangerous <- factor(c(1,5))
#> levels(dangerous)
#[1] "1" "5"
#> as.numeric(dangerous)
#[1] 1 2
#as.numeric coerces the factor with 1,5 in it to the numbers 1,2. Problem. 


#ACTUAL EXERCISES:


# c - combine (NOT the same as "concatenate" apparently!)
#AGAIN, c() is NOT EQUAL to cat() !!!
#     - takes two (or more) vector and joins them together
c(1, 2, 3)
c(c(1,2,3), c(4,5,6))
#     - they need to be of the same type, though!
c(1,2, "three")

#cbind: combine R objects by rows or columns
#takes more than one vector or other object and makes them into a single object
cbind(letters, 1:26)
#creates a matrix with two columns, 26 rows
cbind(matrix(1:4, nrow = 2, ncol = 2), letters)
#two objects being combined must be multiples of each other (smaller object is REPEATED to fill the space)
cbind(matrix(1:26, nrow = 13, ncol = 2), letters)
#except apparently the smaller object isn't necessarily repeated if said smaller object is a matrix...
cbind(matrix(1:52, nrow = 26, ncol = 2), letters)
#makes a 3x26 matrix
cbind(matrix(1:4, nrow = 2, ncol = 2), matrix(5:8, nrow = 2, ncol = 2))
#makes a 2x4 matrix... just places the two matrices side by side. Does NOT make a dataframe or stacked 3D grid of numbers

#col: column indexes; row: row indexes
#Tells you what number the rows or columns of a matrix-liek object are
#Basically makes a grid showing that locations are under the category "column 1," "column 2," etc.
col(pony.frame, as.factor = TRUE)
#shows a 3x3 matrix filled with the column names
col(pony.frame)
#shows a 3x3 matrix filled with column numbers

#cut: convert numeric to factor
#factors include a) a list of possible character states (levels), and b) a vector with information on what character state each data point is at
cut.example <- c(0:20)
cut(cut.example, breaks = 4)
#Takes the vector of numbers from 1 to 20 and divides them into four categories: 0<x<5, 5<x<10, 10<x<15, and 15<x<20
#Returns a list showing which data points fall into which category (level)
random.height <- c(2, 4, 6, 3, 4, 1, 5, 4, 7, 3, 8, 2, 1)
cut(random.height, 2)
#Sort of creates QUANTILES from your data: min/max determined by data, which quantile a data point falls into is then calculated and returned

#diff: lagged differences
#calculates the difference (subtraction) of two consecutive values in a vector
#the LAG arguemnt is the amount of space between integers you're calculating the difference between (ex. difference between every third value = lag of 3)
#the DIFFERENCES argument tells how many TIMES to calculate the difference between consecutive integers
#collapses a vector of length n to length n-1 for each difference taken
#Thus, the max value for differences is n-1 for a vector of length n before weird stuff happens:
diff.example <- c(1, 4, 6, 8, 3, 4)
diff(c(1, 4, 6, 8, 3, 4))
diff(c(1, 4, 6, 8, 3, 4), differences = 5)

#dim: dimensions of an object
#returns the dimensions of any object in R
dim(pony.frame)
#returns 3 3, meaning pony.frame is a 3 x 3 "matrix," (rows x columns)

#rownames, colnames, names:
#Returns the names within an R object
colnames(pony.frame)
# returns "name"   "height" "color" 

#expand.grid: create data frame from all combos of factor variables
#makes a data frame from all possible combinations (like nCr) of items
#For example, if you have three colors of shirts and two colors of pants, how many outfits? 
jeans <- c("blue", "black")
shirts <- c("white", "red", "green")
expand.grid(jeans, shirts)
#shows you all possible combos, and that there are six options for outfits
#EVEN BETTER CALCULATE HORSE COLOR GENETICS, VECTORS OF ALLELES IN EACH LOCUS:
blackred_locus <- c("EE", "Ee", "ee")
agouti_locus <- c("AA", "Aa", "a")
cream_locus <- c("CrCr", "Crcr", "crcr")
total_genotypes <- expand.grid(blackred_locus, agouti_locus, cream_locus)
#Gives 27 genotypes. Can this be translated to phenotype? Future problem...  
#phenotypes from this expansion = black, bay, chestnut, smokey black, buckskin, palomino, smokey cream, perlino, and cremello

#Hmmm can this be used to make a punnett square? 
#not quite :(

#eigen, %*%, lower.tri, upper.tri, diag
#eigen computes eigenvalues and eigenvectors of matrices (linear algebra stuff)
small.matrix <- matrix(1:4, ncol = 2, nrow = 2)
eigen(small.matrix)
#%*% = matrix multiplication
matrix.a <- matrix(1:2, nrow = 2, ncol = 4)
matrix.b <- matrix(1:4, nrow = 4, ncol = 3)
matrix.a %*% matrix.b
#multiplies matrix.a (2x4) by matrix.b (4x3) to give the resulting 2x3 matrix (r1c1 x r1c1 + r1c2 x r2c1 ...)
#lower.tri returns "TRUE" for the lower triangle of a matrix
small.matrix[lower.tri(small.matrix)] <- 10
#changes the value of everything in the lower triangle of small.matrix to the value "10"
#upper.tri = same, but upper corner
#diag: matrix diagonals
#used to construct diagonal matrices, or manipulate diagonals of matrices
five.by.five.identity.matrix <- diag(x = 1, nrow = 5, ncol = 5)
#super cool. 

#gl: generate factor levels
#n = number of levels, k = number of replications, labels = names of factor levels
gl(4, k = 3, labels = c("egg", "larva", "pupa", "adult"))
#gives a list of egg, larva, pupa, adult with 3 replicates each

#identical: test objects for exact equality
#checks if two things are EXACTLY equal, returns true or false
vector.a <- c(1, 2, 3, 4)
vector.b <- c(1, 2, 3, 1)
identical(vector.a, vector.b)
#returns a SINGLE "FALSE." Does NOT check if PARTS of the vector are the same, checks if the vectors AS A WHOLE are the same

#image: display color image
#takes a grid and fills it with colors based on value
#can be used to translate numbers into color values
large.matrix <- matrix(1:25, nrow = 5, ncol = 5)
image(large.matrix)
#Makes a super awesome grid from white/yellow to red
#however, this grid does not correspond to the matrix. Not sure what it's using to make colors

#library: packages
#allows you to call/load specific packages available to you in R

#length:length of an object
#Tells you how big an object is
length(small.matrix)
#tells you there are four cells in small.matrix
length(large.matrix)
#tells you there are 25 cells in large.matrix
length(expand.grid(jeans, shirts))
#doesn't work. Doesn't tell you the number of combinations, tells you the number of CATEGORIES (jeans and shirts = 2)

#jitter: add noise
#adds noise to values, useful for making multiple overlapping points on a plot visible
jitter(small.matrix)
#changes values from 1, 2, 3, 4, to random values close to these (ex. 1.05, 2.94, 2.07, 3.95)

#ls: list objects
#Gives a list of the objects in your environment
ls
#does weird stuff. Must use brackets.
ls() 
#lists stuff you have defined (in this case, jeans, shirts, small.matrix, pony.dataframe, etc.)
#can modify stuff in brackets to look for what's in a specific environment of your choosing
#rm(list=ls()) clears the environment

#mean, median, max, min
#mean: calculates mu, population average
#median, max, min: self-explanatory
population <- c(14, 15, 16, 12.5, 18, 15.2, 16.1, 14.3, 15.1, 17.2)
mean(population)
max(population)
min(population)
median(population)
#Gives mean, max, etc. BUT want it to round since hands are measured to the inch, never less
#round(x, digits = 0) allows you to round to specific decimal places (digits)
#ceiling, floor, and truncate (trunc) also available for discrete math calculations

#paste: concatenate strings
#converts everything into a character, and then makes it into a vector
#collapse function makes entire vector into a single string (vector of length 1?)
paste(letters, collapse = ",")
# gives [1] "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
#how long is this vector?
collapsible <- paste(letters, collapse = ",")
length(collapsible)
#Yes, vector of length one with items separated by COMMAS
paste(letters, collapse = " ")
#vector of length one with items separated by SPACES
paste(letters, collapse = "")
#vector of length one with items separated by NOTHING
#Can I separate this into codons?
paste(letters, 1:3, collapse = "")
#This does something weird
paste(letters, 1:3)
#Apparently combines two different vectors (letters and 1:3) into a single vector
#each element of the vector is the COMBINATION of the matching PLACES in the two vectors
#ex. v1 <- (a, b, c); v2 <- (d, e, f); paste(v1, v2) <- (ad, be, cf) --> (1, 2, 3) + (1, 2, 3) = (11, 22, 33)
#RECYCLES shorter vector
blackred_locus_alleles <- c("E", "e")
agouti_locus_alleles <- c("A", "a")
cream_locus_alleles <- c("Cr", "cr")
diploid <- function(x){
  diploid <- expand.grid(x, x)
  return(diploid)
}
paste(diploid(blackred_locus_alleles))
#Nopeee. So sad. 
#also, diploid(blackred_locus_alleles) gives the PERMUTATIONS rather than the COMBINATIONS... not sure why
binary_fission <- paste(letters, letters)
quaternary_fission <- paste(letters, letters, letters, letters)
#Still doesn't make codons, of course, but clones stuff like a bacterium.

#read.csv, read.table, write.csv, write.table
#read.csv: takes a file you have and brings it into your workspace in R. Creates a data frame from a table. 
#read.table: is identical to read.csv except for what the defaults are set to
#read.csv has default header = TRUE, while read.table has default header = FALSE
#write.csv and write.table make an existing matrix or data frame x in R into a file (.csv or .table)
#the oppositve of read.csv and read.table

#rnorm, pnorm, dnorm, qnorm
#rnorm: generates a random number from the normal distribution
# n = how many random numbers you want, defaults set to mean = 0 and SD = 1
FiveNormalNumbers <- rnorm(5)
#Interestingly, either the random numbers are only drawn once for a named variable (so the vector remains constant)
#OR it uses a set algorithm so the same five random normal numbers are drawn each time
#pnorm: the cumulative probability function, the normal probability table from the back of the math textbook! 
# given a test statistic, it spits out the (sum) probability (right tail) that your data were drawn from the normal curve
#dnorm: it's the DENSITY FUNCTION for the NORMAL CURVE. Given an X value, it gives you the associated probability
#DRAWS the normal curve
normal_curve <- dnorm(-5:5)
plot(normal_curve)
#ta da! one bell curve. 
#qnorm: the OPPOSITE of pnorm. Given a probability, it spits out the test statistic associated with that probability. 
qnorm(0.5)
#Yields 0 as a result,indicating half the probability lies to the left of 0 in the cumulative function. Correct. 

#runif, rpois
#draws random numbers from the uniform distribution and poisson distribution. "R UNIF" NOT "RUN IF" DO NOT FORGET THIS

#rank: given an input vector, rank returns a vector showing the order of numeric values in the input vector
#places the rank value of a given number in the vector in the POSITION that number occurs in the input vector
#ex. if 5 is the 9th number in vector x, and is the 2nd smallest number in that vector, the result of rank will show "2" in the 5th vector position of the output
#default rank from smallest (1) to largest (n), will use averages if there are several numbers of the same value in a single vector

#sort, rank, order
#unlike rank, which shows the rank of each number in a vector IN THE POSITION IN WHICH THEY OCCUR, sort REARRANGES the initial values
#of course, however, sort does not alter the original vector. Must define a new one for that to stick.
#order does weird stuff that allows you to organize data frames and other sets of data. Apparently tells you HOW to sort data...
unordered_thing <- c(4, 4, 4, 6, 1)
#The proper order of this vector (ascending) is (1, 4, 4, 4, 6)
order(x)
#This gives 5, 1, 2, 3, 4, which makes NO sense, BUT: 
ordered_thing <- unordered_thing[order(unordered_thing)]
#ordered_thing is now the vector 1, 4, 4, 4, 6 as wanted. No explanation as to how. 

#outer: given vectors a and b, creates an array with dimensions  a x b showing some combination of the elements of a & b
a <- c(1, 2, 3)
b <- c(4, 5, 6)
outer (a, b)
#[,1] [,2] [,3]
#[1,]    4    5    6
#[2,]    8   10   12
#[3,]   12   15   18
#here, outer creates a matrix of dimensions a x b; the first row is the first element of a * vector b, the second row is the second element of a * vector b, etc.
#does producty things

#rep: replicates values in a vector or list
#needs an input of a vector/list, and nu?mber of times you want it repeated
not_enough_cowbell <- ("cowbell")
rep(not_enough_cowbell, 5)
#"cowbell" "cowbell" "cowbell" "cowbell" "cowbell"
#Enough said. 

#rowSums, colSums: calculates the sum of a certain part of a matrix, in other words, the MARGINS
#NOT THE SAME AS rowsum!!! 
matrix.a <- matrix(1:2, nrow = 2, ncol = 4)
#     [,1] [,2] [,3] [,4]
#[1,]    1    1    1    1
#[2,]    2    2    2    2
rowSums(matrix.a)
#yields [1] 4 8 because 1+1+1+1 = 4, and 2+2+2+2 = 8
colSums(matrix.a)
#yields [1] 3 3 3 3

#seq: generates a sequence of numbers based on parameters you choose: from = x, to = y, by = z
seq(from = 0, to = 66, by = 3)
#yields the vector: [1]  0  3  6  9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54 57 60 63 66

#source: reads the file of your choosing and evaluates anything there to evaluate, giving the results in R
#source(file name)

#which, which.min, which.max
#which: gives the location (INDEX) of elements in a LOGICAL vector that are TRUE
horse.colors <- c("bay", "black", "chestnut", "palomino", "perlino", "cremello", "buckskin", "red roan", "grulla")
eumelanin.content <- c(TRUE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE)
horse.eumelanin.table <- table(horse.colors, eumelanin.content)
#SUCH A GREAT TABLE:
#   eumelanin.content
#horse.colors  FALSE TRUE
#   bay          0    1
#   black        0    1
#   buckskin     0    1
#   chestnut     1    0
#   cremello     1    0
#   grulla       0    1
#   palomino     1    0
#   perlino      0    1
#   red roan     1    0
which(eumelanin.content)
#yields [1] 1 2 5 7 9, indicating the position/location of colors in the vector that express eumelanin
#does NOT work for NON-LOGICAL VECTORS!

#which.min or which.max: gives the location/position in a vector where the FIRST minimum or maximum occurs (possible that there is more than one value that is min/max)
lots.of.numbers <- c(4, 6, 3, 76, 34, 51, 7, 76, 234, 56, 567, 1, 9)
which.min(lots.of.numbers)
#yields [1] 12 because it's not giving the VALUE of the min, it's giving the LOCATION of the min. 
#if you want the VALUE of the min/max, use min() or max()

#setdiff: tells you what IS contained in the first set that is NOT contained in the other
# https://www.safaribooksonline.com/library/view/the-r-book/9780470510247/ch002-sec073.html
home.barn.breeds <- c("arabian", "miniature", "paint", "arab cross")
Polly.barn.breeds <- c("Welsh cob", "quarter horse", "appaloosa", "arab cross", "warmblood")
#What breeds are at the home barn that aren't at Polly's barn?
setdiff(home.barn.breeds, Polly.barn.breeds)
#answer? Arabian, mini, and paint.
#But what breeds are at POLLY'S barn that aren't at the HOME barn?
setdiff(Polly.barn.breeds, home.barn.breeds)
#answer? Welsh cob, quarter horse, appy, and warmblood

#intersect: gives the intersection of two sets (elements common to both set A and set B)
intersect(Polly.barn.breeds, home.barn.breeds)
#both Polly's barn and the home barn have an arab cross. 

#union: gives the union of two sets (all unique elements from the combination of set A and B)
Dawn.barn.breeds <- c("holsteiner", "paint", "quarter horse", "arab cross", "percheron", "thoroughbred", "arabian")
union(Polly.barn.breeds, home.barn.breeds, Dawn.barn.breeds)
#Nope, won't do the union of three sets. Crappy.

#table: creates a table from a bunch of vectors, lists, data frames, or other strings of data
pony.frame = data.frame(name = c("Vanna", "George", "Heidi"), height = c(15, 13.2, 12), color = c("grey", "chestnut overo", "palomino"))
table(pony.frame)
#Not super for doing stuff with data frames. 
name.pony <- c("Vanna", "George", "Heidi")
height.pony <- c(15, 13.2, 12)
color.pony <- c("grey", "chestnut overo", "palomino")
table(name.pony, height.pony, color.pony)
#still not good. 
pony.table <- (name.pony = c("Vanna", "George", "Heidi"), height.pony = c(15, 13.2, 12), color.pony = c("grey", "chestnut overo", "palomino"))
#doesn't work at all.
#So apparently table doesn't make tables, per se. Data frames are the "tables," and tables take strings of stuff and calculate frequency. Screw you, R. 
# http://www.cyclismo.org/tutorial/R/types.html
#You can either take a matrix and give it names...
#OR you can take a max of TWO vectors and use those as the two dimensions of the table. The table will be filled with frequencies of the two
#The table will ONLY contain numbers, not characters

#with: specifies which data you want to use (say, in a data frame), and then allows you to to do something to it (AVAILIBLE IN R, like MAX
#takes 1) a data set, and 2) an EXPRESSION (IN R) you want to use on that data set: with(data, function)

#par: set or query graphical parameters
#allows you to change appearance and display of graphs/plots. Parameters (like color, font, etc.) are set by making them ARGUMENTS of par
#Things that can be changed in par: 
#adj: alignment of text. 0 = left-justified, 0.5 = centered, 1 = right-justified
#ann: axis titles and header: if ann = FALSE, no headers/titles
#bg: background color of a plot, bg = some color value
#bty: determines the type of box drawn around a plot (USEFUL FOR EXERCISE?!)
#cex: magnifies parts of a plot (ex. main title (.main), subtitles, (.sub), etc.)
#col: plot color (again, can specify particular parts of a plot: col.axis = color of axis titles)
#crt: rotation of text (ex. for axis titles)
#family: font type (options are "serif", "sans", and "mono")
#font: changes type of lettering: 1 = plain, 2 = bold, 3 = italic...
#etc. 



################################################
## Bonus exercises #############################
################################################

bonus.text <- "It was the best of times, it was the worst of times, it was the age of
wisdom, it was the age of foolishness, it was the epoch of belief, it
was the epoch of incredulity, it it was the season of Light, it was the
season of Darkness, it was the spring of hope, it was the winter of
despair, we had everything before us, we had nothing before us, we
were all going direct to Heaven, we were all going direct the other
way- in short, the period was so far like the present period, that
some of its noiosiest authorities insisted on its being received, for
good or for evil, in the superlative degree of comparison only."

#Guessing this is Dickens, though I don't know which one.
#Tale of Two Cities; haven't read it, though my last evolution prof would surely be pleased if I did.

#grep: finds a regular expression
#arguments for grep: pattern (like "the"), x (the vector of characters you want to search), etc

grep("the", bonus.text)
#yields [1] 1 BECAUSE it's telling you the POSITION of the element of the vector contains a match. bonus.text is a vector of length one. One element. That one element has a match. 

grepl("the", bonus.text)
#yields [1] TRUE because instead of the POSITION (like grep), it gives whether or not each element contains a match in true/false form

grep("the", bonus.text, value = TRUE)
#doesn't help matters because it just returns the ENTIRE phrase (since it's ONE element and that ONE element contains a match)

gregexpr("the", bonus.text)
#yields [1]  8  34  61  87 118 146 182 210 241 268 407 412 432 459 575
#Yes. Location of each instance of THE. The occurs starting at character 8, 34, 61, etc.
length(gregexpr("the", bonus.text))

