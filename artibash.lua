local unit = df.global.world.units.active[0]
local attks = unit.actions
for k in ipairs(attks) do
	if attks[k].type==1 and attks[k].data.attack.attack_item_id then
		local item = df.item.find(attks[k].data.attack.attack_item_id)
		if item.flags.artifact == true then
			for v = 0,1 do
			item.subtype.attacks[v].velocity_mult = 2700000
		attks[k].data.attack.unk_30=99999999
		attks[k].data.attack.unk_3c=999
		end
	end
end
