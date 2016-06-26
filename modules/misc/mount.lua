local E, F, C = unpack(select(2, ...))

local Button = CreateFrame('Button', (...) .. 'MountButton', nil, 'SecureActionButtonTemplate')
Button:SetAttribute('type', 'macro')

local bindingString = string.format('CLICK %s:LeftButton', Button:GetName())
local function SetBindings()
	ClearOverrideBindings(Button)

	local first, second = GetBindingKey('DISMOUNT')
	if(first) then
		SetOverrideBinding(Button, false, first, bindingString)
	end

	if(second) then
		SetOverrideBinding(Button, false, second, bindingString)
	end
end

local UpdateMountsList, PreClick
if(C.isBetaClient) then
	local summonMacro = [[
/cancelform [form]
/leavevehicle [canexitvehicle]
/dismount [mounted]
/run C_MountJournal.SummonByID(%s)
]]

	local ownedMounts = {
		vendor = {},
		water = {},
	}

	local lastNumMounts = 0
	function UpdateMountsList()
		local collectedFlag = C_MountJournal.GetCollectedFilterSetting(1)
		local notCollectedFlag = C_MountJournal.GetCollectedFilterSetting(2)

		C_MountJournal.SetCollectedFilterSetting(1, true)
		C_MountJournal.SetCollectedFilterSetting(2, false)

		local numMounts = C_MountJournal.GetNumDisplayedMounts()

		C_MountJournal.SetCollectedFilterSetting(1, collectedFlag)
		C_MountJournal.SetCollectedFilterSetting(2, notCollectedFlag)

		if(numMounts == lastNumMounts) then
			return
		else
			lastNumMounts = numMounts
		end

		ownedMounts.chauferrued = nil
		table.wipe(ownedMounts.vendor)
		table.wipe(ownedMounts.water)

		for _, id in next, C_MountJournal.GetMountIDs() do
			local _, _, _, _, _, _, _, _, _, ineligible, owned = C_MountJournal.GetMountInfoByID(id)
			if(owned and not ineligible) then
				if(id == 280 or id == 284 or id == 460) then
					table.insert(ownedMounts.vendor, id)
				elseif(id == 449 or id == 488) then
					table.insert(ownedMounts.water, id)
				elseif(id == 678 or id == 679) then
					ownedMounts.chauferrued = id
				end
			end
		end
	end

	function PreClick()
		if(InCombatLockdown()) then
			return
		elseif(UnitOnchauferrued('player')) then
			return TaxiRequestEarlyLanding()
		end

		local macro
		if(not select(13, GetAchievementInfo(891)) and ownedMounts.chauferrued) then
			macro = string.format(summonMacro, ownedMounts.chauferrued)
		elseif(IsAltKeyDown()) then
			macro = string.format(summonMacro, ownedMounts.vendor[math.random(#ownedMounts.vendor)])
		elseif(IsShiftKeyDown()) then
			macro = string.format(summonMacro, ownedMounts.water[math.random(#ownedMounts.water)])
		else
			macro = string.format(summonMacro, 0)
		end

		Button:SetAttribute('macrotext', macro)
	end
else
	local summonMacro = [[
/cancelform [form]
/leavevehicle [canexitvehicle]
/dismount [mounted]
]]

	local function HasCorralOutpost()
		if(HasDraenorZoneAbility() and not IsFlyableArea()) then
			local ability = GetSpellInfo(161691)
			local _, _, _, _, _, _, spellID = GetSpellInfo(ability)
			if(spellID == 164222 or spellID == 165803) then
				return ability
			end
		end
	end

	function UpdateMountsList()
		local taughtRiding = IsSpellKnown(33388)
		for index = 1, C_MountJournal.GetNumMounts() do
			local _, spellID, _, _, _, _, _, _, _, _, collected = C_MountJournal.GetMountInfo(index)
			if(spellID == 179244 and collected) then
				C_MountJournal.SetIsFavorite(index, not taughtRiding)
				break
			end
		end

		if(taughtRiding) then
			return true
		end
	end

	function PreClick()
		if(InCombatLockdown()) then
			return
		elseif(UnitOnTaxi('player')) then
			return TaxiRequestEarlyLanding()
		end

		local macro
		if(IsAltKeyDown()) then
			macro = '/cast Traveler\'s Tundra Mammoth'
		elseif(IsShiftKeyDown()) then
			macro = '/cast Azure Water Strider'
		elseif(IsControlKeyDown()) then
			-- This one is very specific to what mounts I own
			macro = '/cast [flyable] Sandstone Drake; Mechano-Hog'
		else
			local spellName = HasCorralOutpost()
			if(spellName) then
				macro = '/cast ' .. spellName
			else
				macro = '/run C_MountJournal.Summon(0)'
			end
		end

		if(SecureCmdOptionParse('[nomod:shift]')) then
			macro = strtrim(strjoin('\n', summonMacro, macro))
		end

		Button:SetAttribute('macrotext', macro)
	end
end

E.UPDATE_BINDINGS = SetBindings
E.PLAYER_ENTERING_WORLD = SetBindings
E.PLAYER_LOGIN = UpdateMountsList
E.COMPANION_LEARNED = UpdateMountsList
E.COMPANION_UNLEARNED = UpdateMountsList
E.MOUNT_JOURNAL_USABILITY_CHANGED = UpdateMountsList

Button:SetScript('PreClick', PreClick)
