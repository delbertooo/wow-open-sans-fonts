local OpenSansFonts = {
	fonts = {
		{"Open Sans Extrabold",              [[Interface\Addons\OpenSansFonts\fonts\OpenSans-ExtraBold.ttf]]},
		{"Open Sans Extrabold Italic",       [[Interface\Addons\OpenSansFonts\fonts\OpenSans-ExtraBoldItalic.ttf]]},
		{"Open Sans Bold",                   [[Interface\Addons\OpenSansFonts\fonts\OpenSans-Bold.ttf]]},
		{"Open Sans Bold Italic",            [[Interface\Addons\OpenSansFonts\fonts\OpenSans-BoldItalic.ttf]]},
		{"Open Sans Italic",                 [[Interface\Addons\OpenSansFonts\fonts\OpenSans-Italic.ttf]]},
		{"Open Sans Light",                  [[Interface\Addons\OpenSansFonts\fonts\OpenSans-Light.ttf]]},
		{"Open Sans Light Italic",           [[Interface\Addons\OpenSansFonts\fonts\OpenSans-LightItalic.ttf]]},
		{"Open Sans Regular",                [[Interface\Addons\OpenSansFonts\fonts\OpenSans-Regular.ttf]]},
		{"Open Sans Semibold",               [[Interface\Addons\OpenSansFonts\fonts\OpenSans-Semibold.ttf]]},
		{"Open Sans Semibold Italic",        [[Interface\Addons\OpenSansFonts\fonts\OpenSans-SemiboldItalic.ttf]]},
		{"Open Sans Condensed Bold",         [[Interface\Addons\OpenSansFonts\fonts\OpenSans-CondBold.ttf]]},
		{"Open Sans Condensed Light",        [[Interface\Addons\OpenSansFonts\fonts\OpenSans-CondLight.ttf]]},
		{"Open Sans Condensed Light Italic", [[Interface\Addons\OpenSansFonts\fonts\OpenSans-CondLightItalic.ttf]]},
	}
}

function OpenSansFonts:TryRegister()
	if self.registred then return true end

	local LSM = LibStub("LibSharedMedia-3.0", true)
	if not LSM then return false end

	self.registred = true

	for _,definition in ipairs(self.fonts) do
		local name, path = definition[1], definition[2]
		LSM:Register(LSM.MediaType.FONT, name, path, LSM.LOCALE_BIT_western + LSM.LOCALE_BIT_ruRU)
	end

	return true
end

function OpenSansFonts:InstallDelayedRegistrationHook()
	if self.frame then return end

	self.frame = CreateFrame("Frame")
	self.frame:SetScript("OnEvent", function (_, _, ...)
		if self:TryRegister() then
			self.frame:UnregisterEvent("ADDON_LOADED")
		end
	end)
	self.frame:RegisterEvent("ADDON_LOADED")
end


if not OpenSansFonts:TryRegister() then
	OpenSansFonts:InstallDelayedRegistrationHook()
end

