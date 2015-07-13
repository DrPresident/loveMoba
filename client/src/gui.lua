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
        :SetName("")
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

        local mikitaButton = loveframes.Create("button", waterPanel)
            :SetText("Mikita")
            :SetSize(50, 50)
            :SetPos(10, 50)

        mikitaButton.OnClick = function(object, x, y)
            --[[
            setMain(Mikita.create())
            loveframes:SetState("game")
            paused = false
            ]]
        end

        --Earth Heroes
        local earthPanel = loveframes.Create("panel", heroSelectFrame)
            :SetSize(300, 350)
            :SetPos(700, 100)

        local earthHeading = loveframes.Create("text", earthPanel)
            :SetText("Earth")
            :SetPos(130, 0)

        local davidButton = loveframes.Create("button", earthPanel)
            :SetText("David")
            :SetSize(50, 50)
            :SetPos(10, 50)

        davidButton.OnClick = function(object, x, y)
            --[[
            setMain(David.create())
            loveframes:SetState("game")
            paused = false
            ]]
        end

        local turtleButton = loveframes.Create("button", earthPanel)
            :SetText("Turtle")
            :SetSize(50, 50)
            :SetPos(70, 50)

        turtleButton.OnClick = function(object, x, y)
            --[[
            setMain(Turtle.create())
            loveframes:SetState("game")
            paused = false
            ]]
        end

        --Physical Heroes
        local physicalPanel = loveframes.Create("panel", heroSelectFrame)
            :SetSize(500, 200)
            :SetPos(290, 460)

        local physicalHeading = loveframes.Create("text", physicalPanel)
            :SetText("Physical")
            :SetPos(225, 0)

        local nijaButton = loveframes.Create("button", physicalPanel)
            :SetText("Nija")
            :SetSize(50, 50)
            :SetPos(10, 50)

        nijaButton.OnClick = function(object, x, y)
            setMain(Nija.create())
            loveframes:SetState("game")
            paused = false
        end

        local dadButton = loveframes.Create("button", physicalPanel)
            :SetText("Dad")
            :SetSize(50, 50)
            :SetPos(70, 50)

        dadButton.OnClick = function(object, x, y)
            --[[
            setMain(Dad.create())
            loveframes:SetState("game")
            paused = false
            ]]
        end

        local raedenButton = loveframes.Create("button", physicalPanel)
            :SetText("Raeden")
            :SetSize(50, 50)
            :SetPos(130, 50)

        raedenButton.OnClick = function(object, x, y)
            --[[
            setMain(Raeden.create())
            loveframes:SetState("game")
            paused = false
            ]]
        end

        --Random
        local randomButton = loveframes.Create("button", heroSelectFrame)
            :SetText("Random Hero")
            :SetSize(100, 50)
            :SetPos(900, 800)

        randomButton.OnClick = function(object, x, y)
            setMain(randomHero())
            loveframes:SetState("game")
            paused = false
        end

    --HUD
    local hudFrame = loveframes.Create("frame")
        :SetName("")
        :SetSize(love.graphics.getWidth(), 100)
        :SetPos(0, love.graphics.getHeight() - 100)
        :ShowCloseButton(false)
        :SetModal(false)
        :SetState("game")

        local spellsPanel = loveframes.Create("panel", hudFrame)
            :SetSize(200, 70)
            :SetPos(300, 10)

            spell1Button = loveframes.Create("button", spellsPanel)
                :SetSize(50, 50)
                :SetPos(0, 0)
                :SetText("Q")
            spell1Button.OnClick = function(object, x, y)
                main():spellReady(1)
            end

            spell1Label = loveframes.Create("text", spellsPanel)
                :SetText("First")
                :SetPos(0, 50)

            spell2Button = loveframes.Create("button", spellsPanel)
                :SetSize(50, 50)
                :SetPos(50, 0)
                :SetText("W")
            spell2Button.OnClick = function(object, x, y)
                main():spellReady(2)
            end

            spell2Label = loveframes.Create("text", spellsPanel)
                :SetText("Second")
                :SetPos(50, 50)

            spell3Button = loveframes.Create("button", spellsPanel)
                :SetSize(50, 50)
                :SetPos(100, 0)
                :SetText("E")
            spell3Button.OnClick = function(object, x, y)
                main():spellReady(3)
            end

            spell3Label = loveframes.Create("text", spellsPanel)
                :SetText("Third")
                :SetPos(100, 50)

            spell4Button = loveframes.Create("button", spellsPanel)
                :SetSize(50, 50)
                :SetPos(150, 0)
                :SetText("R")
            spell4Button.OnClick = function(object, x, y)
                main():spellReady(4)
            end

            spell4Label = loveframes.Create("text", spellsPanel)
                :SetText("Fourth")
                :SetPos(150, 50)

        local itemsPanel = loveframes.Create("panel", hudFrame)
            :SetSize(200, 100)
            :SetPos(50, -20)

            item1Button = loveframes.Create("button", itemsPanel)
                :SetText("Item")
                :SetSize(50, 50)
                :SetPos(0, 0)

            item2Button = loveframes.Create("button", itemsPanel)
                :SetText("Item")
                :SetSize(50, 50)
                :SetPos(50, 0)

            item3Button = loveframes.Create("button", itemsPanel)
                :SetText("Item")
                :SetSize(50, 50)
                :SetPos(100, 0)

            item4Button = loveframes.Create("button", itemsPanel)
                :SetText("Item")
                :SetSize(50, 50)
                :SetPos(150, 0)

            item5Button = loveframes.Create("button", itemsPanel)
                :SetText("Item")
                :SetSize(50, 50)
                :SetPos(0, 50)

            item6Button = loveframes.Create("button", itemsPanel)
                :SetText("Item")
                :SetSize(50, 50)
                :SetPos(50, 50)

            item7Button = loveframes.Create("button", itemsPanel)
                :SetText("Item")
                :SetSize(50, 50)
                :SetPos(100, 50)

            item8Button = loveframes.Create("button", itemsPanel)
                :SetText("Item")
                :SetSize(50, 50)
                :SetPos(150, 50)

        local teamChatPanel = loveframes.Create("panel", hudFrame)
            :SetSize(200, 140)
            :SetPos(550, -50)

            teamChatInput = loveframes.Create("textinput", teamChatPanel)
                :SetSize(200, 10)
                :SetPos(0, 130)

            teamChatInput.OnEnter = function(object)
                client:send("teamchat:" + teamChatInput.text)
                object:Clear()
            end

        local allChatPanel = loveframes.Create("panel", hudFrame)
            :SetSize(200, 140)
            :SetPos(760, -50)

            allChatInput = loveframes.Create("textinput", allChatPanel)
                :SetSize(200, 10)
                :SetPos(0, 130)
end
