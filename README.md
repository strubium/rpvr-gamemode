# rpvr-gamemode
A gamemode for garry's mod I am making to learn gLua and all its magical BS.  

## Features
* A system for spawning npc's at random points (Spawns every 10 seconds, planned to only spawn durning "night")
* A day and night system (Not implemented, going to use Atoms) 
* Zombie NPC's, see below


## The Zombies
I may have gotten over my head by imagining a super smart nextbot but he it goes:
* Zombies spawn at random points, and "explore" random areas until finding a enemy 
* Zombies are planned to spawn only during the night
* During the day, they retreat to a "hiding spot" not by the player and only if they are really close
* When it is night, any player made noises can lure zombies to the players location, where they will attack. 

## Current Convars
<code>rpvr_zrate</code> Controls how fast zombies spawn a night (Not Implemented)

<code>rpvr_zhear</code> Controls the hearing radius of zombues (Not Implemented)

<code>rpvr_dncycle</code> Controls if time will progress (Not Implemented)

<code>rpvr_drate</code> Controls how long days are (Not Implemented)

<code>rpvr_nrate</code> Controls how long nights are (Not Implemented)

<code>rpvr_zombie_damage</code> Controls the damage of zombies againist players (Not Implemented)

<code>rpvr_max_zombies</code> Controls how many zombies will be spawned durning the night (Not Implemented)

## Bugs
* Zombies spawn under the map where ground isnt completly flat
* Zombies spawn inside walls 
* zombies will not spawn on second floors and so on

Fix? 
-- Find a random walkable point

local navmesh = navmesh.Find(Vector(0, 0, 0), 500, 100, 50)

local randomPoint = navmesh:GetRandomPoint()

-- Spawn the npc_fastzombie at the random point
local zombie = ents.Create("npc_fastzombie")

zombie:SetPos(randomPoint)

zombie:Spawn()
