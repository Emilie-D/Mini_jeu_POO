require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Josiane")
player2 = Player.new("José")



puts "Passons à la phase d'attaque :"
puts "======================================"
	while 
		player1.life_points >= 0 && player2.life_points >= 0
		player1.attacks(player2)
		if player1.life_points <= 0 then
			break
		end
		player2.attacks(player1)
		if player2.life_points <= 0 then
			break
		end
puts "======================================="
puts "Voici l'état de chaque joueur :"
	player1.show_state
	player2.show_state
puts "======================================="

	
end

