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

    spells = {}
}

Hero.spells[1] = Spell.create(1)
Hero.spells[2] = Spell.create(2)
Hero.spells[3] = Spell.create(3)
Hero.spells[4] = Spell.create(4)

Hero.__index = Hero

function Hero:create()
    local hero = {}
    setmetatable(Hero, Object)
    setmetatable(hero, Hero)
    return hero
end

function Hero:move(dt)

    local snapRange = 15

    if self:X() == self.desX and self:Y() == self.desY
        then
        self.sprite.anim:stop()
        self.sprite.anim:seek(7)
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
