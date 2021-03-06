aoe = 0
onSelf = 1
target = 2
point = 3
line = 4

Spell =
{
    type,
    radius,
    duration,
    activeTimer,
    distance,
    cdTimer,
    cooldown,
    ready,
    active,
    castFunction,
    frontAnim,
    leftAnim,
    rightAnim,
    backAnim,
    anim,
    cost
}

Spell.__index = Spell

function Spell:create(spellType, castFunc, spritePath, rows, columns, delay)

    local spell = {}

    setmetatable(Spell, Object)
    setmetatable(spell, Spell)

    spell.type = spellType

    spell.sprite = SpriteSheet:loadSprite(spritePath, rows, columns, delay)

    spell.castFunction = castFunc or default
    spell.cdTimer = 0
    spell.activeTimer = 0

    spell.stationary = false

    spell.type = "spell"

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

    elseif self.type == line then

        self.desX = arg1
        self.desY = arg2

    end

    self.active = true
    self.ready = false
    self.activeTimer = 0
    self.cdTimer = self.cooldown
    self.castFunction()
end

function Spell:update(dt)

    if self.cdTimer > 0 then
        self.cdTimer = self.cdTimer - dt
    end

    if self.active then
        if self.type == aoe then

        elseif self.type == onSelf then

        elseif self.type == target then

        elseif self.type == point then

            if self.activeTimer < self.duration then

                self.activeTimer = self.activeTimer + dt
                self:move(dt)

            else
                self.active = false
            end

        end
    end
end

function Spell:anim()
    return self.frontAnim
end

local function default()

end
