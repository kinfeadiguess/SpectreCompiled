local spectre = shared.spectre
local loadstring = function(...)
	local res, err = loadstring(...)
	if err and spectre then
		spectre:CreateNotification('Spectre', 'Failed to load : '..err, 30, 'alert')
	end
	return res
end
local isfile = isfile or function(file)
	local suc, res = pcall(function()
		return readfile(file)
	end)
	return suc and res ~= nil and res ~= ''
end
local function downloadFile(path, func)
	if not isfile(path) then
		local suc, res = pcall(function()
			return game:HttpGet('https://raw.githubusercontent.com/YOUR_USERNAME/SpectreCompiled/'..readfile('spectre/profiles/commit.txt')..'/'..select(1, path:gsub('spectre/', '')), true)
		end)
		if not suc or res == '404: Not Found' then
			error(res)
		end
		if path:find('.lua') then
			res = '--[spectre:cached]\n'..res
		end
		writefile(path, res)
	end
	return (func or readfile)(path)
end

spectre.Place = 606849621
if isfile('spectre/games/'..spectre.Place..'.lua') then
	loadstring(readfile('spectre/games/'..spectre.Place..'.lua'), 'jailbreak')()
else
	if not shared.SpectreDeveloper then
		local success, result = pcall(downloadFile, 'spectre/games/'..spectre.Place..'.lua')
		if success and result then
			loadstring(result, 'jailbreak')()
		end
	end
end