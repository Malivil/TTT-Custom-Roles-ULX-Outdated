--painful file to create will all ttt cvars

local function init()
    if GetConVarString("gamemode") == "terrortown" then --Only execute the following code if it's a terrortown gamemode
        --Preparation and post-round
        ULib.replicatedWritableCvar("ttt_preptime_seconds", "rep_ttt_preptime_seconds", GetConVarNumber("ttt_preptime_seconds"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_firstpreptime", "rep_ttt_firstpreptime", GetConVarNumber("ttt_firstpreptime"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_posttime_seconds", "rep_ttt_posttime_seconds", GetConVarNumber("ttt_posttime_seconds"), false, false, "xgui_gmsettings")

        --Round length
        ULib.replicatedWritableCvar("ttt_haste", "rep_ttt_haste", GetConVarNumber("ttt_haste"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_haste_starting_minutes", "rep_ttt_haste_starting_minutes", GetConVarNumber("ttt_haste_starting_minutes"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_haste_minutes_per_death", "rep_ttt_haste_minutes_per_death", GetConVarNumber("ttt_haste_minutes_per_death"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_roundtime_minutes", "rep_ttt_roundtime_minutes", GetConVarNumber("ttt_roundtime_minutes"), false, false, "xgui_gmsettings")

        --map switching and voting
        ULib.replicatedWritableCvar("ttt_round_limit", "rep_ttt_round_limit", GetConVarNumber("ttt_round_limit"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_time_limit_minutes", "rep_ttt_time_limit_minutes", GetConVarNumber("ttt_time_limit_minutes"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_always_use_mapcycle", "rep_ttt_always_use_mapcycle", GetConVarNumber("ttt_always_use_mapcycle"), false, false, "xgui_gmsettings")

        --traitor and detective counts
        ULib.replicatedWritableCvar("ttt_monster_pct", "rep_ttt_monster_pct", GetConVarNumber("ttt_monster_pct"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_traitor_pct", "rep_ttt_traitor_pct", GetConVarNumber("ttt_traitor_pct"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_traitor_max", "rep_ttt_traitor_max", GetConVarNumber("ttt_traitor_max"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_detective_pct", "rep_ttt_detective_pct", GetConVarNumber("ttt_detective_pct"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_detective_max", "rep_ttt_detective_max", GetConVarNumber("ttt_detective_max"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_detective_min_players", "rep_ttt_detective_min_players", GetConVarNumber("ttt_detective_min_players"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_detective_karma_min", "rep_ttt_detective_karma_min", GetConVarNumber("ttt_detective_karma_min"), false, false, "xgui_gmsettings")

        --custom roles
        ULib.replicatedWritableCvar("ttt_detraitor_enabled", "rep_ttt_detraitor_enabled", GetConVarNumber("ttt_detraitor_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_mercenary_enabled", "rep_ttt_mercenary_enabled", GetConVarNumber("ttt_mercenary_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_hypnotist_enabled", "rep_ttt_hypnotist_enabled", GetConVarNumber("ttt_hypnotist_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_glitch_enabled", "rep_ttt_glitch_enabled", GetConVarNumber("ttt_glitch_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_jester_enabled", "rep_ttt_jester_enabled", GetConVarNumber("ttt_jester_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_phantom_enabled", "rep_ttt_phantom_enabled", GetConVarNumber("ttt_phantom_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_zombie_enabled", "rep_ttt_zombie_enabled", GetConVarNumber("ttt_zombie_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_vampire_enabled", "rep_ttt_vampire_enabled", GetConVarNumber("ttt_vampire_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_swapper_enabled", "rep_ttt_swapper_enabled", GetConVarNumber("ttt_swapper_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_assassin_enabled", "rep_ttt_assassin_enabled", GetConVarNumber("ttt_assassin_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_killer_enabled", "rep_ttt_killer_enabled", GetConVarNumber("ttt_killer_enabled"), false, false, "xgui_gmsettings")

        --custom role chances
        ULib.replicatedWritableCvar("ttt_detraitor_chance", "rep_ttt_detraitor_chance", GetConVarNumber("ttt_detraitor_chance"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_mercenary_chance", "rep_ttt_mercenary_chance", GetConVarNumber("ttt_mercenary_chance"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_hypnotist_chance", "rep_ttt_hypnotist_chance", GetConVarNumber("ttt_hypnotist_chance"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_glitch_chance", "rep_ttt_glitch_chance", GetConVarNumber("ttt_glitch_chance"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_jester_chance", "rep_ttt_jester_chance", GetConVarNumber("ttt_jester_chance"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_phantom_chance", "rep_ttt_phantom_chance", GetConVarNumber("ttt_phantom_chance"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_zombie_chance", "rep_ttt_zombie_chance", GetConVarNumber("ttt_zombie_chance"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_vampire_chance", "rep_ttt_vampire_chance", GetConVarNumber("ttt_vampire_chance"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_swapper_chance", "rep_ttt_swapper_chance", GetConVarNumber("ttt_swapper_chance"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_assassin_chance", "rep_ttt_assassin_chance", GetConVarNumber("ttt_assassin_chance"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_killer_chance", "rep_ttt_killer_chance", GetConVarNumber("ttt_killer_chance"), false, false, "xgui_gmsettings")

        --custom role requirements
        ULib.replicatedWritableCvar("ttt_detraitor_required_traitors", "rep_ttt_detraitor_required_traitors", GetConVarNumber("ttt_detraitor_required_traitors"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_mercenary_required_innos", "rep_ttt_mercenary_required_innos", GetConVarNumber("ttt_mercenary_required_innos"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_hypnotist_required_traitors", "rep_ttt_hypnotist_required_traitors", GetConVarNumber("ttt_hypnotist_required_traitors"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_glitch_required_innos", "rep_ttt_glitch_required_innos", GetConVarNumber("ttt_glitch_required_innos"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_jester_required_innos", "rep_ttt_jester_required_innos", GetConVarNumber("ttt_jester_required_innos"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_phantom_required_innos", "rep_ttt_phantom_required_innos", GetConVarNumber("ttt_phantom_required_innos"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_zombie_required_traitors", "rep_ttt_zombie_required_traitors", GetConVarNumber("ttt_zombie_required_traitors"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_vampire_required_traitors", "rep_ttt_vampire_required_traitors", GetConVarNumber("ttt_vampire_required_traitors"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_swapper_required_innos", "rep_ttt_swapper_required_innos", GetConVarNumber("ttt_swapper_required_innos"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_assassin_required_traitors", "rep_ttt_assassin_required_traitors", GetConVarNumber("ttt_assassin_required_traitors"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_killer_required_innos", "rep_ttt_killer_required_innos", GetConVarNumber("ttt_killer_required_innos"), false, false, "xgui_gmsettings")

        -- Shared role configs
        ULib.replicatedWritableCvar("ttt_all_search_postround", "rep_ttt_all_search_postround", GetConVarNumber("ttt_all_search_postround"), false, false, "xgui_gmsettings")

        -- Shop configs
        ULib.replicatedWritableCvar("ttt_shop_merc_mode", "rep_ttt_shop_merc_mode", GetConVarNumber("ttt_shop_merc_mode"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_assassin_sync", "rep_ttt_shop_assassin_sync", GetConVarNumber("ttt_shop_assassin_sync"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_hypnotist_sync", "rep_ttt_shop_hypnotist_sync", GetConVarNumber("ttt_shop_hypnotist_sync"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_percent", "rep_ttt_shop_random_percent", GetConVarNumber("ttt_shop_random_percent"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_tra_percent", "rep_ttt_shop_random_tra_percent", GetConVarNumber("ttt_shop_random_tra_percent"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_asn_percent", "rep_ttt_shop_random_asn_percent", GetConVarNumber("ttt_shop_random_asn_percent"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_hyp_percent", "rep_ttt_shop_random_hyp_percent", GetConVarNumber("ttt_shop_random_hyp_percent"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_der_percent", "rep_ttt_shop_random_der_percent", GetConVarNumber("ttt_shop_random_der_percent"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_det_percent", "rep_ttt_shop_random_det_percent", GetConVarNumber("ttt_shop_random_det_percent"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_mer_percent", "rep_ttt_shop_random_mer_percent", GetConVarNumber("ttt_shop_random_mer_percent"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_vam_percent", "rep_ttt_shop_random_vam_percent", GetConVarNumber("ttt_shop_random_vam_percent"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_zom_percent", "rep_ttt_shop_random_zom_percent", GetConVarNumber("ttt_shop_random_zom_percent"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_kil_percent", "rep_ttt_shop_random_kil_percent", GetConVarNumber("ttt_shop_random_kil_percent"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_jes_percent", "rep_ttt_shop_random_jes_percent", GetConVarNumber("ttt_shop_random_jes_percent"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_swa_percent", "rep_ttt_shop_random_swa_percent", GetConVarNumber("ttt_shop_random_swa_percent"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_tra_enabled", "rep_ttt_shop_random_tra_enabled", GetConVarNumber("ttt_shop_random_tra_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_asn_enabled", "rep_ttt_shop_random_asn_enabled", GetConVarNumber("ttt_shop_random_asn_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_hyp_enabled", "rep_ttt_shop_random_hyp_enabled", GetConVarNumber("ttt_shop_random_hyp_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_der_enabled", "rep_ttt_shop_random_der_enabled", GetConVarNumber("ttt_shop_random_der_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_det_enabled", "rep_ttt_shop_random_det_enabled", GetConVarNumber("ttt_shop_random_det_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_mer_enabled", "rep_ttt_shop_random_mer_enabled", GetConVarNumber("ttt_shop_random_mer_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_vam_enabled", "rep_ttt_shop_random_vam_enabled", GetConVarNumber("ttt_shop_random_vam_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_zom_enabled", "rep_ttt_shop_random_zom_enabled", GetConVarNumber("ttt_shop_random_zom_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_kil_enabled", "rep_ttt_shop_random_kil_enabled", GetConVarNumber("ttt_shop_random_kil_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_jes_enabled", "rep_ttt_shop_random_jes_enabled", GetConVarNumber("ttt_shop_random_jes_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_shop_random_swa_enabled", "rep_ttt_shop_random_swa_enabled", GetConVarNumber("ttt_shop_random_swa_enabled"), false, false, "xgui_gmsettings")

        -- Innocent role configs
        ULib.replicatedWritableCvar("ttt_detective_search_only", "rep_ttt_detective_search_only", GetConVarNumber("ttt_detective_search_only"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_phantom_killer_footstep_time", "rep_ttt_phantom_killer_footstep_time", GetConVarNumber("ttt_phantom_killer_footstep_time"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_phantom_killer_haunt", "rep_ttt_phantom_killer_haunt", GetConVarNumber("ttt_phantom_killer_haunt"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_phantom_killer_haunt_attack_cost", "rep_ttt_phantom_killer_haunt_attack_cost", GetConVarNumber("ttt_phantom_killer_haunt_attack_cost"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_phantom_killer_haunt_drop_cost", "rep_ttt_phantom_killer_haunt_drop_cost", GetConVarNumber("ttt_phantom_killer_haunt_drop_cost"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_phantom_killer_haunt_jump_cost", "rep_ttt_phantom_killer_haunt_jump_cost", GetConVarNumber("ttt_phantom_killer_haunt_jump_cost"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_phantom_killer_haunt_move_cost", "rep_ttt_phantom_killer_haunt_move_cost", GetConVarNumber("ttt_phantom_killer_haunt_move_cost"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_phantom_killer_haunt_power_max", "rep_ttt_phantom_killer_haunt_power_max", GetConVarNumber("ttt_phantom_killer_haunt_power_max"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_phantom_killer_haunt_power_rate", "rep_ttt_phantom_killer_haunt_power_rate", GetConVarNumber("ttt_phantom_killer_haunt_power_rate"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_phantom_killer_smoke", "rep_ttt_phantom_killer_smoke", GetConVarNumber("ttt_phantom_killer_smoke"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_phantom_weaker_each_respawn", "rep_ttt_phantom_weaker_each_respawn", GetConVarNumber("ttt_phantom_weaker_each_respawn"), false, false, "xgui_gmsettings")

        -- Traitor role configs
        ULib.replicatedWritableCvar("ttt_traitor_vision_enable", "rep_ttt_traitor_vision_enable", GetConVarNumber("ttt_traitor_vision_enable"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_traitors_jester_id_mode", "rep_ttt_traitors_jester_id_mode", GetConVarNumber("ttt_traitors_jester_id_mode"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_assassin_show_target_icon", "rep_ttt_assassin_show_target_icon", GetConVarNumber("ttt_assassin_show_target_icon"), false, false, "xgui_gmsettings")

        -- Monster role configs
        ULib.replicatedWritableCvar("ttt_monsters_are_traitors", "rep_ttt_monsters_are_traitors", GetConVarNumber("ttt_monsters_are_traitors"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_monsters_jester_id_mode", "rep_ttt_monsters_jester_id_mode", GetConVarNumber("ttt_monsters_jester_id_mode"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_vampires_are_traitors", "rep_ttt_vampires_are_traitors", GetConVarNumber("ttt_vampires_are_traitors"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_vampire_convert_enable", "rep_ttt_vampire_convert_enable", GetConVarNumber("ttt_vampire_convert_enable"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_vampire_damage_reduction", "rep_ttt_vampire_damage_reduction", GetConVarNumber("ttt_vampire_damage_reduction"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_vampire_fang_heal", "rep_ttt_vampire_fang_heal", GetConVarNumber("ttt_vampire_fang_heal"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_vampire_fang_timer", "rep_ttt_vampire_fang_timer", GetConVarNumber("ttt_vampire_fang_timer"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_vampire_fang_overheal", "rep_ttt_vampire_fang_overheal", GetConVarNumber("ttt_vampire_fang_overheal"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_vampire_fang_unfreeze_delay", "rep_ttt_vampire_fang_unfreeze_delay", GetConVarNumber("ttt_vampire_fang_unfreeze_delay"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_vampire_prime_death_mode", "rep_ttt_vampire_prime_death_mode", GetConVarNumber("ttt_vampire_prime_death_mode"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_vampire_prime_only_convert", "rep_ttt_vampire_prime_only_convert", GetConVarNumber("ttt_vampire_prime_only_convert"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_vampire_show_target_icon", "rep_ttt_vampire_show_target_icon", GetConVarNumber("ttt_vampire_show_target_icon"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_vampire_vision_enable", "rep_ttt_vampire_vision_enable", GetConVarNumber("ttt_vampire_vision_enable"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_zombies_are_traitors", "rep_ttt_zombies_are_traitors", GetConVarNumber("ttt_zombies_are_traitors"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_zombie_damage_reduction", "rep_ttt_zombie_damage_reduction", GetConVarNumber("ttt_zombie_damage_reduction"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_zombie_damage_scale", "rep_ttt_zombie_damage_scale", GetConVarNumber("ttt_zombie_damage_scale"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_zombie_leap_enable", "rep_ttt_zombie_leap_enable", GetConVarNumber("ttt_zombie_leap_enable"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_zombie_prime_only_weapons", "rep_ttt_zombie_prime_only_weapons", GetConVarNumber("ttt_zombie_prime_only_weapons"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_zombie_show_target_icon", "rep_ttt_zombie_show_target_icon", GetConVarNumber("ttt_zombie_show_target_icon"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_zombie_spit_enable", "rep_ttt_zombie_spit_enable", GetConVarNumber("ttt_zombie_spit_enable"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_zombie_vision_enable", "rep_ttt_zombie_vision_enable", GetConVarNumber("ttt_zombie_vision_enable"), false, false, "xgui_gmsettings")

        -- Independent role configs
        ULib.replicatedWritableCvar("ttt_jester_notify_confetti", "rep_ttt_jester_notify_confetti", GetConVarNumber("ttt_jester_notify_confetti"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_jester_notify_mode", "rep_ttt_jester_notify_mode", GetConVarNumber("ttt_jester_notify_mode"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_jester_notify_sound", "rep_ttt_jester_notify_sound", GetConVarNumber("ttt_jester_notify_sound"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_jester_win_by_traitors", "rep_ttt_jester_win_by_traitors", GetConVarNumber("ttt_jester_win_by_traitors"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_swapper_notify_confetti", "rep_ttt_swapper_notify_confetti", GetConVarNumber("ttt_swapper_notify_confetti"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_swapper_notify_mode", "rep_ttt_swapper_notify_mode", GetConVarNumber("ttt_swapper_notify_mode"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_swapper_notify_sound", "rep_ttt_swapper_notify_sound", GetConVarNumber("ttt_swapper_notify_sound"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_swapper_respawn_health", "rep_ttt_swapper_respawn_health", GetConVarNumber("ttt_swapper_respawn_health"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_killers_jester_id_mode", "rep_ttt_killers_jester_id_mode", GetConVarNumber("ttt_killers_jester_id_mode"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_killer_damage_reduction", "rep_ttt_killer_damage_reduction", GetConVarNumber("ttt_killer_damage_reduction"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_killer_damage_scale", "rep_ttt_killer_damage_scale", GetConVarNumber("ttt_killer_damage_scale"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_killer_knife_enabled", "rep_ttt_killer_knife_enabled", GetConVarNumber("ttt_killer_knife_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_killer_max_health", "rep_ttt_killer_max_health", GetConVarNumber("ttt_killer_max_health"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_killer_show_target_icon", "rep_ttt_killer_show_target_icon", GetConVarNumber("ttt_killer_show_target_icon"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_killer_smoke_enabled", "rep_ttt_killer_smoke_enabled", GetConVarNumber("ttt_killer_smoke_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_killer_smoke_timer", "rep_ttt_killer_smoke_timer", GetConVarNumber("ttt_killer_smoke_timer"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_killer_vision_enable", "rep_ttt_killer_vision_enable", GetConVarNumber("ttt_killer_vision_enable"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_killer_warn_all", "rep_ttt_killer_warn_all", GetConVarNumber("ttt_killer_warn_all"), false, false, "xgui_gmsettings")

        --dna
        ULib.replicatedWritableCvar("ttt_killer_dna_range", "rep_ttt_killer_dna_range", GetConVarNumber("ttt_killer_dna_range"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_killer_dna_basetime", "rep_ttt_killer_dna_basetime", GetConVarNumber("ttt_killer_dna_basetime"), false, false, "xgui_gmsettings")

        --voicechat battery
        ULib.replicatedWritableCvar("ttt_voice_drain", "rep_ttt_voice_drain", GetConVarNumber("ttt_voice_drain"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_voice_drain_normal", "rep_ttt_voice_drain_normal", GetConVarNumber("ttt_voice_drain_normal"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_voice_drain_admin", "rep_ttt_voice_drain_admin", GetConVarNumber("ttt_voice_drain_admin"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_voice_drain_recharge", "rep_ttt_voice_drain_recharge", GetConVarNumber("ttt_voice_drain_recharge"), false, false, "xgui_gmsettings")

        --other gameplay settings
        ULib.replicatedWritableCvar("ttt_minimum_players", "rep_ttt_minimum_players", GetConVarNumber("ttt_minimum_players"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_postround_dm", "rep_ttt_postround_dm", GetConVarNumber("ttt_postround_dm"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_dyingshot", "rep_ttt_dyingshot", GetConVarNumber("ttt_dyingshot"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_no_nade_throw_during_prep", "rep_ttt_no_nade_throw_during_prep", GetConVarNumber("ttt_no_nade_throw_during_prep"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_weapon_carrying", "rep_ttt_weapon_carrying", GetConVarNumber("ttt_weapon_carrying"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_weapon_carrying_range", "rep_ttt_weapon_carrying_range", GetConVarNumber("ttt_weapon_carrying_range"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_teleport_telefrags", "rep_ttt_teleport_telefrags", GetConVarNumber("ttt_teleport_telefrags"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_ragdoll_pinning", "rep_ttt_ragdoll_pinning", GetConVarNumber("ttt_ragdoll_pinning"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_ragdoll_pinning_innocents", "rep_ttt_ragdoll_pinning_innocents", GetConVarNumber("ttt_ragdoll_pinning_innocents"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_player_set_model_on_initial_spawn", "rep_ttt_player_set_model_on_initial_spawn", GetConVarNumber("ttt_player_set_model_on_initial_spawn"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_player_set_model_on_new_round", "rep_ttt_player_set_model_on_new_round", GetConVarNumber("ttt_player_set_model_on_new_round"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_player_set_model_on_respawn", "rep_ttt_player_set_model_on_respawn", GetConVarNumber("ttt_player_set_model_on_respawn"), false, false, "xgui_gmsettings")

        --karma
        ULib.replicatedWritableCvar("ttt_karma", "rep_ttt_karma", GetConVarNumber("ttt_karma"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_karma_strict", "rep_ttt_karma_strict", GetConVarNumber("ttt_karma_strict"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_karma_starting", "rep_ttt_karma_starting", GetConVarNumber("ttt_karma_starting"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_karma_max", "rep_ttt_karma_max", GetConVarNumber("ttt_karma_max"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_karma_ratio", "rep_ttt_karma_ratio", GetConVarNumber("ttt_karma_ratio"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_karma_kill_penalty", "rep_ttt_karma_kill_penalty", GetConVarNumber("ttt_karma_kill_penalty"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_karma_round_increment", "rep_ttt_karma_round_increment", GetConVarNumber("ttt_karma_round_increment"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_karma_clean_bonus", "rep_ttt_karma_clean_bonus", GetConVarNumber("ttt_karma_clean_bonus"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_karma_traitordmg_ratio", "rep_ttt_karma_traitordmg_ratio", GetConVarNumber("ttt_karma_traitordmg_ratio"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_karma_traitorkill_bonus", "rep_ttt_karma_traitorkill_bonus", GetConVarNumber("ttt_karma_traitorkill_bonus"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_karma_low_autokick", "rep_ttt_karma_low_autokick", GetConVarNumber("ttt_karma_low_autokick"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_karma_low_amount", "rep_ttt_karma_low_amount", GetConVarNumber("ttt_karma_low_amount"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_karma_low_ban", "rep_ttt_karma_low_ban", GetConVarNumber("ttt_karma_low_ban"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_karma_low_ban_minutes", "rep_ttt_karma_low_ban_minutes", GetConVarNumber("ttt_karma_low_ban_minutes"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_karma_persist", "rep_ttt_karma_persist", GetConVarNumber("ttt_karma_persist"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_karma_debugspam", "rep_ttt_karma_debugspam", GetConVarNumber("ttt_karma_debugspam"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_karma_clean_half", "rep_ttt_karma_clean_half", GetConVarNumber("ttt_karma_clean_half"), false, false, "xgui_gmsettings")

        --map related
        ULib.replicatedWritableCvar("ttt_use_weapon_spawn_scripts", "rep_ttt_use_weapon_spawn_scripts", GetConVarNumber("ttt_use_weapon_spawn_scripts"), false, false, "xgui_gmsettings")

        --traitor/monster/killer credits
        ULib.replicatedWritableCvar("ttt_credits_starting", "rep_ttt_credits_starting", GetConVarNumber("ttt_credits_starting"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_der_credits_starting", "rep_ttt_der_credits_starting", GetConVarNumber("ttt_der_credits_starting"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_kil_credits_starting", "rep_ttt_kil_credits_starting", GetConVarNumber("ttt_kil_credits_starting"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_asn_credits_starting", "rep_ttt_asn_credits_starting", GetConVarNumber("ttt_asn_credits_starting"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_hyp_credits_starting", "rep_ttt_hyp_credits_starting", GetConVarNumber("ttt_hyp_credits_starting"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_zom_credits_starting", "rep_ttt_zom_credits_starting", GetConVarNumber("ttt_zom_credits_starting"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_vam_credits_starting", "rep_ttt_vam_credits_starting", GetConVarNumber("ttt_vam_credits_starting"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_credits_award_pct", "rep_ttt_credits_award_pct", GetConVarNumber("ttt_credits_award_pct"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_credits_award_size", "rep_ttt_credits_award_size", GetConVarNumber("ttt_credits_award_size"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_credits_award_repeat", "rep_ttt_credits_award_repeat", GetConVarNumber("ttt_credits_award_repeat"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_credits_detectivekill", "rep_ttt_credits_detectivekill", GetConVarNumber("ttt_credits_detectivekill"), false, false, "xgui_gmsettings")

        --innocent credits
        ULib.replicatedWritableCvar("ttt_det_credits_starting", "rep_ttt_det_credits_starting", GetConVarNumber("ttt_det_credits_starting"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_mer_credits_starting", "rep_ttt_mer_credits_starting", GetConVarNumber("ttt_mer_credits_starting"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_det_credits_traitorkill", "rep_ttt_det_credits_traitorkill", GetConVarNumber("ttt_det_credits_traitorkill"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_det_credits_traitordead", "rep_ttt_det_credits_traitordead", GetConVarNumber("ttt_det_credits_traitordead"), false, false, "xgui_gmsettings")

        --jester/swapper credits
        ULib.replicatedWritableCvar("ttt_jes_credits_starting", "rep_ttt_jes_credits_starting", GetConVarNumber("ttt_jes_credits_starting"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_swa_credits_starting", "rep_ttt_swa_credits_starting", GetConVarNumber("ttt_swa_credits_starting"), false, false, "xgui_gmsettings")

        --sprint
        ULib.replicatedWritableCvar("ttt_sprint_enabled", "rep_ttt_sprint_enabled", GetConVarNumber("ttt_sprint_enabled"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_sprint_bonus_rel", "rep_ttt_sprint_bonus_rel", GetConVarNumber("ttt_sprint_bonus_rel"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_sprint_big_crosshair", "rep_ttt_sprint_big_crosshair", GetConVarNumber("ttt_sprint_big_crosshair"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_sprint_regenerate_innocent", "rep_ttt_sprint_regenerate_innocent", GetConVarNumber("ttt_sprint_regenerate_innocent"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_sprint_regenerate_traitor", "rep_ttt_sprint_regenerate_traitor", GetConVarNumber("ttt_sprint_regenerate_traitor"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_sprint_consume", "rep_ttt_sprint_consume", GetConVarNumber("ttt_sprint_consume"), false, false, "xgui_gmsettings")

        --multi-jump
        ULib.replicatedWritableCvar("multijump_default_jumps", "rep_multijump_default_jumps", GetConVarNumber("multijump_default_jumps"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("multijump_default_power", "rep_multijump_default_power", GetConVarNumber("multijump_default_power"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("multijump_can_jump_while_falling", "rep_multijump_can_jump_while_falling", GetConVarNumber("multijump_can_jump_while_falling"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("multijump_max_fall_distance", "rep_multijump_max_fall_distance", GetConVarNumber("multijump_max_fall_distance"), false, false, "xgui_gmsettings")

        --prop possession
        ULib.replicatedWritableCvar("ttt_spec_prop_control", "rep_ttt_spec_prop_control", GetConVarNumber("ttt_spec_prop_control"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_spec_prop_base", "rep_ttt_spec_prop_base", GetConVarNumber("ttt_spec_prop_base"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_spec_prop_maxpenalty", "rep_ttt_spec_prop_maxpenalty", GetConVarNumber("ttt_spec_prop_maxpenalty"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_spec_prop_maxbonus", "rep_ttt_spec_prop_maxbonus", GetConVarNumber("ttt_spec_prop_maxbonus"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_spec_prop_force", "rep_ttt_spec_prop_force", GetConVarNumber("ttt_spec_prop_force"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_spec_prop_rechargetime", "rep_ttt_spec_prop_rechargetime", GetConVarNumber("ttt_spec_prop_rechargetime"), false, false, "xgui_gmsettings")

        --admin related
        ULib.replicatedWritableCvar("ttt_idle_limit", "rep_ttt_idle_limit", GetConVarNumber("ttt_idle_limit"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_namechange_kick", "rep_ttt_namechange_kick", GetConVarNumber("ttt_namechange_kick"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_namechange_bantime", "rep_ttt_namechange_bantime", GetConVarNumber("ttt_namechange_bantime"), false, false, "xgui_gmsettings")

        --misc
        ULib.replicatedWritableCvar("ttt_detective_hats", "rep_ttt_detective_hats", GetConVarNumber("ttt_detective_hats"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_playercolor_mode", "rep_ttt_playercolor_mode", GetConVarNumber("ttt_playercolor_mode"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_ragdoll_collide", "rep_ttt_ragdoll_collide", GetConVarNumber("ttt_ragdoll_collide"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_bots_are_spectators", "rep_ttt_bots_are_spectators", GetConVarNumber("ttt_bots_are_spectators"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_debug_preventwin", "rep_ttt_debug_preventwin", GetConVarNumber("ttt_debug_preventwin"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_debug_logkills", "rep_ttt_debug_logkills", GetConVarNumber("ttt_debug_logkills"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_debug_logroles", "rep_ttt_debug_logroles", GetConVarNumber("ttt_debug_logroles"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_locational_voice", "rep_ttt_locational_voice", GetConVarNumber("ttt_locational_voice"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_allow_discomb_jump", "rep_ttt_allow_discomb_jump", GetConVarNumber("ttt_allow_discomb_jump"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_spawn_wave_interval", "rep_ttt_spawn_wave_interval", GetConVarNumber("ttt_spawn_wave_interval"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_crowbar_unlocks", "rep_ttt_crowbar_unlocks", GetConVarNumber("ttt_crowbar_unlocks"), false, false, "xgui_gmsettings")
        ULib.replicatedWritableCvar("ttt_crowbar_pushforce", "rep_ttt_crowbar_pushforce", GetConVarNumber("ttt_crowbar_pushforce"), false, false, "xgui_gmsettings")
    end
end

xgui.addSVModule("terrortown", init)