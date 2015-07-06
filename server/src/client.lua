Client =
{
    ip,
    hero
}

Client.__index = Client

function Client:create(IP, heroNum)
    local client = {}
    setmetatable(client, Client)
    client.ip = IP
    client.hero = heroNum
    return client
end
