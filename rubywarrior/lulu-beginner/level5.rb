module Level5
	def solve_level_5
		@current_health = warrior.health
		@previous_health = @current_health unless @previous_health

		if warrior.feel.enemy?
			warrior.attack!
		elsif warrior.feel.captive?
			warrior.rescue!
		elsif need_rest?(@current_health, @previous_health)
			warrior.rest!
		else
			warrior.walk!
		end
		@previous_health = @current_health
	end
end