rightclick =
{
    clicked = false,
    x = 0,
    y = 0
}

function love.mousepressed(x, y, button)
    if button == "r" then
        testHero.desX = x
        testHero.desY = y
    end
end

function love.mousereleased(x, y, button)

end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()

    elseif key == "q" then
    testhero:spellReady(1)

    elseif key == "w" then
        testHero:spellReady(2)

    elseif key == "e" then
        testHero:spellReady(3)
    end
end

function love.keyreleased(key)

end
