local Menu = {}

local key_event = {
	escape = 'game',
	s = 'shop',
}

Menu.update = function(key)
	return key_event[key]
end

Menu.draw = function()
	love.graphics.setBackgroundColor(0, 1, 0)
end

return Menu