math.randomseed(os.time())

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "npc.lua" )
AddCSLuaFile( "weather.lua" )

include("shared.lua")
include("npc.lua")
include("weather.lua")

-- Gets the rate that zombies respawn as inputted in the main menu
function GetZrate()
    local zrate = GetConVar("rpvr_zrate"):GetInt()
    if zrate == 0 then
        error("[ERROR] rpvr_zrate is zero!")
    elseif zrate > 20 then
        print("[INFORMATION] rpvr_zrate works!")
    end
end
-- Define a hook function that runs the "atmos_enabled 1" command when rpvr_dncycle is set to 1
local function OnRpvrDnCycleChanged(pl, convar, oldValue, newValue)
    if convar:GetName() == "rpvr_dncycle" and newValue == "1" then
        RunConsoleCommand("atmos_enabled", "1")
    end
end

-- Add the hook to the OnClientLuaChanged event
hook.Add("OnClientLuaChanged", "OnRpvrDnCycleChanged", OnRpvrDnCycleChanged)
