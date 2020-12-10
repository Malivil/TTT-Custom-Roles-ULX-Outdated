--Terrortown settings module for ULX GUI
--Defines ttt cvar limits and ttt specific settings for the ttt gamemode.

local terrortown_settings = xlib.makepanel { parent = xgui.null }

xlib.makelabel { x = 5, y = 5, w = 600, wordwrap = true, label = "Trouble in Terrorist Town ULX Commands XGUI module Created by: Bender180", parent = terrortown_settings }
xlib.makelabel { x = 2, y = 345, w = 600, wordwrap = true, label = "The settings above DO NOT SAVE when the server changes maps, is restarted or crashes. They are for easy access only", parent = terrortown_settings }

xlib.makelabel { x = 5, y = 190, w = 160, wordwrap = true, label = "Note to sever owners: to restrict this panel allow or deny permission to xgui_gmsettings.", parent = terrortown_settings }
xlib.makelabel { x = 5, y = 250, w = 160, wordwrap = true, label = "All settings listed are explained here: http://ttt.badking.net/config- and-commands/convars", parent = terrortown_settings }
xlib.makelabel { x = 5, y = 325, w = 160, wordwrap = true, label = "Not all settings echo to chat.", parent = terrortown_settings }


terrortown_settings.panel = xlib.makepanel { x = 160, y = 25, w = 420, h = 318, parent = terrortown_settings }
terrortown_settings.catList = xlib.makelistview { x = 5, y = 25, w = 150, h = 157, parent = terrortown_settings }
terrortown_settings.catList:AddColumn("Terrorist Town Settings")
terrortown_settings.catList.Columns[1].DoClick = function() end

terrortown_settings.catList.OnRowSelected = function(self, LineID, Line)
    local nPanel = xgui.modules.submodule[Line:GetValue(2)].panel
    if nPanel ~= terrortown_settings.curPanel then
        nPanel:SetZPos(0)
        xlib.addToAnimQueue("pnlSlide", { panel = nPanel, startx = -435, starty = 0, endx = 0, endy = 0, setvisible = true })
        if terrortown_settings.curPanel then
            terrortown_settings.curPanel:SetZPos(-1)
            xlib.addToAnimQueue(terrortown_settings.curPanel.SetVisible, terrortown_settings.curPanel, false)
        end
        xlib.animQueue_start()
        terrortown_settings.curPanel = nPanel
    else
        xlib.addToAnimQueue("pnlSlide", { panel = nPanel, startx = 0, starty = 0, endx = -435, endy = 0, setvisible = false })
        self:ClearSelection()
        terrortown_settings.curPanel = nil
        xlib.animQueue_start()
    end
    if nPanel.onOpen then nPanel.onOpen() end --If the panel has it, call a function when it's opened
end

--Process modular settings
function terrortown_settings.processModules()
    terrortown_settings.catList:Clear()
    for i, module in ipairs(xgui.modules.submodule) do
        if module.mtype == "terrortown_settings" and (not module.access or LocalPlayer():query(module.access)) then
            local w, h = module.panel:GetSize()
            if w == h and h == 0 then module.panel:SetSize(275, 322) end

            if module.panel.scroll then --For DListLayouts
                module.panel.scroll.panel = module.panel
                module.panel = module.panel.scroll
            end
            module.panel:SetParent(terrortown_settings.panel)

            local line = terrortown_settings.catList:AddLine(module.name, i)
            if (module.panel == terrortown_settings.curPanel) then
                terrortown_settings.curPanel = nil
                terrortown_settings.catList:SelectItem(line)
            else
                module.panel:SetVisible(false)
            end
        end
    end
    terrortown_settings.catList:SortByColumn(1, false)
end

terrortown_settings.processModules()

xgui.hookEvent("onProcessModules", nil, terrortown_settings.processModules)
xgui.addModule("TTT", terrortown_settings, "icon16/ttt.png", "xgui_gmsettings")

-------------------- Round structure Module--------------------
local function AddRoundStructureModule()
    local rspnl = xlib.makelistlayout { w = 415, h = 318, parent = xgui.null }

    --Preparation and Post-Round
    local rspapclp = vgui.Create("DCollapsibleCategory", rspnl)
    rspapclp:SetSize(390, 70)
    rspapclp:SetExpanded(1)
    rspapclp:SetLabel("Preparation and Post-Round")

    local rspaplst = vgui.Create("DPanelList", rspapclp)
    rspaplst:SetPos(5, 25)
    rspaplst:SetSize(390, 70)
    rspaplst:SetSpacing(5)

    local prept = xlib.makeslider { label = "ttt_preptime_seconds (def. 30)", min = 1, max = 120, repconvar = "rep_ttt_preptime_seconds", parent = rspaplst }
    rspaplst:AddItem(prept)

    local fprept = xlib.makeslider { label = "ttt_firstpreptime (def. 60)", min = 1, max = 120, repconvar = "rep_ttt_firstpreptime", parent = rspaplst }
    rspaplst:AddItem(fprept)

    local pstt = xlib.makeslider { label = "ttt_posttime_seconds (def. 30)", min = 1, max = 120, repconvar = "rep_ttt_posttime_seconds", parent = rspaplst }
    rspaplst:AddItem(pstt)

    --Round Length
    local rsrlclp = vgui.Create("DCollapsibleCategory", rspnl)
    rsrlclp:SetSize(390, 90)
    rsrlclp:SetExpanded(0)
    rsrlclp:SetLabel("Round Length")

    local rsrllst = vgui.Create("DPanelList", rsrlclp)
    rsrllst:SetPos(5, 25)
    rsrllst:SetSize(390, 90)
    rsrllst:SetSpacing(5)

    local hstmd = xlib.makecheckbox { label = "ttt_haste", repconvar = "rep_ttt_haste", parent = rsrllst }
    rsrllst:AddItem(hstmd)

    local hstsm = xlib.makeslider { label = "ttt_haste_starting_minutes (def. 5)", min = 1, max = 60, repconvar = "rep_ttt_haste_starting_minutes", parent = rsrllst }
    rsrllst:AddItem(hstsm)

    local hstmpd = xlib.makeslider { label = "ttt_haste_minutes_per_death (def. 0.5)", min = 0.1, max = 9, decimal = 1, repconvar = "rep_ttt_haste_minutes_per_death", parent = rsrllst }
    rsrllst:AddItem(hstmpd)

    local rtm = xlib.makeslider { label = "ttt_roundtime_minutes (def. 10)", min = 1, max = 60, repconvar = "rep_ttt_roundtime_minutes", parent = rsrllst }
    rsrllst:AddItem(rtm)

    --Map Switching and Voting
    local msavclp = vgui.Create("DCollapsibleCategory", rspnl)
    msavclp:SetSize(390, 95)
    msavclp:SetExpanded(0)
    msavclp:SetLabel("Map Switching and Voting")

    local msavlst = vgui.Create("DPanelList", msavclp)
    msavlst:SetPos(5, 25)
    msavlst:SetSize(390, 95)
    msavlst:SetSpacing(5)

    local rndl = xlib.makeslider { label = "ttt_round_limit (def. 6)", min = 1, max = 100, repconvar = "rep_ttt_round_limit", parent = msavlst }
    msavlst:AddItem(rndl)

    local rndtlm = xlib.makeslider { label = "ttt_time_limit_minutes (def. 75)", min = 1, max = 150, repconvar = "rep_ttt_time_limit_minutes", parent = msavlst }
    msavlst:AddItem(rndtlm)

    local rndawm = xlib.makecheckbox { label = "ttt_always_use_mapcycle (def. 0)", repconvar = "rep_ttt_always_use_mapcycle", parent = msavlst }
    msavlst:AddItem(rndawm)

    local rndawmtxt = xlib.makelabel { wordwrap = true, label = "This does nothing but since its included in TTT it's here.", parent = msavlst }
    msavlst:AddItem(rndawmtxt)

    xgui.hookEvent("onProcessModules", nil, rspnl.processModules)
    xgui.addSubModule("Round structure", rspnl, nil, "terrortown_settings")
