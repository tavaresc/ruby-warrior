module Level7
	def solve_level_7
		@current_health = warrior.health
		@previous_health = @current_health unless @previous_health
		space = warrior.feel

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
end