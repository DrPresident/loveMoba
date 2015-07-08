function love.mousepressed(x, y, button)

    if not paused then
        loveframes.mousepressed(x, y, button)

        if button == "r" then
            main().desX = x + main().camera.x
            main().desY = y + main().camera.y
        elseif button == "l" then

            for i = 1, 4 do
                if main().spells[i] ~= nil then
                    if main().spells[i].ready then
                        main():cast(toWorldSpace(x, y))
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
            main():spellReady(1)

        elseif key == "w" then
            main():spellReady(2)

        elseif key == "e" then
            main():spellReady(3)

        elseif key == "r" then
            main():spellReady(4)
        elseif key == " " then
            client:send(1)
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
