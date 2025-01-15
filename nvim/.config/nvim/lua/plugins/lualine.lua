local function get_condition()
    return package.loaded["ollama"] and require("ollama").status ~= nil
end
local function get_status_icon()
	local status = require("ollama").status()

	if status == "IDLE" then
			return "󱙺" -- nf-md-robot-outline
	elseif status == "WORKING" then
			return "󰚩" -- nf-md-robot
	end
end
return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto"
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'branch', 'diff', 'diagnostics'},
				lualine_c = {'filename'},
				lualine_x = {get_status_icon, get_condition, 'encoding', 'fileformat', 'filetype'},
				lualine_y = {'progress'},
				lualine_z = {'location'}
			},
		})
	end,
}