end

local function AddRolesEnabled(gppnl)
    -- Roles Enabled
    local gptreclp = vgui.Create("DCollapsibleCategory", gppnl)
    gptreclp:SetSize(390, 220)
    gptreclp:SetExpanded(1)
    gptreclp:SetLabel("Roles Enabled")

    local gptrelst = vgui.Create("DPanelList", gptreclp)
    gptrelst:SetPos(5, 25)
    gptrelst:SetSize(390, 220)
    gptrelst:SetSpacing(5)

    local hasder = xlib.makecheckbox { label = "ttt_detraitor_enabled (def. 0)", repconvar = "rep_ttt_detraitor_enabled", parent = gptrelst }
    gptrelst:AddItem(hasder)

    local hasmer = xlib.makecheckbox { label = "ttt_mercenary_enabled (def. 1)", repconvar = "rep_ttt_mercenary_enabled", parent = gptrelst }
    gptrelst:AddItem(hasmer)

    local hashyp = xlib.makecheckbox { label = "ttt_hypnotist_enabled (def. 1)", repconvar = "rep_ttt_hypnotist_enabled", parent = gptrelst }
    gptrelst:AddItem(hashyp)

    local hasgli = xlib.makecheckbox { label = "ttt_glitch_enabled (def. 1)", repconvar = "rep_ttt_glitch_enabled", parent = gptrelst }
    gptrelst:AddItem(hasgli)

    local hasjes = xlib.makecheckbox { label = "ttt_jester_enabled (def. 1)", repconvar = "rep_ttt_jester_enabled", parent = gptrelst }
    gptrelst:AddItem(hasjes)

    local haspha = xlib.makecheckbox { label = "ttt_phantom_enabled (def. 1)", repconvar = "rep_ttt_phantom_enabled", parent = gptrelst }
    gptrelst:AddItem(haspha)

    local haszom = xlib.makecheckbox { label = "ttt_zombie_enabled (def. 1)", repconvar = "rep_ttt_zombie_enabled", parent = gptrelst }
    gptrelst:AddItem(haszom)

    local hasvam = xlib.makecheckbox { label = "ttt_vampire_enabled (def. 1)", repconvar = "rep_ttt_vampire_enabled", parent = gptrelst }
    gptrelst:AddItem(hasvam)

    local hasswa = xlib.makecheckbox { label = "ttt_swapper_enabled (def. 1)", repconvar = "rep_ttt_swapper_enabled", parent = gptrelst }
    gptrelst:AddItem(hasswa)

    local hasas = xlib.makecheckbox { label = "ttt_assassin_enabled (def. 1)", repconvar = "rep_ttt_assassin_enabled", parent = gptrelst }
    gptrelst:AddItem(hasas)

    local askil = xlib.makecheckbox { label = "ttt_killer_enabled (def. 1)", repconvar = "rep_ttt_killer_enabled", parent = gptrelst }
    gptrelst:AddItem(askil)
end

local function AddRoleCounts(gppnl)
    --Role Counts
    local gptrcclp = vgui.Create("DCollapsibleCategory", gppnl)
    gptrcclp:SetSize(390, 345)
    gptrcclp:SetExpanded(0)
    gptrcclp:SetLabel("Role Counts")

    local gptrclst = vgui.Create("DPanelList", gptrcclp)
    gptrclst:SetPos(5, 25)
    gptrclst:SetSize(390, 345)
    gptrclst:SetSpacing(5)

    local tmax = xlib.makeslider { label = "ttt_traitor_max (def. 32)", min = 1, max = 80, repconvar = "rep_ttt_traitor_max", parent = gptrclst }
    gptrclst:AddItem(tmax)

    local dmax = xlib.makeslider { label = "ttt_detective_max (def. 32)", min = 1, max = 80, repconvar = "rep_ttt_detective_max", parent = gptrclst }
    gptrclst:AddItem(dmax)

    local dmp = xlib.makeslider { label = "ttt_detective_min_players (def. 10)", min = 1, max = 50, repconvar = "rep_ttt_detective_min_players", parent = gptrclst }
    gptrclst:AddItem(dmp)

    local derreq = xlib.makeslider { label = "ttt_detraitor_required_traitors (def. 2)", min = 0, max = 50, repconvar = "rep_ttt_detraitor_required_traitors", parent = gptrclst }
    gptrclst:AddItem(derreq)

    local hreq = xlib.makeslider { label = "ttt_hypnotist_required_traitors (def. 2)", min = 0, max = 50, repconvar = "rep_ttt_hypnotist_required_traitors", parent = gptrclst }
    gptrclst:AddItem(hreq)

    local areq = xlib.makeslider { label = "ttt_assassin_required_traitors (def. 2)", min = 0, max = 50, repconvar = "rep_ttt_assassin_required_traitors", parent = gptrclst }
    gptrclst:AddItem(areq)

    local greq = xlib.makeslider { label = "ttt_glitch_required_innos (def. 2)", min = 0, max = 50, repconvar = "rep_ttt_glitch_required_innos", parent = gptrclst }
    gptrclst:AddItem(greq)

    local preq = xlib.makeslider { label = "ttt_phantom_required_innos (def. 2)", min = 0, max = 50, repconvar = "rep_ttt_phantom_required_innos", parent = gptrclst }
    gptrclst:AddItem(preq)

    local mreq = xlib.makeslider { label = "ttt_mercenary_required_innos (def. 2)", min = 0, max = 50, repconvar = "rep_ttt_mercenary_required_innos", parent = gptrclst }
    gptrclst:AddItem(mreq)

    local jreq = xlib.makeslider { label = "ttt_jester_required_innos (def. 2)", min = 0, max = 50, repconvar = "rep_ttt_jester_required_innos", parent = gptrclst }
    gptrclst:AddItem(jreq)

    local sreq = xlib.makeslider { label = "ttt_swapper_required_innos (def. 2)", min = 0, max = 50, repconvar = "rep_ttt_swapper_required_innos", parent = gptrclst }
    gptrclst:AddItem(sreq)

    local zreq = xlib.makeslider { label = "ttt_zombie_required_traitors (def. 2)", min = 0, max = 50, repconvar = "rep_ttt_zombie_required_traitors", parent = gptrclst }
    gptrclst:AddItem(zreq)

    local vreq = xlib.makeslider { label = "ttt_vampire_required_traitors (def. 2)", min = 0, max = 50, repconvar = "rep_ttt_vampire_required_traitors", parent = gptrclst }
    gptrclst:AddItem(vreq)

    local kreq = xlib.makeslider { label = "ttt_killer_required_innos (def. 2)", min = 0, max = 50, repconvar = "rep_ttt_killer_required_innos", parent = gptrclst }
    gptrclst:AddItem(kreq)
end

