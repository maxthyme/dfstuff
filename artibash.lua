--The unk_30 and unk_3c effects were found by Putnam and Roses, respectively. 
--They are attack_velocity and attack_accuracy.
--This is just an early testing version to play around with.

local unit = df.global.world.units.active[0]
local attks = unit.actions
        for k in ipairs(attks) do
        if attks[k].type==1 and attks[k].data.attack.attack_item_id then
                local item = df.item.find(attks[k].data.attack.attack_item_id)
                        if item.flags.artifact == true then
                        local acks = item.subtype.attacks
                                for v in ipairs(acks)  do
                                acks[v].velocity_mult = 2700000
                        attks[k].data.attack.unk_30=99999999
                        attks[k].data.attack.unk_3c=999
                        end
                end
        end
end

