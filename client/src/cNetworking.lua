--[[
function onReceive(data)

end

function clientInit(ip)
    local client = lube.client
    client:setHandshake("Howdy")
    client:setCallback(onReceive)
    client:connect(ip or "127.0.0.1", 18025)
    return client
end
]]
