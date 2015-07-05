function love.update(dt)
    if not paused then
        --Send/Recieve Packets
        server:update(dt)

        --Move Objects
        --mainHero:update(dt)

        --Check Collisions
        --colliders:update(dt)

        --Update Cameras
        --mainHero.camera:update()

        --Update GUI/HUD
        --loveframes.update(dt)
    end

end