local function AddRoleDetermination(gppnl)
    --Role Determination
    local gptrdclp = vgui.Create("DCollapsibleCategory", gppnl)
    gptrdclp:SetSize(390, 370)
    gptrdclp:SetExpanded(0)
    gptrdclp:SetLabel("Role Determination")

    local gptrdlst = vgui.Create("DPanelList", gptrdclp)
    gptrdlst:SetPos(5, 25)
    gptrdlst:SetSize(390, 370)
    gptrdlst:SetSpacing(5)

    local dkm = xlib.makeslider { label = "ttt_detective_karma_min (def. 600)", min = 1, max = 1000, repconvar = "rep_ttt_detective_karma_min", parent = gptrdlst }
    gptrdlst:AddItem(dkm)

    local mpercet = xlib.makeslider { label = "ttt_monster_pct (def. 0.33)", min = 0.01, max = 2, decimal = 2, repconvar = "rep_ttt_monster_pct", parent = gptrdlst }
    gptrdlst:AddItem(mpercet)

    local tpercet = xlib.makeslider { label = "ttt_traitor_pct (def. 0.25)", min = 0.01, max = 2, decimal = 2, repconvar = "rep_ttt_traitor_pct", parent = gptrdlst }
    gptrdlst:AddItem(tpercet)

    local dpercet = xlib.makeslider { label = "ttt_detective_pct (def. 0.13)", min = 0.01, max = 2, decimal = 2, repconvar = "rep_ttt_detective_pct", parent = gptrdlst }
    gptrdlst:AddItem(dpercet)

    local hchance = xlib.makeslider { label = "ttt_hypnotist_chance (def. 0.2)", min = 0.01, max = 1, decimal = 2, repconvar = "rep_ttt_hypnotist_chance", parent = gptrdlst }
    gptrdlst:AddItem(hchance)

    local achance = xlib.makeslider { label = "ttt_assassin_chance (def. 0.2)", min = 0.01, max = 1, decimal = 2, repconvar = "rep_ttt_assassin_chance", parent = gptrdlst }
    gptrdlst:AddItem(achance)

    local gchance = xlib.makeslider { label = "ttt_glitch_chance (def. 0.25)", min = 0.01, max = 1, decimal = 2, repconvar = "rep_ttt_glitch_chance", parent = gptrdlst }
    gptrdlst:AddItem(gchance)

    local pchance = xlib.makeslider { label = "ttt_phantom_chance (def. 0.25)", min = 0.01, max = 1, decimal = 2, repconvar = "rep_ttt_phantom_chance", parent = gptrdlst }
    gptrdlst:AddItem(pchance)

    local mchance = xlib.makeslider { label = "ttt_mercenary_chance (def. 0.25)", min = 0.01, max = 1, decimal = 2, repconvar = "rep_ttt_mercenary_chance", parent = gptrdlst }
    gptrdlst:AddItem(mchance)

    local derchance = xlib.makeslider { label = "ttt_detraitor_chance (def. 0.2)", min = 0.01, max = 1, decimal = 2, repconvar = "rep_ttt_detraitor_chance", parent = gptrdlst }
    gptrdlst:AddItem(derchance)

    local jchance = xlib.makeslider { label = "ttt_jester_chance (def. 0.25)", min = 0.01, max = 1, decimal = 2, repconvar = "rep_ttt_jester_chance", parent = gptrdlst }
    gptrdlst:AddItem(jchance)

    local schance = xlib.makeslider { label = "ttt_swapper_chance (def. 0.25)", min = 0.01, max = 1, decimal = 2, repconvar = "rep_ttt_swapper_chance", parent = gptrdlst }
    gptrdlst:AddItem(schance)

    local zchance = xlib.makeslider { label = "ttt_zombie_chance (def. 0.1)", min = 0.01, max = 1, decimal = 2, repconvar = "rep_ttt_zombie_chance", parent = gptrdlst }
    gptrdlst:AddItem(zchance)

    local vchance = xlib.makeslider { label = "ttt_vampire_chance (def. 0.2)", min = 0.01, max = 1, decimal = 2, repconvar = "rep_ttt_vampire_chance", parent = gptrdlst }
    gptrdlst:AddItem(vchance)

    local kchance = xlib.makeslider { label = "ttt_killer_chance (def. 0.25)", min = 0.01, max = 1, decimal = 2, repconvar = "rep_ttt_killer_chance", parent = gptrdlst }
    gptrdlst:AddItem(kchance)
end

local function AddSharedRoleConfigs(gppnl)
    local category = vgui.Create("DCollapsibleCategory", gppnl)
    category:SetSize(390, 20)
    category:SetExpanded(0)
    category:SetLabel("Shared Role Configs")

    local panel = vgui.Create("DPanelList", category)
    panel:SetPos(5, 25)
    panel:SetSize(390, 20)
    panel:SetSpacing(5)

    local asearch = xlib.makecheckbox { label = "ttt_all_search_postround (def. 1)", repconvar = "rep_ttt_all_search_postround", parent = panel }
    panel:AddItem(asearch)
end

local function AddInnocentRoleConfigs(gppnl)
    local category = vgui.Create("DCollapsibleCategory", gppnl)
    category:SetSize(390, 240)
    category:SetExpanded(0)
    category:SetLabel("Innocent Role Configs")

    local panel = vgui.Create("DPanelList", category)
    panel:SetPos(5, 25)
    panel:SetSize(390, 240)
    panel:SetSpacing(5)

    local dsearch = xlib.makecheckbox { label = "ttt_detective_search_only (def. 1)", repconvar = "rep_ttt_detective_search_only", parent = panel }
    panel:AddItem(dsearch)

    local pkft = xlib.makecheckbox { label = "ttt_phantom_killer_footstep_time (def. 10)", repconvar = "rep_ttt_phantom_killer_footstep_time", parent = panel }
    panel:AddItem(pkft)

    local pkh = xlib.makecheckbox { label = "ttt_phantom_killer_haunt (def. 1)", repconvar = "rep_ttt_phantom_killer_haunt", parent = panel }
    panel:AddItem(pkh)

    local pkhac = xlib.makeslider { label = "ttt_phantom_killer_haunt_attack_cost (def. 75)", min = 1, max = 100, repconvar = "rep_ttt_phantom_killer_haunt_attack_cost", parent = panel }
    panel:AddItem(pkhac)

    local pkhdc = xlib.makeslider { label = "ttt_phantom_killer_haunt_drop_cost (def. 35)", min = 1, max = 100, repconvar = "rep_ttt_phantom_killer_haunt_drop_cost", parent = panel }
    panel:AddItem(pkhdc)

    local pkhjc = xlib.makeslider { label = "ttt_phantom_killer_haunt_jump_cost (def. 30)", min = 1, max = 100, repconvar = "rep_ttt_phantom_killer_haunt_jump_cost", parent = panel }
    panel:AddItem(pkhjc)

    local pkhmc = xlib.makeslider { label = "ttt_phantom_killer_haunt_move_cost (def. 50)", min = 1, max = 100, repconvar = "rep_ttt_phantom_killer_haunt_move_cost", parent = panel }
    panel:AddItem(pkhmc)

    local pkhpm = xlib.makeslider { label = "ttt_phantom_killer_haunt_power_max (def. 100)", min = 0, max = 250, repconvar = "rep_ttt_phantom_killer_haunt_power_max", parent = panel }
    panel:AddItem(pkhpm)

    local pkhpr = xlib.makeslider { label = "ttt_phantom_killer_haunt_power_rate (def. 5)", min = 1, max = 50, repconvar = "rep_ttt_phantom_killer_haunt_power_rate", parent = panel }
    panel:AddItem(pkhpr)

    local pks = xlib.makecheckbox { label = "ttt_phantom_killer_smoke (def. 1)", repconvar = "rep_ttt_phantom_killer_smoke", parent = panel }
    panel:AddItem(pks)

    local pwer = xlib.makecheckbox { label = "ttt_phantom_weaker_each_respawn (def. 0)", repconvar = "rep_ttt_phantom_weaker_each_respawn", parent = panel }
    panel:AddItem(pwer)

    local mshop = xlib.makeslider { label = "ttt_shop_merc_mode (def. 0)", min = 0, max = 4, repconvar = "rep_ttt_shop_merc_mode", parent = panel }
    panel:AddItem(mshop)
