module Level9
	def current_phase_done?
		spaces = warrior.look
		spaces.last.wall? && spaces.take(2).all? { |s| s.empty? || s.stairs? || s.wall? }
	end

	def change_phase
		@current_phase += 1
		warrior.pivot!
	end

	def solve_level_9
		last_phase = 3
		@current_health = warrior.health
		@previous_health = @current_health unless @previous_health
		@current_phase = 0 unless @current_phase
		space = warrior.feel
		enemy_index = warrior.look.find_index(&:enemy?)
		# can be written as: "enemy_index = warrior.look.find_index { |s| s.enemy? }"


		if @current_phase == 0 || (@current_phase != last_phase && current_phase_done?)
			change_phase
		elsif	space.enemy?
			warrior.attack!
		elsif space.captive?
			warrior.rescue!
		elsif enemy_index && warrior.look.take(enemy_index).all? { |s| s.empty? }
			warrior.shoot!
		elsif !(space.stairs?) && need_rest?(@current_health, @previous_health)
			warrior.rest!
		else
			warrior.walk!
		end

		@previous_health = @current_health
	end
end