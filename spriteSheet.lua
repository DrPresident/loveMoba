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
    return spriteSheet

end

function SpriteSheet:loadSprite(path, rows, columns, delay, frames)--, rows, columns)

    self.image = love.graphics.newImage(path or "res/fail.png")

    self.width = self.image:getWidth() / columns
    self.height = self.image:getHeight() / rows

    self.anim = newAnimation(
                    self.image,
                    self.width,
                    self.height,
                    delay or .1,
                    frames or 0)

end
