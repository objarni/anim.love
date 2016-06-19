require('lovestates')

function build_start_state()
	state = lovestate()

	state.init = function()
		love.graphics.setBackgroundColor( 50, 50, 50 )
	end

	state.draw = function()
		love.graphics.setColor(255, 255, 255, 255)
		local y = 0
		function writeln(s)
			love.graphics.print(s, 0, y)
			y = y + 15
		end
		writeln("I will animate if you obey:")
		writeln(IMAGE_PATH .. ": source image")
		writeln("Height: 2^N")
		writeln("Width: F * 2^N")
		writeln("F: number of keyframes")
	end

	state.update = function( dt )
		writeln_y = 0
		exists = love.filesystem.exists( IMAGE_PATH )
		switch_state( 'load_state' )
	end
	
	return state
end

