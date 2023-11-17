local fn = vim.fn

local M = {}

function M.executable(name)
	if fn.executable(name) > 0 then
		return true
	end

	return false
end

--- check whether a feature exists in Nvim
--- @feat: string
---   the feature name, like `nvim-0.7` or `unix`.
--- return: bool
M.has = function(feat)
	if fn.has(feat) == 1 then
		return true
	end

	return false
end
