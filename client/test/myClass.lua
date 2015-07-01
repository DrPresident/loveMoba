myClass = 
{
    speed = 50
}

myClass.__index = myClass

function myClass.create()
    local myclass = {}
    setmetatable(myclass, myClass)
    return myclass
end

function myClass.thing()
    print(30)
end

guy = myClass.create()

print(guy.speed)
guy.thing()

guy.speed = 100

man = myClass.create()

print(man.speed)

