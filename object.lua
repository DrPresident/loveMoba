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
    return math.floor(self.x + self.sprite.width / 2)
end

function Object:Y()
    return math.floor(self.y + self.sprite.height / 2)
end
