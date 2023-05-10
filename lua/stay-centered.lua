local skip_filetypes = {}
local skip_buftypes = {}

local function setup(ctx)
	if ctx == nil then
		return
	end

	skip_filetypes = ctx.skip_filetypes
	skip_buftypes = ctx.skip_buftypes
end

local mode = require("mode")
local plugin = require("plugin")

local add_group = vim.api.nvim_create_augroup
local group = add_group("StayCentered", { clear = true })

local add_command = vim.api.nvim_create_autocmd
add_command("CursorMovedI", {
	group = group,
	callback = function()
		plugin.stay_centered({
			mode = mode.insert,
			skip_filetypes = skip_filetypes,
			skip_buftypes = skip_buftypes,
		})
	end,
})
add_command({ "CursorMoved", "BufEnter" }, {
	group = group,
	callback = function()
		plugin.stay_centered({
			mode = mode.other,
			skip_filetypes = skip_filetypes,
			skip_buftypes = skip_buftypes,
		})
	end,
})

return {
	setup = setup,
}
