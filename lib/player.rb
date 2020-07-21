class Player
attr_accessor :name , :life_points

  def initialize (name)
    @name= name
    @life_points = 10
  end

  def show_state
    if @life_points > 1
      print "#{@name} a #{@life_points} points de vie"
    else
      print "#{@name} a #{@life_points} point de vie"
    end
  end

  def gets_damage (nb_dmg)
    @life_points -= nb_dmg
    if @life_points <= 0
      print "\n**** le joueur #{@name} a été tué ! ****\n"
      @life_points = 0
    end
  end

  def attacks (player_2)
    print "\n#{@name} attaque #{player_2.name}\n"
    dmg = compute_damage
    print "\nil lui inflige #{dmg} points de dommages\n"
    player_2.gets_damage(dmg)
  end
  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize (name)
    @name= name
    @life_points = 100
    @weapon_level = 1
  end
  def show_state
    if @life_points > 1
      print "\n#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}\n"
    else
      print "\n#{@name} a #{@life_points} point de vie et une arme de niveau #{@weapon_level}\n"
    end
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    rolls = rand(1..6)
    puts "tu as trouvé une arme de niveau #{rolls}"
    if rolls > @weapon_level
      @weapon_level = rolls
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    rolls = rand(1..6)
    case rolls.to_i
    when 1
      puts "Tu n'as rien trouvé..."
    when 2, 3, 4, 5
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      if @life_points + 50 > 100
        @life_points = 100
      else
        @life_points += 50
      end
    else
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      if @life_points + 80 > 100
        @life_points = 100
      else
        @life_points += 80
      end
    end
  end

end