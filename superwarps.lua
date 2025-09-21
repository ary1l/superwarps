-- superwarps
addon.name    = 'superwarps'
addon.author  = 'aryl'
addon.version = '0.1'
addon.desc    = 'Warp system for Sortie, Odyssey, Apollyon, Temenos, and Spatial Displacement'

require('common')

local mm = AshitaCore:GetMemoryManager()
local qcmd = function(cmd) AshitaCore:GetChatManager():QueueCommand(1, cmd) end

-- Load zone modules
local zones = {}
zones.sortie    = require('zones.sortie')
zones.odyssey   = require('zones.odyssey')
zones.temenos   = require('zones.temenos')
zones.apollyon  = require('zones.apollyon')
zones.spd       = require('zones.spd')

-- Utility: get NPC by target
local function get_npc_by_target()
    local target = mm:GetTarget()
    if not target or target.Index == 0 then return nil end
    return target.Name:lower()
end

-- Utility: same zone check
local function is_same_zone(npc_zone)
    local player_zone = AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0)
    return player_zone == npc_zone
end

-- Generic warp (/sw ad)
local function generic_warp()
    local target = mm:GetTarget()
    if not target or target.Index == 0 then return end
    local npc_name = target.Name:lower()

    for _, z in pairs(zones) do
        local npc = z[npc_name]
        if npc and is_same_zone(npc.zone) and npc.links and #npc.links > 0 then
            local dest = npc.links[1]
            qcmd(string.format('/menu %d %d', npc.menuId, npc.options[dest:lower()]))
            print('[SW] Warping to ' .. dest)
            return
        end
    end
end

-- Direct warp (/sw s <destination>)
local function warp_to(dest_name)
    local target = mm:GetTarget()
    if not target or target.Index == 0 then return end
    local npc_name = target.Name:lower()

    for _, z in pairs(zones) do
        local npc = z[npc_name]
        if npc and is_same_zone(npc.zone) then
            local optionIndex = npc.options[dest_name:lower()]
            if optionIndex then
                qcmd(string.format('/menu %d %d', npc.menuId, optionIndex))
                print('[SW] Warping to ' .. dest_name)
                return
            end
        end
    end
    print('[SW] Unknown destination or not in same zone: ' .. dest_name)
end

-- Command handler
ashita.events.register('command', 'sw_command', function(e)
    local args = e.command:args()
    if #args == 0 then return end
    if args[1]:lower() ~= '/sw' then return end
    e.blocked = true

    if args[2] then
        if args[2]:lower() == 'ad' then
            generic_warp()
        elseif args[2]:lower() == 's' and args[3] then
            warp_to(args[3])
        else
            print('[SW] Usage: /sw ad OR /sw s <destination>')
        end
    else
        print('[SW] Usage: /sw ad OR /sw s <destination>')
    end
end)

