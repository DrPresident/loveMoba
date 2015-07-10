require "math"

require "src.draw"
require "src.update"
require "src.controls"
require "src.load"
require "src.orcus"
require "src.tree"
require "src.vector"
require "src.camera"
require "src.hero"
require "src.nija"
require "src.spriteSheet"
require "src.object"
require "src.passive"
require "src.spell"
require "src.cNetworking"
require "src.collisions"
require "src.gui"

class = require "lib.class"
anim8 = require "lib.anim8.anim8"
loveframes = require "lib.LoveFrames"
HC = require "lib.HardonCollider"


function toWorldSpace(x, y)
    return x + main().camera.x, y + main().camera.y
end

function main()
    return rootData["heroes"][mainHero]
end

function setMain(hero)
    rootData["heroes"][mainHero] = hero
end

function randomHero()
    math.randomseed(os.time())
    local rand = math.random(2)

    if rand == 1 then
        return Orcus.create()
    elseif rand == 2 then
        return Nija.create()
    end

end
