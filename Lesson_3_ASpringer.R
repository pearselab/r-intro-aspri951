#1) Implement cat class, slot = race, methods = pring

class(cat) <- "race"

#How does R define the slots for an class? It appears that you have to define an object first and then R uses that instance as the example/model that defines the class? In other words, you cannot define a class without first giving an instance? 
#Apparently you can't just define a class. Attempt to use an instance to define a class:

Milo <- list(race = "siamese")
class(Milo) <- "cat"

#Again, this is NOT intuitive to me. Just looking at the code, it appears that I have just taken a specific case and generalized it to the entire class (induction). In this case, it looks like I just said "because Milo is Siamese, and Milo is a cat, all cats are siamese." 

Darwin <- list(race = "Russian blue")

#I have given a second object the same property (slot) as my first instance of cat. However, R does NOT appear to assign "Darwin" to class "cat." 

