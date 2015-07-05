require "lib.class"
require "lib.LUBElibs.LUBE.LUBE"

function onReceive(data, clientid)
    recv = true
end

function onConnect()
    conn = true
end

function onDisconnect()
    disc = true
end

function serverInit(ip)
    server = lube.udpServer
    server:init()
    server:createSocket()
    server:listen(18025)
    server.callbacks.recv = onReceive
    server.callbacks.connect = onConnect
    server.callbacks.disconnect = onDisconnect
end
