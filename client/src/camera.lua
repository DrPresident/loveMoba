Camera =
{
    x = 0,
    y = 0,
    scale = 1,
    sensitivity = 10,
    edgeMargin = 50
}

Camera.__index  = Camera

function Camera:create()
    cam = {}
    setmetatable(cam, Camera)
    return cam
end

function Camera:set()
    love.graphics.push()
    love.graphics.scale(1 / self.scale, 1 / self.scale)
    love.graphics.translate(-self.x, -self.y)
end

function Camera:unset()
    love.graphics.pop()
end

function Camera:move(dx, dy)
    self.x = self.x + (dx or 0)
    self.y = self.y + (dy or 0)
end

function Camera:zoom(s)
  self.scale = self.scale * (s or 1)
end

function Camera:setPosition(x, y)
  self.x = x or self.x
  self.y = y or self.y
end

function Camera:setScale(s)
  self.scaleX = (s or self.scaleX)
end

function Camera:update()
    dx = 0
    dy = 0

    if love.mouse.getX() > love.graphics.getWidth() - self.edgeMargin and
        self.x <= 10780 then
        dx = dx + (1 * self.sensitivity)
    elseif love.mouse.getX() < self.edgeMargin and
        self.x >= 20 then
        dx = dx - (1 * self.sensitivity)
    end

    if love.mouse.getY() > love.graphics.getHeight() - self.edgeMargin and
        self.y <= 8980 then
        dy = dy + (1 * self.sensitivity)
    elseif love.mouse.getY() < self.edgeMargin and
        self.y >= 20 then
        dy = dy - (1 * self.sensitivity)
    end

    self:move(dx, dy)
end
