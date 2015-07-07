Client =
{
    ip,
    hero,
    data,
    id
}

Client.__index = Client

function Client:create(IP, heroNum)
    local client = {}
    setmetatable(client, Client)
    client.ip = IP
    client.id = IP-- .. ":18025"
    client.data = server.clients[IP .. ":18025"]
    client.hero = heroNum
    return client
end
