require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

binding.pry

puts "À ma droite \"Josiane\""
player1 = Player.new("Josiane")
puts "À ma gauche \"José\""
player2 = Player.new("José")
round = 1
while player1.life_points > 0 && player2.life_points > 0
  puts "\nVoici l'état de chaque joueur:"
  player1.show_state
  player2.show_state
  puts "\nPassons à la phase d'attaque :"
  player1.attacks(player2)
  if player2.life_points <= 0
    break
  end
  player2.attacks(player1)
  round += 1
end