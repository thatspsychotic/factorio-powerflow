
--To Implement--

pole_data = {
	-- vanilla & similar
	[{"big-electric-pole"}] = {
		["x"] = 0.025,
		["rating"] = 750,
	},
	[{"medium-electric-pole"}] = {
		["x"] = 0.15,
		["rating"] = 200,
	},	
	[{"small-electric-pole"}] = {
		["x"] = 0.4,
		["rating"] = 50,
	},	
	[{"substation"}] = {
		["x"] = 0.2,
		["rating"] = 300,
	},	
}

local function find_all_poles()
	all_poles = {}
	for _, surface in pairs(game.surfaces) do
		for _, pole in pairs(surface.find_entities_filtered{type="electric-pole"}) do
			all_poles[pole.unit_number] = pole
		end
	end
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

local function initialize()
	print("Total number of electric poles on map")
	print(table.getn(game.surfaces[1].find_entities_filtered(type="electric-pole)))
	game.print("It worked!")
end

--[[ Whole thing is event handlers at this stage]]--

local e=defines.events
local remove_events = {e.on_player_mined_entity, e.on_robot_pre_mined, e.on_entity_died}
local add_events = {e.on_built_entity, e.on_robot_built_entity}

script.on_event(e.on_selected_entity_changed, show_selected_pole_neighbors)
script.on_init(initialize)