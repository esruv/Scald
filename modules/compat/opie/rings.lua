local addonName, addon = ...

local RINGS = {
	{
		name = 'Mage Teleport',
		limit = 'MAGE',

		{'spell', 193759, c='d000ff'},                    -- Hall of the Guardian
		{'spell', 446540, c='9bf2f0'},                    -- Dornogal
		{'spell', 395277, c='ffc853'},                    -- Valdrakken
		{'spell', 344587, c='209fe6'},                    -- Oribos
		{'spell', 281404, c='f9e222', show='[horde]'},    -- Dazar'alor
		{'spell', 281403, c='21d2d5', show='[alliance]'}, -- Boralus
		{'spell', 224869, c='83ff61'},                    -- Dalaran - Broken Isles
		{'spell', 176242, c='00abf0', show='[horde]'},    -- Warspear
		{'spell', 176248, c='f03000', show='[alliance]'}, -- Stormshield
		{'spell', 132627, c='ffc34d', show='[horde]'},    -- Vale of Eternal Blossoms
		{'spell', 132621, c='ffc34d', show='[alliance]'}, -- Vale of Eternal Blossoms
		{'spell', 88344,  c='f03c00', show='[horde]'},    -- Tol Barad
		{'spell', 88342,  c='f03c00', show='[alliance]'}, -- Tol Barad
		{'spell', 53140,  c='a54cff'},                    -- Dalaran - Northrend
		{'spell', 35715,  c='4dffc3', show='[horde]'},    -- Shattrath
		{'spell', 33690,  c='4dffc3', show='[alliance]'}, -- Shattrath
		{'spell', 49358,  c='b0ff26', show='[horde]'},    -- Stonard
		{'spell', 49359,  c='f09d00', show='[alliance]'}, -- Theramore
		{'spell', 3563,   c='77ff4d', show='[horde]'},    -- Undercity
		{'spell', 3562,   c='4cddff', show='[alliance]'}, -- Ironforge
		{'spell', 3567,   c='ff8126', show='[horde]'},    -- Orgrimmar
		{'spell', 3561,   c='0d54f0', show='[alliance]'}, -- Stormwind
		{'spell', 3566,   c='4cddff', show='[horde]'},    -- Thunder Bluff
		{'spell', 3565,   c='9d0df0', show='[alliance]'}, -- Darnassus
		{'spell', 32272,  c='f00e00', show='[horde]'},    -- Silvermoon
		{'spell', 32271,  c='f024e2', show='[alliance]'}, -- Exodar
		{'spell', 120145, c='a54cff'},                    -- Ancient Dalaran
	},
	{
		name = 'Mage Portal',
		limit = 'MAGE',

		{'spell', 193759, c='d000ff'},                    -- Hall of the Guardian (just for symmetry)
		{'spell', 446534, c='9bf2f0'},                    -- Dornogal
		{'spell', 395289, c='ffc853'},                    -- Valdrakken
		{'spell', 344597, c='209fe6'},                    -- Oribos
		{'spell', 281402, c='f9e222', show='[horde]'},    -- Dazar'alor
		{'spell', 281400, c='21d2d5', show='[alliance]'}, -- Boralus
		{'spell', 224871, c='83ff61'},                    -- Dalaran - Broken Isles
		{'spell', 176244, c='00abf0', show='[horde]'},    -- Warspear
		{'spell', 176246, c='f03000', show='[alliance]'}, -- Stormshield
		{'spell', 132626, c='ffc34d', show='[horde]'},    -- Vale of Eternal Blossoms
		{'spell', 132620, c='ffc34d', show='[alliance]'}, -- Vale of Eternal Blossoms
		{'spell', 88346,  c='f03c00', show='[horde]'},    -- Tol Barad
		{'spell', 88345,  c='f03c00', show='[alliance]'}, -- Tol Barad
		{'spell', 53142,  c='a54cff'},                    -- Dalaran - Northrend
		{'spell', 35717,  c='4dffc3', show='[horde]'},    -- Shattrath
		{'spell', 33691,  c='4dffc3', show='[alliance]'}, -- Shattrath
		{'spell', 49361,  c='b0ff26', show='[horde]'},    -- Stonard
		{'spell', 49360,  c='f09d00', show='[alliance]'}, -- Theramore
		{'spell', 11418,  c='77ff4d', show='[horde]'},    -- Undercity
		{'spell', 11416,  c='4cddff', show='[alliance]'}, -- Ironforge
		{'spell', 11417,  c='ff8126', show='[horde]'},    -- Orgrimmar
		{'spell', 10059,  c='0d54f0', show='[alliance]'}, -- Stormwind
		{'spell', 11420,  c='4cddff', show='[horde]'},    -- Thunder Bluff
		{'spell', 11419,  c='9d0df0', show='[alliance]'}, -- Darnassus
		{'spell', 32267,  c='f00e00', show='[horde]'},    -- Silvermoon
		{'spell', 32266,  c='f024e2', show='[alliance]'}, -- Exodar
		{'spell', 120146, c='a54cff'},                    -- Ancient Dalaran
	},
	{
		name = 'Hunter Pets',
		limit = 'HUNTER',

		{'spell', 2641, show='[@pet,exists,nodead]', fastClick=true}, -- Dismiss Pet
		{'spell', 883, show='[nopet,havepet:1]'}, -- Call Pet 1
		{'spell', 83242, show='[nopet,havepet:2]'}, -- Call Pet 2
		{'spell', 83243, show='[nopet,havepet:3]'}, -- Call Pet 3
		{'spell', 83244, show='[nopet,havepet:4]'}, -- Call Pet 4
		{'spell', 83245, show='[nopet,havepet:5]'}, -- Call Pet 5
		{'spell', 1515, -- Tame Beast (only show if we have empty slots)
			show='[nopet,nohavepet:1][nopet,nohavepet:2][nopet,nohavepet:3][nopet,nohavepet:4][nopet,nohavepet:5]'
		}
	},
	{
		name = 'Warlock Demons',
		limit = 'WARLOCK',

		{'spell', 30146}, -- Felguard
		{'spell', 691}, -- Felhunter
		{'spell', 688}, -- Imp
		{'spell', 697}, -- Voidwalker
		{'spell', 366222}, -- Succubus
	},
	addon.HEARTHSTONE_IDS,
	{
		name = 'Wormhole',

		{'toy', 221966}, -- Wormhole Generator: Khaz Algar
		{'toy', 198156}, -- Wyrmhole Generator (Dragonflight)
		{'toy', 172924}, -- Wormhole Generator: Shadowlands
		{'toy', 168807}, -- Wormhole Generator: Kul Tiras
		{'toy', 168808}, -- Wormhole Generator: Zandalar
		{'item', 144341}, -- Rechargeable Reaves Battery (Legion)
		{'toy', 151652}, -- Wormhole Generator: Argus
		{'toy', 112059}, -- Wormhole Centrifuge (Draenor)
		{'toy', 48933}, -- Wormhole Generator: Northrend
		{'toy', 87215}, -- Wormhole Generator: Pandaria
		{'toy', 18984}, -- Dimensional Ripper - Everlook
		{'toy', 30542}, -- Dimensional Ripper - Area 52
		{'toy', 18986}, -- Ultrasafe Teleporter: Gadgetzan
		{'toy', 30544}, -- Ultrasafe Teleporter: Toshley's Station
	},
	{
		name = 'Teleport',

		-- hearthstones
		{'ring', addonName .. 'Hearthstone', fastClick=true, rotationMode='shuffle'},

		-- engineering wormholes
		{'ring', addonName .. 'Wormhole'},

		-- equipped items
		{'item', 46874, show='[have:46874]'}, -- Argent Crusader's Tabard
		{'item', 142298, show='[have:142298]'}, -- Astonishingly Scarlet Slippers
		{'item', 22632, show='[have:22632]'}, -- Atiesh, Greatstaff of the Guardian (Druid)
		{'item', 22589, show='[have:22589]'}, -- Atiesh, Greatstaff of the Guardian (Mage)
		{'item', 22631, show='[have:22631]'}, -- Atiesh, Greatstaff of the Guardian (Priest)
		{'item', 22630, show='[have:22630]'}, -- Atiesh, Greatstaff of the Guardian (Warlock)
		{'item', 40586, show='[have:40586]'}, -- Band of the Kirin Tor
		{'item', 63379, show='[have:63379]'}, -- Baradin Wardens Tabard
		{'item', 32757, show='[have:32757]'}, -- Blessed Medallion of Karabor
		{'item', 50287, show='[have:50287]'}, -- Boots of the Bay      (not found in above filter)
		{'item', 166560, show='[have:166560]'}, -- Captain's Signet of Command
		{'item', 189827, show='[have:189827]'}, -- Cartel Xy's Proof of Initiation
		{'item', 65360, show='[have:65360]'}, -- Cloak of Coordination (Alliance)
		{'item', 65274, show='[have:65274]'}, -- Cloak of Coordination (Horde)
		{'item', 166559, show='[have:166559]'}, -- Commander's Signet of Battle
		{'item', 139599, show='[have:139599]'}, -- Empowered Ring of the Kirin Tor
		{'item', 48954, show='[have:48954]'}, -- Etched Band of the Kirin Tor
		{'item', 48955, show='[have:48955]'}, -- Etched Loop of the Kirin Tor
		{'item', 48956, show='[have:48956]'}, -- Etched Ring of the Kirin Tor
		{'item', 48957, show='[have:48957]'}, -- Etched Signet of the Kirin Tor
		{'item', 17690, show='[have:17690]'}, -- Frostwolf Insignia Rank 1
		{'item', 17905, show='[have:17905]'}, -- Frostwolf Insignia Rank 2
		{'item', 17906, show='[have:17906]'}, -- Frostwolf Insignia Rank 3
		{'item', 17907, show='[have:17907]'}, -- Frostwolf Insignia Rank 4
		{'item', 17908, show='[have:17908]'}, -- Frostwolf Insignia Rank 5
		{'item', 17909, show='[have:17909]'}, -- Frostwolf Insignia Rank 6
		{'item', 63378, show='[have:63378]'}, -- Hellscream's Reach Tabard
		{'item', 45688, show='[have:45688]'}, -- Inscribed Band of the Kirin Tor
		{'item', 45689, show='[have:45689]'}, -- Inscribed Loop of the Kirin Tor
		{'item', 45690, show='[have:45690]'}, -- Inscribed Ring of the Kirin Tor
		{'item', 45691, show='[have:45691]'}, -- Inscribed Signet of the Kirin Tor
		{'item', 44934, show='[have:44934]'}, -- Loop of the Kirin Tor
		{'item', 169064, show='[have:169064]'}, -- Mountebank's Colorful Cloak
		{'item', 118907, show='[have:118907]'}, -- Pit Fighter's Punching Ring (Alliance)
		{'item', 118908, show='[have:118908]'}, -- Pit Fighter's Punching Ring (Horde)
		{'item', 144391, show='[have:144391]'}, -- Pugilist's Powerful Punching Ring (Alliance)
		{'item', 144392, show='[have:144392]'}, -- Pugilist's Powerful Punching Ring (Horde)
		{'item', 44935, show='[have:44935]'}, -- Ring of the Kirin Tor
		{'item', 28585, show='[have:28585]'}, -- Ruby Slippers
		{'item', 51560, show='[have:51560]'}, -- Runed Band of the Kirin Tor
		{'item', 51558, show='[have:51558]'}, -- Runed Loop of the Kirin Tor
		{'item', 51559, show='[have:51559]'}, -- Runed Ring of the Kirin Tor
		{'item', 51557, show='[have:51557]'}, -- Runed Signet of the Kirin Tor
		{'item', 63352, show='[have:63352]'}, -- Shroud of Cooperation (Alliance)
		{'item', 63353, show='[have:63353]'}, -- Shroud of Coordination (Horde)
		{'item', 40585, show='[have:40585]'}, -- Signet of the Kirin Tor
		{'item', 17691, show='[have:17691]'}, -- Stormpike Insignia Rank 1
		{'item', 17900, show='[have:17900]'}, -- Stormpike Insignia Rank 2
		{'item', 17901, show='[have:17901]'}, -- Stormpike Insignia Rank 3
		{'item', 17902, show='[have:17902]'}, -- Stormpike Insignia Rank 4
		{'item', 17903, show='[have:17903]'}, -- Stormpike Insignia Rank 5
		{'item', 17904, show='[have:17904]'}, -- Stormpike Insignia Rank 6
		{'item', 95051, show='[have:95051]'}, -- The Brassiest Knuckle (Alliance)
		{'item', 95050, show='[have:95050]'}, -- The Brassiest Knuckle (Horde)
		{'item', 103678, show='[have:103678]'}, -- Time-Lost Artifact
		{'item', 142469, show='[have:142469]'}, -- Violet Seal of the Grand Magus
		{'item', 63206, show='[have:63206]'}, -- Wrap of Unity (Alliance)
		{'item', 63207, show='[have:63207]'}, -- Wrap of Unity (Horde)

		-- misc toys
		{'toy', 151016}, -- Fractured Necrolyte Skull (Shadowmoon Valley)
		{'toy', 153004}, -- Unstable Portal Emitter (random)
		{'toy', 136849, show='[me:druid]'}, -- Nature's Beacon (random)
		{'toy', 95568, show='[horde,zone:Isle of Thunder][horde,zone:Throne of Thunder]'}, -- Sunreaver Beacon
		{'toy', 95567, show='[alliance,zone:Isle of Thunder][alliance,zone:Throne of Thunder]'}, -- Kirin Tor Beacon
		{'toy', 140324, show='[zone:Suramar]'}, -- Mobile Telemancy Beacon
		{'toy', 169298, show='[horde,zone:Alterac Valley]'}, -- Frostwolf Insignia
		{'toy', 169297, show='[alliance,zone:Alterac Valley]'}, -- Stormpike Insignia
		{'toy', 43824, show='[zone:Dalaran]'}, -- The Schools of Arcane Magic - Mastery

		-- class/racial spells
		{'spell', 193753, show='[me:druid]'}, -- Dreamwalk
		{'spell', 18960, show='[me:druid]'}, -- Teleport: Moonglade
		{'item', 139590, show='[me:rogue]'}, -- Scroll of Teleport: Ravenholdt
		{'spell', 50977, show='[me:deathknight]'}, -- Death Gate
		{'spell', 312370, show='[race:vulpera]'}, -- Make Camp
		{'spell', 312372, show='[race:vulpera]'}, -- Return to Camp
		{'spell', 126892, show='[me:monk]'}, -- Zen Pilgrimage
		{'spell', 556, show='[me:shaman]'}, -- Astral Recall
		{'spell', 265225--[[, show='[race:dark iron dwarf]']]}, -- Mole Machine
		{'ring', addonName .. 'MagePortal', show='[me:mage]'},
		{'ring', addonName .. 'MageTeleport', show='[me:mage]'},

		-- misc items
		{'item', 37863}, -- Direbrew's Remote
		{'item', 180817, show='[zone:The Maw]'}, -- Cypher of Relocation
		{'item', 141605, -- Flight Master's Whistle (only shown in zones where it can be used)
			show = '[zone:Azsuna][zone:Val\'Sharah][zone:Highmountain][zone:Stormheim][zone:Suramar][zone:The Broken Shore][zone:Krokuun][zone:Antoran Wastes][zone:Eredath][zone:Zuldazar][zone:Nazmir][zone:Vol\'dun][zone:Tiragarde Sound][zone:Drustvar][zone:Stormsong Valley][zone:Nazjatar][zone:Mechagon]' --[zoneid:1332][zoneid:943]'
		},
		{'item', 168862, -- G.E.A.R. Tracking Beacon (alternative to Flight Master's Whistle, same rules)
			show = '[zone:Azsuna][zone:Val\'Sharah][zone:Highmountain][zone:Stormheim][zone:Suramar][zone:The Broken Shore][zone:Krokuun][zone:Antoran Wastes][zone:Eredath][zone:Zuldazar][zone:Nazmir][zone:Vol\'dun][zone:Tiragarde Sound][zone:Drustvar][zone:Stormsong Valley][zone:Nazjatar][zone:Mechagon]' --[zoneid:1332][zoneid:943]'
		},
		{'toy', 205255, show='[zone:Zaralek Cavern]'}, -- Niffen Diggin' Mits (Zaralek Cavern, Dragon Isles)
		{'toy', 110560}, -- Garrison Hearthstone (OPie has internal checks for these toys, no need for show conditional)
		{'toy', 140192}, -- Dalaran Hearthstone (OPie has internal checks for these toys, no need for show conditional)
		{'item', 219222, show='[have:219222]'}, -- Time-Lost Artifact
		{'item', 217930, show='[have:217930]'}, -- Nostwin's Voucher (infinite bazaar during timerunning in 2024)
	},
	{
		name = 'Special Mounts',

		-- the first owned mount with the flag "fastClick" will be the default action
		{'spell', 465235, fastClick=true}, -- Trader's Gilded Brutosaur
		{'spell', 264058, fastClick=true}, -- Mighty Caravan Brutosaur
		{'spell', 457485, fastClick=true}, -- Grizzly Hills Packmaster
		{'spell', 122708, fastClick=true}, -- Grand Expedition Yak
		{'spell', 61447, show='[horde]', fastClick=true}, -- Traveler's Tundra Mammoth (Horde)
		{'spell', 61425, show='[alliance]', fastClick=true}, -- Traveler's Tundra Mammoth (Alliance)
		{'spell', 436854}, -- Swift Flight Style
		{'ring', addonName .. 'SwimmingMounts'}, -- TODO: randomize?
		{'spell', 48778, show='[known:444008]'}, -- Acherus Deathcharger w/ On a Paler Horse hero talent
	},
	{
		name = 'Professions',

		{'spell', 4036}, -- Engineering
		{'spell', 3908}, -- Tailoring
		{'spell', 2108}, -- Leatherworking
		{'spell', 2018}, -- Blacksmithing
		{'spell', 7411}, -- Enchanting
		{'spell', 2259}, -- Alchemy
		{'spell', 25229}, -- Jewelcrafting
		{'spell', 45357}, -- Inscription
		{'spell', 2656}, -- Mining Journal
		{'spell', 193290}, -- Herbalism Journal
		{'spell', 194174}, -- Skinning Journal
		{'spell', 2550}, -- Cooking
		{'spell', 78670}, -- Archaeology
		{'spell', 271990}, -- Fishing Journal

		{'spell', 53428}, -- (Death Knight) Runeforging (not a profession but lets treat it as one for convenience)

		-- slap bank utilities in here as I often use them in relation to professions
		{'spell', 83958}, -- Mobile Banking
		{'spell', 460905}, -- Warband Bank Distance Inhibitor
	},
}

local sliceTokens = {}
local function addRing(data)
	local id = addonName .. data.name:gsub(' ', '')

	-- each slice needs a unique token
	-- https://www.townlong-yak.com/addons/opie/dev/slice-token-requirements
	for _, slice in next, data do
		if type(slice) == 'table' then
			slice.sliceToken = id .. '_' .. slice[1] .. slice[2]

			assert(not sliceTokens[slice.sliceToken], 'sliceToken ' .. slice.sliceToken .. ' is not unique')
			sliceTokens[slice.sliceToken] = true
		end
	end

	OPie.CustomRings:SetExternalRing(id, data)
end

addon:HookAddOn('OPie', function()
	for _, ring in next, RINGS do
		addRing(ring)
	end
end)

local function addSwimmingMounts()
	local ring = {
		name = 'Swimming Mounts'
	}

	-- TODO: swimming mounts have different speeds still? might want to sort them based on that
	for _, mountID in next, C_MountJournal.GetMountIDs() do
		local _, _, _, _, mountType = C_MountJournal.GetMountInfoExtraByID(mountID)
		if mountType == 231 or mountType == 254 then -- turtle/swimming
			local _, spellID = C_MountJournal.GetMountInfoByID(mountID)
			table.insert(ring, 1, {'spell', spellID})
		end
	end

	addRing(ring)
end

function addon:OnLogin()
	if addon:IsAddOnEnabled('OPie') then
		addSwimmingMounts()
	end
end

