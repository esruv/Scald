local E, F, C = unpack(select(2, ...))

local CoordText
local function UpdateCoords(self)
	if(WorldMapScrollFrame:IsMouseOver()) then
		local scale = self:GetEffectiveScale()
		local centerX, centerY = self:GetCenter()
		local width, height = self:GetSize()
		local x, y = GetCursorPosition()

		x = ((x / scale) - (centerX - (width / 2))) / width
		y = (centerY + (height / 2) - (y / scale)) / height

		CoordText:SetFormattedText('%.2f, %.2f', x * 100, y * 100)
		CoordText:SetTextColor(0, 1, 0)
	else
		local x, y = GetPlayerMapPosition('player')
		if(not x or not y) then
			CoordText:SetText(UNAVAILABLE)
			CoordText:SetTextColor(1, 0, 0)
		else
			CoordText:SetFormattedText('%.2f, %.2f', x * 100, y * 100)
			CoordText:SetTextColor(1, 1, 0)
		end
	end
end

local totalElapsed = 0
local function OnUpdate(self, elapsed)
	if(totalElapsed > 0.05) then
		UpdateCoords(self)
		-- UpdateLine(self)

		totalElapsed = 0
	else
		totalElapsed = totalElapsed + elapsed
	end
end

function E:PLAYER_LOGIN()
	CoordText = WorldMapFrameCloseButton:CreateFontString(C.Name .. 'Coordinates', nil, 'GameFontNormal')
	CoordText:SetPoint('RIGHT', WorldMapFrameCloseButton, 'LEFT', -30, 0)

	WorldMapDetailFrame:HookScript('OnUpdate', OnUpdate)
end
