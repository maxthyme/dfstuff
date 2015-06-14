local utils = require 'utils'

validArgs = validArgs or utils.invert({
 'help',
 'item',
 'unit',
 'first'
})

local args = utils.processArgs({...}, validArgs)

if args.help then
 print(
[[names.lua
arguments:
    -help
        print this help message
    -item 
	if currently targeting an item
    -unit 
	if currently targeting a unit
    -first
	if a first name is desired
]])
 return
end

if not df.viewscreen_layer_choose_language_namest:is_instance(dfhack.gui.getCurViewscreen()) then
	choices = df.new(df.viewscreen_setupadventurest) ; choices.subscreen = 3 ; gui = require 'gui' ; gui.simulateInput(choices, 'A_RANDOM_NAME') ; gui.simulateInput(choices, 'A_CUST_NAME')
end

if args.item then
	fact = dfhack.gui.getCurViewscreen().parent.item.general_refs[0].artifact_id
	trg = df.artifact_record.find(fact)
end

if args.unit then
	trg = dfhack.gui.getCurViewscreen().parent.unit
end

if args.first then
	trg.name.first_name = args.first
end

function newName()
 	newn = dfhack.gui.getCurViewscreen().name
	oldn = trg.name
 	oldn.words[0] = newn.words[0]
 	oldn.words[1] = newn.words[1]
 	oldn.words[2] = newn.words[2]
 	oldn.words[3] = newn.words[3]
 	oldn.words[4] = newn.words[4]
 	oldn.words[5] = newn.words[5]
 	oldn.words[6] = newn.words[6]
 	oldn.parts_of_speech[0] = newn.parts_of_speech[0]
 	oldn.parts_of_speech[1] = newn.parts_of_speech[1]
 	oldn.parts_of_speech[2] = newn.parts_of_speech[2]
 	oldn.parts_of_speech[3] = newn.parts_of_speech[3]
 	oldn.parts_of_speech[4] = newn.parts_of_speech[4]
 	oldn.parts_of_speech[5] = newn.parts_of_speech[5]
 	oldn.parts_of_speech[6] = newn.parts_of_speech[6]
 	oldn.language = newn.language
 	oldn.has_name = newn.has_name
end
newName()
