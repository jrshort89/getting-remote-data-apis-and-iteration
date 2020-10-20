def welcome
  # puts out a welcome message here!
  puts "Welcome to our Star Wars CLI application where you become one with Star Wars! We are not your father!"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp
  # puts input
end