end

local function AddTraitorRoleConfigs(gppnl)
    local category = vgui.Create("DCollapsibleCategory", gppnl)
    category:SetSize(390, 100)
    category:SetExpanded(0)
    category:SetLabel("Traitor Role Configs")

    local panel = vgui.Create("DPanelList", category)
    panel:SetPos(5, 25)
    panel:SetSize(390, 100)
    panel:SetSpacing(5)

    local tvision = xlib.makecheckbox { label = "ttt_traitor_vision_enable (def. 0)", repconvar = "rep_ttt_traitor_vision_enable", parent = panel }
    panel:AddItem(tvision)

    local tkswa = xlib.makeslider { label = "ttt_traitors_jester_id_mode (def. 1)", min = 0, max = 4, repconvar = "rep_ttt_traitors_jester_id_mode", parent = panel }
    panel:AddItem(tkswa)

    local atarget = xlib.makecheckbox { label = "ttt_assassin_show_target_icon (def. 0)", repconvar = "rep_ttt_assassin_show_target_icon", parent = panel }
    panel:AddItem(atarget)

    local ashop = xlib.makecheckbox { label = "ttt_shop_assassin_sync (def. 0)", repconvar = "rep_ttt_shop_assassin_sync", parent = panel }
    panel:AddItem(ashop)

    local hshop = xlib.makecheckbox { label = "ttt_shop_hypnotist_sync (def. 0)", repconvar = "rep_ttt_shop_hypnotist_sync", parent = panel }
    panel:AddItem(hshop)
end

local function AddMonsterRoleConfigs(gppnl)
    local category = vgui.Create("DCollapsibleCategory", gppnl)
    category:SetSize(390, 400)
    category:SetExpanded(0)
    category:SetLabel("Monster Role Configs")

    local panel = vgui.Create("DPanelList", category)
    panel:SetPos(5, 25)
    panel:SetSize(390, 400)
    panel:SetSpacing(5)

    local msats = xlib.makecheckbox { label = "ttt_monsters_are_traitors (def. 0)", repconvar = "rep_ttt_monsters_are_traitors", parent = panel }
    panel:AddItem(msats)

    local mkswa = xlib.makeslider { label = "ttt_monsters_jester_id_mode (def. 1)", min = 0, max = 4, repconvar = "rep_ttt_monsters_jester_id_mode", parent = panel }
    panel:AddItem(mkswa)

    local vsats = xlib.makecheckbox { label = "ttt_vampires_are_traitors (def. 0)", repconvar = "rep_ttt_vampires_are_traitors", parent = panel }
    panel:AddItem(vsats)

    local vconvert = xlib.makecheckbox { label = "ttt_vampire_convert_enable (def. 1)", repconvar = "rep_ttt_vampire_convert_enable", parent = panel }
    panel:AddItem(vconvert)

    local vdmgreduc = xlib.makeslider { label = "ttt_vampire_damage_reduction (def. 0.8)", min = 0.1, max = 1, decimal = 2, repconvar = "rep_ttt_vampire_damage_reduction", parent = panel }
    panel:AddItem(vdmgreduc)

    local vfangheal = xlib.makeslider { label = "ttt_vampire_fang_heal (def. 50)", min = 10, max = 100, repconvar = "rep_ttt_vampire_fang_heal", parent = panel }
    panel:AddItem(vfangheal)

    local vfangtim = xlib.makeslider { label = "ttt_vampire_fang_timer (def. 5)", min = 1, max = 10, repconvar = "rep_ttt_vampire_fang_timer", parent = panel }
    panel:AddItem(vfangtim)

    local vfangoheal = xlib.makeslider { label = "ttt_vampire_fang_overheal (def. 25)", min = 5, max = 50, repconvar = "rep_ttt_vampire_fang_overheal", parent = panel }
    panel:AddItem(vfangoheal)

    local vpdm = xlib.makeslider { label = "ttt_vampire_prime_death_mode (def. 0)", min = 0, max = 2, repconvar = "rep_ttt_vampire_prime_death_mode", parent = panel }
    panel:AddItem(vpdm)

    local vpoc = xlib.makecheckbox { label = "ttt_vampire_prime_only_convert (def. 1)", repconvar = "rep_ttt_vampire_prime_only_convert", parent = panel }
    panel:AddItem(vpoc)

    local vtarget = xlib.makecheckbox { label = "ttt_vampire_show_target_icon (def. 1)", repconvar = "rep_ttt_vampire_show_target_icon", parent = panel }
    panel:AddItem(vtarget)

    local vvision = xlib.makecheckbox { label = "ttt_vampire_vision_enable (def. 1)", repconvar = "rep_ttt_vampire_vision_enable", parent = panel }
    panel:AddItem(vvision)

    local zsats = xlib.makecheckbox { label = "ttt_zombies_are_traitors (def. 0)", repconvar = "rep_ttt_zombies_are_traitors", parent = panel }
    panel:AddItem(zsats)

    local zdmgreduc = xlib.makeslider { label = "ttt_zombie_damage_reduction (def. 0.8)", min = 0.1, max = 1, decimal = 2, repconvar = "rep_ttt_zombie_damage_reduction", parent = panel }
    panel:AddItem(zdmgreduc)

    local zdmgscale = xlib.makeslider { label = "ttt_zombie_damage_scale (def. 0.2)", min = 0.1, max = 1, decimal = 2, repconvar = "rep_ttt_zombie_damage_scale", parent = panel }
    panel:AddItem(zdmgscale)

    local zleap = xlib.makecheckbox { label = "ttt_zombie_leap_enable (def. 1)", repconvar = "rep_ttt_zombie_leap_enable", parent = panel }
    panel:AddItem(zleap)

    local zpoweap = xlib.makecheckbox { label = "ttt_zombie_prime_only_weapons (def. 1)", repconvar = "rep_ttt_zombie_prime_only_weapons", parent = panel }
    panel:AddItem(zpoweap)

    local ztarget = xlib.makecheckbox { label = "ttt_zombie_show_target_icon (def. 1)", repconvar = "rep_ttt_zombie_show_target_icon", parent = panel }
    panel:AddItem(ztarget)

    local zspit = xlib.makecheckbox { label = "ttt_zombie_spit_enable (def. 1)", repconvar = "rep_ttt_zombie_spit_enable", parent = panel }
    panel:AddItem(zspit)

    local zvision = xlib.makecheckbox { label = "ttt_zombie_vision_enable (def. 1)", repconvar = "rep_ttt_zombie_vision_enable", parent = panel }
    panel:AddItem(zvision)
end

