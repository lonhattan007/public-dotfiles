-----------------------------------------------------------------------
-- Some utils I might use frequently
-----------------------------------------------------------------------

M = {}

---@type string
local home_path = ""

---@type string
local path_sep = package.config:sub(1, 1)

if path_sep == "/" then
	-- unix path separator
	-- equivalent of "$HOME..."
	home_path = vim.fn.stdpath("config") .. "/../.."
elseif path_sep == "\\" then
	-- windows path separator
	home_path = vim.fn.stdpath("config") .. "\\..\\..\\.."
end

---@param paths_segments table
---@return string
local concat_paths = function(paths_segments)
	local result = paths_segments[1]

	for i, segment in ipairs(paths_segments) do
		if i > 1 then
			result = result .. path_sep .. segment
		end
	end

	return result
end

M.path_sep = path_sep
M.home_path = home_path
M.concat_paths = concat_paths

return M
