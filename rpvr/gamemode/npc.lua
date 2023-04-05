function SpawnZombies()
  local spawnPoints = ents.FindByClass("info_player_start") -- Find all spawn points in the map
  for i=1, 5 do -- Spawn 5 zombies
    local spawnIndex = math.random(1, #spawnPoints) -- Get a random spawn point index
    local zombie = ents.Create("npc_fastzombie") -- Create a fast zombie entity
    zombie:SetPos(spawnPoints[spawnIndex]:GetPos()) -- Set zombie position to the spawn point
    zombie:SetKeyValue("spawnflags", "512") -- Set the zombie's spawn flags to enable it to see farther
    zombie:SetKeyValue("MaxRange1", "500") -- Set the maximum range of the zombie's vision to 500 units
    zombie:SetKeyValue("FieldOfView", "120") -- Set the zombie's field of view to 120 degrees
    zombie:Spawn() -- Spawn the zombie
  end
end

timer.Create("SpawnZombiesTimer", 10, 0, SpawnZombies) -- Create a timer that spawns zombies every 10 seconds
