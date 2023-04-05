-- Define the class for the zombie nextbot
DEFINE_BASECLASS("player_zombie")

-- Define the hearing range for the zombie
local HEARING_RANGE = 1000

-- Define a function to handle the sound heard event
local function OnSoundHeard(ent, soundName, volume, origin)
    -- Check if the entity making the sound is a player
    if IsValid(ent) and ent:IsPlayer() then
        -- Find all zombies within the hearing range
        local zombies = ents.FindInSphere(origin, HEARING_RANGE)
        
        -- Alert each zombie within range
        for _, zombie in ipairs(zombies) do
            if IsValid(zombie) and zombie:IsNPC() and zombie:GetClass() == "npc_zombie" then
                zombie:SetEnemy(ent)
                zombie:UpdateEnemyMemory(ent, origin)
            end
        end
    end
end

-- Add a hook to the "EntityEmitSound" event to detect player sounds
hook.Add("EntityEmitSound", "OnSoundHeard", OnSoundHeard)

-- Define the SpawnZombie function to spawn a zombie at a specified location
local function SpawnZombie(pos)
    -- Spawn the NPC
    local npc = ents.Create("npc_zombie")
    npc:SetPos(pos)
    npc:Spawn()
end

-- Define the Initialize function to set the zombie's model and hook into the sound detection system
function ENT:Initialize()
    -- Call the base class's Initialize function
    BaseClass.Initialize(self)
    
    -- Set the model of the zombie to headcrab zombie
    self:SetModel("models/headcrab.mdl")

    -- Hook into the sound detection system to make the zombies attack any player they hear
    hook.Add("EntityEmitSound", "OnSoundHeard", OnSoundHeard)

    -- Spawn zombies at the specified locations
    local spawnPositions = {
        Vector(-1000, -1000, 0),
        Vector(1000, 1000, 0),
        Vector(-500, 500, 0),
        Vector(-250, 250, 0),
        Vector(500, -500, 0),
        Vector(250, -250, 0),
    }
    for _, pos in ipairs(spawnPositions) do
        SpawnZombie(pos)
    end
end

