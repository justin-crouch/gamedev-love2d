local Frame = {}

Frame.new = function(delay, yIndex)
	return {
		yIndex=yIndex or 0,
		delay=delay,
	}
end

return Frame