require "hero"
require "object"
require "spriteSheet"

Orcus =
{

}

Orcus.__index = Orcus

function Orcus:create()
    local orcus = {}

    setmetatable(Hero, Object)
    setmetatable(Orcus, Hero)
    setmetatable(orcus, Orcus)

    orcus:loadSprite("res/orcus/sprite.png", .1)

    --Fireball Setup
    orcus.spells[1] = Spell:create(point, orcus.fireBall, "res/orcus/fireBall.png", 4, 3, .1)
    orcus.spells[1].frontAnim = anim8.newAnimation(
        orcus.spells[1].sprite.grid('1-3', 1), .1)
    orcus.spells[1].leftAnim = anim8.newAnimation(
        orcus.spells[1].sprite.grid('1-3', 2), .1)
    orcus.spells[1].rightAnim = anim8.newAnimation(
        orcus.spells[1].sprite.grid('1-3', 3), .1)
    orcus.spells[1].backAnim = anim8.newAnimation(
        orcus.spells[1].sprite.grid('1-3', 4), .1)

    orcus.spells[1].duration = 1
    orcus.spells[1].activeTimer = orcus.spells[1].duration
    orcus.spells[1].speed = 300
    orcus.spells[1].cooldown = 5
    orcus.spells[1].cost = 35



    return orcus
end

function Orcus:fireBall()

end
