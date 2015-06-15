require "controls"
require "load"

function love.update(dt)

    --Move Objects
    testHero:move(dt)

    --Update Animations
    testHero.sprite.anim:update(dt)

end
