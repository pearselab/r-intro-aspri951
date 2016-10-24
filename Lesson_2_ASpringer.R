#Session 2 Exercises

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
  if i %% 2 <- 0
  print(i)
}

# More bracket problems. Closing curly bracket returns error. Why?

for (i in 20:10){
  if i %% 2 = 0
  print(i)
}


