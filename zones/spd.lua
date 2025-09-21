-- zones/spd.lua
local spd = {}

-- Spatial Displacement Devices
spd['device_a'] = {
    npcId = 21001006,
    menuId = 1006,
    zone = 285,
    links = {'Apollyon North', 'Apollyon South'},
    options = {
        ['apollyon north'] = 1,
        ['apollyon south'] = 2
    }
}

return spd