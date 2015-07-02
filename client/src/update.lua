function love.update(dt)

    --Update Network
    --client:update(dt)

    --Move Objects
    mainHero:update(dt)

    --Update Cameras
    mainHero.camera:update()

    --Update GUI/HUD
    loveframes.update(dt)

end
