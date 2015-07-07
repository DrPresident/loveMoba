require "lib.class"
require "lib.LUBElibs.LUBE.LUBE"
require "string"

function onReceive(data, clientid)
    --local table = lube.bin:unpack(data)
    local accept = false
    local ip, port = getIPnPort(clientid)

    if port == 18025 then

        for i = 1, clients:getLength() do
            if clients[i].ip == ip then
                accept = true
                local clientNum = i
                recv = recv + 1
                break
            end
        end

        if accept then
            rootData["heroes"].setAt(i, data)
            refreshAllClients()
        end
    end
end

function onConnect(clientid)

    local accept = false
    local ip, port = getIPnPort(clientid)

    if port == 18025 then

        for i = 1, clients:getLength() do
            if clients[i].ip == ip then
                accept = true
                conn = conn + 1
                break
            end
        end

        if not accept and clients:getLength() < 10 then
            clients.pushBack(Client:create(ip, clients.length() + 1))
            conn = conn + 1
        end

    end
end

function onDisconnect()
    conn = conn - 1
end

function refreshAllClients()

    for i = 1, clients:getLength() do
        --server:send(lube.bin:pack(rootData), clients:getAt(i).ip)
    end

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
