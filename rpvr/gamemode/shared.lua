GM.Name = "Rp_VR"
GM.Author = "N/A"
GM.Email = "N/A"
GM.Website = "N/A"

function GM:Initialize()
    local rpvr_zrate = GetConVarNumber("rpvr_zrate")
    local zrate_init = math.floor(rpvr_zrate)
    print("zrate_init: " .. zrate_init)
end
