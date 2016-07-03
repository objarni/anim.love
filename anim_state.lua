require('lovestates')

function build_anim_state()
	state = lovestate()
	local time = 0
	local animFPS = 10
	local animPeriod = 1.0 / animFPS
	local frame = 0
	local posx, posy = 200, 200

	function intdiv(a, b)
		return math.floor(a/b)
	end

	function intmod(a, b)
		return a % b
	end

	state.init = function()
		modtime, errormsg = love.filesystem.getLastModified( IMAGE_PATH )
	end

	state.draw = function()
	  -- love.graphics.rectangle("fill", 20, 50, 60, 120 )
	  love.graphics.draw(image, quads[frame], posx-h/2, posy-h/2)
	end

	state.update = function( dt )
		local mtime, errmsg = love.filesystem.getLastModified( IMAGE_PATH)
		if mtime ~= modtime then
			switch_state('validate_state')
		end
		time = time + dt
		frame = intmod(intdiv(time, animPeriod), keyframeCount)
		debugtxt = tostring(frame)
	end

	state.mousereleased = function(x, y, button, istouch)
		posx, posy = x, y
	end
	
	return state
end

