require "load"
require "tree"

function love.draw ()

    testHero.camera:set()
    --Draw Map
    love.graphics.draw(grassback, 0, 0)

    --Draw Characters
    testHero.sprite.anim:draw(testHero.x, testHero.y)

    --Draw Trees
    for i = 1, Tree.total do
        love.graphics.draw(Tree.sprite.image, 0, 0)
    end

    testHero.camera:unset()
    --Draw GUI


    --Debug Info

    --mouse
    love.graphics.print("MOUSE", love.graphics.getWidth() - 200, 10)
    love.graphics.print(tostring(love.mouse.getX()), love.graphics.getWidth() - 200, 20)
    love.graphics.print(tostring(love.mouse.getY()), love.graphics.getWidth() - 200, 30)

    --testHero
    love.graphics.print("HERO DESTINATION", love.graphics.getWidth() - 200, 50)
    love.graphics.print(tostring(testHero.desX), love.graphics.getWidth() - 200, 60)
    love.graphics.print(tostring(testHero.desY), love.graphics.getWidth() - 200, 70)
    love.graphics.print("HERO LOCATION", love.graphics.getWidth() - 200, 80)
    love.graphics.print(tostring(testHero.desY), love.graphics.getWidth() - 200, 90)
    love.graphics.print(tostring(testHero.desY), love.graphics.getWidth() - 200, 100)

end
