require "lib.class"
require "lib.LUBElibs.LUBE.LUBE"
require "string"

function onReceive(data, clientid)
    --local table = lube.bin:unpack(data)
    local accept = false
    local ip, port = getIPnPort(clientid)


    if string.sub(data, 1, 4) == "tc1-" then
        team1Chat = team1Chat .. '\n' .. string.sub(data, 5)
        server:send("tc1" .. team1Chat)
        recv = recv + 1

    elseif string.sub(data, 1, 4) == "tc2-" then
        team2Chat = team2Chat .. '\n' .. string.sub(data, 5)
        server:send("tc2-" .. team2Chat)
        recv = recv + 1

    elseif string.sub(data, 1, 3) == "ac-" then
        allChat = allChat .. '\n' .. string.sub(data, 4)
        server:send("ac-" .. allChat)
        recv = recv + 1
        onDisconnect()

    end

    --rootData["heroes"].setAt(i, data)
    refreshAllClients()
end

function onConnect(clientid)

    local accept = false
    local ip, port = getIPnPort(clientid)

    conn = conn + 1
end

function onDisconnect()
    conn = conn - 1
end

function refreshAllClients()

    server:send("tc1-" .. team1Chat)
    server:send("tc2-" .. team2Chat)
    server:send("ac-" .. allChat)

end

function serverInit(ip)
    server = lube.udpServer
    server:init()
    server:createSocket()
    server.callbacks.recv = onReceive
    server.callbacks.connect = onConnect
    server.callbacks.disconnect = onDisconnect

    server.handshake = "howdy"

    server:listen(18025)
end

function getIPnPort(clientid)

    local len = string.find(clientid, ':')
    local ip = string.sub(clientid, 1, len)
    local port = tonumber(string.sub(clientid, string.len(ip)))

    return ip, port
end
