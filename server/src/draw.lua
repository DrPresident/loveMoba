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

    --Draw GUI
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", 0, 30, 50, love.graphics.getHeight() - 60)
    love.graphics.rectangle("fill", love.graphics.getWidth() - 50, 30, 50, love.graphics.getHeight() - 60)

    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", 5, 35, 40, love.graphics.getHeight() - 70)
    love.graphics.rectangle("fill", love.graphics.getWidth() - 45, 35, 40, love.graphics.getHeight() - 70)

    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", 5, 35, 40,
            (love.graphics.getHeight() - 70) *
            (main().health / main().maxHealth))

    love.graphics.setColor(0, 0, 255)
    love.graphics.rectangle("fill", love.graphics.getWidth() - 45, 35, 40,
            (love.graphics.getHeight() - 70) *
            (main().mana / main().maxMana))

    loveframes.draw()

    love.graphics.setColor(baseColor)

    --Debug Info

    local spellActiveString = "active"
    local spellReadyString =  "ready"
    local spellCDString =     "CD   "
    local clientString =      "CLIENTS"

    for i = 1, 4 do
        if main().spells[i] ~= nil then
            spellReadyString = spellReadyString .. " - " .. tostring(main().spells[i].ready)
            spellActiveString = spellActiveString .. " - " .. tostring(main().spells[i].active)
            spellCDString = spellCDString .. " - " .. tostring(math.ceil(main().spells[i].cdTimer))
        end
    end

    for i = 1, clients:getLength() do
        --clientString = clientString .. "\n" .. clients[i].id .. "ping - " .. clients[i].data.ping
        love.graphics.print(clients:getAt(i).id .. "ping - " .. clients:getAt(i).data.ping, love.graphics.getWidth() - 500, 10 * i)
    end

    --love version
    love.graphics.print(string.format("Version %d.%d.%d - %s", love.getVersion()), love.graphics.getWidth() - 200, 0)

    --mouse
    love.graphics.print("MOUSE", love.graphics.getWidth() - 200, 10)
    love.graphics.print(tostring(love.mouse.getX()), love.graphics.getWidth() - 200, 20)
    love.graphics.print(tostring(love.mouse.getY()), love.graphics.getWidth() - 200, 30)

    --main()
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

    love.graphics.print("RECV - " .. tostring(recv), love.graphics.getWidth() - 200, 150)
    love.graphics.print("CONN - " .. tostring(conn), love.graphics.getWidth() - 200, 160)

    love.graphics.print(clients:getLength(), love.graphics.getWidth() - 200, 180)

end
