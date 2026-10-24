addMaid(spectre)
gui = Instance.new('ScreenGui')
gui.Name = randomString()
gui.DisplayOrder = 9999999
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
gui.IgnoreGuiInset = true

if spectre.ThreadFix then
	local holder = Instance.new('Folder')
	holder.Parent = cloneref(game:GetService('CoreGui'))
	gui.OnTopOfCoreBlur = true
	gui.Parent = (gethui and gethui()) or cloneref(game:GetService('CoreGui'))
	spectre.holder = holder
else
	gui.Parent = cloneref(game:GetService('Players')).LocalPlayer.PlayerGui
	gui.ResetOnSpawn = false
	spectre.holder = gui
end
spectre.gui = gui

scaledgui = Instance.new('Frame')
scaledgui.BackgroundTransparency = 1
scaledgui.Name = 'ScaledGui'
scaledgui.Size = UDim2.fromScale(1, 1)
scaledgui.Parent = gui
clickgui = Instance.new('Frame')
clickgui.BackgroundTransparency = 1
clickgui.Name = 'ClickGui'
clickgui.Size = UDim2.fromScale(1, 1)
clickgui.Visible = false
clickgui.Parent = scaledgui
local scarcitybanner = Instance.new('TextLabel')
scarcitybanner.BackgroundTransparency = 1
scarcitybanner.FontFace = uipallet.Font
scarcitybanner.Position = UDim2.fromScale(0, 0.97)
scarcitybanner.Size = UDim2.fromScale(1, 0.018)
scarcitybanner.Text = 'All update logs and game support are found in the discord, click the discord icon to join.'
scarcitybanner.TextColor3 = Color3.new(1, 1, 1)
scarcitybanner.TextScaled = true
scarcitybanner.TextStrokeTransparency = 0.5
scarcitybanner.Parent = clickgui
local modal = Instance.new('TextButton')
modal.BackgroundTransparency = 1
modal.Modal = true
modal.Text = ''
modal.Parent = clickgui
local cursor = Instance.new('ImageLabel')
cursor.BackgroundTransparency = 1
cursor.Image = 'rbxasset://textures/Cursors/KeyboardMouse/ArrowFarCursor.png'
cursor.Size = UDim2.fromOffset(64, 64)
cursor.Visible = false
cursor.Parent = gui
notifications = Instance.new('Folder')
notifications.Name = 'Notifications'
notifications.Parent = scaledgui
tooltip = Instance.new('TextLabel')
tooltip.BackgroundColor3 = color.Dark(uipallet.Main, 0.02)
tooltip.FontFace = uipallet.Font
tooltip.Position = UDim2.fromScale(-1, -1)
tooltip.RichText = true
tooltip.Text = ''
tooltip.TextColor3 = color.Dark(uipallet.Text, 0.16)
tooltip.TextSize = 12
tooltip.Visible = false
tooltip.ZIndex = 5
tooltip.Parent = scaledgui
toolblur = addBlur(tooltip)
addCorner(tooltip)
scale = Instance.new('UIScale')
scale.Scale = math.max(gui.AbsoluteSize.X / 1920, 0.6)
scale.Parent = scaledgui
scaledgui.Size = UDim2.fromScale(1 / scale.Scale, 1 / scale.Scale)
components.GUI({})

spectre:CreateCategory({
	Name = 'Combat',
	Icon = getvapeasset('spectre/assets/new/combat.png'),
	Size = UDim2.fromOffset(13, 14)
})
spectre:CreateCategory({
	Name = 'Blatant',
	Icon = getvapeasset('spectre/assets/new/blatant.png'),
	Size = UDim2.fromOffset(14, 14)
})
spectre:CreateCategory({
	Name = 'Render',
	Icon = getvapeasset('spectre/assets/new/render.png'),
	Size = UDim2.fromOffset(15, 14)
})
spectre:CreateCategory({
	Name = 'Utility',
	Icon = getvapeasset('spectre/assets/new/utility.png'),
	Size = UDim2.fromOffset(15, 14)
})
spectre:CreateCategory({
	Name = 'World',
	Icon = getvapeasset('spectre/assets/new/world.png'),
	Size = UDim2.fromOffset(14, 14)
})
spectre:CreateCategory({
	Name = 'Inventory',
	Icon = getvapeasset('spectre/assets/new/inventory.png'),
	Size = UDim2.fromOffset(15, 14)
})
spectre.Categories.Main:CreateDivider({
	Text = 'misc'
})

