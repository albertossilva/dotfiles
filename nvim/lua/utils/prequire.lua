local notify = require("notify")

local function prequire(x, title)
	local d = {}
	for index, name in ipairs(x) do
		local status_ok, dependency = pcall(require, name)
		if not status_ok then
			notify(name .. " dependency not found", "error", { title = title })
			return false, {}
		end

		d[index] = dependency
	end
	return true, d
end

return prequire