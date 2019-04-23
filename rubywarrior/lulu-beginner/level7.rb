class Level7
	attr_accessor :warrior
	attr_reader :full_health

	def initialize(warrior, max_health)
		@warrior = warrior
		@full_health = max_health
	end

	def need_rest?(current_health, previous_health)
		return current_health < full_health && current_health >= previous_health
	end

	def solve_level_7
		@current_health = @warrior.health
		@previous_health = @current_health unless @previous_health
		space = @warrior.feel

		print "-- current_health = #{@current_health} \n"
		print "-- previous_health = #{@previous_health} \n"

		if space.wall?
			@warrior.pivot!
		elsif space.enemy?
			@warrior.attack!
		elsif !(space.stairs?) && need_rest?(@current_health, @previous_health)
			if @warrior.feel(:backward).wall?
				@warrior.rest!
			else
				@warrior.walk!(:backward)
			end
		else
			@warrior.walk!
		end

		@previous_health = @current_health
	end
end