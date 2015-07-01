require "object"

Item = {}

Item.__index = Item

function Item:create()
    item = {}
    setmetatable(Item, Object)
    setmetatable(item, Item)
    return item
end

function Item:use(hero)

end
