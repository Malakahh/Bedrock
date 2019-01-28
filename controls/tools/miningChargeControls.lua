local frame = {}
frame.diggables = {
	"bedrock",
	"bedrock-coal",
	"bedrock-copper",
	"bedrock-iron"
}

frame.miningChargeName = "miningCharge"
frame.miningChargeDamage = 250
frame.miningCharges = {}

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

function frame:OnEntityCreated(event)
	local e = {
		entity = event.created_entity,
		started = false,
	}

	if e.entity.name == self.miningChargeName then
		table.insert(self.miningCharges, e)
	end
end

function frame:on_built_entity(event)
	self:OnEntityCreated(event)
end

function frame:on_robot_built_entity(event)
	self:OnEntityCreated(event)
end

function frame:on_tick(event)
	for k,v in pairs(self.miningCharges) do
		if not v.started and v.entity and v.entity.valid then
			local inventory = v.entity.get_inventory(defines.inventory.turret_ammo)
			if inventory then
				local itemStack = inventory[1]
				if itemStack and itemStack.valid_for_read then
					local count = itemStack.count
					if count > 0 then -- We have determined that we have placed ammo
						v.started = true
						v.tick = event.tick
						script.on_nth_tick(event.tick + 60, self.OnNthTick)
					end
				end
			end
		end
	end
end

function frame:Explode(entity)
	local prototype = game.entity_prototypes[frame.miningChargeName]
	if prototype then
		local attackParameters = prototype.attack_parameters
		if attackParameters then
			local range = attackParameters.range
			entity.surface.create_entity({name="big-explosion", position=entity.position})

			if range then
				range = math.ceil(range)
				local tl = self.vectorLib.Add(entity.position, self.vectorLib.ToStandard(-range, -range))
				local br = self.vectorLib.Add(entity.position, self.vectorLib.ToStandard(range, range))
				local entities = game.surfaces["nauvis"].find_entities({tl, br})

				for k,v in pairs(entities) do
					if self.vectorLib.Dist(v.position, entity.position) <= range then
						if self:IsEntityDiggable(v) then
							v.destroy()
						elseif v.health and v.health > 0 then
							v.damage(self.miningChargeDamage, entity.force, "explosion")
						end
					end
				end
			end
		end
	end
end

function frame.OnNthTick(event)
	for k,v in pairs(frame.miningCharges) do
		if v.entity and v.entity.valid then
			if event.tick >= v.tick + 60 then -- new or Every second (60 game ticks)
				local inventory = v.entity.get_inventory(defines.inventory.turret_ammo)
				if inventory then
					local itemStack = inventory[1]
					if itemStack and itemStack.valid_for_read then
						local count = itemStack.count
						if count > 0 then
							script.on_nth_tick(v.tick + 60, nil) -- reset

							if not v.tick then
								v.tick = event.tick
								script.on_nth_tick(v.tick + 60, frame.OnNthTick) -- resub
							else
								itemStack.drain_ammo(1)
								v.tick = event.tick
								if count == 1 then -- If we depleted ammo
									frame.Explode(frame, v.entity)
									v.entity.destroy()
									frame.miningCharges[k] = nil
								else
									script.on_nth_tick(v.tick + 60, frame.OnNthTick) -- resub
								end
							end

						end
					else
						frame.Explode(frame, v.entity)
						v.entity.destroy()
						frame.miningCharges[k] = nil
					end
				end
			end
		else
			frame.miningCharges[k] = nil
		end		
	end
end

return frame