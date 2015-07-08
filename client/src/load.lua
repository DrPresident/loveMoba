function love.load(arg)

    --Window Setup
    love.window.setMode(1080, 900)

    --love.window.setFullscreen(true)

    --Network Setup
    clientInit("127.0.0.1")

    --Map Setup
    map = love.graphics.newImage("res/environment/grass_back.png")
    initCollisions(100)

    --Startup Values
    paused = false
    rootData = {}

    rootData["heroes"] = {}
    rootData["creeps"] = {}
    collidables = {}

    tree = Tree:create()
    mainHero = 1
    for i = 1, 10 do
        if i == mainHero then
            rootData["heroes"]["main"] = Orcus:create()
        end
    end

    --get base color for drawing
    local r,g,b,a = love.graphics.getColor()
    baseColor = {r, g, b, a}

    --HUD creation
    initMainMenu()
    hideMainMenu()

end