local function AddIndependentRoleConfigs(gppnl)
    local category = vgui.Create("DCollapsibleCategory", gppnl)
    category:SetSize(390, 360)
    category:SetExpanded(0)
    category:SetLabel("Independent Role Configs")

    local panel = vgui.Create("DPanelList", category)
    panel:SetPos(5, 25)
    panel:SetSize(390, 360)
    panel:SetSpacing(5)

    local jnc = xlib.makecheckbox { label = "ttt_jester_notify_confetti (def. 0)", repconvar = "rep_ttt_jester_notify_confetti", parent = panel }
    panel:AddItem(jnc)

    local jnm = xlib.makeslider { label = "ttt_jester_notify_mode (def. 1)", min = 0, max = 4, repconvar = "rep_ttt_jester_notify_mode", parent = panel }
    panel:AddItem(jnm)

    local jns = xlib.makecheckbox { label = "ttt_jester_notify_sound (def. 0)", repconvar = "rep_ttt_jester_notify_sound", parent = panel }
    panel:AddItem(jns)

    local jwbt = xlib.makecheckbox { label = "ttt_jester_win_by_traitors (def. 1)", repconvar = "rep_ttt_jester_win_by_traitors", parent = panel }
    panel:AddItem(jwbt)

    local snc = xlib.makecheckbox { label = "ttt_swapper_notify_confetti (def. 0)", repconvar = "rep_ttt_swapper_notify_confetti", parent = panel }
    panel:AddItem(snc)

    local snm = xlib.makeslider { label = "ttt_swapper_notify_mode (def. 1)", min = 0, max = 4, repconvar = "rep_ttt_swapper_notify_mode", parent = panel }
    panel:AddItem(snm)

    local sns = xlib.makecheckbox { label = "ttt_swapper_notify_sound (def. 0)", repconvar = "rep_ttt_swapper_notify_sound", parent = panel }
    panel:AddItem(sns)

    local srh = xlib.makeslider { label = "ttt_swapper_respawn_health (def. 100)", min = 25, max = 150, repconvar = "rep_ttt_swapper_respawn_health", parent = panel }
    panel:AddItem(srh)

    local kkswa = xlib.makeslider { label = "ttt_killers_jester_id_mode (def. 1)", min = 0, max = 4, repconvar = "rep_ttt_killers_jester_id_mode", parent = panel }
    panel:AddItem(kkswa)

    local kdmgreduc = xlib.makeslider { label = "ttt_killer_damage_reduction (def. 0.55)", min = 0.1, max = 1, decimal = 2, repconvar = "rep_ttt_killer_damage_reduction", parent = panel }
    panel:AddItem(kdmgreduc)

    local kdmgscale = xlib.makeslider { label = "ttt_killer_damage_scale (def. 0.25)", min = 0.1, max = 1, decimal = 2, repconvar = "rep_ttt_killer_damage_scale", parent = panel }
    panel:AddItem(kdmgscale)

    local kknife = xlib.makecheckbox { label = "ttt_killer_knife_enabled (def. 1)", repconvar = "rep_ttt_killer_knife_enabled", parent = panel }
    panel:AddItem(kknife)

    local khealth = xlib.makeslider { label = "ttt_killer_max_health (def. 100)", min = 1, max = 200, repconvar = "rep_ttt_killer_max_health", parent = panel }
    panel:AddItem(khealth)

    local ktarget = xlib.makecheckbox { label = "ttt_killer_show_target_icon (def. 1)", repconvar = "rep_ttt_killer_show_target_icon", parent = panel }
    panel:AddItem(ktarget)

    local ksmokee = xlib.makecheckbox { label = "ttt_killer_smoke_enabled (def. 1)", repconvar = "rep_ttt_killer_smoke_enabled", parent = panel }
    panel:AddItem(ksmokee)

    local ksmoke = xlib.makeslider { label = "ttt_killer_smoke_timer (def. 60)", min = 10, max = 200, repconvar = "rep_ttt_killer_smoke_timer", parent = panel }
    panel:AddItem(ksmoke)

    local kvision = xlib.makecheckbox { label = "ttt_killer_vision_enable (def. 1)", repconvar = "rep_ttt_killer_vision_enable", parent = panel }
    panel:AddItem(kvision)

    local kwarnall = xlib.makecheckbox { label = "ttt_killer_warn_all (def. 0)", repconvar = "rep_ttt_killer_warn_all", parent = panel }
    panel:AddItem(kwarnall)
end

local function AddDna(gppnl)
    --DNA
    local gpdnaclp = vgui.Create("DCollapsibleCategory", gppnl)
    gpdnaclp:SetSize(390, 50)
    gpdnaclp:SetExpanded(0)
    gpdnaclp:SetLabel("DNA")

    local gpdnalst = vgui.Create("DPanelList", gpdnaclp)
    gpdnalst:SetPos(5, 25)
    gpdnalst:SetSize(390, 50)
    gpdnalst:SetSpacing(5)

    local dnarange = xlib.makeslider { label = "ttt_killer_dna_range (def. 550)", min = 100, max = 1000, repconvar = "rep_ttt_killer_dna_range", parent = gpdnalst }
    gpdnalst:AddItem(dnarange)

    local dnakbt = xlib.makeslider { label = "ttt_killer_dna_basetime (def. 100)", min = 10, max = 200, repconvar = "rep_ttt_killer_dna_basetime", parent = gpdnalst }
    gpdnalst:AddItem(dnakbt)
end

local function AddVoiceChat(gppnl)
    --Voice Chat Battery
    local gpvcbclp = vgui.Create("DCollapsibleCategory", gppnl)
    gpvcbclp:SetSize(390, 65)
    gpvcbclp:SetExpanded(0)
    gpvcbclp:SetLabel("Voice Chat Battery")

    local gpvcblst = vgui.Create("DPanelList", gpvcbclp)
    gpvcblst:SetPos(5, 25)
    gpvcblst:SetSize(390, 65)
    gpvcblst:SetSpacing(5)

    local gpevd = xlib.makecheckbox { label = "ttt_voice_drain (def. 0)", repconvar = "rep_ttt_voice_drain", parent = gpvcblst }
    gpvcblst:AddItem(gpevd)

    local gpvdn = xlib.makeslider { label = "ttt_voice_drain_normal (def. 0.2)", min = 0.1, max = 1, decimal = 1, repconvar = "rep_ttt_voice_drain_normal", parent = gpvcblst }
    gpvcblst:AddItem(gpvdn)

    local gpvda = xlib.makeslider { label = "ttt_voice_drain_admin (def. 0.05)", min = 0.01, max = 1, decimal = 2, repconvar = "rep_ttt_voice_drain_admin", parent = gpvcblst }
    gpvcblst:AddItem(gpvda)

    local gpvdr = xlib.makeslider { label = "ttt_voice_drain_recharge (def. 0.05)", min = 0.01, max = 1, decimal = 2, repconvar = "rep_ttt_voice_drain_recharge", parent = gpvcblst }
    gpvcblst:AddItem(gpvdr)
end

local function AddOtherGameplay(gppnl)
    --Other Gameplay Settings
    local gpogsclp = vgui.Create("DCollapsibleCategory", gppnl)
    gpogsclp:SetSize(390, 245)
    gpogsclp:SetExpanded(0)
    gpogsclp:SetLabel("Other Gameplay Settings")

    local gpogslst = vgui.Create("DPanelList", gpogsclp)
    gpogslst:SetPos(5, 25)
    gpogslst:SetSize(390, 245)
    gpogslst:SetSpacing(5)

    local gpminply = xlib.makeslider { label = "ttt_minimum_players (def. 2)", min = 1, max = 10, repconvar = "rep_ttt_minimum_players", parent = gpogslst }
    gpogslst:AddItem(gpminply)

    local gpprdm = xlib.makecheckbox { label = "ttt_postround_dm (def. 0)", repconvar = "rep_ttt_postround_dm", parent = gpogslst }
    gpogslst:AddItem(gpprdm)

    local gpds = xlib.makecheckbox { label = "ttt_dyingshot (def. 0)", repconvar = "rep_ttt_dyingshot", parent = gpogslst }
    gpogslst:AddItem(gpds)

    local gpnntdp = xlib.makecheckbox { label = "ttt_no_nade_throw_during_prep (def. 0)", repconvar = "rep_ttt_no_nade_throw_during_prep", parent = gpogslst }
    gpogslst:AddItem(gpnntdp)

    local gpwc = xlib.makecheckbox { label = "ttt_weapon_carrying (def. 1)", repconvar = "rep_ttt_weapon_carrying", parent = gpogslst }
    gpogslst:AddItem(gpwc)

    local gpwcr = xlib.makeslider { label = "ttt_weapon_carrying_range (def. 50)", min = 10, max = 100, repconvar = "rep_ttt_weapon_carrying_range", parent = gpogslst }
    gpogslst:AddItem(gpwcr)

    local gpttf = xlib.makecheckbox { label = "ttt_teleport_telefrags (def. 0)", repconvar = "rep_ttt_teleport_telefrags", parent = gpogslst }
    gpogslst:AddItem(gpttf)

    local gprdp = xlib.makecheckbox { label = "ttt_ragdoll_pinning (def. 1)", repconvar = "rep_ttt_ragdoll_pinning", parent = gpogslst }
    gpogslst:AddItem(gprdp)

    local gprdpi = xlib.makecheckbox { label = "ttt_ragdoll_pinning_innocents (def. 0)", repconvar = "rep_ttt_ragdoll_pinning_innocents", parent = gpogslst }
    gpogslst:AddItem(gprdpi)

    local gppsmis = xlib.makecheckbox { label = "ttt_player_set_model_on_initial_spawn (def. 1)", repconvar = "rep_ttt_player_set_model_on_initial_spawn", parent = gpogslst }
    gpogslst:AddItem(gppsmis)

    local gppsmnr = xlib.makecheckbox { label = "ttt_player_set_model_on_new_round (def. 1)", repconvar = "rep_ttt_player_set_model_on_new_round", parent = gpogslst }
    gpogslst:AddItem(gppsmnr)

    local gppsmr = xlib.makecheckbox { label = "ttt_player_set_model_on_respawn (def. 1)", repconvar = "rep_ttt_player_set_model_on_respawn", parent = gpogslst }
    gpogslst:AddItem(gppsmr)
