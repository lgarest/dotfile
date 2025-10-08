hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "W", function()
	-- hs.alert.show("Hello World!")
	hs.notify.new({ title = "Hammerspoon", informativeText = "Hello World" }):send()
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
	hs.alert.show("Config loaded")
	hs.timer.doAfter(0.5, function() -- Wait for a moment to ensure the alert is shown
		hs.reload()
	end)
end)

-- Load SpoonInstall
hs.loadSpoon("SpoonInstall")

-- Configure SpoonInstall to use syncinstall (blocks until installation is complete)
spoon.SpoonInstall.use_syncinstall = true

-- Set up the official Spoon repository
spoon.SpoonInstall.repos = {
	default = {
		url = "https://github.com/Hammerspoon/Spoons",
		desc = "Main Hammerspoon Spoon Repository",
	},
}

spoon.SpoonInstall:andUse("MicMute", {
	config = {
		micName = "Poly V4320 Series",
		micIcon = "mic",
		micMutedIcon = "mic.slash",
	},
	hotkeys = { toggle = { { "cmd", "shift" }, "4" } },
})

-- Load the file opener module
local status, fileOpener = pcall(require, "file_opener")
if status then
	-- hs.alert.show("File opener loaded successfully")
	-- Bind to Cmd+Alt+Ctrl+N to show the file chooser
	fileOpener.bindHotkey({ "cmd", "alt", "ctrl" }, "N")

	-- Also add a menu item as an alternative
	if not hsMenubar then
		hsMenubar = hs.menubar.new()
	end
	if hsMenubar then
		hsMenubar:setTitle("Notes")
		hsMenubar:setMenu({
			{
				title = "Open Notes File",
				fn = function()
					fileOpener.showFileChooser()
				end,
			},
			{ title = "-" },
			{
				title = "Reload Config",
				fn = function()
					hs.reload()
				end,
			},
		})
	end
else
	hs.alert.show("Failed to load file_opener: " .. tostring(fileOpener))
	print("Error loading file_opener:", fileOpener)
end
