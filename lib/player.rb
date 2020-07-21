class Player
attr_accessor :name , :life_points

  def initialize (name, life_points = 10)
    @name= name
    @life_points = life_points
  end

  def show_state
    if @life_points > 1
      puts "#{@name} a #{@life_points} points de vie"
    else
      puts "#{@name} a #{@life_points} point de vie"
    end
  end

  def gets_damage (nb_dmg)
    @life_points -= nb_dmg
    if @life_points <= 0
      puts "le joueur #{@name} a été tué !"
    end
  end

  def attacks (player_2)
    puts "le joueur #{@name} attaque le joueur #{player_2.name}"
    dmg = compute_damage
    player_2.gets_damage(dmg)
    puts "il lui inflige #{dmg} points de dommages"
  end
  def compute_damage
    return rand(1..6)
  end
end