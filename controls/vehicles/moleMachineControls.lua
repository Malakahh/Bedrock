local frame = {}
frame.diggables = {
	"bedrock",
	"tree%-",
	"%-tree",
	"%-trunk"
}

local vehiclePrototype = "moleMachine"
local diggingWidth = 1

function frame:CalcDigVector(vehicle, targetedEntity)

	local entityPos = {
		x = math.floor((targetedEntity.position.x or targetedEntity.position[1]) + 0.5),
		y = math.floor((targetedEntity.position.y or targetedEntity.position[2]) + 0.5)
	}

	-- Determine digVec based on vehicle orientation. Rotate by pi/2rads to correct to standard math. For shame Wube Software
	local rotationInRad = vehicle.orientation * math.pi * 2
	local digVec = {
		x = math.sin(rotationInRad + math.pi / 2),
		y = -math.cos(rotationInRad + math.pi / 2)
	}

	local coords = {}
	local halfWidth = math.floor(diggingWidth / 2)
	for i = -halfWidth, halfWidth, 1 do
		table.insert(coords, {
			x = math.floor( entityPos.x + digVec.x * i * 2 + 0.5),
			y = math.floor( entityPos.y + digVec.y * i * 2 + 0.5)
		})

		table.insert(coords, {
			x = math.floor( entityPos.x - digVec.x * i * 2 + 0.5),
			y = math.floor( entityPos.y - digVec.y * i * 2 + 0.5)
		})
	end

	return coords
end

function frame:IsEntityDiggable(entity)
	 local name = entity.name

	 for _,v in pairs(self.diggables) do
	 	if name:match(v) then
	 		return true
	 	end
	 end

	 return false
end

function frame:InsertItems(items, vehicle)
	for _, v in pairs(items) do
		local remaining = v.count - vehicle.insert(v)
		if remaining > 0 then
			vehicle.surface.spill_item_stack(vehicle.position, {name = v.name, count = remaining}, true)
		end
	end
end

function frame:DigRock(event)
	local entity = event.entity
	local damageType = event.damage_type
	local cause = event.cause

	-- Escape
	if not entity or not damageType or not cause then return end

	if damageType.name:match("impact") and cause.name:match(vehiclePrototype) and self:IsEntityDiggable(entity) then
		local coords = self:CalcDigVector(cause, entity)
		local entities = {}

		for i = 1, #coords, 1 do
			local e = game.surfaces["nauvis"].find_entities_filtered({position = coords[i]})[1]

			if e and self:IsEntityDiggable(e) then
				local products = e.prototype.mineable_properties.products
				if #products > 0 then
					local items = {}
					for k,v in pairs(products) do
						items[k] = {
							name = v.name,
							count = v.amount
						}
					end

					self:InsertItems(items, cause)
				end

				e.destroy()
			end
		end
	end
end

function frame:on_entity_damaged(event)
	self:DigRock(event)
end

local function onMoleMachineIncreaseWidth(event)
	diggingWidth = diggingWidth + 1
	game.players[event.player_index].print(diggingWidth)
end
script.on_event("bedrockMoleMachineIncreaseWidthHotkey", onMoleMachineIncreaseWidth)

local function onMoleMachineDecreaseWidth(event)
	diggingWidth = diggingWidth - 1

	if diggingWidth <= 0 then
		diggingWidth = 1
	end

	game.players[event.player_index].print(diggingWidth)
end
script.on_event("bedrockMoleMachineDecreaseWidthHotkey", onMoleMachineDecreaseWidth)

return frame