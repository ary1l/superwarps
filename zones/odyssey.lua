-- zones/odyssey.lua
local odyssey = {}

-- Sheol A Confluxes
odyssey['conflux_a'] = {
    npcId = 21001001,
    menuId = 1001,
    zone = 280,
    links = {'Sheol A Perdition', 'Sheol A Rapture'},
    options = {
        ['sheol a perdition'] = 1,
        ['sheol a rapture'] = 2
    }
}

-- Sheol B Confluxes
odyssey['conflux_b'] = {
    npcId = 21001002,
    menuId = 1002,
    zone = 281,
    links = {'Sheol B Perdition', 'Sheol B Rapture'},
    options = {
        ['sheol b perdition'] = 1,
        ['sheol b rapture'] = 2
    }
}

-- Sheol C Confluxes
odyssey['conflux_c'] = {
    npcId = 21001003,
    menuId = 1003,
    zone = 282,
    links = {'Sheol C Perdition', 'Sheol C Rapture'},
    options = {
        ['sheol c perdition'] = 1,
        ['sheol c rapture'] = 2
    }
}

return odyssey