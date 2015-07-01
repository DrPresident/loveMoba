require "controls"
require "load"

function love.update(dt)

    --Move Objects
    mainHero:update(dt)

    --Update Cameras
    mainHero.camera:update()

    --Update GUI/HUD
    loveframes.update(dt)

end
