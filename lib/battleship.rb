def checker(grid)
	for i in 0...grid.length do
		for j in 0...10 do
			if grid[i][j] == 1
				if i == 0 && j == 0
					return false if grid[1][0] == 1 && grid[0][1] == 1 || grid[1][1] == 1		
				elsif i == 0 && (grid[i][j+1] == 1 || grid[i][j-1] == 1)
					return false if grid[i+1][j-1..j+1].include?(1)
				elsif i == 0 && grid[i+1][j] == 1
					return false if grid[i][j-1] == 1 || grid[i][j+1] == 1 || grid[i+1][j+1] == 1 || grid[i-1][j+1] == 1
				end
			end
		end
	end
	true	
end
p checker([
	[0, 0, 0, 0, 0, 1, 1, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	])

        