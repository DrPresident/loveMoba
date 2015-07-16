require "string"

function love.mousepressed(x, y, button)

    loveframes.mousepressed(x, y, button)

    if not paused then

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

    loveframes.mousereleased(x, y, button)

    if not paused then

    end

end

function love.keypressed(key)

    loveframes.keypressed(key)

    if key == "lshift" or key == "rshift" then
        shift = true
    end

    if teamTyping then

        if key == "up"
            or key == "down"
            or key == "right"
            or key == "left"
            or key == "home"
            or key == "end"
            or key == "pageup"
            or key == "pageup"
            or key == "insert"
            or key == "tab"
            or key == "clear"
            or key == "delete"
            or key == "lshift"
            or key == "rshift"
            or key == "lctrl"
            or key == "rctrl"
            or key == "lalt"
            or key == "ralt"
            or key == "lgui"
            or key == "rgui"
            or key == "mode"
            or key == "capslock"
            or key == "numlock"
            or key == "scrolllock"
        then

        elseif key == "return" then
            client:send("tc1-" .. teamChatInput:GetText())
            teamChatInput:Clear()
            teamTyping = false
            teamChatInput:SetFocus(false)

        elseif key == "backspace" then
            teamChatInput:SetText(
                string.sub(teamChatInput:GetText(),
                        1, string.len(teamChatInput:GetText())))


        else
            teamChatInput:SetText(teamChatInput:GetText() .. key)
        end

    elseif allTyping then

        if key == "up"
            or key == "down"
            or key == "right"
            or key == "left"
            or key == "home"
            or key == "end"
            or key == "pageup"
            or key == "pageup"
            or key == "insert"
            or key == "tab"
            or key == "clear"
            or key == "delete"
            or key == "lshift"
            or key == "rshift"
            or key == "lctrl"
            or key == "rctrl"
            or key == "lalt"
            or key == "ralt"
            or key == "lgui"
            or key == "rgui"
            or key == "mode"
            or key == "capslock"
            or key == "numlock"
            or key == "scrolllock"
        then

        elseif key == "return" then
            if string.len(allChatInput:GetText()) >= 1 then
                client:send("ac-" .. allChatInput:GetText())
            end
            allChatInput:Clear()
            allTyping = false
            allChatInput:SetFocus(false)

        elseif key == "backspace" then
            allChatInput:SetText(
                string.sub(allChatInput:GetText(),
                        1, string.len(allChatInput:GetText())))

        else
            allChatInput:SetText(allChatInput:GetText() .. key)
        end

    elseif not paused then

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

        elseif shift and key == "return" then
            allChatInput:SetFocus(true)

        elseif key == "return" then
            teamChatInput:SetFocus(true)
        end
    end

    if not teamTyping and not allTyping then
        if key == "p" then
            paused = not paused
        elseif key == "escape" then
            love.event.quit()
        end
    end
end

function love.keyreleased(key)

    loveframes.keyreleased(key)

    if key == "lshift" or key == "rshift" then
        shift = false
    end

end
