SpriteSheet =
{
    image,
    anim,
    frameWidth,
    frameHeight,
    grid
}

SpriteSheet.__index = SpriteSheet

function SpriteSheet:loadSprite(path, rows, columns, delay)

    local sprite = {}

    setmetatable(sprite, SpriteSheet)

    sprite.image = love.graphics.newImage(path)

    sprite.frameWidth = math.floor(sprite.image:getWidth() / columns)
    sprite.frameHeight = math.floor(sprite.image:getHeight() / rows)

    sprite.grid = anim8.newGrid(sprite.frameWidth, sprite.frameHeight,
                            sprite.image:getWidth(), sprite.image:getHeight())

    return sprite
end
