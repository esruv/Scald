local _, addon = ...

local PREFIXES = {
	item = ENCOUNTER_JOURNAL_ITEM,
	spell = STAT_CATEGORY_SPELL,
	currency = CURRENCY,
	mount = MOUNT,
	npc = 'NPC',
}

local function addLine(tip, prefix, id)
	if IsShiftKeyDown() then
		tip:AddLine(string.format('%s %s: |cff93ccea%s|r', PREFIXES[prefix], ID, id or UNKNOWN))
	end
end

local tooltip = {}
function tooltip:Item(data)
	addLine(self, 'item', data.id)
end

function tooltip:Spell(data)
	addLine(self, 'spell', data.id)
end

function tooltip:Unit(data)
	if not C_PlayerInfo.GUIDIsPlayer(data.guid) then
		addLine(self, 'npc', addon:ExtractIDFromGUID(data.guid))
	end
end

function tooltip:Currency(data)
	addLine(self, 'currency', data.id)
end

function tooltip:Mount(data)
	addLine(self, 'mount', data.id)

	if data.id then
		local _, spellID = C_MountJournal.GetMountInfoByID(data.id)
		addLine(self, 'spell', spellID)
	end
end

function tooltip:PetAction(data)
	for _, line in next, data.lines do
		if line.tooltipID then
			addLine(self, 'spell', line.tooltipID)
			break
		end
	end
end

tooltip.Corpse = tooltip.Unit
tooltip.UnitAura = tooltip.Spell
tooltip.Toy = tooltip.Item

for dataType, key in next, Enum.TooltipDataType do
	if tooltip[dataType] then
		TooltipDataProcessor.AddTooltipPostCall(key, tooltip[dataType])
	end
end

-- react to shift key
function addon:MODIFIER_STATE_CHANGED(key)
	if key == 'LSHIFT' or key == 'RSHIFT' and GameTooltip:IsShown() then
		GameTooltip:RefreshData() -- high taint contender
	end
end
