--[[
    These default limits will apply if not overridden by MCT
--]]
local settings = {
    enabled = true,
    min_fealty = 2,
    max_fealty = 7,
}

--[[
    Safely enable MCT configuration if applicable.
    Will not do anything if MCT is not enabled.
    Documentation at https://chadvandy.github.io/mod_configuration_tool/topics/manual.md.html#Hook_Into_Scripts
    
    Persistence set to false as this mod only activates once at the start of the campagin.
    In future, if I add a feature to enable randomisation mid-campaign, I may need to revisit the impact of this persistence setting
--]]
core:add_listener(
    "EmpRandomFealtySettingsLoader",
    "MctInitialized",
    true,
    function(context)
        local mct = context:mct();
        local erf = mct:get_mod_by_key("hanter_emp_random_fealty_mod");
        settings.enabled = erf:get_option_by_key("hanter_emp_random_fealty_enabled"):get_finalized_setting();
        settings.min_fealty = erf:get_option_by_key("hanter_emp_random_fealty_min"):get_finalized_setting();
        settings.max_fealty = erf:get_option_by_key("hanter_emp_random_fealty_max"):get_finalized_setting();
    end,
    false -- non-persistent listener
)

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
    if not settings.enabled then
        out_h("Elector Counts Fealty Randomisation disabled.");
        return;
    end
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
            local r = cm:random_number(settings.max_fealty,settings.min_fealty);
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