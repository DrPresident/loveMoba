local anim8 = require 'anim8'

SpriteSheet =
{
    image,
    anim,
    width,
    height
}

SpriteSheet.__index = SpriteSheet

function SpriteSheet:create()

    local spriteSheet = {}
    setmetatable(spriteSheet, SpriteSheet)
    return spriteSheet
end

function SpriteSheet:loadSprite(path, rows, columns, frames, delay)

    self.image = love.graphics.newImage(path or "res/fail.png")

    self.width = self.image:getWidth() / (columns or 1)
    self.height = self.image:getHeight() / (rows or 1)

    local grid = anim8.newGrid(self.width, self.height, self.image:getWidth(), self.image:getWidth())

    self.anim = newAnimation(grid(frames), delay)

    return self
end
