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
    speed = 100,
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

    spells = {}
}

Hero.__index = Hero

function Hero:create()
    local hero = {}
    setmetatable(Hero, Object)
    setmetatable(hero, Hero)
    return hero
end

function Hero:move(dt)

    local snapRange = 5

    if self:X() == self.desX and self:Y() == self.desY
        then
        self.sprite.anim:stop()
        self.sprite.anim:seek(1)
    else
        if self:X() < self.desX then
            if (self.desX - self:X()) < snapRange then
                self.x = self.desX - (self:X() - self.x)
            else
                self.x = self.x + (self.speed * dt)
                self.sprite.anim:play()
            end

        elseif self:X() > self.desX then
            if (self.desX - self:X()) > snapRange then
                self.x = self.desX - (self:X() - self.x)
            else
                self.x = self.x - (self.speed * dt)
                self.sprite.anim:play()
            end
        end

        if self:Y() < self.desY then
            if (self.desY - self:Y()) < snapRange then
                self.y = self.desY - (self:Y() - self.y)
            else
                self.y = self.y + (self.speed * dt)
                self.sprite.anim:play()
            end
        elseif self:Y() > self.desY then
            if (self.desY - self:Y()) > snapRange then
                self.y = self.desY - (self:Y() - self.y)
            else
                self.y = self.y - (self.speed * dt)
                self.sprite.anim:play()
            end
        end
    end

end

function Hero:update(dt)

    Hero:move(dt)

end

function Hero:cast(mouseX, mouseY)



end

function Hero:spellReady(spellNum)

    for i = 1, 4 do
        self.spells[i].ready = false
    end

    self.spells[spellNum].ready = true
end
