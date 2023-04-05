
function SpawnRandomNPC()
    -- define NPC types and spawn positions
    local npcTypes = { "npc_citizen", "npc_combine_s" }
    local spawnPositions = {
        Vector(-1000, -1000, 0),
        Vector(1000, 1000, 0),
        Vector(-500, 500, 0),
		Vector(-250, 250, 0),
        Vector(500, -500, 0),
		Vector(250, -250, 0),
    }

    -- pick a random NPC type and spawn position
    local npcType = table.Random(npcTypes)
    local spawnPos = table.Random(spawnPositions)

    -- spawn the NPC
    local npc = ents.Create(npcType)
    npc:SetPos(spawnPos)
	npc:SetKeyValue("additionalequipment", "weapon_ar2") -- Add additional equipment to NPC
    npc:Spawn()
end

-- spawn NPCs every 5 seconds
timer.Create("SpawnRandomNPCs", 5, 0, SpawnRandomNPC)
