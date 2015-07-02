function onReceive(data)

end
--[[
function clientInit(ip)
    client = lube.client()
    client:setHandshake("Howdy")
    client:setCallback(onReceive)
    client:connect(ip or "127.0.0.1", 18025)
end
]]
