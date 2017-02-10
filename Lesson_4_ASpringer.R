#1) Create a dataset of 10 variables, each drawn from normal distributions with DIFF MEANS AND SDs!

#First, dataset of 10 variables from norm distribution:
#Will need rnorm function (rnorm(n, mean, sd))

Norm.samp <- rnorm(10, 0, 1)
#Generates 10 random numbers from the normal distribution with mean = 0 and SD = 1

Norm.samp.test <- rnorm(1, 0, 1)
rep(Norm.samp.test, 10)
#This is DEFINITELY NOT the same as rnorm(10,0,1). R evaluates the rnorm function FIRST, spits out a SINGLE value, then REPLICATES that value 10 times
#So you get a vector of 10 copies of the SAME value
#WEll then. rep() is NOT the same function as replicate(). 
#"replicate is a wrapper for the common use of sapply for repeated evaluation of an expression (which will usually involve random number generation)."
#replicate(n, expr, simplify = "array")

replicate(10, rnorm(1, 0, 1))
#THIS is equivalent to rnorm(10, 0, 1)
#Now change mean and variance for each execution (use uniform distribution to draw a random mean/variance):
#(runif(n, min, max))

replicate(10, rnorm(1, mean = runif(1, -5, 5), sd = runif(1, 0, 10)))
#pretty sure this works but no way to check?




#2) Make version of summary function for continuous datasets

#data summaries: want mean (expectation = sum of stuff/n for set of numbers)... nah, use R's functions for SD. Hate writing SD
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
#Done.




#3) Write summary function that summarizes only categorical data (NOT is.numeric, aka !is.numeric)
#Percentages, total count make sense for categorical data?
#In other words, you've got a vector of people who are male, female, etc. Can't take mean etc., but can say %male

horses <- c("arab", "arab", "Morgan", "saddlebred", "Friesian", "Haflinger", "paint", "appaloosa", "Friesian", "Peruvian Paso", "arab", "arab", "Welsh cob", "Knabstrupper", "arab")
horses[1] == horses[2]
#Excellent, can effectively check if the first element of my categorical vector is equivalent to the second
#Sets me up for an if-else pathway for sorting the vector: 
#First step: count how many elements in the vector are equivalent to element ONE
#Second step: if element 1 == element two, then move on. If element 1 != element two, then go back to first step
#No, easier method: make a NEW vector each step that REMOVES the elements that have already been counted?

#counting example: b <- c(7, 2, 4, 3, -1, -2, 3, 3, 6, 8, 12, 7, 3)
#count3 <- length(which(b == 3)) 

#Try a generic form: 
length(which(horses == horses[1]))
#Cool. Counts number of instances of "arab" in the horse vector. 
#What about an if statement: if element i is NOT equal to elements 1 through i-1, then count length for which vector == i
#So, for elements 1:n, if element i != 1:i-1, then length(which(vector == vector[i]))

counting.function <- function(data.vector){
  for(i in 1:length(data.vector)){
    if(data.vector[i] != data.vector[1:(i-1)]){
      instances.of.i <- length(which(data.vector == data.vector[i]))
      cat("The category", data.vector[i], "contains", instances.of.i, "element(s).", "\n")
    }
  }
}
#Close, but doesn't handle the first element correctly
#Also repeats Freisian twice. Problem: guessing R checks to see if, in this case, "friesian" is equal to ALL the others coming before it.Which is false.
#Need to check if ANY are equivalent. Need ELEMENT-WISE check.

counting.function <- function(data.vector){
  instances.of.element.one <- length(which(data.vector == data.vector[1]))
  cat("The category", data.vector[1], "contains", instances.of.element.one, "element(s).", "\n")
  for(i in 2:length(data.vector)){
    if(data.vector[i] != data.vector[1:(i-1)]){
      instances.of.i <- length(which(data.vector == data.vector[i]))
      cat("The category", data.vector[i], "contains", instances.of.i, "element(s).", "\n")
    }
  }
}

#Warning: 1: In if (data.vector[i] != data.vector[1:(i - 1)]) { :
#the condition has length > 1 and only the first element will be used

#Yeah yeah trying to fix that. But hey, arab works now.
#Oh hey there's an "any" function. That's a shortcut...

any(horses[9] == horses[1:8])

#Yesss. This I want.

