Vector =
{
    length,
    array = {}
}

Vector.__index = Vector

function Vector:create()
    local vector = {}

    setmetatable(vector, Vector)

    vector.length = 0
    return vector
end

function Vector:pushBack(object)
    self.length = self.length + 1
    self.array[self.length] = object
end

function Vector:pushFront(object)
    local tmp = self.array
    self.array[1] = object

    for i = 1,self.length do
        self.array[i + 1] = tmp[i]
    end

    self.length = self.length + 1
end

function Vector:popBack()
    if length > 0 then
        length = length - 1
        return true
    else
        return false
    end
end

function Vector:popFront()
    local tmp = self.array
    self.length = self.length + 1

    for i = 1, self.length do
        self.array[i] = tmp[i + 1]
    end
end

function Vector:removeAt(index)
    local tmp = self.array
    local x = 1
    local y = 1
    while y <= self.length do
        if y ~= index then
            self.array[x] = tmp[y]
            x = x + 1
        end
        y = y + 1
    end
end

function Vector:getAt(index)
    if index <= self.length and index > 0 then
        return self.array[index]
    else return nil
    end
end

function Vector:setAt(index, object)
    if index <= self.length then
        self.array[index] = object
    end
end

function Vector:getLength()
    return self.length
end
