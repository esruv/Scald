local E, F, C = unpack(select(2, ...))

local Parent = CreateFrame('Frame', C.Name .. 'ExtraBarParent', UIParent, 'SecureHandlerStateTemplate')
Parent:SetPoint('BOTTOM', _G[C.Name .. 'ActionBar'], 0, 148)
Parent:SetSize(50, 50)

RegisterStateDriver(Parent, 'visibility', '[petbattle][overridebar][vehicleui] hide; show')

ExtraActionBarFrame:SetParent(Parent)
ExtraActionBarFrame:EnableMouse(false)
ExtraActionBarFrame:SetAllPoints()
ExtraActionBarFrame.ignoreFramePositionManager = true

ExtraActionButton1.style:Hide()
