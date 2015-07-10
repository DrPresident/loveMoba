Hero =
{
    speed = 100,
    attack = 100,
    resistance = 100,
    scale = 1,
    maxHealth = 100,
    health = 100,
    healthRegen = .5,
    maxMana = 100,
    mana = 100,
    manaRegen = .5,
    camera = Camera:create(),
    readySpell,
    passive,
    frontAnim,
    leftAnim,
    rightAnim,
    backAnim,

    spells = {},
    buffs = {}
}

Hero.__index = Hero

function Hero:create()
    local hero = {}
    setmetatable(Hero, Object)
    setmetatable(hero, Hero)
    hero.stationary = false

    col = Collider.addRectangle()
    return hero
end

function Hero:loadSprite(path, delay)

    self.sprite = SpriteSheet:loadSprite(path, 4, 3, delay)

    self.frontAnim = anim8.newAnimation(self.sprite.grid('1-3', 1), delay)
    self.leftAnim = anim8.newAnimation(self.sprite.grid('1-3', 2), delay)
    self.rightAnim = anim8.newAnimation(self.sprite.grid('1-3', 3), delay)
    self.backAnim = anim8.newAnimation(self.sprite.grid('1-3', 4), delay)

end

function Hero:update(dt)

    self:move(dt)

    self:anim():update(dt)

    for i = 1, 4 do
        if self.spells[i] ~= nil then
            self.spells[i]:update(dt)
        end
    end

    if self.health > self.maxHealth then self.health = self.maxHealth
    elseif self.health < self.maxHealth then
        self.health = self.health + (self.healthRegen * dt)
    end

    if self.mana > self.maxMana then self.mana = self.maxMana
    elseif self.mana < self.maxMana then
        self.mana = self.mana + (self.manaRegen * dt)
    end
end

function Hero:anim()

    if math.abs(self:X() - self.desX) > math.abs(self:Y() - self.desY) then
        if (self:X() - self.desX) > 0 then
            return self.leftAnim
        elseif (self:X() - self.desX) < 0 then
            return self.rightAnim
        end
    elseif math.abs(self:X() - self.desX) < math.abs(self:Y() - self.desY) then
        if (self:Y() - self.desY) > 0 then
            return self.backAnim
        elseif (self:Y() - self.desY) < 0 then
            return self.frontAnim
        end
    else
        return self.frontAnim
    end
end

function Hero:cast(mouseX, mouseY)

    for i = 1,4 do
        if self.spells[i] == nil then break
        else
            if self.spells[i].ready and self.spells[i].cdTimer <= 0 then
                self.spells[i].active = true
                self.spells[i].ready = false
                self.spells[i].x = self.x
                self.spells[i].y = self.y
                self.mana = self.mana - self.spells[i].cost
                self.spells[i]:cast(mouseX, mouseY)
                break
            end
        end
    end
end

function Hero:spellReady(spellNum)

    if self.spells[spellNum]~= nil then
        if self.spells[spellNum].cdTimer <= 0
           and self.mana > self.spells[spellNum].cost then
            for i = 1, 4 do
                if self.spells[i] ~= nil then
                    self.spells[i].ready = false
                end
            end
            if self.spells[spellNum] ~= nil then
                self.spells[spellNum].ready = true
            end
        end
    end
end
