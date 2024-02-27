local Game = {}

local key_event = {
	escape = 'menu'
}

Game.update = function(key)
	return key_event[key]
end

Game.draw = function()
	love.graphics.setBackgroundColor(1, 0, 0)
end

return Game