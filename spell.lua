require "object"
require "spriteSheet"
require "math"

aoe = 0
onSelf = 1
target = 2
point = 3

Spell =
{
    type,
    radius,
    duration,
    speed,
    activeTimer,
    distance,
    cdTimer,
    cooldown,
    desX,
    desY,
    ready,
    active,
    castFunction,
    frontAnim,
    leftAnim,
    rightAnim,
    backAnim,
    anim
}

Spell.__index = Spell

function Spell:create(spellType, castFunc, spritePath, rows, columns, delay)

    local spell = {}
    setmetatable(Spell, Object)
    setmetatable(spell, Spell)
    spell.type = spellType

    spell.sprite = SpriteSheet:loadSprite(spritePath, rows, columns, delay)

    spell.castFunction = castFunc or default

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

    castFunction()
end

function Spell:update(dt)

    if self.active then
        if self.type == aoe then

        elseif self.type == onSelf then

        elseif self.type == target then

        elseif self.type == point then
            if self.activeTimer < self.duration then
                self.activeTime = self.activeTime + dt
                self.x = self.x + (speed * dt)
                self.y = self.y + (speed * dt)

            else
                self.active = false
                self.activeTimer = 0
            end
        end
    end
end

function Spell:anim()
    return self.frontAnim
end

local function default()

end