--[[
	Friends
]]
do
	local friends
	local friendscolor = {
		Hue = 1,
		Sat = 1,
		Value = 1
	}

	friends = spectre:CreateCategoryList({
		Name = 'Friends',
		Icon = getvapeasset('spectre/assets/new/friends.png'),
		Size = UDim2.fromOffset(17, 16),
		Placeholder = 'Roblox username',
		Color = Color3.fromRGB(5, 134, 105),
		Player = true,
		Function = function()
			friends.Update:Fire()
			friends.ColorUpdate:Fire(friendscolor.Hue, friendscolor.Sat, friendscolor.Value)
		end
	})
	friends.Update = Instance.new('BindableEvent')
	friends.ColorUpdate = Instance.new('BindableEvent')
	friends:CreateToggle({
		Name = 'Recolor visuals',
		Darker = true,
		Default = true,
		Function = function()
			friends.Update:Fire()
			friends.ColorUpdate:Fire(friendscolor.Hue, friendscolor.Sat, friendscolor.Value)
		end
	})
	friendscolor = friends:CreateColorSlider({
		Name = 'Friends color',
		Darker = true,
		Function = function(hue, sat, val)
			for _, v in friends.Object.Children:GetChildren() do
				local dot = v:FindFirstChild('Dot')
				if dot and dot.BackgroundColor3 ~= color.Light(uipallet.Main, 0.37) then
					dot.BackgroundColor3 = Color3.fromHSV(hue, sat, val)
					dot.Dot.BackgroundColor3 = dot.BackgroundColor3
				end
			end

			friends.ColorUpdate:Fire(hue, sat, val)
		end
	})
	friends:CreateToggle({
		Name = 'Use friends',
		Darker = true,
		Default = true,
		Function = function()
			friends.Update:Fire()
			friends.ColorUpdate:Fire(friendscolor.Hue, friendscolor.Sat, friendscolor.Value)
		end
	})
	spectre:Clean(friends.Update)
	spectre:Clean(friends.ColorUpdate)
end

--[[
	Profiles
]]
spectre:CreateCategoryList({
	Name = 'Profiles',
	Icon = getvapeasset('spectre/assets/new/profiles.png'),
	Size = UDim2.fromOffset(17, 10),
	Position = UDim2.fromOffset(12, 16),
	Placeholder = 'Type name',
	Profiles = true
})

--[[
	Targets
]]
local targets
targets = spectre:CreateCategoryList({
	Name = 'Targets',
	Icon = getvapeasset('spectre/assets/new/friends.png'),
	Size = UDim2.fromOffset(17, 16),
	Placeholder = 'Roblox username',
	Player = true,
	Function = function()
		targets.Update:Fire()
	end
})
targets.Update = Instance.new('BindableEvent')
spectre:Clean(targets.Update)

components.LegitWindow()
spectre.SearchBar = components.SearchBar()
spectre.Categories.Main:CreateOverlayBar()

--[[
	General Settings
]]

local general = spectre.Categories.Main.Settings:CreateSettingsPane({Name = 'General'})
local settingConnections = {}
spectre.MultiKeybind = general:CreateToggle({
	Name = 'Enable Multi-Keybinding',
	Tooltip = 'Allows multiple keys to be bound to a module (eg. G + H)'
})
general:CreateToggle({
	Name = 'Allow setting keybinds',
	Function = function(callback)
		if callback then
			for _, container in {spectre.Modules, spectre.Legit.Modules} do
				for _, module in container do
					for _, component in module.Options do
						if component.Type == 'Toggle' then
							local bind = components.Bind({
								Module = true
							}, nil, component)
							bind.Object.Position = UDim2.new(1, -40, 0, 5)

							table.insert(settingConnections, bind.Triggered:Connect(function(isDown)
								if bind.Hold then
									if component.Enabled ~= isDown then
										if spectre.SettingToggleNotifications.Enabled then
											spectre:CreateNotification(module.Name, component.Name..' '..(not component.Enabled and "<font color='#00AA00'>ON</font>" or "<font color='#FF5A5A'>OFF</font>"), 1.5)
										end

										component:Toggle()
									end
								else
									if spectre.SettingToggleNotifications.Enabled then
										spectre:CreateNotification(module.Name, component.Name..' '..(not component.Enabled and "<font color='#00AA00'>ON</font>" or "<font color='#FF5A5A'>OFF</font>"), 1.5)
									end

									component:Toggle()
								end
							end))

							table.insert(settingConnections, component.Object.MouseEnter:Connect(function()
								bind:SetVisible(true)
							end))

							table.insert(settingConnections, component.Object.MouseLeave:Connect(function()
								bind:SetVisible(false)
							end))
						end
					end
				end
			end
		else
			for _, container in {spectre.Modules, spectre.Legit.Modules} do
				for _, module in container do
					for _, component in module.Options do
						if component.Bind then
							component.Bind:Destroy()
						end
					end
				end
			end

			for _, connection in settingConnections do
				connection:Disconnect()
			end
			table.clear(settingConnections)
		end
	end,
	Tooltip = 'Hover a toggle setting to bind it to a key'
})

