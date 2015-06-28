require "load"
require "tree"

function love.draw ()

    mainHero.camera:set()

    --Draw Map
    love.graphics.draw(map, 0, 0)

    --Draw Characters
    mainHero:anim():draw(mainHero.sprite.image, mainHero.x, mainHero.y)


    --Draw Spells
    for i = 1, 4 do
        if mainHero.spells[i] == nil then break
        else
            if mainHero.spells[i].active then
                mainHero.spells[i]:anim():draw(
                    mainHero.spells[i].sprite.image,
                    mainHero.spells[i].x,
                    mainHero.spells[i].y)
            end
        end
    end

    --Draw Trees
    love.graphics.draw(tree.sprite.image, 0, 0)

    mainHero.camera:unset()



    --Draw GUI



    --Debug Info

    local spellActiveString = "active"
    local spellReadyString = "ready"

    for i = 1, 1 do
        spellReadyString = spellReadyString .. " - " .. tostring(mainHero.spells[i].ready)
        spellActiveString = spellActiveString .. " - " .. tostring(mainHero.spells[i].active)
    end

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

    --spells
    love.graphics.print("spells - Q - W - E - R", love.graphics.getWidth() - 200, 110)
    love.graphics.print(spellReadyString, love.graphics.getWidth() - 200, 120)
    love.graphics.print(spellActiveString, love.graphics.getWidth() - 200, 130)

end
