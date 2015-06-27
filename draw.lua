require "load"
require "tree"

function love.draw ()

    mainHero.camera:set()

    --Draw Map
    love.graphics.draw(map, 0, 0)

    --Draw Characters
    mainHero:anim():draw(mainHero.sprite.image, mainHero.x, mainHero.y)

    --Draw Trees
    love.graphics.draw(tree.sprite.image, 0, 0)

    mainHero.camera:unset()
    --Draw GUI


    --Debug Info

    --love version
    love.graphics.print(string.format("Version %d.%d.%d - %s", love.getVersion()), love.graphics.getWidth() - 200, 0)

    --mouse
    love.graphics.print("MOUSE", love.graphics.getWidth() - 200, 10)
    love.graphics.print(tostring(love.mouse.getX()), love.graphics.getWidth() - 200, 20)
    love.graphics.print(tostring(love.mouse.getY()), love.graphics.getWidth() - 200, 30)

    --mainHero
    love.graphics.print("HERO DESTINATION", love.graphics.getWidth() - 200, 50)
    love.graphics.print(tostring(mainHero.desX), love.graphics.getWidth() - 200, 60)
    love.graphics.print(tostring(mainHero.desY), love.graphics.getWidth() - 200, 70)
    love.graphics.print("HERO LOCATION", love.graphics.getWidth() - 200, 80)
    love.graphics.print(tostring(mainHero.desY), love.graphics.getWidth() - 200, 90)
    love.graphics.print(tostring(mainHero.desY), love.graphics.getWidth() - 200, 100)

end
