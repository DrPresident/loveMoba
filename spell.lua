require "object"
require "spriteSheet"

aoe = 0
onSelf = 1
target = 2
point = 3

Spell =
{
    type,

    radius,
    duration,
    distance,
    desX,
    desY,
    ready,
    castFunction
}

Spell.__index = Spell

function Spell:create(spellType, spritePath, rows, columns, delay, frames, castFunction)

    spell = {}
    setmetatable(Spell, Object)
    setmetatable(spell, Spell)
    spell.type = spellType
    spell.sprite:loadSprite(spritePath or "res/fail.png",
                            rows or 1, columns or 1,
                            delay or .1, frames or 0)
    spell.castFunction = castFunction or default

    return spell
end

function Spell:cast(arg1, arg2)

    if self.type == aoe then

        self.x = arg1
        self.y = arg2

    elseif self.type == onSelf then

        self.x = arg1
        self.y = arg2

    elseif self.type == target then

        self.desX = arg1
        self.desY = arg2

    elseif self.type == point then
        
        self.desX = arg1
        self.desY = arg2
    end
end

local function default()

end