general:CreateButton({
	Name = 'Reset current profile',
	Function = function()
	spectre.Save = function() end
		if isfile('spectre/profiles/'..spectre.Profile..spectre.Place..'.txt') and delfile then
			delfile('spectre/profiles/'..spectre.Profile..spectre.Place..'.txt')
		end

		shared.spectreload = true
		if shared.SpectreDeveloper then
			loadstring(readfile('spectre/loader.lua'), 'loader')()
		else
			loadstring(game:HttpGet('https://raw.githubusercontent.com/YOUR_USERNAME/SpectreCompiled/'..readfile('spectre/profiles/commit.txt')..'/loader.lua', true))()
		end
	end,
	Tooltip = 'This will set your profile to the default settings of Vape'
})

general:CreateButton({
	Name = 'Self destruct',
	Function = function()
		spectre:Uninject()
	end,
	Tooltip = 'Removes spectre from the current game'
})

general:CreateButton({
	Name = 'Reinject',
	Function = function()
		shared.spectreload = true
		if shared.SpectreDeveloper then
			loadstring(readfile('spectre/loader.lua'), 'loader')()
		else
			loadstring(game:HttpGet('https://raw.githubusercontent.com/YOUR_USERNAME/SpectreCompiled/'..readfile('spectre/profiles/commit.txt')..'/loader.lua', true))()
		end
	end,
	Tooltip = 'Reloads spectre for debugging purposes'
})

--[[
	Module Settings
]]

local modules = spectre.Categories.Main.Settings:CreateSettingsPane({Name = 'Modules'})
modules:CreateToggle({
	Name = 'Teams by server',
	Tooltip = 'Ignore players on your team designated by the server',
	Default = true,
	Function = function()
		if spectre.Libraries.entity and spectre.Libraries.entity.Running then
			spectre.Libraries.entity.refresh()
		end
	end
})

modules:CreateToggle({
	Name = 'Use team color',
	Tooltip = 'Uses the TeamColor property on players for render modules',
	Default = true,
	Function = function()
		if spectre.Libraries.entity and spectre.Libraries.entity.Running then
			spectre.Libraries.entity.refresh()
		end
	end
})

--[[
	GUI Settings
]]

local guipane = spectre.Categories.Main.Settings:CreateSettingsPane({Name = 'GUI'})
spectre.Blur = guipane:CreateToggle({
	Name = 'Blur background',
	Function = function()
		spectre:BlurCheck()
	end,
	Default = true,
	Tooltip = 'Blur the background of the GUI'
})

guipane:CreateToggle({
	Name = 'GUI bind indicator',
	Default = true,
	Tooltip = "Displays a message indicating your GUI upon injecting.\nI.E. 'Press RSHIFT to open GUI'"
})

guipane:CreateToggle({
	Name = 'Show tooltips',
	Function = function(enabled)
		tooltip.Visible = false
		toolblur.Enabled = enabled
	end,
	Default = true,
	Tooltip = 'Toggles visibility of these'
})

guipane:CreateToggle({
	Name = 'Show legit mode',
	Function = function(enabled)
		clickgui.Search.Legit.Visible = enabled
		clickgui.Search.LegitDivider.Visible = enabled
		clickgui.Search.TextBox.Size = UDim2.new(1, enabled and -50 or -10, 0, 37)
		clickgui.Search.TextBox.Position = UDim2.fromOffset(enabled and 50 or 10, 0)
	end,
	Default = true,
	Tooltip = 'Shows the button to switch to the legit mod menu'
})

local ScaleSlider = {Object = {}, Value = 1}
spectre.Scale = guipane:CreateToggle({
	Name = 'Auto rescale',
	Default = true,
	Function = function(callback)
		ScaleSlider.Object.Visible = not callback
		if callback then
			--scale.Scale = math.max(gui.AbsoluteSize.X / 1920, 0.6)
		else
			scale.Scale = ScaleSlider.Value
		end
	end,
	Tooltip = 'Automatically rescales the gui using the screens resolution'
})

ScaleSlider = guipane:CreateSlider({
	Name = 'Scale',
	Min = 0.1,
	Max = 2,
	Decimal = 10,
	Function = function(val, final)
		if final and not spectre.Scale.Enabled then
			scale.Scale = val
		end
	end,
	Default = 1,
	Darker = true,
	Visible = false
})

