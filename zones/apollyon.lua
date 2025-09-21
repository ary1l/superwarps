-- zones/apollyon.lua
local apollyon = {}

-- Swirling Vortices
apollyon['vortex_a'] = {
    npcId = 21001005,
    menuId = 1005,
    zone = 284,
    links = {'Apollyon North', 'Apollyon South'},
    options = {
        ['apollyon north'] = 1,
        ['apollyon south'] = 2
    }
}

return apollyon