local Animator = {}
Animator.interface = {}
Animator.schema = {}
Animator.metatable = {__index = Animator.schema}

Animator.prototype = function(self, spritesheet, width, height)
	self.spritesheet = spritesheet
	self.frames = {}
	self.delays = {}
	self.index = 1
	self.timer = 0

	self.width = width
	self.height = height
	self.transform = love.math.newTransform()

	self.playing = false
	self.loop = true

	return self
end

Animator.interface.new = function(spritesheet, width, height)
	return setmetatable( Animator.prototype({}, spritesheet, width, height), Animator.metatable )
end

Animator.schema.addFrame = function(self, frame)
	local slice = love.graphics.newQuad(
		self.width * #self.frames,
		self.height * frame.yIndex,
		self.width,
		self.height,
		self.spritesheet)

	table.insert(self.frames, slice)
	table.insert(self.delays, frame.delay)
end

Animator.schema.tick = function(self, dt)
	if(not self.playing) then return end

	if(self.timer >= self.delays[self.index] / 1000) then
		self.timer = 0
		self.index = (self.index % #self.frames) + 1

		if(self.index == 1 and not self.loop) then
			self:stop()
			self:reset()
			return
		end
	end
	self.timer = self.timer + dt
end

Animator.schema.play = function(self)
	self.playing = true
end

Animator.schema.stop = function(self)
	self.playing = false
end

Animator.schema.reset = function(self)
	self.index = 1
	self.timer = 0
end

Animator.schema.shouldLoop = function(self, loop)
	self.loop = loop
end

Animator.schema.getFrame = function(self)
	return self.frames[self.index]
end

Animator.schema.setTransform = function(self, transform)
	self.transform = transform
end

Animator.schema.draw = function(self)
	love.graphics.draw(self.spritesheet, self:getFrame(), self.transform)
end

Animator.metatable.__tostring = function(self)
	return 'Frames: ' .. tostring(#self.frames)
end

return Animator.interface