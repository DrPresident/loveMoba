require "spriteSheet"
require "math"

Object =
{
    sprite,-- = SpriteSheet.create(),
    x = 50,
    y = 50,
    desX = 100,
    desY = 100,
    speed
}

Object.__index = Object

function Object:create()
    object = {}
    setmetatable(object, Object)
    return object
end

function Object:X()
    return self.x + (self.sprite.frameWidth / 2)
end

function Object:Y()
    return self.y + (self.sprite.frameHeight / 2)
end
function Object:move(dt)
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
