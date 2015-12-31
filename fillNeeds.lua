local utils=require('utils')
local args = utils.processArgs({...}, validArgs)

local unit = args.unit and df.unit.find(args.unit) or dfhack.gui.getSelectedUnit(true)

if not unit then qerror('A unit must be specified or selected.') end

function satisfyNeeds(unit,needs)
    local needs=unit.status.current_soul.personality.unk_v4201_1a
    for k,v in ipairs(needs) do
       needs[k].unk_8 = 400
    end

end

    satisfyNeeds(unit,needs)



