require "lib.class"
require "lib.LUBElibs.LUBE.LUBE"
require "string"

function onReceive(data, clientid)
    --local table = lube.bin:unpack(data)

    if string.sub(data, 1, 4) == "tc1-" then
        team1Chat = team1Chat .. '\n' .. string.sub(data, 5)
        server:send("tc1" .. team1Chat)

    elseif string.sub(data, 1, 4) == "tc2-" then
        team2Chat = team2Chat .. '\n' .. string.sub(data, 5)
        server:send("tc2-" .. team2Chat)

    elseif string.sub(data, 1, 3) == "ac-" then
        allChat = allChat .. '\n' .. string.sub(data, 4)
        server:send("ac-" .. allChat)
        
    elseif string.sub(data, 1, 2) == "x-" then
        main().desX = tonumber(string.sub(data, 3))
        
    elseif string.sub(data, 1, 2) == "y-" then
        main().desY = tonumber(string.sub(data, 3))
              
    end
    
    recv = recv + 1

    refreshAllClients()
end

function onConnect(clientid)
    
    server:send("con")

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
