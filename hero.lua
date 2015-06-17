require "AnAL"
require "spriteSheet"
require "math"
require "camera"
require "object"
require "passive"
require "spell"

Hero =
{
    desX = 100,
    desY = 100,
    speed = 800,
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

    spells =
    {
        first,
        second,
        third,
        ult
    }
}

Hero.__index = Hero

function Hero:create()
    local hero = {}
    setmetatable(Hero, Object)
    setmetatable(hero, Hero)
    return hero
end

function Hero:move(dt)
    if (self.desX - self:X()) < 10 then
        self.x = self.desX - (self:X() - self.x)
    end
    if (self.desY - self:Y()) < 10 then
        self.y = self.desY - (self:Y() - self.y)
    end

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
