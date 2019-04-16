class Player
	attr_accessor :name, :life_points

	def initialize(name) #création d'une instance avec un nom et des points de vie à 10 
		@name = name
		@life_points = 10
	end 

	def show_state #récupère le nom et les points de vie 
		"#{name} a #{@life_points} points de vie" 
	end 

	def gets_damage(damage_received) #met à jour les points de vie en fonction de dégats subits
		@life_points = life_points - damage_received
		if 
			@life_points <= 0
			puts "le joueur #{name} a été tué !"
	    end
	end

	def attacks(player)  #player1.attacks(player2) méthode pour attaquer
		puts "Le joueur #{name} attaque le joueur #{player.name}"
		damage_received = compute_damage
		puts "Il lui inflige #{damage_received} points de dommages"
		player.gets_damage(damage_received) #on oubli pas d'appeler la méthode pour pouvoir l'utiliser
	end

	def compute_damage #création d'un dé de 6 faces qui va permettre de définir la valeur de l'attaque 
    return rand(1..6) 
  end

end 


class HumanPlayer < Player #création d'une nouvelle classe qui hérite de la classe Player
	attr_accessor :weapon_level #nouveau paramètre qui correspond à l'arme du joueur

	def initialize(name)
		@name = name.to_s
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		puts "#{name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
	end 

	def compute_damage #les dégats reprennent le système de dé vu précédemment multiplié par le niveau de l'arme
    	rand(1..6) * @weapon_level
  	end

  	def search_weapon # si tu trouve une arme plus forte que celle que tu as actuellement, remplace l'ancienne par celle-ci
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

  	def search_health_pack # si tu as de la chance et que tu tombes sur une chiffre entre 2 et 5 tu récupère 50 points de vie et si tu fais 6 tu récupères 80 points, à condition de ne pas avoir ta vie au maximum
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