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

    orcus.frontSprite = SpriteSheet:loadSprite("res/orcusFront.png", 1, 3, .2, 3)
    orcus.backSprite = SpriteSheet:loadSprite("res/orcusBack.png", 1, 3, .2, 3)
    orcus.leftSprite = SpriteSheet:loadSprite("res/orcusLeft.png", 1, 3, .2, 3)
    orcus.rightSprite = SpriteSheet:loadSprite("res/orcusRight.png", 1, 3, .2, 3)

    orcus.sprite = frontSprite

    orcus.spells[1] = Spell.create(3)
    orcus.spells[2] = Spell.create(2)

    return orcus
end

function Orcus:rageBuild()

end

function Orcus:fireBall()

end

function Orcus:possess()

end
