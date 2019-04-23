class Player
	FULL_HEALTH = 20

	attr_accessor :warrior, :health

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

	def solve_level_4
		@current_health = warrior.health
		@previous_health = @current_health unless @previous_health

		if warrior.feel.enemy?
			warrior.attack!
		else
			# "current_health > previous_health" means that the warrior has been
			# resting
			# "current_health = previous_health" means that the warrior got no
			# damages in the previous turn (health kept the same during 2 turns) 
			if @current_health < FULL_HEALTH && @current_health >= @previous_health
				warrior.rest!
			else
				warrior.walk!
			end
		end
		@previous_health = @current_health
	end

	def solve_level_5
		@current_health = warrior.health
		@previous_health = @current_health unless @previous_health

		if warrior.feel.enemy?
			warrior.attack!
		elsif warrior.feel.captive?
			warrior.rescue!
		elsif @current_health < FULL_HEALTH && @current_health >= @previous_health
			warrior.rest!
		else
			warrior.walk!
		end
		@previous_health = @current_health
	end

  def play_turn(warrior)
  	@warrior = warrior
  	solve_level_5
  end
end
