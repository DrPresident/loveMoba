require "Object"

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
}

Spell.__index = Spell

function Spell:create(type)
    spell = {}
    setmetatable(Spell, Object)
    setmetatable(spell, Spell)
    spell.
    return spell
end

function Spell:cast(hero, func)

    if self.type == aoe then

    elseif self.type == onSelf then

    elseif self.type == target then

    end
end
