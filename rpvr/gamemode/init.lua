math.randomseed(os.time())

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "npc.lua" )

include("shared.lua")
include("npc.lua")
include("weather.lua")

function GetZrate()
    local rpvr_zrate = GetConVar("rpvr_zrate")
    if rpvr_zrate > 20 then
        print("wowe")
    end
end