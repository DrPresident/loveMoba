function initGUI()
    loveframes.util.SetActiveSkin("Dark")

    --Main Menu
    local mainMenuFrame = loveframes.Create("frame")
    mainMenuFrame:SetName("")
        :SetSize(love.graphics.getWidth() - 10, love.graphics.getHeight() - 10)
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
        :SetSize(love.graphics.getWidth() - 10, love.graphics.getHeight() - 10)
        :Center()
        :ShowCloseButton(false)
        :SetDraggable(false)
        :SetResizable(false)
        :SetModal(false)
        :SetState("heroselection")

        local heroSelectHeading = loveframes.Create("text", heroSelectFrame)
        heroSelectHeading:SetText("Choose Your Hero")
            :SetPos(400, 30)

        local orcusButton = loveframes.Create("button", heroSelectFrame)
        orcusButton:SetText("Orcus")
            :SetSize(50, 50)
            :SetPos(50, 100)

        orcusButton.OnClick = function(object, x, y)
            setMain(Orcus.create())
            loveframes:SetState("game")
            paused = false
        end

        local nijaButton = loveframes.Create("button", heroSelectFrame)
        nijaButton:SetText("Nija")
            :SetSize(50, 50)
            :SetPos(110, 100)

        nijaButton.OnClick = function(object, x, y)
            setMain(Nija.create())
            loveframes:SetState("game")
            paused = false
        end

        local randomButton = loveframes.Create("button", heroSelectFrame)
        randomButton:SetText("Random Hero")
            :SetSize(100, 50)
            :SetPos(500, 600)

        randomButton.OnClick = function(object, x, y)
            setMain(randomHero())
            loveframes:SetState("game")
            paused = false
        end




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
