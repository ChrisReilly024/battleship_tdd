require 'pry'
require 'byebug'

# def ship_count(grid)
# 	sub_count = 0
# 	dest_count = 0
# 	cru_count = 0
# 	battleship_count = 0
# 	flat1 = grid.map {|line| line << 'X'}.flatten
# 	flat2 = grid.transpose.map {|line| line << 'X'}.flatten

# 	flat = (flat1 + flat2)
# 	flat.each_with_index do |ship, i|
# 		if ship == 1
# 			if (flat[i-1] == 0 || flat[i-1] == 'X') && flat[i+1] == 1 && flat[i+2] == 1 && flat[i+3] == 1
# 				battleship_count += 1
# 			elsif (flat[i-1] == 0 || flat[i-1] == 'X') && flat[i+1] == 1 && flat[i+2] == 1 && (flat[i+3] == 0 || flat[i+3] == 'X')
# 				cru_count += 1
# 			elsif (flat[i-1] == 0 || flat[i-1] == 'X') && flat[i+1] == 1 && (flat[i+2] == 0 || flat[i+2] == 'X')
# 				dest_count += 1
# 			elsif (flat[i-1] == 0 || flat[i-1] == 'X') && (flat[i+1] == 0 || flat[i+1] == 'X')
# 				sub_count += 1
# 			end
# 		end
# 	end
# 	p [sub_count, dest_count, cru_count, battleship_count]
# 	sub_count >= 4 && dest_count >= 3 && cru_count >= 2 && battleship_count >= 1
# end

# [1, 0, 0, 0, 1, 0, 1, 0, 0, 0], 
# [0, 0, 0, 0, 1, 0, 1, 0, 0, 0], 
# [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
# [0, 1, 1, 1, 1, 0, 0, 0, 0, 1], 
# [0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
# [0, 0, 0, 1, 1, 1, 0, 0, 0, 1], 
# [0, 0, 0, 0, 0, 0, 0, 1, 0, 0], 
# [0, 0, 0, 0, 0, 1, 0, 0, 0, 0], 
# [0, 1, 0, 0, 0, 0, 0, 1, 0, 0], 
# [0, 0, 0, 0, 0, 0, 0, 1, 0, 0]

# def checker(grid)
# 	for i in 0...grid.length do
# 		for j in 0...10 do
# 			if grid[i][j] == 1
				
# 				if i == 0 && j == 0
# 					return false if grid[1][0] == 1 && grid[0][1] == 1 || grid[1][1] == 1
					
# 				elsif i == 0 && j > 0 && (grid[i][j+1] == 1 || grid[i][j-1] == 1)
# 					return false if grid[i+1][j-1..j+1].include?(1)

# 				elsif i == 0 && j > 0 && grid[i+1][j] == 1
# 					return false if grid[i][j-1] == 1 || grid[i][j+1] == 1 
# 					return false if grid[i+1][j-1] == 1 || grid[i+1][j+1] == 1

# 				elsif i == 9 && j == 0 && grid[i][j+1] == 1
# 					return false if grid[i-1][j..j+1].include?(1)

# 				elsif i == 9 && j == 0 && grid[i-1][j] == 1
# 					return false if grid[i][j+1] == 1 || grid[i-1][j+1] == 1					
					
# 				elsif i == 9 && j > 0 && grid[i-1][j] == 1 
# 					return false if grid[i][j-1] == 1 || grid[i][j+1] == 1 
# 					return false if grid[i-1][j-1] == 1 || grid[i-1][j+1] == 1

# 				elsif i == 9 && j > 0 && (grid[i][j-1] == 1 || grid[i][j+1] == 1)
# 					return false if grid[i-1][j-1..j+1].include?(1)

# 				elsif j == 0 && i > 0 && i < 9 && (grid[i+1][j] == 1 || grid[i-1][j] == 1)
# 					return false if grid[i][j+1] == 1 || grid[i+1][j+1] == 1 || grid[i-1][j+1] == 1

