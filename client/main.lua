require "draw"
require "update"
require "controls"
require "hero"
require "vector"

class = require "lib.class"
anim8 = require "lib.anim8.anim8"
loveframes = require "lib.LoveFrames"
quickie = require "lib.Quickie"
lube = require "lib.LUBElibs.LUBE.LUBE"
UI = require "lib.thranduil.ui.UI"

heroes = Vector:create()
creeps = Vector:create()

function toWorldSpace(x, y)
    return x + mainHero.camera.x, y + mainHero.camera.y
end
