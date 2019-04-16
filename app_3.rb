require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry

puts "================================================"
puts "||Bienvenue sur 'ILS VEULENT TOUS MA POO' !      ||"
puts "||Le but du jeu est d'être le dernier survivant !||"
puts "================================================"

puts "Quel est ton nom ?"
name_player = gets.chomp
puts "Heureux de vous rencontrer #{name_player}"
my_game = Game.new(name_player)
puts "===================================="
puts "===================================="

while my_game.is_still_ongoing? 
	my_game.show_players
	my_game.menu
	str = gets.chomp
	my_game.menu_choice(str)
	my_game.enemies_attack
  my_game.end
end
