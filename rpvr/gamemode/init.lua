math.randomseed(os.time())

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "npc.lua" )

include("shared.lua")
include("npc.lua")
include("weather.lua")

function GetZrate()
    local zrate = GetConVar("rpvr_zrate")
    if zrate > 20 then error( "[INFORMATION] rpvr_zrate works!!" )
    end
end
