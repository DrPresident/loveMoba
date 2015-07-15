function love.load(arg)

    --Window Setup
    love.window.setMode(1080, 900)

    --love.window.setFullscreen(true)

    --Network Setup
    serverInit()

    --Map Setup
    map = love.graphics.newImage("res/environment/grass_back.png")
    initCollisions(100)

    --Startup Values
    paused = false
    team1Chat = ""
    team2Chat = ""
    allChat = ""
    rootData = {}

    recv = 0
    conn = 0

    rootData["heroes"] = {}
    rootData["creeps"] = {}
    collidables = Vector:create()

    tree = Tree:create()
    mainHero = 1
    for i = 1, 10 do
        if i == mainHero then
            rootData["heroes"]["main"] = Orcus:create()
        end
    end

    --HUD creation
    local r,g,b,a = love.graphics.getColor()
    baseColor = {r, g, b, a}
end
