require "AnAL"
require "spriteSheet"
require "math"
require "camera"
require "object"

Hero =
{
    desX = 0,
    desY = 0,
    speed = 200,
    attack = 100,
    resistance = 100,
    scale = 1,
    maxHealth = 100,
    health = 100,
    maxMana = 100,
    mana = 100,
    camera = Camera.create()
}

Hero.__index = Hero

function Hero:create()
    local hero = {}
    setmetatable(Hero, Object)
    setmetatable(hero, Hero)
    return hero
end

function Hero:move(dt)
    if math.floor(self:X()) == self.desX
        and math.floor(self:Y()) == self.desY
        then
        self.sprite.anim:stop()
        self.sprite.anim:seek(7)
    else
        if self:X() < self.desX then
            self.x = self.x + (self.speed * dt)
            self.sprite.anim:play()

        elseif self:X() > self.desX then
            self.x = self.x - (self.speed * dt)
            self.sprite.anim:play()
        end

        if self:Y() < self.desY then
            self.y = self.y + (self.speed * dt)
            self.sprite.anim:play()

        elseif self:Y() > self.desY then
            self.y = self.y - (self.speed * dt)
            self.sprite.anim:play()
        end
    end
end

--[[
function Hero:X()
    return math.floor(self.x + self.sprite.width / 2)
end

function Hero:Y()
    return math.floor(self.y + self.sprite.height / 2)
end
]]--
