Hero = {}

Hero.__index = Hero

function Hero.create()
    local hero
    setmetatable(hero, Hero)
    return hero
end

function Hero