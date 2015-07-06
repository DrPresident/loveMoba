function love.update(dt)
    if not paused then
        --Send/Recieve Packets
        client:update(dt)
        --client:send(chars)

        --Move Objects
        main():update(dt)

        --Check Collisions
        colliders:update(dt)

        --Update Cameras
        main().camera:update(dt)

        --Update GUI/HUD
        loveframes.update(dt)
    end

end
