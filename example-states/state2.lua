local State2 = {}

local timer = 0

State2.update = function(dt)
	print('bye')

	timer = timer + dt
end

State2.draw = function()
	love.graphics.print('bye', 100, 100, 0, 2, 2)
end

return State2