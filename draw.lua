function love.draw ()

    testHero.camera:set()
    --Draw Map
    love.graphics.draw(grassback, 0, 0)

    --Draw Characters
    testHero.sprite.anim:draw(testHero.x, testHero.y)

    testHero.camera:unset()
    --Draw GUI
end
