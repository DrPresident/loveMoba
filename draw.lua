function love.draw ()

    --Draw Map
    love.graphics.draw(grassback, 0, 0)

    --Draw Characters
    --love.graphics.draw(testHero.sprite.image, testHero.x, testHero.y, 0, testHero.scale)
    testHero.sprite.anim:draw(testHero.x, testHero.y)

    --Draw GUI
end
