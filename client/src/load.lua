function love.load(arg)

    --Window Setup
    love.window.setMode(1080, 900)

    --love.window.setFullscreen(true)

    --Map Setup
    map = love.graphics.newImage("res/environment/grass_back.png")
    initCollisions(100)

    --Startup Values
    paused = true
    teamTyping = false
    allTyping = false
    shift = false
    connected = false
    rootData = {} 
    fps = 60
    conn = 0
    
    timers = {}
    timers["conn"] = 0.0
    timers["push"] = 0.0
    
    --Network Setup
    clientInit()

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

    --loveframes.SetState("heroselection")

    setMain(Orcus.create())
    paused = false
    loveframes.SetState("game")
    
    testCol = Collider:addRectangle(300, 300, 100, 100)

end
