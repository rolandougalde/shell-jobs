# Harry Potter-themed Ruby script

# Declare a string variable for Harry's name
harry_name = "Harry Potter"

# Declare a number variable for Harry's age
harry_age = 12

# Declare an array of Hogwarts houses
houses = ["Gryffindor", "Hufflepuff", "Ravenclaw", "Slytherin"]

# Output Harry's name and age
puts "#{harry_name} is #{harry_age} years old."

# Conditional check for Harry's age
if harry_age < 11
  puts "#{harry_name} is too young to go to Hogwarts."
elsif harry_age >= 11 && harry_age <= 17
  puts "#{harry_name} is the perfect age to attend Hogwarts!"
else
  puts "#{harry_name} should have graduated from Hogwarts by now!"
end

# Pick a random Hogwarts house for Harry (for fun)
harry_house = houses.sample

# Output Harry's house
puts "#{harry_name} has been sorted into #{harry_house}."

# Let's simulate a magic spell with user input
puts "What's your favorite spell?"
favorite_spell = gets.chomp

# Respond based on the user's spell
if favorite_spell.downcase == "expelliarmus"
  puts "Expelliarmus! You disarmed your opponent!"
else
  puts "Hmm, that's not quite the spell I was expecting, but it's still magic!"
end
