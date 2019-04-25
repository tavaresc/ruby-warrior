module Level8
	def solve_level_8
		space = warrior.feel
		enemy_index = warrior.look.find_index { |s| s.enemy? }

		if space.enemy?
			warrior.attack!
		elsif space.captive?
			warrior.rescue!
		elsif enemy_index && warrior.look.take(enemy_index).all? { |s| s.empty? }
			warrior.shoot!
		else
			warrior.walk!
		end
	end
end