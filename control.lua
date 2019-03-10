
--To Implement--

function initialize()
	
end



local function show_selected_pole_neighbors(event)
	local item = game.get_player(event.player_index).selected
	local neighbors
	
	if(item ~= nil) then
		if(item.type == "electric-pole") then
			game.print("Electric pole has neighbors:")
			for _, neighbor in pairs(item.neighbours["copper"]) do
				game.print(neighbor.unit_number)
			end
		end
	end
end


--[[ Whole thing is event handlers at this stage]]--

local e=defines.events
local remove_events = {e.on_player_mined_entity, e.on_robot_pre_mined, e.on_entity_died}
local add_events = {e.on_built_entity, e.on_robot_built_entity}

script.on_event(e.on_selected_entity_changed, show_selected_pole_neighbors)
script.on_init(e.on_init, initialize)