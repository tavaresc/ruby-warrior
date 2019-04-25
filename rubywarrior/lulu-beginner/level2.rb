module Level2
	def solve_level_2
		if warrior.feel.empty?
			warrior.walk!
		else
			warrior.attack!
		end
	end
end