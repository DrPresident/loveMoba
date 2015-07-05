stat = 0
attack = 1
defense = 2
element = 3
elementChange = 4

Buff =
{
    duration,
    icon,
    power,
    effectFunc
}

Buff.__index = Buff

function Buff:create(type, func)

    local b = {}

    effectFunc = func or default
    duration = 30
    icon = love.graphics.newImage("res/fail.png")

end

local function default()

end
