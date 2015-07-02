Passive =
{
    active,
    activeFunction
}

Passive.__index = Passive

function Passive:create()
    local passive = {}
    setmetatable(Passive, Object)
    setmetatable(passive, Passive)
    return passive
end
