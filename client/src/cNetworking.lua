require "lib.class"
require "lib.LUBElibs.LUBE.LUBE"

function onReceive(data)
    --rootData = bin:unpack(data)
    if string.sub(data, 1, 4) == "tc1-" then
        teamChatBox:SetText(string.sub(data, 5))

    elseif string.sub(data, 1, 3) == "ac-" then
        allChatBox:SetText(string.sub(data, 4))
        
    end
end

function clientInit(ip)

    client = lube.udpClient
    client:init()
    client:createSocket()
    client.handshake = "howdy"
    client.callbacks.recv = onReceive

    client:connect(ip or "127.0.0.1", 18025)
end
