-- libs
local events = require "libs.BetterEvents.BetterEvents"
local perlin = require "libs.PerlinNoise.Perlin"
local vector = require "libs.Vector.Vector"

-- controls
local moleMachineControls = require "controls.vehicles.moleMachineControls"
events.RegisterForEvents(moleMachineControls)

local miningGrenadeControls = require "controls.tools.miningGrenadeControls"
miningGrenadeControls:Init(vector)
events.RegisterForEvents(miningGrenadeControls)

local miningChargeControls = require "controls.tools.miningChargeControls"
miningChargeControls:Init(vector)
events.RegisterForEvents(miningChargeControls)




local frame = {}
events.RegisterForEvents(frame)

local function CanSpawn(surface, x, y)
	local tile = surface.get_tile(x, y)

	-- don't place in water
	if tile.collides_with("water-tile") then
		return ""
	end

	-- don't place in starting area
	local playerStartingPoint = surface.map_gen_settings.starting_points[1]
	local saWidth = settings.global["bedrock-starting-area-width"].value
	local saHeight = settings.global["bedrock-starting-area-height"].value

	local pSP = { x = playerStartingPoint.x or playerStartingPoint[1], y = playerStartingPoint.y or playerStartingPoint[2] }
	local tl = { x = pSP.x - saWidth / 2, y = pSP.y + saHeight / 2 }
	local br = { x = pSP.x + saWidth / 2, y = pSP.y - saHeight / 2 }

	if x >= tl.x and x <= br.x and
		y <= tl.y and y >= br.y then
		return ""
	end

	-- entities
	local p1 = {x = x - 0.5, y = y - 0.5 }
	local p2 = {x = x + 0.5, y = y + 0.5 }

	local entities = surface.find_entities({p1, p2})

	if entities ~= nil and #entities > 0 then
		return ""
	end

	-- cave stuff
	local freq = 1 / settings.global["bedrock-noise-period"].value
	local octs = settings.global["bedrock-noise-octaves"].value
	local persistance = settings.global["bedrock-noise-persistence"].value
	local perlinVal = perlin:fBm(x * freq, y * freq, persistance, octs)

	if perlinVal >= settings.global["bedrock-cave-level"].value then
		return ""
	elseif perlinVal <= settings.global["bedrock-resource-level"].value then
		local i = math.random(1, 3)

		if i == 1 then
			return "bedrock-coal"
		elseif i == 2 then
			return "bedrock-iron"
		elseif i == 3 then
			return "bedrock-copper"
		end
	else
		return "bedrock"
	end
end

function frame:on_chunk_generated(event)
	if not perlin.isInitialized then
		perlin:init()
	end

	local tl = event.area.left_top
	local br = event.area.right_bottom

	for x = tl.x, br.x, 1 do
		if x % 2 == 0 then
			for y = tl.y, br.y, 1 do
				if y % 2 == 0 then
					local toSpawn = CanSpawn(event.surface, x, y)
					if toSpawn ~= "" then
						event.surface.create_entity({name=toSpawn, position={x, y}})
					end
				end
			end
		end
	end
end