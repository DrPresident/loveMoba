require "controls"
require "load"

function love.update(dt)

    --Move Objects
    mainHero:update(dt)

    --Update Cameras
    mainHero.camera:update()



    --Update GUI/HUD
    loveframes.update(dt)


    if mainHero.health > 0 then
        mainHero.health = mainHero.health - 1
    else
        mainHero.health = mainHero.maxHealth
    end

end
