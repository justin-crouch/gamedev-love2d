local Controller = {}

Controller.animators = {}

Controller.register = function(animator)
	if(animator == nil) then return end

	table.insert(Controller.animators, animator)
end

Controller.deregister = function(animator)
	if(animator == nil) then return end

	local index = 0
	for i, anim in ipairs(Controller.animators) do
		if(anim == animator) then
			index = i
			break
		end
	end

	if(index == 0) then return end
	table.remove(Controller.animators, index)
end

Controller.tickAll = function(dt)
	for _, animator in ipairs(Controller.animators) do
		animator:tick(dt)
	end
end

Controller.drawAll = function()
	for _, animator in ipairs(Controller.animators) do
		animator:draw()
	end
end

return Controller