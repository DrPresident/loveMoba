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

cNetworking = require "src.cNetworking"
class = require "lib.class"
anim8 = require "lib.anim8.anim8"
loveframes = require "lib.LoveFrames"
quickie = require "lib.Quickie"
lube = require "lib.LUBElibs.LUBE.LUBE"
UI = require "lib.thranduil.ui.UI"
HC = require "lib.HardonCollider"

heroes = Vector:create()
creeps = Vector:create()

function toWorldSpace(x, y)
    return x + mainHero.camera.x, y + mainHero.camera.y
end
