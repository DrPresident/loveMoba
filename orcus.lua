require "hero"
require "object"
require "spriteSheet"
local anim8 = require "anim8"

Orcus =
{

}

Orcus.__index = Orcus

function Orcus:create()
    local orcus = {}

    setmetatable(Hero, Object)
    setmetatable(Orcus, Hero)
    setmetatable(orcus, Orcus)

    orcus:loadSprite("res/orcus.png", .1)

    --Fireball Setup
    orcus.spells[1] = Spell:create(point, orcus.fireBall, "res/orcusFireBall.png", 4, 3, .1)
    orcus.spells[1].frontAnim = anim8.newAnimation(
        orcus.spells[1].sprite.grid('1-3', 1), .1)
    orcus.spells[1].leftAnim = anim8.newAnimation(
        orcus.spells[1].sprite.grid('1-3', 2), .1)
    orcus.spells[1].rightAnim = anim8.newAnimation(
        orcus.spells[1].sprite.grid('1-3', 3), .1)
    orcus.spells[1].backAnim = anim8.newAnimation(
        orcus.spells[1].sprite.grid('1-3', 4), .1)

    return orcus
end

function Orcus:fireBall()

end
