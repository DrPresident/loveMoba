function love.draw ()

    --Draw Map
    love.graphics.draw(grassback, 0, 0)

    --Draw Characters
    love.graphics.draw(testHero.image, testHero.x, testHero.y, 0, testHero.scale)
    
    --Draw GUI
end
