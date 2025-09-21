-- superwarps.lua (fixed)
addon.name    = 'superwarps'
addon.author  = 'aryl'
addon.version = '0.2'
addon.desc    = 'Warp system for Sortie, Odyssey, Apollyon, Temenos, and Spatial Displacement'

require('common')
local helper = require('helper')  -- helper.lua

local mm = AshitaCore:GetMemoryManager()
local qcmd = function(cmd) AshitaCore:GetChatManager():QueueCommand(1, cmd) end

-- Define S as a set-like utility
S = function(t)
    local set = {}
    for _, v in ipairs(t) do
        set[v] = true
    end
    return set
end

-- Load zone modules
local zones = {
    sortie    = require('zones.sortie'),
    odyssey   = require('zones.odyssey'),
    temenos   = require('zones.temenos'),
    apollyon  = require('zones.apollyon'),
    spd       = require('zones.spd'),
}

-- Utility: get NPC by target
local function get_npc_by_target()
    local target = mm:GetTarget()
    if not target or target.Index == 0 then return nil end
    return target.Name:lower()
end

-- Utility: same zone check
local function is_same_zone(npc_zone)
    local player_zone = mm:GetParty():GetMemberZone(0)
    return player_zone == npc_zone
end

-- Generic warp (/sw ad)
local function generic_warp()
    local npc_name = get_npc_by_target()
    if not npc_name then return end

    for _, z in pairs(zones) do
        local npc = z[npc_name]
        if npc and is_same_zone(npc.zone) then
            -- Check Aminon Hardmode
            if npc.hardmode then
                local menu_packet = helper.get_menu_packet(npc.menuId)
                local dest = npc.hardmode(menu_packet)
                local optionIndex = npc.options[dest:lower()]
                if optionIndex then
                    qcmd(string.format('/menu %d %d', npc.menuId, optionIndex))
                    print('[SW] Warping to ' .. dest)
                    return
                end
            else
                if npc.links and #npc.links > 0 then
                    local dest = npc.links[1]
                    local optionIndex = npc.options[dest:lower()]
                    qcmd(string.format('/menu %d %d', npc.menuId, optionIndex))
                    print('[SW] Warping to ' .. dest)
                    return
                end
            end
        end
    end
end

-- Direct warp (/sw s <destination>)
local function warp_to(dest_name)
    local npc_name = get_npc_by_target()
    if not npc_name then return end

    for _, z in pairs(zones) do
        local npc = z[npc_name]
        if npc and is_same_zone(npc.zone) then
            local optionIndex
            if npc.hardmode then
                local menu_packet = helper.get_menu_packet(npc.menuId)
                local dest = npc.hardmode(menu_packet)
                optionIndex = npc.options[dest:lower()]
            else
                optionIndex = npc.options[dest_name:lower()]
            end
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
