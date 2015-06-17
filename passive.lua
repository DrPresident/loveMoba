require "Object"

Passive =
{
}

Passive.__index = Passive

function Passive:create()
    passive = {}
    setmetatable(Passive, Object)
    setmetatable(passive, Passive)
    return passive
end
