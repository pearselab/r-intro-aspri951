################################################
## Exercises ###################################
################################################

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


# c - concatenate
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
#Still doesn't make codons, of course, but clones stuff.





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
