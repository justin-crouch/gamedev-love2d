local Shop = {}

local key_event = {
	escape = 'menu',
}

Shop.update = function(key)
	return key_event[key]
end

Shop.draw = function()
	love.graphics.setBackgroundColor(0, 0, 1)
end

return Shop