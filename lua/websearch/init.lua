local M = {}


-- get current selection as string
local function get_visual_selection()
    local visual_mode = vim.fn.mode()

    local sel_begin_row = vim.fn.line("v")
    local sel_end_row = vim.fn.line(".")

    local sel_begin_col, sel_end_col

    if visual_mode == "v" then
        sel_begin_col = vim.fn.col("v")
        sel_end_col = vim.fn.col(".")

        if sel_begin_row > sel_end_row then
            sel_begin_row, sel_end_row = sel_end_row, sel_begin_row
            sel_begin_col, sel_end_col = sel_end_col, sel_begin_col
        elseif sel_begin_row == sel_end_row then
            if sel_begin_col > sel_end_col then
                sel_begin_col, sel_end_col = sel_end_col, sel_begin_col
            end
        end
    elseif visual_mode == "V" then
        sel_begin_col = 1
        sel_end_col = #vim.fn.getline(sel_end_row)

        if sel_begin_row > sel_end_row then
            sel_begin_row, sel_end_row = sel_end_row, sel_begin_row
        end
    end

    if sel_begin_col == nil then
        return nil
    end

    local lines_table = vim.api.nvim_buf_get_text(0, sel_begin_row-1, sel_begin_col-1, sel_end_row-1, sel_end_col, {})

    return table.concat(lines_table, "\n")
end


-- url encode ("percent encode") a string
local function url_encode(input)
    local output = string.gsub(input, "([^%w%.%-])", function(c)
        return string.format("%%%02X", string.byte(c))
    end)

    return output
end


-- the actual function that executes the search
function M.search_web()
    local selection = get_visual_selection()

    if selection == nil then
        return
    end

    local encoded_selection = url_encode(selection)
    local escaped_selection = vim.fn.shellescape(M.config.search_url .. encoded_selection)
    local cmd_string = M.config.browser .. " " .. escaped_selection

    vim.fn.jobstart(cmd_string)
end


-- setup takes an optional configuration table and defines a key binding.
function M.setup(user_config)
    M.config = vim.tbl_extend("force", M.config, user_config or {})

    if M.config.search_key ~= nil and M.config.search_key ~= "" then
        vim.keymap.set("v", M.config.search_key, M.search_web)
    end
end


-- the configuration
M.config = {
    browser = "firefox",
    search_url = "https://search.projectsegfau.lt/search?q=",
    search_key = "<leader>s"
}


-- create user command when module is `required()`
vim.api.nvim_create_user_command('Websearch', M.search_web, {desc = "Execute a web search on selected text"})


return M
