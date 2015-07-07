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

class = require "lib.class"
anim8 = require "lib.anim8.anim8"
loveframes = require "lib.LoveFrames"
quickie = require "lib.Quickie"
UI = require "lib.thranduil.ui.UI"


function toWorldSpace(x, y)
    return x + main().camera.x, y + main().camera.y
end

function main()
    return rootData["heroes"]:getAt(mainHero)
end
