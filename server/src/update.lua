function love.update(dt)

    --Send/Recieve Packets
    server:update(dt)

    --Move Objects
    main():update(dt)

    --Check Collisions
    colliders:update(dt)
end
