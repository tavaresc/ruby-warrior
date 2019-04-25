module Level4
	def solve_level_4
		@current_health = warrior.health
		@previous_health = @current_health unless @previous_health

		if warrior.feel.enemy?
			warrior.attack!
		else
			if need_rest?(@current_health, @previous_health)
				warrior.rest!
			else
				warrior.walk!
			end
		end
		@previous_health = @current_health
	end
end