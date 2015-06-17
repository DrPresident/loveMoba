require "controls"
require "load"

function love.update(dt)

    --Move Objects
    mainHero:move(dt)

    --Update Cameras
    mainHero.camera:update()

    --Update Animations
    mainHero.sprite.anim:update(dt)

end