spectre.RainbowSpeed = guipane:CreateSlider({
	Name = 'Rainbow speed',
	Min = 0.1,
	Max = 10,
	Decimal = 10,
	Default = 1,
	Tooltip = 'Adjusts the speed of rainbow values'
})

spectre.RainbowUpdateSpeed = guipane:CreateSlider({
	Name = 'Rainbow update rate',
	Min = 1,
	Max = 144,
	Default = 60,
	Tooltip = 'Adjusts the update rate of rainbow values',
	Suffix = 'hz'
})

--[[guipane:CreateDropdown({
	Name = 'GUI Theme',
	List = inputService.TouchEnabled and {'new', 'old'} or {'new', 'old', 'rise'},
	Function = function(val, mouse)
		if mouse then
			writefile('spectre/profiles/gui.txt', val)
			shared.spectreload = true
			if shared.SpectreDeveloper then
				loadstring(readfile('spectre/loader.lua'), 'loader')()
			else
				loadstring(game:HttpGet('https://raw.githubusercontent.com/YOUR_USERNAME/SpectreCompiled/'..readfile('spectre/profiles/commit.txt')..'/loader.lua', true))()
			end
		end
	end,
	Tooltip = 'new - The newest spectre theme to since v4.05\nold - The spectre theme pre v4.05\nrise - Rise 6.0'
})]]

guipane:CreateDropdown({
	Name = 'Search bar style',
	List = {'Floating', 'None'},
	Default = 'Floating',
	Function = function(value)
		spectre.SearchBar.Object.Visible = value == 'Floating'
	end,
	Tooltip = 'Switch between search bar styles'
})

spectre.RainbowMode = guipane:CreateDropdown({
	Name = 'Rainbow Mode',
	List = {'Normal', 'Gradient', 'Retro'},
	Tooltip = 'Normal - Smooth color fade\nGradient - Gradient color fade\nRetro - Static color'
})

guipane:CreateButton({
	Name = 'Reset GUI positions',
	Function = function()
		for _, category in spectre.Categories do
			category.Object.Position = UDim2.fromOffset(6, 42)
		end
	end,
	Tooltip = 'This will reset your GUI back to the default'
})

guipane:CreateButton({
	Name = 'Sort GUI',
	Function = function()
		local priority = {
			GUICategory = 1,
			CombatCategory = 2,
			BlatantCategory = 3,
			RenderCategory = 4,
			UtilityCategory = 5,
			WorldCategory = 6,
			InventoryCategory = 7,
			FriendsCategory = 8,
			ProfilesCategory = 9
		}

		local categories = {}
		for _, category in spectre.Categories do
			if category.Type ~= 'Overlay' then
				table.insert(categories, category)
			end
		end

		table.sort(categories, function(a, b)
			return (priority[a.Object.Name] or 99) < (priority[b.Object.Name] or 99)
		end)

		local index = 0
		for _, category in categories do
			if category.Object.Visible then
				category.Object.Position = UDim2.fromOffset(6 + (index % 8 * 230), 60 + (index > 7 and 360 or 0))
				index += 1
			end
		end
	end,
	Tooltip = 'Sorts GUI by category order'
})

--[[
	Notification Settings
]]

local notifpane = spectre.Categories.Main.Settings:CreateSettingsPane({Name = 'Notifications'})
spectre.Notifications = notifpane:CreateToggle({
	Name = 'Notifications',
	Function = function(enabled)
		if spectre.ToggleNotifications.Object then
			spectre.ToggleNotifications.Object.Visible = enabled
		end

		if spectre.SettingToggleNotifications.Object then
			spectre.SettingToggleNotifications.Object.Visible = enabled
		end
	end,
	Tooltip = 'Shows notifications',
	Default = true
})

spectre.ToggleNotifications = notifpane:CreateToggle({
	Name = 'Toggle alert',
	Tooltip = 'Notifies you if a module is enabled/disabled.',
	Default = true,
	Darker = true
})
spectre.SettingToggleNotifications = notifpane:CreateToggle({
	Name = 'Setting toggle alert',
	Tooltip = 'Notifies you when a bound setting is toggled.',
	Default = true,
	Darker = true
})

spectre.GUIColor = spectre.Categories.Main.Settings:CreateGUISlider({
	Name = 'GUI Theme',
	Function = function(h, s, v)
		spectre:UpdateGUI()
	end
})

spectre.GUIBind = spectre.Categories.Main.Settings:CreateBind({
	Name = 'Rebind GUI',
	Default = {'RightShift'},
	NoRemove = true,
	Tooltip = 'Change the bind of the GUI'
})

