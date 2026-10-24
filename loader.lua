local isfile = isfile or function(file)
	local suc, res = pcall(function()
		return readfile(file)
	end)
	return suc and res ~= nil and res ~= ''
end
local delfile = delfile or function(file)
	writefile(file, '')
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

local function wipeFolder(path)
	if not isfolder(path) then return end
	for _, file in listfiles(path) do
		if file:find('loader') then continue end
		if isfile(file) and select(1, readfile(file):find('--[spectre:cached]')) == 1 then
			delfile(file)
		end
	end
end

for _, folder in {'spectre', 'spectre/games', 'spectre/profiles', 'spectre/assets', 'spectre/libraries', 'spectre/guis'} do
	if not isfolder(folder) then
		makefolder(folder)
	end
end

if not shared.SpectreDeveloper then
	local _, subbed = pcall(function()
		return game:HttpGet('https://github.com/YOUR_USERNAME/SpectreCompiled')
	end)

	local assetVer = '1'
	local commit = subbed:find('currentOid')
	commit = commit and subbed:sub(commit + 13, commit + 52) or nil
	commit = commit and #commit == 40 and commit or 'main'

	if commit == 'main' or (isfile('spectre/profiles/commit.txt') and readfile('spectre/profiles/commit.txt') or '') ~= commit then
		wipeFolder('spectre')
		wipeFolder('spectre/games')
		wipeFolder('spectre/guis')
		wipeFolder('spectre/libraries')
	end

	if (isfile('spectre/profiles/asset.txt') and readfile('spectre/profiles/asset.txt') or '') ~= assetVer then
		wipeFolder('spectre/assets')
	end

	writefile('spectre/profiles/asset.txt', assetVer)
	writefile('spectre/profiles/commit.txt', commit)
end

return loadstring(downloadFile('spectre/main.lua'), 'main')()