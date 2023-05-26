--[[
    Custom logging template    
--]]
local function out_h (str)
    out("[hanter_emp_random_fealty][hanter_emp_random_fealty.lua] "..str);
end

--[[
    Loop through the global EMPIRE_ELECTOR_COUNTS table (defined in vanilla wh2_dlc13_empire_politics.lua)
    and randomize the fealty of any applicable factions.
    
    Any mods that add/modify Elector Counts (such as graetor's Sylvania Overhaul) will work 
    as long as it also updates EMPIRE_ELECTOR_COUNTS
--]]
function hanter_randomize_fealty()
    out_h("***************************************************");
    out_h("* Begin randomising Fealty for all Elector Counts *");
    out_h("***************************************************");
    for k,v in pairs(EMPIRE_ELECTOR_COUNTS) do
        out_h("Randomizing Fealty for: "..k.." ("..v["faction_key"]..")");
        if v["faction_key"]~="" then
            local faction = cm:model():world():faction_by_key(v["faction_key"]);
            -- reset fealty to zero
            empire_modify_elector_loyalty(k,"base_fealty", -faction:pooled_resource_manager():resource("emp_loyalty"):value());
            -- now randomize fealty
            local r = cm:random_number(7,2)
            empire_modify_elector_loyalty(k,"base_fealty",r);
            out_h("\tFealty of "..v["faction_key"].." set to "..tostring(r));
        else
            out_h("\tSkipped");
        end
    end
end

--[[
    Use this callback so we randomize fealty only at the start of a new game
--]]
cm:add_first_tick_callback_new(function()
    -- Check if human player with Fealty mechanic for Empire
    local player_factions = cm:get_human_factions();
    for i = 1, #player_factions do
		if cm:get_faction(player_factions[i]):pooled_resource_manager():resource("emp_loyalty"):is_null_interface() == false then
            out_h("Human Empire player faction with Fealty mechanic detected: "..player_factions[i]..". Adding non-persistent faction turn start listener");
            -- Add a turn start listener that triggers only once. Effectively, this will be called only on the first turn of a new game
            cm:add_faction_turn_start_listener_by_name(
                "hanter_emp_random_fealty_listener_"..player_factions[i],
                player_factions[i],
                hanter_randomize_fealty,
                false
        );
		end
	end
end);