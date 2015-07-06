function love.load(arg)

    --Window Setup
    love.window.setMode(1080, 900)

    --love.window.setFullscreen(true)

    --Network Setup
    serverInit()
    clients = Vector:create()

    --Map Setup
    map = love.graphics.newImage("res/environment/grass_back.png")
    initCollisions(100)

    --Startup Values
    paused = false
    chars = {}

    chars["heroes"] = Vector:create()
    chars["creeps"] = Vector:create()
    collidables = Vector:create()

    tree = Tree:create()
    mainHero = 1
    for i = 1, 10 do
        if i == mainHero then
            chars["heroes"]:pushBack(Orcus.create())
        end
    end

    --HUD creation
    local r,g,b,a = love.graphics.getColor()
    baseColor = {r, g, b, a}
end
