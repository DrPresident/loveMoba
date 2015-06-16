require "spriteSheet"

Tree =
{
    total = 1,
    treesX = {},
    treesY = {},
    sprite = SpriteSheet:loadSprite("res/tallTree.png")
}

Tree.__index = Tree

function Tree:create()
    tree = {}
    setmetatable(Tree, Object)
    setmetatable(tree, Tree)
    tree.sprite:loadSprite("res/tallTree.png")
    return tree
end

function Tree:chopDown()

end

function Tree:regrow()

end
