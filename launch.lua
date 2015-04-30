--Based on propel.lua by Roses, molested by Rumrusher and I until this happened, sorry.
function launch(unitSource,unitTarget)

local curpos
	if df.global.ui_advmode.menu==1 then
		curpos=df.global.cursor
	else
		print ("No cursor located!  You would have slammed into the ground and exploded.")
		return
	end


 local count=0
 local l = df.global.world.proj_list
 local lastlist=l
 l=l.next
 while l do
  count=count+1
  if l.next==nil then
   lastlist=l
  end
  l = l.next
 end

resultx = curpos.x - unitSource.pos.x
resulty = curpos.y - unitSource.pos.y
resultz = curpos.z - unitSource.pos.z

	
 newlist = df.proj_list_link:new()
 lastlist.next=newlist
 newlist.prev=lastlist
 proj = df.proj_unitst:new()
 newlist.item=proj
 proj.link=newlist
 proj.id=df.global.proj_next_id
 df.global.proj_next_id=df.global.proj_next_id+1
 proj.unit=unitSource
 proj.origin_pos.x=unitSource.pos.x
 proj.origin_pos.y=unitSource.pos.y
 proj.origin_pos.z=unitSource.pos.z
 proj.target_pos.x=curpos.x
 proj.target_pos.y=curpos.y
 proj.target_pos.z=curpos.z
 proj.prev_pos.x=unitSource.pos.x
 proj.prev_pos.y=unitSource.pos.y
 proj.prev_pos.z=unitSource.pos.z
 proj.cur_pos.x=unitSource.pos.x
 proj.cur_pos.y=unitSource.pos.y
 proj.cur_pos.z=unitSource.pos.z
 proj.flags.no_impact_destroy=true
 proj.flags.piercing=true
 proj.flags.high_flying=true
 proj.flags.parabolic=true
 proj.flags.no_collide=true
 proj.flags.unk9=true
 proj.speed_x=resultx*10000
 proj.speed_y=resulty*10000
 proj.speed_z=resultz*10000
 unitoccupancy = dfhack.maps.ensureTileBlock(unitSource.pos).occupancy[unitSource.pos.x%16][unitSource.pos.y%16]
 if not unitSource.flags1.on_ground then 
  unitoccupancy.unit = false 
 else 
  unitoccupancy.unit_grounded = false 
 end
 unitSource.flags1.projectile=true
 unitSource.flags1.on_ground=false
 end

unitTarget = curpos
if df.global.world.units.active[0].job.hunt_target==nil then
unitSource = df.global.world.units.active[0]
else
unitSource = df.global.world.units.active[0].job.hunt_target
end
 
launch(unitSource,unitTarget)
