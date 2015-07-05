require "lib.class"
require "lib.LUBElibs.LUBE.LUBE"

function onReceive(data)

end

function clientInit(ip)
    client = lube.udpClient
    client:init()
    client:createSocket()
    client:connect(ip or "127.0.0.1", 18025)
    client.callbacks.recv = onReceive
end