end

local function AddGameplayModule()
    -------------------- Gameplay Module--------------------
    local gppnl = xlib.makelistlayout { w = 415, h = 318, parent = xgui.null }

    AddRolesEnabled(gppnl)
    AddRoleCounts(gppnl)
    AddRoleDetermination(gppnl)
    AddSharedRoleConfigs(gppnl)
    AddInnocentRoleConfigs(gppnl)
    AddTraitorRoleConfigs(gppnl)
    AddMonsterRoleConfigs(gppnl)
    AddIndependentRoleConfigs(gppnl)
    AddDna(gppnl)
    AddVoiceChat(gppnl)
    AddOtherGameplay(gppnl)

    xgui.hookEvent("onProcessModules", nil, gppnl.processModules)
    xgui.addSubModule("Gameplay", gppnl, nil, "terrortown_settings")
end

local function AddKarmaModule()
    -------------------- Karma Module--------------------
    local krmpnl = xlib.makelistlayout { w = 415, h = 318, parent = xgui.null }

    local krmclp = vgui.Create("DCollapsibleCategory", krmpnl)
    krmclp:SetSize(390, 400)
    krmclp:SetExpanded(1)
    krmclp:SetLabel("Karma")

    local krmlst = vgui.Create("DPanelList", krmclp)
    krmlst:SetPos(5, 25)
    krmlst:SetSize(390, 400)
    krmlst:SetSpacing(5)

    local krmekrm = xlib.makecheckbox { label = "ttt_karma", repconvar = "rep_ttt_karma", parent = krmlst }
    krmlst:AddItem(krmekrm)

    local krmeskrm = xlib.makecheckbox { label = "ttt_karma_strict", repconvar = "rep_ttt_karma_strict", parent = krmlst }
    krmlst:AddItem(krmeskrm)

    local krms = xlib.makeslider { label = "ttt_karma_starting (def. 1000)", min = 500, max = 2000, repconvar = "rep_ttt_karma_starting", parent = krmlst }
    krmlst:AddItem(krms)

    local krmmx = xlib.makeslider { label = "ttt_karma_max (def. 1000)", min = 500, max = 2000, repconvar = "rep_ttt_karma_max", parent = krmlst }
    krmlst:AddItem(krmmx)

    local krmr = xlib.makeslider { label = "ttt_karma_ratio (def. 0.001)", min = 0.001, max = 0.009, decimal = 3, repconvar = "rep_ttt_karma_ratio", parent = krmlst }
    krmlst:AddItem(krmr)

    local krmkp = xlib.makeslider { label = "ttt_karma_kill_penalty (def. 15)", min = 1, max = 30, repconvar = "rep_ttt_karma_kill_penalty", parent = krmlst }
    krmlst:AddItem(krmkp)

    local krmri = xlib.makeslider { label = "ttt_karma_round_increment (def. 5)", min = 1, max = 30, repconvar = "rep_ttt_karma_round_increment", parent = krmlst }
    krmlst:AddItem(krmri)

    local krmcb = xlib.makeslider { label = "ttt_karma_clean_bonus (def. 30)", min = 10, max = 100, repconvar = "rep_ttt_karma_clean_bonus", parent = krmlst }
    krmlst:AddItem(krmcb)

    local krmtdmgr = xlib.makeslider { label = "ttt_karma_traitordmg_ratio (def. 0.0003)", min = 0.0001, max = 0.001, decimal = 4, repconvar = "rep_ttt_karma_traitordmg_ratio", parent = krmlst }
    krmlst:AddItem(krmtdmgr)

    local krmtkb = xlib.makeslider { label = "ttt_karma_traitorkill_bonus (def. 40)", min = 10, max = 100, repconvar = "rep_ttt_karma_traitorkill_bonus", parent = krmlst }
    krmlst:AddItem(krmtkb)

    local krmlak = xlib.makecheckbox { label = "ttt_karma_low_autokick (def. 1)", repconvar = "rep_ttt_karma_low_autokick", parent = krmlst }
    krmlst:AddItem(krmlak)

    local krmla = xlib.makeslider { label = "ttt_karma_low_amount (def. 450)", min = 100, max = 1000, repconvar = "rep_ttt_karma_low_amount", parent = krmlst }
    krmlst:AddItem(krmla)

    local krmlab = xlib.makecheckbox { label = "ttt_karma_low_ban (def. 1)", repconvar = "rep_ttt_karma_low_ban", parent = krmlst }
    krmlst:AddItem(krmlab)

    local krmlbm = xlib.makeslider { label = "ttt_karma_low_ban_minutes (def. 60)", min = 10, max = 100, repconvar = "rep_ttt_karma_low_ban_minutes", parent = krmlst }
    krmlst:AddItem(krmlbm)

    local krmpre = xlib.makecheckbox { label = "ttt_karma_persist (def. 0)", repconvar = "rep_ttt_karma_persist", parent = krmlst }
    krmlst:AddItem(krmpre)

    local krmdbs = xlib.makecheckbox { label = "ttt_karma_debugspam (def. 0)", repconvar = "rep_ttt_karma_debugspam", parent = krmlst }
    krmlst:AddItem(krmdbs)

    local krmch = xlib.makeslider { label = "ttt_karma_clean_half (def. 0.25)", min = 0.01, max = 0.9, decimal = 2, repconvar = "rep_ttt_karma_clean_half", parent = krmlst }
    krmlst:AddItem(krmch)

    xgui.hookEvent("onProcessModules", nil, krmpnl.processModules)
    xgui.addSubModule("Karma", krmpnl, nil, "terrortown_settings")
end

local function AddMapModule()
    -------------------- Map-related Module--------------------
    local mprpnl = xlib.makepanel { w = 415, h = 318, parent = xgui.null }

    xlib.makecheckbox { x = 5, y = 5, label = "ttt_use_weapon_spawn_scripts (def. 1)", repconvar = "rep_ttt_use_weapon_spawn_scripts", parent = mprpnl }

    xgui.hookEvent("onProcessModules", nil, mprpnl.processModules)
    xgui.addSubModule("Map-related", mprpnl, nil, "terrortown_settings")
end