counting.function <- function(data.vector){
  instances.of.element.one <- length(which(data.vector == data.vector[1]))
  cat("The category", data.vector[1], "contains", instances.of.element.one, "element(s).", "\n")
  for(i in 2:length(data.vector)){
    if(any(data.vector[i] == data.vector[1:(i-1)]) == FALSE){
      instances.of.i <- length(which(data.vector == data.vector[i]))
      cat("The category", data.vector[i], "contains", instances.of.i, "element(s).", "\n")
    }
  }
}
#WOWWWWWWWWWWWWWWWWWWWWWW IT WORKSSSSSSSSSSSSSSSS

counting.function(c("male", "female", "female", "female", "male", "female"))
counting.function(horses)
#YESS. 
#Now just need to calculate percentages. 
#Will want to round. round(x, digits = n)

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

summary.categorical(horses)
#Holy damn. 



#4) summary function capable of both kinds of data

#Question: do logical vectors count as categorical? Test:
tf <- c(TRUE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE)
summary.categorical(tf)
#Yup

summary.general <- function(data.vector){
  if(is.numeric(data.vector) == TRUE){
    summary.continuous(data.vector)
  } else {
    summary.categorical(data.vector)
  }
}

#Test:

summary.general(horses)
#(character)
summary.general(tf)
#(logical)
summary.general(bunch.of.numbers)
#(numeric)



#5) write a function that will take an arbitrary input sequence of DNA and output the translated sequence

#first, need to make a codon lookup table. Use expand.grid. From lesson one:
#expand.grid: create data frame from all combos of factor variables
#makes a data frame from all possible combinations (like nCr) of items
#For example, if you have three colors of shirts and two colors of pants, how many outfits? 
jeans <- c("blue", "black")
shirts <- c("white", "red", "green")
expand.grid(jeans, shirts)
#shows you all possible combos, and that there are six options for outfits

#Goal: make vector of all possible codons using expand.grid

bases <- c("A", "G", "T", "C")
codons <- expand.grid(bases, bases, bases)

#I now have a data frame that has all the codons in it. 
#Add a new column to data frame with the proper amino acid in it?
#I really don't feel like transcribing DNA-->RNA, so will cheat and use a DNA codon table...
#I also really don't feel like making this arbitrary

#Goal: combine the three separate columns of data frame into single column
#The can use this: for every codon i in sequence of DNA, for every row j of column 1 of data frame, if codon i == dataframe[j, 1], then replace codon i with dataframe[j, 2]
#for loop within a for loop? Prob can use apply function somehow instead.

merged.codons <- data.frame(paste(codons$Var3, codons$var2, codons$var1))
#nope.
merged.codons <- paste(codons$Var3, codons$var2, codons$var1)
#nope.
paste(codons$Var1[1], codons$Var2[1], codons$Var3[1])
#good, but want to remove space.
paste(codons$Var1[1], codons$Var2[1], codons$Var3[1], collapse = "")
# ugh.

#Ok, attempt B: split strings into single letters and check equality piece-meal

#rearranged codons for ease of making lookup table:

rearranged.codons <- codons[c(3, 2, 1)]

amino.acids <- c("Lys", "Lys", "Asn", "Asn", "Arg", "Arg", "Ser", "Ser", "Ile", "Met", "Ile", "Ile", "Thr", "Thr", "Thr", "Thr", "Glu", "Glu", "Asp", "Asp", "Gly", "Gly", "Gly", "Gly", "Val", "Val", "Val", "Val", "Ala", "Ala", "Ala", "Ala", "stop", "stop", "Tyr", "Tyr", "stop", "Trp", "Cys", "Cys", "Leu", "Leu", "Phe", "Phe", "Ser", "Ser", "Ser", "Ser", "Gln", "Gln", "His", "His", "Arg", "Arg", "Arg", "Arg", "Leu", "Leu", "Leu", "Leu", "Pro", "Pro", "Pro", "Pro")

DNA.translation.lookup.table <- cbind(rearranged.codons, amino.acids)

#Okay. Next, splitting random string of DNA into 3-letter codons.
#Actually, who cares... split them into single letters, then match them one by one? Could use strsplit() for that
#substring() looks evil and I don't understand what the hell it does
#How to get every THIRD element? Why, use discrete math! I want every number for which n-1/3 == 0

sequence.split <- function(sequence){
  split.sequence <- unlist(strsplit(sequence, ""))
  return(split.sequence)
  for(i in 1:length(split.sequence)-1){
    if(i-1 / 3 == 0){
      codon <- c(split.sequence[i-1], split.sequence[i], split.sequence[i+1])
      return(codon)
    }
  }
}
#Doesn't work... whyyy.

