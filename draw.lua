require "load"
require "tree"

function love.draw ()

    mainHero.camera:set()

    --Draw Map
    love.graphics.draw(map, 0, 0)

    --Draw Characters
    mainHero.sprite.anim:draw(mainHero.x, mainHero.y)

    --Draw Trees
    for i = 1, Tree.total do
        Tree.sprite.anim:draw(Tree.treesX[i], Tree.treesY[i])
    end

    mainHero.camera:unset()
    --Draw GUI


    --Debug Info

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