local function AddEquipmentCreditsModule()
    -------------------- Equipment credits Module--------------------
    local ecpnl = xlib.makelistlayout { w = 415, h = 318, parent = xgui.null }

    --Traitor/Monster/Killer Credits
    local ectcclp = vgui.Create("DCollapsibleCategory", ecpnl)
    ectcclp:SetSize(390, 270)
    ectcclp:SetExpanded(1)
    ectcclp:SetLabel("Traitor/Monster/Killer Credits")

    local ectclst = vgui.Create("DPanelList", ectcclp)
    ectclst:SetPos(5, 25)
    ectclst:SetSize(390, 270)
    ectclst:SetSpacing(5)

    local ectccs = xlib.makeslider { label = "ttt_credits_starting (def. 2)", min = 0, max = 10, repconvar = "rep_ttt_credits_starting", parent = ectclst }
    ectclst:AddItem(ectccs)

    local ectcdcs = xlib.makeslider { label = "ttt_der_credits_starting (def. 2)", min = 0, max = 10, repconvar = "rep_ttt_der_credits_starting", parent = ectclst }
    ectclst:AddItem(ectcdcs)

    local ectckcs = xlib.makeslider { label = "ttt_kil_credits_starting (def. 2)", min = 0, max = 10, repconvar = "rep_ttt_kil_credits_starting", parent = ectclst }
    ectclst:AddItem(ectckcs)

    local ectcacs = xlib.makeslider { label = "ttt_asn_credits_starting (def. 0)", min = 0, max = 10, repconvar = "rep_ttt_asn_credits_starting", parent = ectclst }
    ectclst:AddItem(ectcacs)

    local ectchcs = xlib.makeslider { label = "ttt_hyp_credits_starting (def. 0)", min = 0, max = 10, repconvar = "rep_ttt_hyp_credits_starting", parent = ectclst }
    ectclst:AddItem(ectchcs)

    local ectczcs = xlib.makeslider { label = "ttt_zom_credits_starting (def. 0)", min = 0, max = 10, repconvar = "rep_ttt_zom_credits_starting", parent = ectclst }
    ectclst:AddItem(ectczcs)

    local ectcvcs = xlib.makeslider { label = "ttt_vam_credits_starting (def. 0)", min = 0, max = 10, repconvar = "rep_ttt_vam_credits_starting", parent = ectclst }
    ectclst:AddItem(ectcvcs)

    local ectcap = xlib.makeslider { label = "ttt_credits_award_pct (def. 0.35)", min = 0.01, max = 0.9, decimal = 2, repconvar = "rep_ttt_credits_award_pct", parent = ectclst }
    ectclst:AddItem(ectcap)

    local ectcas = xlib.makeslider { label = "ttt_credits_award_size (def. 1)", min = 0, max = 5, repconvar = "rep_ttt_credits_award_size", parent = ectclst }
    ectclst:AddItem(ectcas)

    local ectcar = xlib.makeslider { label = "ttt_credits_award_repeat (def. 1)", min = 0, max = 5, repconvar = "rep_ttt_credits_award_repeat", parent = ectclst }
    ectclst:AddItem(ectcar)

    local ectcdk = xlib.makeslider { label = "ttt_credits_detectivekill (def. 1)", min = 0, max = 5, repconvar = "rep_ttt_credits_detectivekill", parent = ectclst }
    ectclst:AddItem(ectcdk)

    --Innocent Credits
    local ecdcclp = vgui.Create("DCollapsibleCategory", ecpnl)
    ecdcclp:SetSize(390, 110)
    ecdcclp:SetExpanded(0)
    ecdcclp:SetLabel("Innocent Credits")

    local ecdclst = vgui.Create("DPanelList", ecdcclp)
    ecdclst:SetPos(5, 25)
    ecdclst:SetSize(390, 110)
    ecdclst:SetSpacing(5)

    local ecdccs = xlib.makeslider { label = "ttt_det_credits_starting (def. 1)", min = 0, max = 10, repconvar = "rep_ttt_det_credits_starting", parent = ecdclst }
    ecdclst:AddItem(ecdccs)

    local ecmccs = xlib.makeslider { label = "ttt_mer_credits_starting (def. 1)", min = 0, max = 10, repconvar = "rep_ttt_mer_credits_starting", parent = ecdclst }
    ecdclst:AddItem(ecmccs)

    local ecdctk = xlib.makeslider { label = "ttt_det_credits_traitorkill (def. 0)", min = 0, max = 10, repconvar = "rep_ttt_det_credits_traitorkill", parent = ecdclst }
    ecdclst:AddItem(ecdctk)

    local ecdctd = xlib.makeslider { label = "ttt_det_credits_traitordead (def. 1)", min = 0, max = 10, repconvar = "rep_ttt_det_credits_traitordead", parent = ecdclst }
    ecdclst:AddItem(ecdctd)

    xgui.hookEvent("onProcessModules", nil, ecpnl.processModules)
    xgui.addSubModule("Equipment credits", ecpnl, nil, "terrortown_settings")
end

local function AddPlayerMovementModule()
    -------------------- Player Movement Module--------------------
    local pmpnl = xlib.makelistlayout { w = 415, h = 318, parent = xgui.null }

    --Sprint
    local pmspp = vgui.Create("DCollapsibleCategory", pmpnl)
    pmspp:SetSize(390, 140)
    pmspp:SetExpanded(1)
    pmspp:SetLabel("Sprint")

    local pmsplst = vgui.Create("DPanelList", pmspp)
    pmsplst:SetPos(5, 25)
    pmsplst:SetSize(390, 140)
    pmsplst:SetSpacing(5)

    local pmspe = xlib.makecheckbox { label = "ttt_sprint_enabled (def. 1)", repconvar = "rep_ttt_sprint_enabled", parent = pmsplst }
    pmsplst:AddItem(pmspe)

    local pmspbr = xlib.makeslider { label = "ttt_sprint_bonus_rel (def. 0.4)", min = 0.1, max = 2, decimal = 1, repconvar = "rep_ttt_sprint_bonus_rel", parent = pmsplst }
    pmsplst:AddItem(pmspbr)

    local pmspbc = xlib.makecheckbox { label = "ttt_sprint_big_crosshair (def. 1)", repconvar = "rep_ttt_sprint_big_crosshair", parent = pmsplst }
    pmsplst:AddItem(pmspbc)

    local pmspri = xlib.makeslider { label = "ttt_sprint_regenerate_innocent (def. 0.08)", min = 0.01, max = 2, decimal = 2, repconvar = "rep_ttt_sprint_regenerate_innocent", parent = pmsplst }
    pmsplst:AddItem(pmspri)

    local pmsprt = xlib.makeslider { label = "ttt_sprint_regenerate_traitor (def. 0.12)", min = 0.01, max = 2, decimal = 2, repconvar = "rep_ttt_sprint_regenerate_traitor", parent = pmsplst }
    pmsplst:AddItem(pmsprt)

    local pmspc = xlib.makeslider { label = "ttt_sprint_consume (def. 0.2)", min = 0.1, max = 5, decimal = 1, repconvar = "rep_ttt_sprint_consume", parent = pmsplst }
    pmsplst:AddItem(pmspc)

    --Multi-Jump
    local pmmjp = vgui.Create("DCollapsibleCategory", pmpnl)
    pmmjp:SetSize(390, 110)
    pmmjp:SetExpanded(0)
    pmmjp:SetLabel("Multi-Jump")

    local pmmjlst = vgui.Create("DPanelList", pmmjp)
    pmmjlst:SetPos(5, 25)
    pmmjlst:SetSize(390, 110)
    pmmjlst:SetSpacing(5)

    local pmmjdj = xlib.makeslider { label = "multijump_default_jumps (def. 1)", min = 0, max = 10, repconvar = "rep_multijump_default_jumps", parent = pmmjlst }
    pmmjlst:AddItem(pmmjdj)

    local pmmjdp = xlib.makeslider { label = "multijump_default_power (def. 1)", min = 0, max = 50, repconvar = "rep_multijump_default_power", parent = pmmjlst }
    pmmjlst:AddItem(pmmjdp)

    local pmmjcjwf = xlib.makecheckbox { label = "multijump_can_jump_while_falling (def. 1)", repconvar = "rep_multijump_can_jump_while_falling", parent = pmmjlst }
    pmmjlst:AddItem(pmmjcjwf)

    local pmmjmfd = xlib.makeslider { label = "multijump_max_fall_distance (def. 0)", min = 0, max = 2000, repconvar = "rep_multijump_max_fall_distance", parent = pmmjlst }
    pmmjlst:AddItem(pmmjmfd)

    xgui.hookEvent("onProcessModules", nil, pmpnl.processModules)
    xgui.addSubModule("Player Movement", pmpnl, nil, "terrortown_settings")
