local Controller = {}

-- Return table to hold state modules
Controller.new = function(folder)
	return {
		current = '',
		folder = folder or ''
	}
end

-- Add a module to a states table
Controller.add = function(state_list, name)
	local path = state_list.folder .. name
	state_list[name] = require( path )

	if(state_list.current == '') then state_list.current = name end
end

-- Update current state with some event; change state if needed
Controller.switch = function(state_list, event)
	local current = state_list.current
	state_list.current = state_list[current].update(event) or current
end

-- Get module of current state
Controller.get = function(state_list)
	return state_list[ state_list.current ]
end

-- Set current state of a states table
-- ONLY RECOMMENDED FOR SETTING INITIAL STATE
Controller.set = function(state_list, state)
	state_list.current = state
end

return Controller