math.randomseed(os.time())

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "npc.lua" )
AddCSLuaFile( "weather.lua" )

include("shared.lua")
include("npc.lua")
include("weather.lua")

function GetZrate()
    local zrate = GetConVar("rpvr_zrate"):GetInt()
    if zrate == 0 then
        error("[ERROR] rpvr_zrate is zero!")
    elseif zrate > 20 then
        print("[INFORMATION] rpvr_zrate works!")
    end
end
