Hero = 
{
    x = 0,
    y = 0,
    desX = 0,
    desY = 0,
    speed = 200,
    attack = 100,
    resistance = 100,
    scale = 1,
    maxHealth = 100,
    health = 100,
    maxMana = 100,
    mana = 100,
    image
}

Hero.__index = Hero

function Hero:create()
    local hero = {}
    setmetatable(hero, Hero)
    return hero
end

function Hero:move(dt)
    if self.x < self.desX then
        self.x = self.x + (self.speed * dt)
    end
    
    if self.x > self.desX then
        self.x = self.x - (self.speed * dt)
    end
    
    if self.y < self.desY then
        self.y = self.y + (self.speed * dt)
    end
    
    if self.y > self.desY then
        self.y = self.y - (self.speed * dt)
    end
end

function Hero:calcX()
    return self.x + image:getWidth()
end

function Hero:calcY()
    return self.y + image.getHeight()
end