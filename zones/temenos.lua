-- zones/temenos.lua
local temenos = {}

-- Matter Diffusion Modules
temenos['module_a'] = {
    npcId = 21001004,
    menuId = 1004,
    zone = 283,
    links = {'Central Temenos', 'Upper Temenos'},
    options = {
        ['central temenos'] = 1,
        ['upper temenos'] = 2
    }
}

return temenos