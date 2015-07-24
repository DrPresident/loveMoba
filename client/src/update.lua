function love.update(dt)
        
    --update timers
    for key, value in pairs(timers) do
        timers[key] = timers[key] + dt
    end
    
    --connecting if need be
    if timers["conn"] > 2.0 and not connected then
        reconnect()
        timers["conn"] = 0.0
    end
    
    if timers["push"] > .1 then
        --client:send(main())
        timers["push"] = 0.0
        
        --test data
        client:send("x-" .. tostring(main().desX))
        client:send("y-" .. tostring(main().desY))
    end
    
    --Recieve Packets
    client:update(dt)
    
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
