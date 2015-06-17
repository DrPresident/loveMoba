require "AnAL"
require "spriteSheet"
require "math"
require "camera"
require "object"
require "passive"
require "spell"

Hero =
{
    desX = 10,
    desY = 10,
    speed = 200,
    attack = 100,
    resistance = 100,
    scale = 1,
    maxHealth = 100,
    health = 100,
    maxMana = 100,
    mana = 100,
    camera = Camera.create(),
    readySpell,
    passive,
    spell1,
    spell2,
    spell3
}

Hero.__index = Hero

function Hero:create()
    local hero = {}
    setmetatable(Hero, Object)
    setmetatable(hero, Hero)
    return hero
end

function Hero:move(dt)
    if ((self:X() > self.desX - 2) and (self:X() < self.desX + 2))
        and ((self:Y() > self.desY - 2) and (self:Y() < self.desY + 2))
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

function Hero:update(dt)

    Hero:move(dt)

    if self.readySpell then

    else

    end

end

function Hero:cast(spellNum)

end

function Hero:spellReady(spellNum)

end
