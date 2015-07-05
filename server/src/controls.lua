
function love.mousepressed(x, y, button)

    if not paused then
        loveframes.mousepressed(x, y, button)

        if button == "r" then
            mainHero.desX = x + mainHero.camera.x
            mainHero.desY = y + mainHero.camera.y
        elseif button == "l" then

            for i = 1, 4 do
                if mainHero.spells[i] ~= nil then
                    if mainHero.spells[i].ready then
                        mainHero:cast(toWorldSpace(x, y))
                        break
                    end
                end
            end
        end
    end
end

function love.mousereleased(x, y, button)
    if not paused then
        loveframes.mousereleased(x, y, button)
    end
end

function love.keypressed(key)

    if not paused then
        loveframes.keypressed(key)

        if key == "q" then
            mainHero:spellReady(1)

        elseif key == "w" then
            mainHero:spellReady(2)

        elseif key == "e" then
            mainHero:spellReady(3)

        elseif key == "r" then
            mainHero:spellReady(4)
        end
    end

    if key == "p" then
        paused = not paused
    elseif key == "escape" then
        love.event.quit()
    end
end

function love.keyreleased(key)

    loveframes.keyreleased(key)

end