for(i in 1:10){
  if(i-1 / 3 == 0){
  print(i)  
  }
}
#Here is the problem. Why won't this print jack squat?

for(i in 1:10){
  if(i-1 == 0){
    print(i)  
  }
}
#THIS one works... so... what?!
for(i in 1:10){
  if(((i-1) / 3) == 0){
    print(i)  
  }
}
#well then look who's stupid. Perhaps %% will be more effective than ==. Remainder, not equality :/

for(i in 1:10){
  if(i-1 %% 3 == 0){
    print(i)  
  }
}
#still not working...

for(i in 1:10){
  if(i %% 3 == 0){
    print(i)  
  }
}
#but this works?!
#needed parentheses because R apparently sucks at order of operations.
for(i in 1:10){
  if((i-1) %% 3 == 0){
    print(i)  
  }
}

#Try again:

sequence.split <- function(sequence){
  split.sequence <- unlist(strsplit(sequence, ""))
  for(i in 1:length(split.sequence)-1){
    if((i-1) %% 3 == 0){
      codon <- c(split.sequence[i-1], split.sequence[i], split.sequence[i+1])
      return(codon)
    }
  }
}
#Not working. Test:

sequence.split <- function(sequence){
  split.sequence <- unlist(strsplit(sequence, ""))
  for(i in 1:length(split.sequence)-1){
    if((i-1) %% 3 == 0){
      cat(split.sequence[i], split.sequence[i+1], split.sequence[i+2], "\n")
    }
  }
}
#R doesn't handle 0/n very well. Thus, 1-1 is not a good thing to have. Use range from 2:whatever instead.
#or, you know, 3:whatever because 2 won't work either... so...
#OR I really suck at referencing, because I don't WANT i-1, i, i+1, I want i, i+1, i+2 for a sequence of 4, 5, 6, not 1, 2, 3

new.DNA <- "asdfqeijwkcjgiwnkoskiwksifk"

sequence.split <- function(sequence){
  split.sequence <- unlist(strsplit(sequence, ""))
  for(i in 1:length(split.sequence)-1){
    if((i-1) %% 3 == 0){
      codon <- c(split.sequence[i], split.sequence[i+1], split.sequence[i+2])
      return(codon)
    }
  }
}
#problem: stops after the first codon. Return cuts out of the loop? 

sequence.split <- function(sequence){
  split.sequence <- unlist(strsplit(sequence, ""))
  for(i in 1:length(split.sequence)-1){
    if((i-1) %% 3 == 0){
      codon <- c(split.sequence[i], split.sequence[i+1], split.sequence[i+2])
    }
    all.codons <- list(codon)
    return(all.codons)
  }
}
#nope, can't have a thing called outside of if statement. It dies after if statment is complete.
#need a way to STORE value
#internet says create empty vector and return after loop
sequence.split <- function(sequence){
  split.sequence <- unlist(strsplit(sequence, ""))
  for(i in 1:length(split.sequence)-1){
    if((i-1) %% 3 == 0){
      a[i] <- c(split.sequence[i], split.sequence[i+1], split.sequence[i+2])
      return(a)
    }
  }
}

#get rid of for-loop and use lapply?

split.sequence <- function(sequence){
  unlist(strsplit(sequence, ""))
}

