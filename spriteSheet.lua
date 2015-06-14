require "AnAL"

SpriteSheet = 
{
    image,
    anim
}

SpriteSheet.__index = SpriteSheet

function SpriteSheet:create()
    
    local spriteSheet = {}
    setmetatable(spriteSheet, SpriteSheet)
    return spriteSheet
    
end

function SpriteSheet:loadSprite(path, rows, columns)

    self.image = love.graphics.newImage(path, normal)
    self.numSprites = num
    self.anim = newAnimation(
                    self.image, 
                    self.image.getWidth / columns,
                    self.image.getHeight / rows)

end