# 				elsif j == 0 && i > 0 && i < 9 && grid[i][j+1] == 1
# 					return false if grid[i-1][j..j+1].include?(1) || grid[i+1][j..j+1].include?(1)

# 				elsif i > 0 && i < 9 && j > 0 && (grid[i-1][j] == 1 || grid[i+1][j] == 1)
# 					return false if grid[i][j+1] == 1 || grid[i][j-1] == 1
# 					return false if grid[i-1][j+1] == 1 || grid[i-1][j-1] == 1
# 					return false if grid[i+1][j+1] == 1 || grid[i+1][j-1] == 1

# 				elsif i > 0 && i < 9 && j > 0 && (grid[i][j+1] == 1 || grid[i][j-1] == 1)
# 					return false if grid[i+1][j-1..j+1].include?(1)
# 					return false if grid[i-1][j-1..j+1].include?(1)			

# 				end
# 			end
# 		end
# 	end
# 	true	
# end

# def validate_battlefield(grid)
# 	return false if grid.flatten.count(1) != 20
# 	checker(grid) && ship_count(grid)
# end


# p ship_count([
# 	[1, 0, 0, 0, 1, 0, 1, 0, 0, 0], 
# 	[0, 0, 0, 0, 1, 0, 1, 0, 0, 0], 
# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
# 	[0, 1, 1, 1, 1, 0, 0, 0, 0, 1], 
# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
# 	[0, 0, 0, 1, 1, 1, 0, 0, 0, 1],
# 	[0, 0, 0, 0, 0, 0, 0, 1, 0, 0], 
# 	[0, 0, 0, 0, 0, 1, 0, 0, 0, 0], 
# 	[0, 1, 0, 0, 0, 0, 0, 1, 0, 0], 
# 	[0, 0, 0, 0, 0, 0, 0, 1, 0, 0]
# 	])

# p validate_battlefield([
# [0, 1, 0, 1, 0, 0, 0, 0, 0, 0], 
# [0, 1, 0, 0, 0, 0, 0, 1, 0, 0], 
# [0, 1, 0, 0, 0, 0, 0, 1, 0, 0], 
# [0, 0, 0, 0, 1, 0, 0, 1, 0, 0], 
# [0, 0, 1, 0, 1, 0, 0, 1, 0, 0], 
# [0, 0, 1, 0, 0, 0, 0, 0, 0, 0], 
# [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
# [0, 1, 1, 0, 0, 0, 0, 1, 0, 1], 
# [0, 0, 0, 0, 0, 0, 0, 1, 0, 0], 
# [0, 0, 1, 0, 0, 0, 0, 1, 0, 1]
# ])

# p validate_battlefield([
# 	[0, 1, 0, 0, 0, 0, 0, 0, 0, 0], 
# 	[0, 0, 0, 0, 0, 0, 0, 0, 1, 1], 
# 	[0, 0, 1, 1, 1, 1, 0, 0, 0, 0], 
# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
# 	[0, 0, 0, 1, 0, 0, 0, 1, 1, 1], 
# 	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
# 	[0, 0, 0, 0, 0, 0, 0, 1, 0, 0], 
# 	[1, 1, 1, 0, 0, 1, 0, 1, 0, 1], 
# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
# 	])

# Test if number is prime


# class Calc
# 	attr_accessor :splitted, :order, :input

# 	def eval(exp)
# 		first, sign, second = exp
# 		case sign
# 			when '+' then first.to_i + second.to_i
# 			when '-' then first.to_i - second.to_i
# 			when '*' then first.to_i * second.to_i
# 			else 
# 				first = first.to_f
# 				second = second.to_f		
# 				first / second
# 		end
# 	end


# 	def splitter(input)
# 		@splitted = input.split(/[ ()]/).select {|ele| ele != ' ' && ele != ''}.map {|num| num.to_i != 0 ? num.to_i : num }
# 	end

