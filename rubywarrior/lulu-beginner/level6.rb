module Level6
	def solve_level_6
		@current_health = warrior.health
		@previous_health = @current_health unless @previous_health
		@direction = :backward unless @direction
		space = warrior.feel(@direction)
		
		if space.enemy?
			warrior.attack!(@direction)
		elsif space.captive?
			warrior.rescue!(@direction)
		elsif !(space.stairs?) && need_rest?(@current_health, @previous_health)
			warrior.rest!
		else
			warrior.walk!(@direction)
		end

		@direction = change_direction if must_change_direction?
		@previous_health = @current_health
	end
end