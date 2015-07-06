Packet =
{
    x,
    y,
    desX,
    desY,
    health,
    maxHealth,
    mana,
    maxMana,
    items = {},
    level
}

Packet.__index = Packet

function Packet:create(hero)
    local packet = {}

    setmetatable(packet, Packet)


    return packet
end

function Packet:serialize()
    local str =
        tostring(x) .. ',' .. tostring(y) .. ','
        tostring(desY) .. ',' .. tostring(desY) .. ','

    return str
end
