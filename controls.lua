rightclick = 
{
    clicked = false,
    x = 0,
    y = 0
}

function love.mousepressed(x, y, button)
    if button == "r" then
        rightclick.clicked = true
        rightclick.x = x
        rightclick.y = y
    end
end

function love.mousereleased(x, y, button)

end

function love.keypressed(key)

end

function love.keyreleased(key)

end
