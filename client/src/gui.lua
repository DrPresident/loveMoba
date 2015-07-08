function initGUI()
    loveframes.util.SetActiveSkin("Dark")

    --Main Menu
    local mainMenuFrame = loveframes.Create("frame")
    mainMenuFrame:SetName("")
        :SetSize(love.graphics.getWidth(), love.graphics.getHeight())
        :Center()
        :ShowCloseButton(false)
        :SetDraggable(false)
        :SetResizable(false)
        :SetModal(false)
        :SetState("mainmenu")

        local button = loveframes.Create("button", mainMenuFrame)
        button:SetText("button")
            :SetSize(100, 100)
            :Center()

    --Hero Selection
    local heroSelectFrame = loveframes.Create("frame")
    heroSelectFrame:SetName("")
        :SetSize(love.graphics.getWidth(), love.graphics.getHeight())
        :Center()
        :ShowCloseButton(false)
        :SetDraggable(false)
        :SetResizable(false)
        :SetModal(false)
        :SetState("heroselection")

        local heroSelectHeading = loveframes.Create("text", heroSelectFrame)
            :SetText("Choose Your Hero")
            :SetPos(500, 30)

        --Fire Heroes
        local firePanel = loveframes.Create("panel", heroSelectFrame)
            :SetSize(300, 350)
            :SetPos(80, 100)

        local fireHeading = loveframes.Create("text", firePanel)
            :SetText("Fire")
            :SetPos(130, 0)

        local orcusButton = loveframes.Create("button", firePanel)
            :SetText("Orcus")
            :SetSize(50, 50)
            :SetPos(10, 50)

        orcusButton.OnClick = function(object, x, y)
            setMain(Orcus.create())
            loveframes:SetState("game")
            paused = false
        end

        --Water Heroes
        local waterPanel = loveframes.Create("panel", heroSelectFrame)
            :SetSize(300, 350)
            :SetPos(390, 100)

        local waterHeading = loveframes.Create("text", waterPanel)
            :SetText("Water")
            :SetPos(130, 0)

        --Earth Heroes
        local earthPanel = loveframes.Create("panel", heroSelectFrame)
            :SetSize(300, 350)
            :SetPos(700, 100)

        local earthHeading = loveframes.Create("text", earthPanel)
            :SetText("Earth")
            :SetPos(130, 0)

        --Physical Heroes
        local physicalPanel = loveframes.Create("panel", heroSelectFrame)
            :SetSize(500, 200)
            :SetPos(290, 460)

        local physicalHeading = loveframes.Create("text", physicalPanel)
            :SetText("Physical")
            :SetPos(225, 0)

        local nijaButton = loveframes.Create("button", physicalPanel)
        nijaButton:SetText("Nija")
            :SetSize(50, 50)
            :SetPos(10, 50)

        nijaButton.OnClick = function(object, x, y)
            setMain(Nija.create())
            loveframes:SetState("game")
            paused = false
        end

        --Random
        local randomButton = loveframes.Create("button", heroSelectFrame)
        randomButton:SetText("Random Hero")
            :SetSize(100, 50)
            :SetPos(900, 800)

        randomButton.OnClick = function(object, x, y)
            setMain(randomHero())
            loveframes:SetState("game")
            paused = false
        end

    local hudPanel = loveframes.Create("panel")
    hudPanel:SetSize(love.graphics.getWidth(), 50)
        :SetPos(0, 500)
        :SetState("game")

        local spell1Button = loveframes.Create("button", hudPanel)
        spell1Button:SetSize(50, 50)
            :SetPos(200, 10)
            :SetText("Q")


end

function showMainMenu()
    loveframes:SetState("mainmenu")
end

function showHeroSelection()
    loveframes:SetState("heroselection")
end

function showHUD()
    loveframes:SetState("game")
end
