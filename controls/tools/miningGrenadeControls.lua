local frame = {}
frame.diggables = {
	"bedrock",
	"bedrock-coal",
	"bedrock-copper",
	"bedrock-iron"
}

frame.projectiles = {
	{ name = "miningGrenadeMk1", radius = math.ceil(10) }
}

frame.entitiesToDelete = {}

function frame:Init(vectorLib)
	self.vectorLib = vectorLib
end

function frame:IsEntityDiggable(entity)
	 local name = entity.name

	 for _,v in pairs(self.diggables) do
	 	if name == v then
	 		return true
	 	end
	 end

	 return false
end

function frame:on_player_used_capsule(event)
	local position = self.vectorLib.ToStandard(event.position)
	local itemPrototype = event.item

	local radius = nil
	for k,v in pairs(self.projectiles) do
		if not radius and itemPrototype.name == v.name then
			radius = math.ceil(v.radius)
		end
	end

	if radius then
		local tl = self.vectorLib.Add(position, self.vectorLib.ToStandard(-radius, -radius))
		local br = self.vectorLib.Add(position, self.vectorLib.ToStandard(radius, radius))
		local entities = game.surfaces["nauvis"].find_entities({tl, br})

		local entitiesToDeleteTable = {}

		for k,v in pairs(entities) do
			if self:IsEntityDiggable(v) then
				if self.vectorLib.Dist(v.position, position) <= radius then
					table.insert(entitiesToDeleteTable, v)
				end
			end
		end

		if #entitiesToDeleteTable > 0 then
			table.insert(self.entitiesToDelete, entitiesToDeleteTable)
		end
	end
end

function frame:on_entity_damaged(event)
	for k,v in pairs(self.entitiesToDelete) do
		if v[1] == event.entity then
			for i = 1, #v, 1 do
				v[i].destroy()
				v[i] = nil
			end

			self.entitiesToDelete[k] = nil
		end
	end
end

return frame