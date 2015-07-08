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
    paused = true
    typing = false
    rootData = {}

    rootData["heroes"] = {}
    rootData["creeps"] = {}
    collidables = {}

    tree = Tree:create()
    mainHero = 1

    --get base color for drawing
    local r,g,b,a = love.graphics.getColor()
    baseColor = {r, g, b, a}

    --GUI creation
    initGUI()

    setMain(Orcus.create())
    paused = false
    loveframes.SetState("game")

end
