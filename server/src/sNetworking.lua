require "lib.class"
require "lib.LUBElibs.LUBE.LUBE"

function onReceive(data, clientid)
    recv = recv + 1

    local accept = false
    for i = 1, clients:getLength() do
        if clients[i].ip == clientid then
            accept = true
            break
        end
    end

    if accept then

    end
end

function onConnect()
    conn = conn + 1

    local accept = false
    for i = 1, clients:getLength() do
        if clients[i].ip == clientid then
            accept = true
            break
        end
    end

    if not accept and clients.getLength() < 10 then
        clients.pushBack(Client:create(ip, clients.length() + 1))
    end
end

function onDisconnect()
    conn = conn - 1
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
