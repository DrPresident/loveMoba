require "spriteSheet"
require "math"

Object =
{
    sprite = SpriteSheet.create(),
    x = 50,
    y = 50
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
