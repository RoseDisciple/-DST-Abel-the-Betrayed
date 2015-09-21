
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {

        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/wilson.fsb" ),
        Asset( "ANIM", "anim/beard.zip" ),

        Asset( "ANIM", "anim/abel.zip" ),
        Asset( "ANIM", "anim/ghost_abel_build.zip" ),
}
local prefabs = {}

-- Custom starting items
local start_inv = {
"flowerhat",
 "glommerflower",
 "spear",
}

-- When the character is revived from human
local function onbecamehuman(inst)
	-- Set speed when loading or reviving from ghost (optional)
	inst.components.locomotor.walkspeed = 5
	inst.components.locomotor.runspeed = 7
end

-- When loading or spawning the character
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)

    if not inst:HasTag("playerghost") then
        onbecamehuman(inst)
    end
end
-- Eating Meat Bonus
local function oneat(inst, food)
    if food and food.components.edible and food.components.edible.foodtype == FOODTYPE.VEGGIE then -- If it is food, edible, and meat
     
        local healthvalue = food.components.edible.healthvalue -- Shortcuts for having to write only "healthvalue" instead of "food.components.edible.healthvalue"
        local hungervalue = food.components.edible.foodvalue
        local sanityvalue = food.components.edible.sanityvalue
         
        if healthvalue and not healthvalue == 0 then -- If the food item has a health value, and it isn't 0
            if healthvalue >= 0 then -- If the food item's health value is over 0
            inst.components.health:DoDelta(healthvalue * 7.5) -- Multiplies food's health value by 1.5
            else -- If the food item's health value is below 0
            inst.components.health:DoDelta(healthvalue * -1.5) -- Multiplies food's health value by 1.5 and makes it positive
            end
        end
        if hungervalue and not hungervalue == 0 then
            if hungervalue >= 0 then
            inst.components.hunger:DoDelta(hungervalue * 7.5) -- Multiplies food's hunger value by 1.5
            else
            inst.components.hunger:DoDelta(hungervalue * -1.5) -- Multiplies food's hunger value by 1.5 and makes it positive
            end
        end
        if sanityvalue and not sanityvalue == 0 then
            if sanityvalue >= 0 then
            inst.components.sanity:DoDelta(sanityvalue * 7.5) -- Multiplies food's sanity value by 1.5
            else
            inst.components.sanity:DoDelta(sanityvalue * -1.5) -- Multiplies food's sanity value by 1.5 and makes it positive
            end
        end
    end
end

-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "abel.tex" )
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	inst.components.temperature.inherentinsulation = (TUNING.INSULATION_MED * 5)
	inst.components.temperature.mintemp = 20
	inst.components.temperature.maxtemp = 60
	
	-- Uncomment if "wathgrithr"(Wigfrid) or "webber" voice is used
    --inst.talker_path_override = "dontstarve_DLC001/characters/"
	
	-- Stats	
	inst.components.health:SetMaxHealth(300)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(150)
	
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 3
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
end

return MakePlayerCharacter("abel", prefabs, assets, common_postinit, master_postinit, start_inv)
