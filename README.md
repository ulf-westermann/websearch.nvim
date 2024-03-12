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

* `browser` (string, default: "firefox")
* `search_key` (string, default: "\<leader\>s")
* `search_url` (string, default: "<span>https://search.projectsegfau.lt/search?q=</span>")

Example (when used with lazy.nvim):

    require('lazy').setup({
        ...
        {"ulf-westermann/websearch.nvim", config = function() require("websearch").setup({
            browser = "qutebrowser",
            search_key = "<leader>q",
            search_url = "https://search.brave.com/search?q="
        }) end},
        ...
    })
