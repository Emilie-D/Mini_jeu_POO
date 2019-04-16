require_relative 'player'

class Game
	attr_accessor :human_player, :enemies 

	def initialize(name)
		@human_player = HumanPlayer.new(name)
		@enemies = [Player.new("Josiane"), Player.new("José"), Player.new("François"),Player.new("Claude")]
	end

	def kill_player(player) #si un player n'a plus de vie il est supprimé de l'array
		enemies.delete_if { |player| player.life_points == 0 }
	end

	def is_still_ongoing? # la partie continue si les points de vie de l'human_player sont supérieurs à 0 et si l'array n'est pas vide 
		human_player.life_points > 0 && !enemies.empty?
	end

	def show_players
		puts "#{human_player.name} a #{human_player.life_points} points de vie"
		puts " Il reste #{enemies.count} enemies"
	end 

	def menu #menu qui affiche les différents choix du joueur
		puts "Bienvenue dans le menu, plusieurs choix s'offrent à toi :"
		puts "Attaquer un joueur :"
		enemies.each.with_index do |enemies, index|
		  puts "#{index} - #{enemies.show_state}" if enemies.show_state
		end
		puts "4 - Chercher une meilleure arme"
		puts "5 - Chercher à se soigner"
	end 

	def menu_choice(str) #permet au joueur de rentrer son choix et d'excécuter la commande
		if str == "0"
			puts "Tu as choisi d'attaquer Josiane"
			system('say "Attack Josiane"')
			human_player.attacks(enemies[0])
		elsif str == "1"
			puts "Tu as choisi d'attaquer José"
			system('say "Attack Joséééééééé"')
			human_player.attacks(enemies[1])
		elsif str == "2"
			puts "Tu as choisi d'attaquer François"
			system('say "Attack Françoaaaaaaaa"')
			human_player.attacks(enemies[2])
		elsif str == "3"
			puts "Tu as choisi d'attaquer Claude"
			system('say "Attack Clooooooode"')
			human_player.attacks(enemies[3])
		elsif str == "4"
			puts "Tu as choisi de chercher une meilleure arme"
			human_player.search_weapon
		elsif str == "5"
			puts "Tu as choisi de te soigner"
			human_player.search_health_pack
		else 
			puts "Erreur... Je n'ai pas compris ta réponse"
		end
	end

	def enemies_attack #boucle pour faire attaquer les enemies un par un 
		enemies.each do |enemies|
		enemies.attacks(human_player) 
	end
	end

	def end # si tout les enemies sont morts tu as gagné 
		compteur = 0
		enemies.each do |enemies|
			if enemies.life_points <= 0
	          compteur += 1
	        end
	    end
	    if compteur == 4
            system('say "BRAVO ! Tu as gagnée"') 
		elsif human_player.life_points <= 0
	      puts "Tu as perdu .. Reviens vite !"
	      system('say "LOOSER"')
		end
	end 
end