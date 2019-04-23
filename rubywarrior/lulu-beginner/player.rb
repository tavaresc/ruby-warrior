require_relative "level7"

class Player
	FULL_HEALTH = 20

	attr_accessor :warrior

	def need_rest?(current_health, previous_health)
		return current_health < FULL_HEALTH && current_health >= previous_health
	end

	def need_pivot_to_rest?(current_health, previous_health)
		return current_health < FULL_HEALTH && current_health < previous_health
	end

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
			# resting (and can keep it)
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

	def solve_level_6
		@current_health = warrior.health
		@previous_health = @current_health unless @previous_health
		@direction = :backward unless @direction

		def change_direction
			result = 
			if @direction == :backward
				:forward
			else
				:backward
			end
			return result
		end

		def call_actions(space)
			if space.enemy?
				warrior.attack!(@direction)
			elsif space.captive?
				warrior.rescue!(@direction)
			elsif !(space.stairs?) && need_rest?(@current_health, @previous_health)
				warrior.rest!
			else
				warrior.walk!(@direction)
			end
		end

		def must_change_direction?
			return warrior.feel(@direction).wall? || need_rest?(@current_health, @previous_health)
		end

		call_actions(warrior.feel(@direction))

		@direction = change_direction if must_change_direction?
		@previous_health = @current_health
	end

	def solve_level_7
		@current_health = warrior.health
		@previous_health = @current_health unless @previous_health
		space = warrior.feel

		print "-- current_health = #{@current_health} \n"
		print "-- previous_health = #{@previous_health} \n"

		if space.wall?
			warrior.pivot!
		elsif space.enemy?
			warrior.attack!
		elsif space.captive?
			warrior.rescue!
		elsif !(space.stairs?) && need_rest?(@current_health, @previous_health)
			if warrior.feel(:backward).wall?
				warrior.rest!
			else
				warrior.walk!(:backward)
			end
		elsif
			warrior.walk!
		end

		@previous_health = @current_health
	end

	def play_turn(warrior)
		@warrior = warrior
		solve_level_7
		#level7 = Level7.new(@warrior, FULL_HEALTH)
		#level7.solve_level_7
		#Level1.new(warrior)
	end
end
