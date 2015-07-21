function love.update(dt)
        
    if not connected then
        --reconnect()
    end
    
    --Send/Recieve Packets
    client:update(dt)
    --client:send(bin:pack(main()))
    
    --Update GUI/HUD
    loveframes.update(dt)

    if not paused then
        --Move Objects
        main():update(dt)

        --Check Collisions
        Collider:update(dt)

        --Update Cameras
        main().camera:update(dt)
    end


end
