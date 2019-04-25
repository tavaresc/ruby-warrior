require_relative "level1"
require_relative "level2"
require_relative "level3"
require_relative "level4"
require_relative "level5"
require_relative "level6"
require_relative "level7"
require_relative "level8"
require_relative "level9"

class Player
	include Level1
	include Level2
	include Level3
	include Level4
	include Level5
	include Level6
	include Level7
	include Level8
	include Level9

	FULL_HEALTH = 20

	attr_accessor :warrior

	# "current_health > previous_health" means that the warrior has been
	# resting (and can keep it) or al least not damaged
	# "current_health = previous_health" means that the warrior got no
	# damages in the previous turn (health kept the same during 2 turns) 
	def need_rest?(current_health, previous_health)
		return current_health < FULL_HEALTH && current_health >= previous_health
	end

	def must_change_direction?
		warrior.feel(@direction).wall? || need_rest?(@current_health, @previous_health)
	end

	def change_direction
		if @direction == :backward
			:forward
		else
			:backward
		end
	end

	

	def play_turn(warrior)
		@warrior = warrior
		#solve_level_1
		#solve_level_2
		#solve_level_3
		#solve_level_4
		#solve_level_5
		#solve_level_6
		#solve_level_7
		#solve_level_8
		solve_level_9
	end
end