sequence.split <- function(sequence){
  for(i in 1:length(split.sequence(sequence)-1){
    if((i-1) %% 3 == 0){
      codon <- c(split.sequence[i], split.sequence[i+1], split.sequence[i+2])
      return(codon)
    }
  }
}

sequence.split.apply <- function(sequence){
  lapply(sequence, )
}
  

bases <- c("A", "G", "T", "C")
codons <- expand.grid(bases, bases, bases)
rearranged.codons <- codons[c(3, 2, 1)]
amino.acids <- c("Lys", "Lys", "Asn", "Asn", "Arg", "Arg", "Ser", "Ser", "Ile", "Met", "Ile", "Ile", "Thr", "Thr", "Thr", "Thr", "Glu", "Glu", "Asp", "Asp", "Gly", "Gly", "Gly", "Gly", "Val", "Val", "Val", "Val", "Ala", "Ala", "Ala", "Ala", "stop", "stop", "Tyr", "Tyr", "stop", "Trp", "Cys", "Cys", "Leu", "Leu", "Phe", "Phe", "Ser", "Ser", "Ser", "Ser", "Gln", "Gln", "His", "His", "Arg", "Arg", "Arg", "Arg", "Leu", "Leu", "Leu", "Leu", "Pro", "Pro", "Pro", "Pro")
DNA.translation.lookup.table <- cbind(rearranged.codons, amino.acids)

#Goal: merge first 3 columns of DNA translation lookup table:
DNA.translation.lookup.table[,4] <- paste(DNA.translation.lookup.table[,1], DNA.translation.lookup.table[,2], DNA.translation.lookup.table[,3], collapse = "")
DNA.translation.lookup.table[,5] <- sapply(DNA.translation.lookup.table, paste(DNA.translation.lookup.table[,1], DNA.translation.lookup.table[,2], DNA.translation.lookup.table[,3], collapse = ""))
#apply function not working


merged.codons <- character(nrow(DNA.translation.lookup.table))

for(i in 1:nrow(DNA.translation.lookup.table)){
  merged.codons[i] <- paste(DNA.translation.lookup.table[i, 1], DNA.translation.lookup.table[i, 2], DNA.translation.lookup.table[i, 3], collapse = "")
}

#Good. Now need to remove space. 
#sub or gsub? Take (pattern, replacement, x)
#sub only replaces first instance, gsub replaces all

merged.codons.final <- gsub(" ", "", merged.codons)

DNA.translation.lookup.table[,5] <- merged.codons.final

#Second, split string into character vector with nchar == 3 for each element
#Stack overflow code: http://stackoverflow.com/questions/11619616/how-to-split-a-string-into-substrings-of-a-given-length

text <- "aabbccccdd"
substring(text, seq(1, nchar(text)-1, 2), seq(2, nchar(text), 2))
#Test for 3 instead of two, just guessing:

test.DNA <- "elfjweifjwilefjwel"
substring(test.DNA, seq(1, nchar(text)-2, 3), seq(2, nchar(text)-1, 3), seq(3, nchar(text), 3))
#nope. Test two:

test.DNA <- "elfjweifjwilefjwel"
substring(test.DNA, seq(1, nchar(text)-2, 3), seq(3, nchar(text), 3))
#seq = function taking (from, to, by)
#substring(x, start, stop)
#Not working. New strategy:


single.nucleotides <- unlist(strsplit(test.DNA, ""))
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
return(codons)
#Works! Wrap in function

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

DNA.real.test <- "GATTTCCCCAAACTGAAGCTA"

#Translate into amino acids: 

DNA.real.test <- "GATTTCCCCAAACTGAAGCTA"

aa.sequence <- character(length(codons.final))
for(i in 1: length(codons.final)){
  aa.sequence[i] <- DNA.translation.lookup.table[which(DNA.translation.lookup.table$amino.acids == codons.final[i]), 4]
}
#Nah.

protein <- character(length(codons.final))
for(j in 1:length(codons.final)){
  for(i in 1:nrow(DNA.translation.lookup.table)){
    if(DNA.translation.lookup.table[i, 5] == codons.final[j]){
      protein[j] <- DNA.translation.lookup.table[i, 4]
    }
  }
  (protein)
}


codon <- unlist(DNA.translation.lookup.table[5])
names(codon) <-  unlist(DNA.translation.lookup.table[4])
protein <- character(length(codons.final))
for(i in 1: length(codons.final)){
  if()
  protein[i] <- names(codon[which(protein[i] == codon[i])])
}
 
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
> DNA.codons(DNA.real.test)


 

#Using which() to find stuff test:
test.one <- c(4, 6, 8, 3, 5)
test.two <- c(5, 6, 5, 3, 7)
which(test.one == test.two)
#[1] 2 4
#returns index. excellent.



#6) modify function to take multiple DNA sequences

translate.many.DNA.seq <- function(DNA.seq.1, DNA.seq.2, ...){
  DNA.list <- list(DNA.seq.1, DNA.seq.2, ...)
  translated.seqs <- sapply(DNA.list, translate.DNA.seq)
  return(translated.seqs)
}

DNA.seq.overlap <- function(DNA.seq.1, DNA.seq.2, ...){
  translated.seqs <- mapply(DNA.seq.1, DNA.seq.2, ..., DNA.translate)
}


DNA.seq.overlap <- function(DNA.seq.1, DNA.seq.2, ...){
  DNA.list <- list(DNA.seq.1, DNA.seq.2, ...)
  translated.seqs <- sapply(DNA.list, DNA.translate)
  for(i in 1:(length(DNA.seq.1)-1)){
    match <- which(DNA.list[[i]] == DNA.list[[i+1]])
  }
}



#7) 