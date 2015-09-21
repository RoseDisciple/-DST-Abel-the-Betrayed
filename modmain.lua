PrefabFiles = {
	"abel",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/abel.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/abel.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/abel.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/abel.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/abel_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/abel_silho.xml" ),

    Asset( "IMAGE", "bigportraits/abel.tex" ),
    Asset( "ATLAS", "bigportraits/abel.xml" ),
	
	Asset( "IMAGE", "images/map_icons/abel.tex" ),
	Asset( "ATLAS", "images/map_icons/abel.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_abel.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_abel.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_abel.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_abel.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.abel = "Abel the Betrayed"
STRINGS.CHARACTER_NAMES.abel = "Abel"
STRINGS.CHARACTER_DESCRIPTIONS.abel = "*Perk 1\n*Perk 2\n*Perk 3"
STRINGS.CHARACTER_QUOTES.abel = "\"Quote\""

-- Custom speech strings
STRINGS.CHARACTERS.ABEL = require "speech_abel"

-- The character's name as appears in-game 
STRINGS.NAMES.ABEL = "Abel"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ABEL = 
{
	GENERIC = "♥♥ Wow. Abel is so cute like that ~! ♥♥",
	ATTACKER = "That Abel looks shifty...",
	MURDERER = "How dare you!!",
	REVIVER = "Abel, thank you.",
	GHOST = "Abel needs to be revived!",
}


AddMinimapAtlas("images/map_icons/abel.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("abel", "MALE")