--Overlays

spectre:Clean(task.spawn(function()
	local hue = 0
	repeat
		for _, component in spectre.RainbowSliders do
			if component.Type == 'GUISlider' then
				component:SetValue(spectre:Color(hue))
			else
				component:SetValue(hue)
			end
		end

		local delta = task.wait(1 / spectre.RainbowUpdateSpeed.Value)
		hue = (hue + (delta * (0.2 * spectre.RainbowSpeed.Value))) % 1
	until false
end))

local cursorConnection
spectre:Clean(clickgui:GetPropertyChangedSignal('Visible'):Connect(function()
	spectre:UpdateGUI()

	if clickgui.Visible and inputService.MouseEnabled then
		if cursorConnection then
			cursorConnection:Disconnect()
		end

		cursorConnection = runService.RenderStepped:Connect(function()
			local isVisible = clickgui.Visible
			for _, window in spectre.Windows do
				isVisible = isVisible or window.Visible
			end

			if not isVisible then
				cursor.Visible = false
				cursorConnection:Disconnect()
				cursorConnection = nil
				return
			end

			cursor.Visible = not inputService.MouseIconEnabled
			if cursor.Visible then
				local mouseLocation = inputService:GetMouseLocation()
				cursor.Position = UDim2.fromOffset(mouseLocation.X - 31, mouseLocation.Y - 32)
			end
		end)
	end
end))

spectre:Clean(function()
	if cursorConnection then
		cursorConnection:Disconnect()
	end
end)

spectre:Clean(gui:GetPropertyChangedSignal('AbsoluteSize'):Connect(function()
	if spectre.Scale.Enabled then
		scale.Scale = math.max(gui.AbsoluteSize.X / 1920, 0.6)
	end
end))

spectre:Clean(notifications.ChildRemoved:Connect(function()
	for index, notif in notifications:GetChildren() do
		if tween.Tween then
			tween:Tween(notif, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {
				Position = UDim2.new(1, 0, 1, -(29 + (78 * index)))
			})
		end
	end
end))

spectre:Clean(scale:GetPropertyChangedSignal('Scale'):Connect(function()
	scaledgui.Size = UDim2.fromScale(1 / scale.Scale, 1 / scale.Scale)

	for _, obj in scaledgui:QueryDescendants('GuiObject >> [Visible = true]') do
		obj.Visible = false
		obj.Visible = true
	end
end))

spectre:Clean(spectre.GUIBind.Triggered:Connect(function()
	if spectre.ThreadFix then
		setthreadidentity(8)
	end

	for _, window in self.Windows do
		window.Visible = false
	end

	for _, module in self.Modules do
		if module.Bind.Mobile then
			module.Bind.Mobile.Visible = clickgui.Visible
		end
	end

	clickgui.Visible = not clickgui.Visible
	spectre:BlurCheck()
end))

spectre:Clean(inputService.InputBegan:Connect(function(input)
	if spectre.CurrentTooltip and input.KeyCode == Enum.KeyCode.LeftShift then
		spectre.CurrentTooltip()
	end

	if spectre.Autocomplete and input.KeyCode == Enum.KeyCode.Tab then
		spectre.Autocomplete()
	end

	if not inputService:GetFocusedTextBox() and input.KeyCode ~= Enum.KeyCode.Unknown then
		table.insert(spectre.HeldKeybinds, input.KeyCode.Name)
		if spectre.Binding then return end

		for _, bind in spectre.ActiveBinds do
			if checkKeybinds(spectre.HeldKeybinds, bind.Keys, input.KeyCode.Name) then
				bind.Triggered:Fire(true)
			end
		end
	end
end))

spectre:Clean(inputService.InputEnded:Connect(function(input)
	if spectre.CurrentTooltip and input.KeyCode == Enum.KeyCode.LeftShift then
		spectre.CurrentTooltip()
	end

	if not inputService:GetFocusedTextBox() and input.KeyCode ~= Enum.KeyCode.Unknown then
		if spectre.Binding then
			if not spectre.MultiKeybind.Enabled then
				spectre.HeldKeybinds = {input.KeyCode.Name}
			end

			spectre.Binding:SetBind(spectre.HeldKeybinds, true)
			spectre.Binding = nil
		else
			for _, bind in spectre.ActiveBinds do
				if bind.Hold and checkKeybinds(spectre.HeldKeybinds, bind.Keys, input.KeyCode.Name) then
					bind.Triggered:Fire(false)
				end
			end
		end
	end

	local index = table.find(spectre.HeldKeybinds, input.KeyCode.Name)
	if index then
		table.remove(spectre.HeldKeybinds, index)
	end
end))