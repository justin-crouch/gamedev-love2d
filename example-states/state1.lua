local State1 = {}

local timer = 0

State1.update = function(dt)
	timer = timer + dt

	if(timer > 3) then return 'state2' end
end

State1.draw = function()
	love.graphics.print('hi', 100, 100, 0, 2, 2)
end

return State1