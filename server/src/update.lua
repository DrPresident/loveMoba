function love.update(dt)

    --update timers
    for key, value in pairs(timers) do
        timers[key] = timers[key] + dt
    end
    
    --Recieve Packets
    server:update(dt)

    --Move Objects
    for key, value in pairs(rootData["heroes"]) do
        rootData["heroes"][key]:update(dt)
    end
    
    for key, value in pairs(rootData["creeps"]) do
        rootData["creeps"][key]:update(dt)
    end

    --Check Collisions
    colliders:update(dt)
    
    --test refresh
end
