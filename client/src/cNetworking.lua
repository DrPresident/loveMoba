require "lib.class"
require "lib.LUBElibs.LUBE.LUBE"

function onReceive(data)
    chars = data
end

function clientInit(ip)
    client = lube.udpClient
    client:init()
    client:createSocket()
    client.handshake = "howdy"
    client.callbacks.recv = onReceive

    client:connect(ip or "127.0.0.1", 18025)
end
