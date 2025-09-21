-- zones/sortie.lua
local sortie = {}

-- Gadgets
sortie['gadget_a'] = {
    npcId = 21001014,
    menuId = 1005,
    zone = 267,
    links = {
        'Aminon (Normal)',
        'Aminon (Hard)',
        'Bitzer #A',
        'Bitzer #B',
        'Device #1'
    },
    options = {
        ['aminon (normal)'] = 1,
        ['aminon (hard)'] = 2,
        ['bitzer #a'] = 3,
        ['bitzer #b'] = 4,
        ['device #1'] = 5
    }
}

sortie['gadget_b'] = {
    npcId = 21001015,
    menuId = 1005,
    zone = 267,
    links = {
        'Aminon (Normal)',
        'Aminon (Hard)',
        'Bitzer #C',
        'Bitzer #D',
        'Device #2'
    },
    options = {
        ['aminon (normal)'] = 1,
        ['aminon (hard)'] = 2,
        ['bitzer #c'] = 3,
        ['bitzer #d'] = 4,
        ['device #2'] = 5
    }
}

-- Bitzers
sortie['bitzer_a'] = {
    npcId = 21001016,
    menuId = 1006,
    zone = 267,
    links = {'Aminon (Normal)', 'Device #1'},
    options = {['aminon (normal)'] = 1, ['device #1'] = 2}
}

sortie['bitzer_b'] = {
    npcId = 21001017,
    menuId = 1006,
    zone = 267,
    links = {'Aminon (Hard)', 'Device #1'},
    options = {['aminon (hard)'] = 1, ['device #1'] = 2}
}

sortie['bitzer_c'] = {
    npcId = 21001018,
    menuId = 1006,
    zone = 267,
    links = {'Aminon (Normal)', 'Device #2'},
    options = {['aminon (normal)'] = 1, ['device #2'] = 2}
}

sortie['bitzer_d'] = {
    npcId = 21001019,
    menuId = 1006,
    zone = 267,
    links = {'Aminon (Hard)', 'Device #2'},
    options = {['aminon (hard)'] = 1, ['device #2'] = 2}
}

-- Devices
sortie['device_1'] = {
    npcId = 21001020,
    menuId = 1007,
    zone = 267,
    links = {'Aminon (Normal)', 'Aminon (Hard)'},
    options = {['aminon (normal)'] = 1, ['aminon (hard)'] = 2}
}

sortie['device_2'] = {
    npcId = 21001021,
    menuId = 1007,
    zone = 267,
    links = {'Aminon (Normal)', 'Aminon (Hard)'},
    options = {['aminon (normal)'] = 1, ['aminon (hard)'] = 2}
}

return sortie
