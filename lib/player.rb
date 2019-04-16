class Player
	attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 10
	end 

	def show_state
		puts "#{name} a #{@life_points} points de vie"
	end 

	def gets_damage(damage_received)
		@life_points = life_points - damage_received
		if 
			@life_points <= 0
			puts "le joueur #{name} a été tué !"
	    end
	end

	def attacks(player)  #player1.attacks(player2)
		puts "Le joueur #{name} attaque le joueur #{player.name}"
		damage_received = compute_damage
		puts "Il lui inflige #{damage_received} points de dommages"
		player.gets_damage(damage_received)
	end

	def compute_damage
    return rand(1..6)
  end

end 


class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name)
		@name = name.to_s
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		puts "#{name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
	end 

	def compute_damage
    	rand(1..6) * @weapon_level
  	end

  	def search_weapon
  		weapon_level_2 = rand(1..6)
  		puts "Tu as trouvé une nouvelle arme de niveau #{weapon_level_2}"
  		if weapon_level_2 > @weapon_level 
  			@weapon_level = weapon_level_2
  			puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends"
  			puts "Tu as maintenant une arme de niveau #{weapon_level_2}"
  		else 
  			puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
  		end
  	end

  	def search_health_pack
  		resultat = rand(1..6)
  		if resultat == 1 
  			puts "Tu n'as rien trouvé"
  		elsif resultat >= 2 || resultat <= 5
  			puts " Bravo tu as trouvé un pack de +50 points de vie"
  			if @life_points <= 50 
  			@life_points = life_points + 50
  			end
  		else resultat == 6 
  			puts "Waow, tu as trouvé un pack de +80 points de vie"
  			if @life_points <= 20 
  			@life_points = life_points + 80
  			end
  		end
  	end
end