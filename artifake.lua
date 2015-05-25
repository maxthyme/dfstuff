function weapon()
		df.global.world.units.active[0].flags1.has_mood=true
		df.global.world.units.active[0].mood=0
		df.global.world.units.active[0].job.current_job.job_type=57
		df.global.world.units.active[0].job.mood_skill=27
end

function armor()
		df.global.world.units.active[0].flags1.has_mood=true
		df.global.world.units.active[0].mood=0
		df.global.world.units.active[0].job.current_job.job_type=57
		df.global.world.units.active[0].job.mood_skill=28
end

local opt = ...
local profilename

if opt then
	if opt=="w" then
		weapon()
		return
	end
	if opt=="a" then
		armor()
		return
	end
else
	print ("Use this with a unit that already has preferences and preferably an artifact name set.")
	print ("After starting a job, ideally at a magma forge, with advfort, this can be used to fake an artifact.")
	print ("w		-- use this option for a weapon artifact.")
	print ("a		-- use this option for an armor artifact.")
	print ("I haven't added more types yet because I'm still trying to get everything done reliably.")
	print ("prefchange can be used for the preferences, I suppose I should write something for the names.")
	end
