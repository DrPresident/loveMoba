Tree =
{
    total = 1
}

Tree.__index = Tree

function Tree:create()
    local tree = {}
    setmetatable(Tree, Object)
    setmetatable(tree, Tree)
    tree.sprite = SpriteSheet:loadSprite("res/environment/tallTree.png", 1, 1, 1, .1)
    stationary = true

    tree.type = "tree"

    return tree
end

function Tree:chopDown()

end

function Tree:regrow()

end
