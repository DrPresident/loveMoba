local anim8 = require 'anim8'

SpriteSheet =
{
    image,
    anim,
    frameWidth,
    frameHeight,
    grid
}

SpriteSheet.__index = SpriteSheet

function SpriteSheet:create()

    local spriteSheet = {}
    setmetatable(spriteSheet, SpriteSheet)
    return spriteSheet
end

function SpriteSheet:loadSprite(path, rows, columns, frames, delay)

    self.image = love.graphics.newImage(path or "res/fail.png")

    self.frameWidth = self.image:getWidth() / (columns or 1)
    self.frameHeight = self.image:getHeight() / (rows or 1)

    self.grid = anim8.newGrid(self.frameWidth, self.frameHeight, self.image:getWidth(), self.image:getWidth())

    --self.anim = anim8.newAnimation(self:grid(frames), delay)

    return self
end
