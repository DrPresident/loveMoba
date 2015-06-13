Hero = 
{
    x = 0,
    y = 0,
    speed = 50,
    attack = 100,
    resistance = 100,
    scale = 1,
    __index = Hero,
    maxHealth = 100,
    health = 100,
    maxMana = 100,
    mana = 100
}

function Hero:create(path)
    local hero = {}
    setmetatable(hero, Hero)
    hero.image = love.graphics.newImage(path)
    return hero
end

function Hero:move(desX, desY, dt)
    if self.x < desX then
        self.x = self.x - (self.speed * dt)
    end
    
    if self.x > desX then
        self.x = self.x + (self.speed * dt)
    end
    
    if self.y < desY then
        self.y = self.y - (self.speed * dt)
    end
    
    if self.y > desY then
        self.y = self.y + (self.speed * dt)
    end
end