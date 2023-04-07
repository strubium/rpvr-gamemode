hook.Add("EntityTakeDamage", "StopZombieSchedule", function(ent, dmginfo)
    if ent:IsNPC() and ent:GetClass() == "npc_fastzombie" and dmginfo:GetAttacker():IsPlayer() then
        ent:ClearSchedule() -- Clear the current schedule of the zombie
        ent:AddEntityRelationship(dmginfo:GetAttacker(), D_HT, 99) -- Make the zombie hate the player
        ent:SetTarget(dmginfo:GetAttacker()) -- Set the player as the zombie's target
        ent:SetNPCState(NPC_STATE_COMBAT) -- Set the zombie's state to combat
    end
end)

function SpawnZombies()
  for i=1, 7 do -- Spawn 5 zombies
    local zombie = ents.Create("npc_fastzombie") -- Create a fast zombie entity
    local spawnVector = Vector(math.random(-5000, 5000), math.random(-5000, 5000), 0) -- Generate a random spawn vector within a 1000 unit radius
    zombie:SetPos(spawnVector) -- Set zombie position to the spawn vector
    zombie:SetKeyValue("spawnflags", "512") -- Set the zombie's spawn flags to enable it to see farther
    zombie:SetKeyValue("MaxRange1", "1000")-- Set the maximum range of the zombie's vision to 500 units
    zombie:SetKeyValue("FieldOfView", "120") -- Set the zombie's field of view to 120 degrees
    zombie:Spawn() -- Spawn the zombie
    zombie:CapabilitiesAdd(CAP_MOVE_GROUND) -- Add the capability to move on the ground
    zombie:SetSchedule(SCHED_IDLE_WANDER) -- Set the initial schedule to idle wandering
    timer.Simple(2, function() -- Start a timer that moves the zombie to a random location after 2 seconds
      if IsValid(zombie) and zombie:IsNPC() and zombie:GetNPCState() == NPC_STATE_IDLE then -- Check if the zombie is still idle
        local targetVector = Vector(math.random(-1000, 1000), math.random(-1000, 1000), 0) -- Generate a random target vector within a 1000 unit radius
        zombie:SetLastPosition(targetVector) -- Set the last position of the zombie to the target vector
        zombie:SetSchedule(SCHED_FORCED_GO) -- Set the new schedule to forced movement towards the target vector
      end
    end)
  end
end

timer.Create("SpawnZombiesTimer", 10, 0, SpawnZombies) -- Create a timer that spawns zombies every 10 seconds
