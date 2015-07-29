tmpDesX = 0
tmpDesY = 0

function initCollisions(cellSize)
    Collider = HC(cellSize, onCollision, onCollisionExit)
end

function onCollision(dt, obOne, obTwo, dx, dy)
    
    colliding = true
    
    tmpDesX = main().desX
    tmpDesY = main().desY
    main().desX = main().x + dx
    main().desY = main().y + dx
    
    if obOne == main() then
        
        tmpDesX = obOne.object.desX
        tmpDesY = obOne.object.desY
        
        obOne.object.desX = obOne.object.x + dx
        obOne.object.desY = obOne.object.y + dy
        
    elseif obTwo == main() then
    
        tmpDesX = obOne.object.desX
        tmpDesY = obOne.object.desY
    
        obTwo.object.x = obTwo.object.x - dx
        obTwo.object.y = obTwo.object.y - dy
        
    end
end

function onCollisionExit(dt, obOne, obTwo)

    colliding = false
    
    main().desX = tmpDesX
    main().desY = tmpDesY
    
    if obOne == main() then
    
        obOne.object.desX = tmpDesX
        obOne.object.desY = tmpDesY
        
    elseif obTwo == main() then
        
        obTwo.object.desX = tmpDesX
        obTwo.object.desY = tmpDesY
        
    end
end
