local anim8 = require "anim8"
require "spriteSheet"
require "math"
require "camera"
require "object"
require "passive"
require "spell"

Hero =
{
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
    frontAnim,
    leftAnim,
    rightAnim,
    backAnim,

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
        self:anim():pauseAtStart()
    else
        if self:X() < self.desX then
            if (self.desX - self:X()) < snapRange then
                self.x = self.desX - (self:X() - self.x)
            else
                self.x = self.x + (self.speed * dt)
                self:anim():resume()
            end

        elseif self:X() > self.desX then
            if (self.desX - self:X()) > snapRange then
                self.x = self.desX - (self:X() - self.x)
            else
                self.x = self.x - (self.speed * dt)
                self:anim():resume()
            end
        end

        if self:Y() < self.desY then
            if (self.desY - self:Y()) < snapRange then
                self.y = self.desY - (self:Y() - self.y)
            else
                self.y = self.y + (self.speed * dt)
                self:anim():resume()
            end
        elseif self:Y() > self.desY then
            if (self.desY - self:Y()) > snapRange then
                self.y = self.desY - (self:Y() - self.y)
            else
                self.y = self.y - (self.speed * dt)
                self:anim():resume()
            end
        end
    end
end

function Hero:loadSprite(path, delay)

    self.sprite = SpriteSheet:loadSprite(path, 4, 3, delay)
    --self.sprite.image = love.graphics.newImage(path)-- or "res/fail.png")

    --self.sprite.frameWidth = math.floor(self.sprite.image:getWidth() / 3)
    --self.sprite.frameHeight = math.floor(self.sprite.image:getHeight() / 4)

    --self.sprite.grid = anim8.newGrid(self.sprite.frameWidth, self.sprite.frameHeight, self.sprite.image:getWidth(), self.sprite.image:getHeight())

    self.frontAnim = anim8.newAnimation(self.sprite.grid('1-3', 1), delay)
    self.leftAnim = anim8.newAnimation(self.sprite.grid('1-3', 2), delay)
    self.rightAnim = anim8.newAnimation(self.sprite.grid('1-3', 3), delay)
    self.backAnim = anim8.newAnimation(self.sprite.grid('1-3', 4), delay)

end

function Hero:update(dt)

    self:move(dt)

    self:anim():update(dt)

    for i = 1, 4 do
        if self.spells[i] ~= nil then
            self.spells[i]:update(dt)
        end
    end
end

function Hero:anim()

    if math.abs(self:X() - self.desX) > math.abs(self:Y() - self.desY) then
        if (self:X() - self.desX) > 0 then
            return self.leftAnim
        elseif (self:X() - self.desX) < 0 then
            return self.rightAnim
        end
    elseif math.abs(self:X() - self.desX) < math.abs(self:Y() - self.desY) then
        if (self:Y() - self.desY) > 0 then
            return self.backAnim
        elseif (self:Y() - self.desY) < 0 then
            return self.frontAnim
        end
    else
        return self.frontAnim
    end
end

function Hero:cast(mouseX, mouseY)

    for i = 1,4 do
        if self.spells[i] == nil then break
        else
            if self.spells[i].ready then
                self.spells[i].active = true
                self.spells[i].ready = false
                self.spells[i].x = self.x
                self.spells[i].y = self.y
                self.spells[i]:cast(mouseX, mouseY)
                break
            end
        end
    end
end

function Hero:spellReady(spellNum)

    for i = 1, 4 do
        if self.spells[i] ~= nil then
            self.spells[i].ready = false
        end

    end
    if self.spells[spellNum] ~= nil then
        self.spells[spellNum].ready = true
    end
end
