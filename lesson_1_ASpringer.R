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