# 	def para
# 		p @splitted
# 		if @splitted.include?('(')
# 			@splitted.each_with_index do |ele1,i|
# 				if ele1 == '('
# 					para1 = i
# 					@splitted.each_with_index do |ele2,j|
# 						if ele2 == ')'			
# 							para2 = j
# 							exp = @splitted[para1+1...para2]
# 							@splitted = @splitted[0...para1] + [eval(exp)] + @splitted[para2+1..-1]
# 							para
# 						end
# 					end
# 				end
# 			end
# 		end
# 		@splitted
# 	end

# 	def ordered	
# 		if @splitted.include?('/')
# 			sign_index = @splitted.index('/')
# 			exp = @splitted[sign_index-1..sign_index+1]
# 			@splitted = @splitted[0...sign_index-1] + [eval(exp)] + @splitted[sign_index+2..-1]
# 			ordered
# 		elsif @splitted.include?('*')
# 			sign_index = @splitted.index('*')
# 			exp = @splitted[sign_index-1..sign_index+1]
# 			@splitted = @splitted[0...sign_index-1] + [eval(exp)] + @splitted[sign_index+2..-1]
# 			ordered
# 		elsif @splitted.include?('+')
# 			sign_index = @splitted.index('+')
# 			exp = @splitted[sign_index-1..sign_index+1]
# 			@splitted = @splitted[0...sign_index-1] + [eval(exp)] + @splitted[sign_index+2..-1]
# 			ordered
# 		elsif @splitted.include?('-')
# 			sign_index = @splitted.index('-')
# 			exp = @splitted[sign_index-1..sign_index+1]
# 			@splitted = @splitted[0...sign_index-1] + [eval(exp)] + @splitted[sign_index+2..-1]
# 			ordered
# 		end
# 		@splitted.join.to_f
# 	end

# 	def evaluate(input)
# 		@splitted = splitter(input)
# 		ordered
# 	end

# end

# p Calc.new.evaluate("4 + 5") # 9
# p Calc.new.evaluate("4 * 5") # 20
# p Calc.new.evaluate("4 / 5") #0.8
# p Calc.new.evaluate("4 - 5") # -1
# p Calc.new.evaluate("4 + 5 * 6") # 34

# PEMDAS
# a = Calc.new('5 + 4 + (15 / 3)') # 14
# b = Calc.new('5 + 4 + 3)')
# p a.splitter
# p a.para
# p a.splitted
# p a.ordered
# p b.ordered
# pp a
# p Calc.evaluate("4 + 5") # 9
# p calc.evaluate("4 * 5") # 20
# p calc.evaluate("4 / 5") #0.8
# p calc.evaluate("4 - 5") # -1
# p calc.evaluate("4 + 5 * 6") # 3

# Lift Rules
# The Lift only goes up or down!
# Each floor has both UP and DOWN Lift-call buttons (except top and ground floors which have only DOWN and UP respectively)
# The Lift never changes direction until there are no more people wanting to get on/off in the direction it is already travelling
# When empty the Lift tries to be smart. For example,
# If it was going up then it may continue up to collect the highest floor person wanting to go down
# If it was going down then it may continue down to collect the lowest floor person wanting to go up
# The Lift has a maximum capacity of people
# When called, the Lift will stop at a floor even if it is full, although unless somebody gets off nobody else can get on!
# If the lift is empty, and no people are waiting, then it will return to the ground floor
# People Rules
# People are in "queues" that represent their order of arrival to wait for the Lift
# All people can press the UP/DOWN Lift-call buttons
# Only people going the same direction as the Lift may enter it
# Entry is according to the "queue" order, but those unable to enter do not block those behind them that can
# If a person is unable to enter a full Lift, they will press the UP/DOWN Lift-call button again after it has departed without them

