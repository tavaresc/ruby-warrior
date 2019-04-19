class Player
	FULL_HEALTH = 20
	attr_accessor :warrior

	#def initialize(warrior)
	#	@warrior = warrior
	#end

	def solve_level_1
  	warrior.walk!
	end

	def solve_level_2
		if warrior.feel.empty?
			warrior.walk!
		else
			warrior.attack!
		end
	end

	def solve_level_3
		if warrior.feel.enemy?
			warrior.attack!
		else
			warrior.health < FULL_HEALTH ? warrior.rest! : warrior.walk!
		end
	end

  def play_turn(warrior)
  	@warrior = warrior
  	solve_level_3
  end
end
