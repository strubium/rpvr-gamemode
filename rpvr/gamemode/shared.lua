GM.Name = "Rp_VR"
GM.Author = "N/A"
GM.Email = "N/A"
GM.Website = "N/A"

function GM:Initialize()
    local rpvr_zrate = GetConVarNumber("rpvr_zrate")
    local zrate_init = math.floor(rpvr_zrate)
    ErrorNoHalt("zrate_init: " .. zrate_init .. "\n")
    
    local rpvr_dncycle = GetConVarNumber("rpvr_dncycle")
    if rpvr_dncycle == 1 or rpvr_dncycle == 3 then
        EnableAtmos()
    end
end

function EnableAtmos()
    RunConsoleCommand("atmos_enabled", "1")
end
