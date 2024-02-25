local Controller = {}

Controller.pressed_callbacks  = {}
Controller.released_callbacks = {}

local register = function(t, key, callback, ...)
	t[key] = t[key] or {}

	t[key][callback] = {...}
	return {
		is_live = true,
		disconnect = function(self)
			self.is_live = false
			t[key][callback] = nil
			self.disconnect = nil
		end,
	}
end

local handle = function(t, key)
	if(t[key] == nil) then return end
	
	for callback, params in pairs( t[key] ) do
		callback( key, unpack(params) )
	end
end

Controller.registerPressed = function(key, callback, ...)
	return register(Controller.pressed_callbacks, key, callback, ...)
end

Controller.handlePressed = function(key)
	handle(Controller.pressed_callbacks, key)
end

Controller.registerReleased = function(key, callback, ...)
	return register(Controller.released_callbacks, key, callback, ...)
end

Controller.handleReleased = function(key)
	handle(Controller.released_callbacks, key)
end

return Controller