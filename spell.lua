require "object"
require "spriteSheet"

Spell =
{
    type,
    aoe = 0,
    onSelf = 1,
    target = 2,
    point = 3,

    radius,
    duration,
    distance,
    ready
}

Spell.__index = Spell

function Spell:create(spellType, path, rows, columns, delay, frames)
    spell = {}
    setmetatable(Spell, Object)
    setmetatable(spell, Spell)
    spell.type = spellType
    spell.sprite:loadSprite(path or "res/fail.png",
                            rows or 1, columns or 1,
                            delay or .1, frames or 0)
    return spell
end

function Spell:cast(hero, func)

    if self.type == aoe then

    elseif self.type == onSelf then

    elseif self.type == target then

    end
end
