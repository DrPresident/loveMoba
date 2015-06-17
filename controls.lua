rightclick =
{
    clicked = false,
    x = 0,
    y = 0
}

function love.mousepressed(x, y, button)
    if button == "r" then
        mainHero.desX = x + mainHero.camera.x
        mainHero.desY = y + mainHero.camera.y
    end
end

function love.mousereleased(x, y, button)

end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()

    elseif key == "q" then
    mainHero:spellReady(1)

    elseif key == "w" then
        mainHero:spellReady(2)

    elseif key == "e" then
        mainHero:spellReady(3)
    end
end

function love.keyreleased(key)

end
