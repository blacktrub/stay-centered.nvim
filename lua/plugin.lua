local mode = require("mode")

local function must_skip_file(to_skip, cur)
	if to_skip == nil then
		return false
	end

	for _, value in ipairs(to_skip) do
		if value == cur then
			return true
		end
	end

	return false
end

local function stay_centered(ctx)
	if must_skip_file(ctx.skip_filetypes, vim.bo.filetype) then
		return
	end

	if must_skip_file(ctx.skip_buftypes, vim.bo.buftype) then
		return
	end

	local line = vim.api.nvim_win_get_cursor(0)[1]
	if line ~= vim.b.last_line then
		vim.cmd("norm! zz")
		vim.b.last_line = line
		if ctx.mode == mode.insert then
			local column = vim.fn.getcurpos()[5]
			vim.fn.cursor({ line, column })
		end
	end
end

return {
	stay_centered = stay_centered,
}
