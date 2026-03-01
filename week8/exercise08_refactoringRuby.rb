# Alec Krsek
# CS 362 Exercise 8: Intermediate Ruby
commands = {
  "noun" => -> { 2.times { puts "Noun: Cadillac" } },
  "verb" => -> { 2.times { puts "Verb: Accelerate" } },
  "adjective" => -> { 3.times { puts "Adjective: Dark" } },
  "adverb" => -> { 2.times { puts "Adverb: Confidently" } },
  "gerund" => -> { 4.times { puts "Gerund: Grooving" } }
}
puts "Enter a command: #{commands.keys.join(' ')}"
commands[gets.chomp]&.call || puts("Invalid command. Enter a valid command: #{commands.keys.join(' ')}")