local unit = df.global.world.units.active[0]
local attks = unit.actions
for k,v in ipairs(attks) do
	if attks[k].type==1 and attks[k].data.attack.attack_item_id then
		local item = df.item.find(attks[k].data.attack.attack_item_id)
		if item.flags.artifact == true then
		item.subtype.attacks[0].velocity_mult = 2700000
		attks[k].data.attack.unk_30=99999999
		end
	end
end
