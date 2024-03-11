# websearch.nvim

Neovim plugin to open an external browser for a web search with currently selected text. 


## Installation

### With lazy.nvim Plugin Manager

In your config.lua, add websearch.nvim to your lazy.nvim configuration:

    require('lazy').setup({
        ...
        {"ulf-westermann/websearch.nvim", config = function() require("websearch").setup() end},
        ...
    })
