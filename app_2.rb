require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "================================================"
puts "||Bienvenue sur 'ILS VEULENT TOUS MA POO' !      ||"
puts "||Le but du jeu est d'être le dernier survivant !||"
puts "================================================"

puts "Quel est ton nom ?"
name_player = gets.chomp
puts "Heureux de vous rencontrer #{name_player}"
human_player = HumanPlayer.new(name_player)
puts "===================================="
puts "===================================="


player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = [Player.new("Josiane"), Player.new("José")]


while human_player.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
	human_player.show_state
	puts "Quelle action veux-tu effectuer ?"
	puts "================================="
	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner "
	puts 
	puts "Attaquer un joueur en vue : "
	puts "0 - "
	puts "#{player1.show_state}"
	puts "1 - "
	puts "#{player2.show_state}"
	puts "================================="
	action = gets.chomp
		if action == "a"
			puts "Partons à la recherche d'une meilleure arme"
			human_player.search_weapon
		elsif action == "s"
			puts "Allons chercher des soins"
			human_player.search_health_pack
		elsif action == "0"
			puts "Tu as choisi d'attaquer #{player1.name}"
			human_player.attacks(player1)
		elsif action == "1"
			puts "Tu as choisi d'attaquer #{player2.name}"
			human_player.attacks(player2)
		else 
			puts "Erreur... Je n'ai pas compris ta réponse"
		end
	puts "================================="
	puts "ATTENTION !!!"
	puts "================================="
	puts "Les autres joueurs t'attaquent"
	enemies.each do |enemies|
		enemies.attacks(human_player) 
		#if human_player.life_points > 0 && enemies.life_points > 0
	end
end 

puts "La partie est finie"
if 
	human_player.life_points > player1.life_points || player2.life_points
	puts "BRAVO ! Tu as gagné "
else 
	puts "Tu as perdu .. Reviens vite !"
end