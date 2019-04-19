class Player
	attr_accessor :warrior

	#def initialize(warrior)
	#	@warrior = warrior
	#end

	def solve_level1
  	warrior.walk!
	end

	def solve_level2
		if warrior.feel.empty?
			warrior.walk!
		else
			warrior.attack!
		end
	end

  def play_turn(warrior)
  	@warrior = warrior
  	solve_level2
  end
end
