function love.draw ()

    main().camera:set()

    --Draw Map
    love.graphics.draw(map, 0, 0)

    --Draw Characters
    main():anim():draw(main().sprite.image, main().x, main().y)

    --Draw Spells
    for i = 1, 4 do
        if main().spells[i] == nil then break
        else
            if main().spells[i].active then
                main().spells[i]:anim():draw(
                    main().spells[i].sprite.image,
                    main().spells[i].x,
                    main().spells[i].y)
            end
        end
    end

    --Draw Trees
    love.graphics.draw(tree.sprite.image, 0, 0)

    main().camera:unset()
    
    if paused then
        love.graphics.print("PAUSED", love.graphics.getWidth() / 2 - 50, love.graphics.getHeight() / 2 - 50)
    end

    --Draw GUI
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", 0, 0, 50, love.graphics.getHeight() - 100)
    love.graphics.rectangle("fill", love.graphics.getWidth() - 50, 0, 50, love.graphics.getHeight() - 100)

    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", 5, 5, 40, love.graphics.getHeight() - 110)
    love.graphics.rectangle("fill", love.graphics.getWidth() - 45, 5, 40, love.graphics.getHeight() - 110)

    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", 5, 5, 40,
            (love.graphics.getHeight() - 110) *
            (main().health / main().maxHealth))

    love.graphics.setColor(0, 0, 255)
    love.graphics.rectangle("fill", love.graphics.getWidth() - 45, 5, 40,
            (love.graphics.getHeight() - 110) *
            (main().mana / main().maxMana))

    love.graphics.setColor(baseColor)

--Debug Info

    main().col:draw("fill")
    testCol:draw("fill")
    
    local spellActiveString = "active"
    local spellReadyString =  "ready"
    local spellCDString =     "CD   "

    for i = 1, 4 do
        if main().spells[i] ~= nil then
            spellReadyString = spellReadyString .. " - " .. tostring(main().spells[i].ready)
            spellActiveString = spellActiveString .. " - " .. tostring(main().spells[i].active)
            spellCDString = spellCDString .. " - " .. tostring(math.ceil(main().spells[i].cdTimer))
        end
    end

    --love version
    love.graphics.print(string.format("Version %d.%d.%d - %s", love.getVersion()), love.graphics.getWidth() - 200, 0)

    --mouse
    love.graphics.print("MOUSE", love.graphics.getWidth() - 200, 10)
    love.graphics.print(tostring(love.mouse.getX()), love.graphics.getWidth() - 200, 20)
    love.graphics.print(tostring(love.mouse.getY()), love.graphics.getWidth() - 200, 30)

    --hero
    love.graphics.print("HERO DESTINATION", love.graphics.getWidth() - 200, 50)
    love.graphics.print(tostring(main().desX), love.graphics.getWidth() - 200, 60)
    love.graphics.print(tostring(main().desY), love.graphics.getWidth() - 200, 70)
    love.graphics.print("HERO LOCATION", love.graphics.getWidth() - 200, 80)
    love.graphics.print(tostring(main().desY), love.graphics.getWidth() - 200, 90)
    love.graphics.print(tostring(main().desY), love.graphics.getWidth() - 200, 100)

    --spells
    love.graphics.print("spells - Q - W - E - R", love.graphics.getWidth() - 200, 110)
    love.graphics.print(spellReadyString, love.graphics.getWidth() - 200, 120)
    love.graphics.print(spellActiveString, love.graphics.getWidth() - 200, 130)
    love.graphics.print(spellCDString, love.graphics.getWidth() - 200, 140)
    
    --networking
    if connected then
        love.graphics.print("CONNECTED", love.graphics.getWidth() - 200, 160)
    else
        love.graphics.print("NOT CONNECTED", love.graphics.getWidth() - 200, 160)
    end
    
    love.graphics.print("FPS - " .. love.timer.getFPS(), love.graphics.getWidth() - 200, 170)
    love.graphics.print("col - " .. tostring(colliding), love.graphics.getWidth() - 200, 180)

    loveframes.draw()
end
