require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry


#1 partie
puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

#2 partie
puts "HUMAIN ! Quel est ton speudo ?"
print "=>"
human_name = gets.chomp
while human_name == ""
  puts "J'attends !!!"
  print "=>"
  human_name = gets.chomp
end

my_game = Game.new(human_name)

round = 1
while my_game.is_still_ongoing?
  choise = ""
  while not ((["a", "s"].include? choise) || ((Float(choise) != nil rescue false) ? (my_game.enemies[choise.to_i] == nil ? false : true) : false))
    my_game.menu
    choise = gets.chomp
    if not ((["a", "s"].include? choise) || ((Float(choise) != nil rescue false) ? (my_game.enemies[choise.to_i] == nil ? false : true) : false))
      puts "Choix invalide !!!!!!!!\n=>"
    end
  end
  my_game.nemu_choice (choise)
  my_game.enemies_attack
  round += 1
end
my_game.end