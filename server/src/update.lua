function love.update(dt)

    if not paused then

        --Send/Recieve Packets
        server:update(dt)

        --Move Objects
        main():update(dt)

        --Check Collisions
        colliders:update(dt)

        --Update Cameras
        --main().camera:update(dt)

        --Update GUI/HUD
        loveframes.update(dt)
    end

end
