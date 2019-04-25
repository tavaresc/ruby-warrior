module Level3
	def solve_level_3
		if warrior.feel.enemy?
			warrior.attack!
		else
			warrior.health < Player::FULL_HEALTH ? warrior.rest! : warrior.walk!
		end
	end
end