local HC = require "lib.HardonCollider"

function initCollisions(cellSize)
    colliders = HC(cellSize, handle, onCollisionExit)
end

local function handle(dt, obOne, obTwo, dx, dy)

end

local function stationaryHit(dt, obOne, obTwo, dx, dy)

end

local function animatedHit(dt, obOne, obTwo, dx, dy)

end

local function onCollisionExit(dt, obOne, obTwo)

end