end

local function AddPropPossessionModule()
    -------------------- Prop possession Module--------------------
    local pppnl = xlib.makelistlayout { w = 415, h = 318, parent = xgui.null }

    local ppclp = vgui.Create("DCollapsibleCategory", pppnl)
    ppclp:SetSize(390, 120)
    ppclp:SetExpanded(1)
    ppclp:SetLabel("Prop possession")

    local pplst = vgui.Create("DPanelList", ppclp)
    pplst:SetPos(5, 25)
    pplst:SetSize(390, 120)
    pplst:SetSpacing(5)

    local ppspc = xlib.makecheckbox { label = "ttt_spec_prop_control  (def. 1)", repconvar = "rep_ttt_spec_prop_control", parent = pplst }
    pplst:AddItem(ppspc)

    local ppspb = xlib.makeslider { label = "ttt_spec_prop_base (def. 8)", min = 0, max = 50, repconvar = "rep_ttt_spec_prop_base", parent = pplst }
    pplst:AddItem(ppspb)

    local ppspmp = xlib.makeslider { label = "ttt_spec_prop_maxpenalty (def. -6)", min = -50, max = 0, repconvar = "rep_ttt_spec_prop_maxpenalty", parent = pplst }
    pplst:AddItem(ppspmp)

    local ppspmb = xlib.makeslider { label = "ttt_spec_prop_maxbonus (def. 16)", min = 0, max = 50, repconvar = "rep_ttt_spec_prop_maxbonus", parent = pplst }
    pplst:AddItem(ppspmb)

    local ppspf = xlib.makeslider { label = "ttt_spec_prop_force (def. 110)", min = 50, max = 300, repconvar = "rep_ttt_spec_prop_force", parent = pplst }
    pplst:AddItem(ppspf)

    local ppprt = xlib.makeslider { label = "ttt_spec_prop_rechargetime (def. 1)", min = 0, max = 10, repconvar = "rep_ttt_spec_prop_rechargetime", parent = pplst }
    pplst:AddItem(ppprt)

    xgui.hookEvent("onProcessModules", nil, pppnl.processModules)
    xgui.addSubModule("Prop possession", pppnl, nil, "terrortown_settings")
end

local function AddAdminModule()
    -------------------- Admin-related Module--------------------
    local arpnl = xlib.makelistlayout { w = 415, h = 318, parent = xgui.null }

    local arclp = vgui.Create("DCollapsibleCategory", arpnl)
    arclp:SetSize(390, 120)
    arclp:SetExpanded(1)
    arclp:SetLabel("Admin-related")

    local arlst = vgui.Create("DPanelList", arclp)
    arlst:SetPos(5, 25)
    arlst:SetSize(390, 120)
    arlst:SetSpacing(5)

    local aril = xlib.makeslider { label = "ttt_idle_limit (def. 180)", min = 50, max = 300, repconvar = "rep_ttt_idle_limit", parent = arlst }
    arlst:AddItem(aril)

    local arnck = xlib.makecheckbox { label = "ttt_namechange_kick (def. 1)", repconvar = "rep_ttt_namechange_kick", parent = arlst }
    arlst:AddItem(arnck)

    local arncbt = xlib.makeslider { label = "ttt_namechange_bantime (def. 10)", min = 0, max = 60, repconvar = "rep_ttt_namechange_bantime", parent = arlst }
    arlst:AddItem(arncbt)

    xgui.hookEvent("onProcessModules", nil, arpnl.processModules)
    xgui.addSubModule("Admin-related", arpnl, nil, "terrortown_settings")
end

local function AddMiscModule()
    -------------------- Miscellaneous Module--------------------
    local miscpnl = xlib.makelistlayout { w = 415, h = 318, parent = xgui.null }

    local miscclp = vgui.Create("DCollapsibleCategory", miscpnl)
    miscclp:SetSize(390, 160)
    miscclp:SetExpanded(1)
    miscclp:SetLabel("Miscellaneous")

    local misclst = vgui.Create("DPanelList", miscclp)
    misclst:SetPos(5, 25)
    misclst:SetSize(390, 160)
    misclst:SetSpacing(5)

    local miscdh = xlib.makecheckbox { label = "ttt_detective_hats (def. 0)", repconvar = "rep_ttt_detective_hats", parent = misclst }
    misclst:AddItem(miscdh)

    local miscpcm = xlib.makeslider { label = "ttt_playercolor_mode (def. 1)", min = 0, max = 3, repconvar = "rep_ttt_playercolor_mode", parent = misclst }
    misclst:AddItem(miscpcm)

    local miscrc = xlib.makecheckbox { label = "ttt_ragdoll_collide (def. 0)", repconvar = "rep_ttt_ragdoll_collide", parent = misclst }
    misclst:AddItem(miscrc)

    local miscbs = xlib.makecheckbox { label = "ttt_bots_are_spectators (def. 0)", repconvar = "rep_ttt_bots_are_spectators", parent = misclst }
    misclst:AddItem(miscbs)

    local miscdpw = xlib.makecheckbox { label = "ttt_debug_preventwin (def. 0)", repconvar = "rep_ttt_debug_preventwin", parent = misclst }
    misclst:AddItem(miscdpw)

    local miscdlk = xlib.makecheckbox { label = "ttt_debug_logkills (def. 1)", repconvar = "rep_ttt_debug_logkills", parent = misclst }
    misclst:AddItem(miscdlk)

    local miscdlr = xlib.makecheckbox { label = "ttt_debug_logroles (def. 1)", repconvar = "rep_ttt_debug_logroles", parent = misclst }
    misclst:AddItem(miscdlr)

    local misclv = xlib.makecheckbox { label = "ttt_locational_voice (def. 0)", repconvar = "rep_ttt_locational_voice", parent = misclst }
    misclst:AddItem(misclv)

    local miscdj = xlib.makecheckbox { label = "ttt_allow_discomb_jump (def. 0)", repconvar = "rep_ttt_allow_discomb_jump", parent = misclst }
    misclst:AddItem(miscdj)

    local miscswi = xlib.makeslider { label = "ttt_spawn_wave_interval (def. 0)", min = 0, max = 30, repconvar = "rep_ttt_spawn_wave_interval", parent = misclst }
    misclst:AddItem(miscswi)

    xgui.hookEvent("onProcessModules", nil, miscpnl.processModules)
    xgui.addSubModule("Miscellaneous", miscpnl, nil, "terrortown_settings")
end

AddRoundStructureModule()
AddGameplayModule()
AddKarmaModule()
AddMapModule()
AddEquipmentCreditsModule()
AddPlayerMovementModule()
AddPropPossessionModule()
AddAdminModule()
AddMiscModule()