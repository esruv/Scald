local _, addon = ...

local widgetMixin = {}
function widgetMixin:CreateIcon(layer)
	local icon = self:CreateTexture(nil, layer or 'ARTWORK')
	icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	icon:SetPoint('TOPLEFT', 1, -1)
	icon:SetPoint('BOTTOMRIGHT', -1, 1)
	return icon
end

local textMixin = {}
function textMixin:SetValue(value)
	self:SetText(value > 1 and value or '')
end

function widgetMixin:CreateText()
	local text = self:CreateTextParent():CreateFontString(nil, 'OVERLAY', addon.FONT)
	return Mixin(text, textMixin)
end

function widgetMixin:CreateTextParent()
	if not self.textParent then
		-- to avoid clipping
		self.textParent = CreateFrame('Frame', nil, self)
		self.textParent:SetFrameLevel(20)
	end
	return self.textParent
end

addon.mixins.widget = widgetMixin

function addon:CreateFrame(suffix, ...)
	local frame = CreateFrame('Frame', addon.NAME .. suffix, ...)
	return Mixin(frame, widgetMixin, addon.mixins.event)
end

function addon:CreateButton(suffix, ...)
	local button = CreateFrame('Button', addon.NAME .. suffix, ...)
	return Mixin(button, widgetMixin, addon.mixins.event)
end

function addon:CreateCheckButton(suffix, ...)
	local button = CreateFrame('CheckButton', addon.NAME .. suffix, ...)
	return Mixin(button, widgetMixin, addon.mixins.event)
end