# Get all the people to the floors they want to go to while obeying the Lift rules and the People rules
# Return a list of all floors that the Lift stopped at (in the order visited!)
# NOTE: The Lift always starts on the ground floor (and people waiting on the ground floor may enter immediately)

# Input
# queues a list of queues of people for all floors of the building.
# The height of the building varies
# 0 = the ground floor
# Not all floors have queues
# Queue index [0] is the "head" of the queue
# Numbers indicate which floor the person wants go to
# capacity maximum number of people allowed in the lift
# Parameter validation - All input parameters can be assumed OK. No need to check for things like:

# People wanting to go to floors that do not exist
# People wanting to take the Lift to the floor they are already on
# Buildings with < 2 floors
# Basements
# Output
# A list of all floors that the Lift stopped at (in the order visited!)

# class Lift
# 	attr_reader :capacity
# 	attr_accessor :lift, :direction, :level, :log, :floors
	
# 	def initialize(floors,capacity)
# 		@floors = floors
# 		@capacity = capacity
# 		@lift = []
# 		@direction = 'up'
# 		@level = 0
# 		@log = [0]
# 		operate
# 	end

# 	# private
# 	def full?
# 		@lift.count >= @capacity
# 	end

# 	def change_direct
# 		if @level == @floors.count - 1
# 			@direction = 'down'
# 		elsif @level == 0
# 			@direction = 'up'
# 		else
# 			return false
# 		end
# 		true
# 	end
			
# 	def add_rider
# 		if full? || @floors[@level].empty?
# 			return false
# 		else
# 			boarded = []
# 			@floors[@level].each do |rider|
# 				if !full? && rider > @level && direction == 'up'
# 					@lift << rider
# 					boarded << rider
# 					logger					
# 				elsif !full? && rider < @level && direction == 'down'
# 					@lift << rider
# 					boarded << rider
# 					logger					
# 				elsif rider < 0 || rider > @floors.count - 1
# 					@floors[@level].delete(rider)
# 				end
# 				@floors[@level] = @floors[@level].reject {|rider| boarded.include?(rider)}
# 			end
# 		end
# 	end

# 	def depart_rider
# 		if @lift.include?(@level)		
# 			@lift.reverse.each do |passenger|
# 				riders = @floors[@level].count(passenger)
# 				riders.times {@floors[@level] << riders}
# 				@lift.delete(passenger) if passenger == @level
# 				logger
# 			end
# 		end
# 	end

# 	def level_up_down
# 		if @level == @floors.count
# 			@level -= 1
# 		elsif @level == 0
# 			@level += 1
# 		else
# 		@direction == 'up' ? @level += 1 : @level -= 1
# 		end
# 	end
	
# 	def logger
# 		@log << @level if @log[-1] != @level
# 	end

# 	def shutdown
# 		if @floors.flatten.empty? && @lift.empty?
# 			@log << 0 if @log[-1] != 0
# 			return @log
# 		else
# 			return false
# 		end
# 	end

# 	def operate
# 		while !shutdown
# 			depart_rider
# 			change_direct
# 			add_rider		
# 			level_up_down
# 		end		
# 		@log
# 	end
# end


