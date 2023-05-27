local current_version = "1.0.0";

if not get_mct then return end
local mct = get_mct();
if not mct then return end

local mct_mod = mct:register_mod("hanter_emp_random_fealty_mod");

mct_mod:set_title("hanter_emp_random_fealty_mod_title", true);
mct_mod:set_author("Hanter");
mct_mod:set_description("hanter_emp_random_fealty_mod_description", true);

-- mct_mod:set_workshop_id("");
mct_mod:set_version(current_version);
mct_mod:set_main_image("ui/mct/hanter_emp_random_fealty.png", 500, 500);

-- Enable/Disable Mod
local mct_option = mct_mod:add_new_option("hanter_emp_random_fealty_enabled","checkbox");
mct_option:set_text("hanter_emp_random_fealty_enabled_text", true);
mct_option:set_tooltip_text("hanter_emp_random_fealty_enabled_tooltip", true);
mct_option:set_default_value(true);

-- Adjust Min Random Fealty
local mct_option = mct_mod:add_new_option("hanter_emp_random_fealty_min","slider");
mct_option:set_text("hanter_emp_random_fealty_min_text", true);
mct_option:set_tooltip_text("hanter_emp_random_fealty_min_tooltip", true);
mct_option:slider_set_min_max(0,10);
mct_option:slider_set_step_size(1);
mct_option:set_default_value(2);

-- Adjust Max Random Fealty
local mct_option = mct_mod:add_new_option("hanter_emp_random_fealty_max","slider");
mct_option:set_text("hanter_emp_random_fealty_max_text", true);
mct_option:set_tooltip_text("hanter_emp_random_fealty_max_tooltip", true);
mct_option:slider_set_min_max(0,10);
mct_option:slider_set_step_size(1);
mct_option:set_default_value(7);