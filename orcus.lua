require "hero"
require "object"
require "spriteSheet"

Orcus =
{
    demonSprite = SpriteSheet.create()
}

Orcus.__index = Orcus

function Orcus:create()
    local orcus = {}

    setmetatable(Hero, Object)
    setmetatable(Orcus, Hero)
    setmetatable(orcus, Orcus)

    orcus.sprite:loadSprite("res/Orcus.png", 4, 3, .2, 3)

    orcus.spells[1] = Spell.create(2)
    orcus.spells[2] = Spell.create()

    return orcus
end

function Orcus:rageBuild()

end

function Orcus:fireBall()

end

function Orcus:possess()

end
