require('lovestates')

function build_validate_state()
	state = lovestate()
	local msg = ""
	local acc = 0

	state.init = function()
		love.graphics.setBackgroundColor( 50, 50, 50 )
	end

	state.draw = function()
		love.graphics.setColor(255, 255, 255, 255)
	    love.graphics.print(msg, 10, 10)
	end

	state.update = function( dt )
		acc = acc + dt
		if acc < 1 then
			return
		else
			acc = 0
		end
		if not love.filesystem.exists( IMAGE_PATH ) then
			msg = [[
I will animate if you obey:
Source image path: "]] .. IMAGE_PATH .. [["
Height is multiple of 2
Width is mulitiple of height
]]
			return
		end

		function loadImage()
			image = love.graphics.newImage(IMAGE_PATH)
		end

		if not pcall(loadImage) then
			msg = "Could not load image."
			return
		end

		w, h = image:getWidth(), image:getHeight()

		function powerOfTwo(n)
			x = 1
			while x < 4096 do
				if n == x then
					return true
				end
				x = x * 2
			end
			return false
		end

		function widthMultipleOfHeight(w, h)
			n = h
			while n < w * 2 do
				if n == w then
					return true
				end
				n = n + h
			end
			return false
		end

		if not powerOfTwo(h) then
			msg = "Height of image is not power of two!"
			return
		end

		if not widthMultipleOfHeight(w, h) then
			msg = "Width is not a multiple of height!"
			return
		end

		msg = "all validation tests passed"
		-- switch_state('animate_state')
	end
	
	return state
end

