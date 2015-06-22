require "AnAL"

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
    spriteSheet.image = love.graphics.newImage("res/fail.png")
    return spriteSheet
end

function SpriteSheet:loadSprite(path, rows, columns, delay, frames)

    self.image = love.graphics.newImage(path or "res/fail.png")

    self.width = self.image:getWidth() / (columns or 1)
    self.height = self.image:getHeight() / (rows or 1)

    self.anim = newAnimation(
                    self.image,
                    self.width,
                    self.height,
                    delay or .1,
                    frames or 0)
    return self

end
