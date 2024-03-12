# websearch.nvim

Neovim plugin to open an external browser for a web search with currently selected text. 


## Installation

### With lazy.nvim Plugin Manager

In your neovim `config.lua` file, add websearch.nvim to your lazy.nvim configuration:

    require('lazy').setup({
        ...
        {"ulf-westermann/websearch.nvim", config = function() require("websearch").setup() end},
        ...
    })


### Manual Installation

Copy the `websearch` folder into your neovim `lua` folder, copy `websearch.lua` from the `plugin` folder into your neovim `plugin` folder. Optionally, modify `websearch.lua` to configure it (see section "Configuration").


## Configuration

The `setup()` function of websearch.nvim takes an optional parameter with a Lua table that can contain the following configurations:

* `browser` (default: "firefox")
* `search_url` (default: "https://search.projectsegfau.lt/search?q=")
* `search_key` (default: "\<leader\>s")

Example (when used with lazy.nvim):

    require('lazy').setup({
        ...
        {"ulf-westermann/websearch.nvim", config = function() require("websearch").setup({
            search_key = "<leader>q",
            browser = "qutebrowser"
        }) end},
        ...
    })
