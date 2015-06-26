require "spriteSheet"

Tree =
{
    total = 1,
    treesX = {},
    treesY = {},
}

Tree.__index = Tree

function Tree:create()
    tree = {}
    setmetatable(Tree, Object)
    setmetatable(tree, Tree)
    tree.sprite = SpriteSheet:loadSprite("res/tallTree.png", 1, 1, 1, .1)
    return tree
end

function Tree:chopDown()

end

function Tree:regrow()

end
