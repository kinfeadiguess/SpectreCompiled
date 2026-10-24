do
	local vapeAssets = {
		['spectre/assets/new/add.png'] = 'rbxassetid://121642387707174',
		['spectre/assets/new/aim.png'] = 'rbxassetid://122207028123421',
		['spectre/assets/new/allowedicon.png'] = 'rbxassetid://112336790299036',
		['spectre/assets/new/allowediconmini.png'] = 'rbxassetid://90142384730147',
		['spectre/assets/new/back.png'] = 'rbxassetid://80523803497740',
		['spectre/assets/new/backmini.png'] = 'rbxassetid://85859225495272',
		['spectre/assets/new/bind.png'] = 'rbxassetid://81399857677684',
		['spectre/assets/new/bindbkg.png'] = 'rbxassetid://101996225428926',
		['spectre/assets/new/blatant.png'] = 'rbxassetid://126929923309265',
		['spectre/assets/new/blur.png'] = 'rbxassetid://79246816170155',
		['spectre/assets/new/blurnoti.png'] = 'rbxassetid://124705876663719',
		['spectre/assets/new/close.png'] = 'rbxassetid://121816018671466',
		['spectre/assets/new/closemini.png'] = 'rbxassetid://108320409341289',
		['spectre/assets/new/closetiny.png'] = 'rbxassetid://71393233149714',
		['spectre/assets/new/colorpreview.png'] = 'rbxassetid://140438628568318',
		['spectre/assets/new/combat.png'] = 'rbxassetid://94762732349053',
		['spectre/assets/new/customtheme.png'] = 'rbxassetid://91756736022800',
		['spectre/assets/new/discord.png'] = 'rbxassetid://99871463341003',
		['spectre/assets/new/downexpand.png'] = 'rbxassetid://94197751291504',
		['spectre/assets/new/downexpandslider.png'] = 'rbxassetid://90289944682645',
		['spectre/assets/new/edit.png'] = 'rbxassetid://105801951237137',
		['spectre/assets/new/editlarge.png'] = 'rbxassetid://119233876755282',
		['spectre/assets/new/expandarrow.png'] = 'rbxassetid://86360332526471',
		['spectre/assets/new/friends.png'] = 'rbxassetid://92957214042038',
		['spectre/assets/new/inventory.png'] = 'rbxassetid://93264756888499',
		['spectre/assets/new/legit_mode_icon.png'] = 'rbxassetid://102858626075156',
		['spectre/assets/new/legit_switch.png'] = 'rbxassetid://127508881124779',
		['spectre/assets/new/min.png'] = 'rbxassetid://82175054487146',
		['spectre/assets/new/noti_alert.png'] = 'rbxassetid://82356478726846',
		['spectre/assets/new/noti_info.png'] = 'rbxassetid://102614825645099',
		['spectre/assets/new/noti_warning.png'] = 'rbxassetid://119631730212167',
		['spectre/assets/new/notification.png'] = 'rbxassetid://90300780458781',
		['spectre/assets/new/npcs.png'] = 'rbxassetid://104434365485227',
		['spectre/assets/new/overlaydots.png'] = 'rbxassetid://78012624671930',
		['spectre/assets/new/overlays.png'] = 'rbxassetid://136535637407545',
		['spectre/assets/new/overlayslarge.png'] = 'rbxassetid://127574141208160',
		['spectre/assets/new/pin.png'] = 'rbxassetid://92459145800579',
		['spectre/assets/new/players.png'] = 'rbxassetid://105137446428129',
		['spectre/assets/new/profiles.png'] = 'rbxassetid://126051451865127',
		['spectre/assets/new/radar.png'] = 'rbxassetid://97983828696086',
		['spectre/assets/new/rainbow_1.png'] = 'rbxassetid://101329996188554',
		['spectre/assets/new/rainbow_2.png'] = 'rbxassetid://72739074644654',
		['spectre/assets/new/rainbow_3.png'] = 'rbxassetid://100716555253397',
		['spectre/assets/new/rainbow_4.png'] = 'rbxassetid://133424174227092',
		['spectre/assets/new/range.png'] = 'rbxassetid://107794917650053',
		['spectre/assets/new/rangeindicator.png'] = 'rbxassetid://107038094175283',
		['spectre/assets/new/render.png'] = 'rbxassetid://125472576898654',
		['spectre/assets/new/search.png'] = 'rbxassetid://115611852955611',
		['spectre/assets/new/settingdots.png'] = 'rbxassetid://130896840048276',
		['spectre/assets/new/settings.png'] = 'rbxassetid://73820177347303',
		['spectre/assets/new/settingsmini.png'] = 'rbxassetid://115732118290997',
		['spectre/assets/new/targetinfo.png'] = 'rbxassetid://121604266095276',
		['spectre/assets/new/textgui.png'] = 'rbxassetid://99438663817412',
		['spectre/assets/new/theme.png'] = 'rbxassetid://111525258317113',
		['spectre/assets/new/utility.png'] = 'rbxassetid://108303206513893',
		['spectre/assets/new/spectre.png'] = 'rbxassetid://92153855792786',
		['spectre/assets/new/vapelogo.png'] = 'rbxassetid://126205920310261',
		['spectre/assets/new/vapelogomini.png'] = 'rbxassetid://109041903452149',
		['spectre/assets/new/v4.png'] = 'rbxassetid://102549752760489',
		['spectre/assets/new/v4mini.png'] = 'rbxassetid://115213099001611',
		['spectre/assets/new/world.png'] = 'rbxassetid://118917453153459'
	}

	local function createDownloader(text)
		if spectre.Loaded ~= true then
			local downloader = spectre.Downloader
			if not downloader then
				downloader = Instance.new('TextLabel')
				downloader.BackgroundTransparency = 1
				downloader.FontFace = uipallet.Font
				downloader.Size = UDim2.new(1, 0, 0, 40)
				downloader.TextColor3 = Color3.new(1, 1, 1)
				downloader.TextSize = 20
				downloader.TextStrokeTransparency = 0
				downloader.Parent = spectre.gui
				spectre.Downloader = downloader
			end

			downloader.Text = 'Downloading '..text
		end
	end

	local function downloadFile(path, callback)
		if not isfile(path) then
			createDownloader(path)

			local success, data = pcall(function()
				return game:HttpGet('https://raw.githubusercontent.com/YOUR_USERNAME/SpectreCompiled/'..readfile('spectre/profiles/commit.txt')..'/'..select(1, path:gsub('spectre/', '')), true)
			end)

			if not success or data == '404: Not Found' then
				error(data)
			end

			if path:find('.lua') then
				data = '--[spectre:cached]\n'..data
			end

			writefile(path, data)
		end

		return (callback or readfile)(path)
	end

	getvapeasset = not inputService.TouchEnabled and getcustomasset and function(path)
		return downloadFile(path, getcustomasset)
	end or function(path)
		return spectreAssets[path] or ''
	end
end