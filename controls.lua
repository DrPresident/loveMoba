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
    end
end

function love.keyreleased(key)

end
