class Level1 
	attr_accessor :warrior

	def initialize(warrior)
		@warrior = warrior
	end

	def solve_level_1
		warrior.walk!
	end
end