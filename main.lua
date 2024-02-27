local StateController = require('state_controller')

local states = StateController.new('example-states/')
StateController.add(states, 'state1')
StateController.add(states, 'state2')

local ui_states = StateController.new('ui/')
StateController.add(ui_states, 'game')
StateController.add(ui_states, 'menu')
StateController.add(ui_states, 'shop')
StateController.set(ui_states, 'menu')

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')
end

function love.keypressed(key)
	StateController.switch(ui_states, key)
end

function love.update(dt)
	StateController.switch(states, dt)
end

function love.draw()
	StateController.get(states).draw()

	StateController.get(ui_states).draw()
end
