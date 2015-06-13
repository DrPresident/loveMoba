require "controls"
require "load"

function love.update(dx)
    if rightclick.clicked then
        testHero:move(rightclick.x, rightclick.y, dx)
    end
end