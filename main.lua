
require('lovestates')
require('validate_state')

states = {
    validate_state = build_validate_state(),
}

IMAGE_PATH = 'input/anim.png'

-- LOVE 2D WRAPPERS
function love.load()
    love.window.setTitle( 'Animation viewer' )
    w, h, flags = love.window.getMode( )
    switch_state( 'validate_state' )
  --  font = love.graphics.newFont( 'font.ttf', 35 )
--    love.graphics.setFont( font )
    -- debugtxt = 'hello'

    -- soundtrack = love.audio.newSource("soundtrack.xm")
    -- soundtrack:setVolume(0.9)
    -- soundtrack:setPitch(0.5)     
    -- soundtrack:play()
    -- soundtrack:setLooping( true )
end


function love.update( dt )
    state.update( dt )
end

function love.draw()
    if debugtxt then
        local posy = SCREEN_HEIGHT-40
        love.graphics.setColor(0, 0, 0, 255)
        love.graphics.print(debugtxt, 0, posy, 0, 0.5, 0.5)
        love.graphics.print('FPS:' .. love.timer.getFPS(),
            SCREEN_WIDTH-150, posy, 0, 0.5, 0.5)
    end
    state.draw()
end

function love.keypressed( key )
    state.keypressed( key )
    -- debugtxt = 'Key string: ' .. key
end

function love.keyreleased( key )
    state.keyreleased( key )
    -- debugtxt = 'Key string: ' .. key
end