class Lift
	attr_reader :capacity
	attr_accessor :lift, :direction, :level, :log, :floors, :i
		
	def initialize(floors,capacity)
		@floors = floors
		@capacity = capacity
		@lift = []
		@direction = 'up'
		@level = 0
		@log = [0]
		# operate
	end

	# private
	def full?
		@lift.count >= @capacity
	end
			
	def add_rider
		if full? || @floors[@level].empty?
			return false
		else
			boarded = []
			@floors[@level].each do |rider|
				if !full? && rider > @level && direction == 'up'
					@lift << rider
					boarded << rider
					logger					
				elsif !full? && rider < @level && direction == 'down'
					@lift << rider
					boarded << rider
					logger		
				end
				@floors[@level] = @floors[@level].reject {|rider| boarded.include?(rider)}
			end
		end
	end

	def depart_rider
		if @lift.include?(@level)		
			@lift.reverse.each_with_index do |passenger, i|
				@lift.delete(passenger) if passenger == @level
				logger
			end
		end
	end

	def change_direct
		if @level == 0
			@direction == 'up' 
		elsif @level == @floors.count - 1
			@direction == 'down' 
		end
	end

	def level_up_down
		if @level == @floors.count
			@level -= 1
		elsif @level == 0
			@level += 1
		else
		@direction == 'up' ? @level += 1 : @level -= 1
		end
	end		

	def logger
		@log << @level if @log[-1] != @level
	end

	def shutdown
		if @floors.flatten.empty? && @lift.empty?
			@log << 0 if @log[-1] != 0
		else
			return false
		end
	end

	def operate
		while !shutdown
			depart_rider
			add_rider		
			change_direct
			level_up_down
		end			
		@log	
	end
end

a = Lift.new([ [], [], [5,5,5], [], [],  [],  []],5) 
b = Lift.new([ [], [], [1,1],   [], [],  [],  []],5)         
c = Lift.new([ [], [3], [4],    [], [5], [],  []],5) 
d = Lift.new([ [], [0], [],     [], [2], [3], []],5) 
# e = Lift.new([[], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]], 5) 
# f = Lift.new([[], [2], [3, 3, 3], [1], [], [], []], 1) 
# g = Lift.new([[], [0, 0, 0, 6], [], [], [], [6, 6, 0, 0, 0, 6], []], 5) 
# h = Lift.new([[3, 3, 3, 3, 3, 3], [], [], [], [], [4, 4, 4, 4, 4, 4], []], 5) 
# i = Lift.new([[], [], [], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [], [], []], 5) 
# j = Lift.new([[3, 3, 3, 3, 3, 3], [], [], [], [], [], []], 5) 
# k = Lift.new([[1, 2, 3, 4], [], [], [], [], [], []], 5) 
# l = Lift.new([[], [], [4, 4, 4, 4], [], [2, 2, 2, 2], [], []], 2) 
# m = Lift.new([[3], [2], [0], [2], [], [], [5]], 5) 
	
# p a
# p b
# p c
# p d
# p e # [0, 6, 5, 4, 3, 2, 1, 0, 5, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 3, 2, 1, 0, 1, 0],
# p f # [0, 1, 2, 3, 1, 2, 3, 2, 3, 0]
# p g # [0, 1, 5, 6, 5, 1, 0, 1, 0]
# p h # [0, 3, 5, 4, 0, 3, 5, 4, 0]
# p i # [0, 3, 1, 3, 1, 3, 1, 0]
# p j # [0, 3, 0, 3, 0]
# p k # [0, 1, 2, 3, 4, 0]
# p l # [0, 2, 4, 2, 4, 2, 0]
# p m # [0, 1, 2, 3, 6, 5, 3, 2, 0]

p a.operate # [0, 2, 5, 0] 
p b.operate # [0, 2, 1, 0] 
p c.operate # [0, 1, 2, 3, 4, 5, 0] 
p d.operate # [0, 5, 4, 3, 2, 1, 0]
# p e.operate # [0, 6, 5, 4, 3, 2, 1, 0, 5, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 3, 2, 1, 0, 1, 0]
# p f.operate # [0, 1, 2, 3, 1, 2, 3, 2, 3, 0]
# p g.operate # [0, 1, 5, 6, 5, 1, 0, 1, 0]
# p h.operate # [0, 3, 5, 4, 0, 3, 5, 4, 0]
# p i.operate # [0, 3, 1, 3, 1, 3, 1, 0]
# p j.operate # [0, 3, 0, 3, 0]
# p k.operate # [0, 1, 2, 3, 4, 0]
# p l.operate # [0, 2, 4, 2, 4, 2, 0]
# p m.operate # [0, 1, 2, 3, 6, 5, 3, 2, 0]

	
