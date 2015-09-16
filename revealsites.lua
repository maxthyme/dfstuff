local hid = df.global.world.world_data.sites
for k, v in ipairs(hid) do
	hid[k].flags.Undiscovered=false
	hid[k].flags[8]=true
end
