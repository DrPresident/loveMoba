Nija =
{

}

Nija.__index = Nija

function Nija:create()
    local nija = {}

    setmetatable(Hero, Object)
    setmetatable(Nija, Hero)
    setmetatable(nija, Nija)

    nija:loadSprite("res/nija/sprite.png", .1)

    return nija
end
