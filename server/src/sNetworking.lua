require "lib.class"
require "lib.LUBElibs.LUBE.LUBE"

function onReceive(data, clientid)
    recv = not recv

    local accept = false
    for i = 1, clients.length() do
        if clients[i].ip == clientid then
            accept = true
            break
        end
    end

    if not accept and clients.length() < 10 then
        clients.pushBack(Client:create(ip, clients.length() + 1))
    end
end

function onConnect()
    conn = true
end

function onDisconnect()
    conn = false
end

function serverInit(ip)
    server = lube.udpServer
    server:init()
    server:createSocket()
    server.callbacks.recv = onReceive
    server.callbacks.connect = onConnect
    server.callbacks.disconnect = onDisconnect

    server.handshake = "howddy"

    server:listen(18025)
end
