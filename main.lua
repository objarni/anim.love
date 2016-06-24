
require('lovestates')
require('validate_state')
require('anim_state')

states = {
    validate_state = build_validate_state(),
    anim_state = build_anim_state()
}

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
TEXT_HEIGHT = 15
IMAGE_PATH = 'input/anim.png'

function love.load()
    love.window.setTitle( 'Animation viewer' )
    w, h, flags = love.window.getMode( )
    switch_state( 'validate_state' )
end

function love.update( dt )
    state.update( dt )
end

function love.draw()
    if debugtxt then
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.print(debugtxt, 0, SCREEN_HEIGHT-TEXT_HEIGHT, 0, 1, 1)
        love.graphics.print('FPS:' .. love.timer.getFPS(),
            0, 0, 0, 1, 1)
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

function love.mousepressed(x, y, button, istouch)
    state.mousepressed(x, y, button, istouch)
end

function love.mousereleased(x, y, button, istouch)
    state.mousereleased(x, y, button, istouch)
end