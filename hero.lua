require "AnAL"
require "spriteSheet"
require "math"
require "camera"

Hero =
{
    --__index = Hero,
    x = 0,
    y = 0,
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
    sprite = SpriteSheet.create(),
    camera = Camera.create()
}

Hero.__index = Hero

function Hero:create()
    local hero = {}
    setmetatable(hero, Hero)
    return hero
end

function Hero:move(dt)
    if self:calcX() ~= self.desX
        or self:calcY() ~= self.desY
        then
        self.sprite.anim:stop()
        self.sprite.anim:seek(7)
    else
        if self:calcX() < self.desX then
            self.x = self.x + (self.speed * dt)
            self.sprite.anim:play()

        elseif self:calcX() > self.desX then
            self.x = self.x - (self.speed * dt)
            self.sprite.anim:play()
        end

        if self:calcY() < self.desY then
            self.y = self.y + (self.speed * dt)
            self.sprite.anim:play()

        elseif self:calcY() > self.desY then
            self.y = self.y - (self.speed * dt)
            self.sprite.anim:play()
        end
    end
end

function Hero:calcX()
    return self.x + math.floor(self.sprite.width / 2)
end

function Hero:calcY()
    return self.y + math.floor(self.sprite.height / 2)
end
