require_relative "player"

class Game
  attr_accessor :human_player, :enemies

  def initialize (human_name)
    @human_player = HumanPlayer.new(human_name)
    @enemies = []
    @enemies << player1 = Player.new("Josiane")
    @enemies << player2 = Player.new("José")
    @enemies << player3 = Player.new("Jeremy")
    @enemies << player4 = Player.new("Julie")
  end

  def kill_player (player)
    @enemies.delete(player)
  end

  def is_still_ongoing?
    return @human_player.life_points > 0 && @enemies.count > 0
  end

  def show_players
    print "#{@human_player.name} a #{@human_player.life_points} points de vie\n"
    print "Son Arme a un niveau de #{@human_player.weapon_level} !!\n"
    print "il a encore #{@enemies.count}\n"
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts "\na - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "\nattaquer un joueur en vue :"
    @enemies.each_index{ |index| print " #{index} - " , "#{@enemies[index].show_state} \n" }
    print "\n=>"
  end

  def nemu_choice (choise)
    case
    when choise == "a"
      @human_player.search_weapon
    when choise == "s"
      @human_player.search_health_pack
    when choise.to_i < @enemies.count
      @human_player.attacks(@enemies[choise.to_i])
      if @enemies[choise.to_i].life_points == 0
        kill_player(@enemies[choise.to_i])
      end
    else
      puts "on ne devrait jamais arriver ici"
    end
  end

  def enemies_attack
    puts "Les autres joueurs t'attaquent !"
    @enemies.each{|player| player.attacks(@human_player) if human_player.life_points  > 0 }
  end

  def end
    if @human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNE !"
    else
      puts "Loser ! Tu as perdu !"
    end
  end

end