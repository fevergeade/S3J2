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
human_player = HumanPlayer.new(human_name)

#3 partie
enemies = []
enemies << player1 = Player.new("Josiane")
enemies << player2 = Player.new("José")

round = 1
while (player1.life_points > 0 || player2.life_points > 0) && human_player.life_points > 0
  choise = ""
  while not (["a", "s", "0", "1"].include? choise)
    puts "Quelle action veux-tu effectuer ?"
    puts "\na - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "\nattaquer un joueur en vue :"
    print "\n0 - "
    enemies[0].show_state
    print "\n1 - "
    enemies[1].show_state
    print "\n=>"
    choise = gets.chomp
    if not (["a", "s", "0", "1"].include? choise)
      puts "Choix invalide !!!!!!!!\n=>"
    end
  end
  case choise
  when "a"
    human_player.search_weapon
  when "s"
    human_player.search_health_pack
  when "0"
    human_player.attacks(enemies[choise.to_i])
  when "1"
    human_player.attacks(enemies[choise.to_i])
  else
    puts "on ne devrait jamais arriver ici"
  end
  puts "Les autres joueurs t'attaquent !"
  enemies.each{|player| player.attacks(human_player) if player.life_points > 0 && human_player.life_points  > 0 }
  round += 1
end
if human_player.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end
