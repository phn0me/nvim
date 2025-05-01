-- lua/plugins/theme.lua
return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- load immediately so you can use the colorscheme right away
    priority = 1000, -- load before other UI plugins
    config = function()
      require("kanagawa").setup({
        compile = true, -- enable theme compilation for faster startup
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        typeStyle = {},
        specialReturn = true,
        specialException = true,
        transparent = false, -- no background
        dimInactive = false,
        globalStatus = false,
        colors = {
          palette = {},
          theme = { all = {} },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            -- example override: make LineNr a bit dimmer
            LineNr = { fg = theme.ui.fg_dim },
          }
        end,
        theme = "dragon", -- the default style: wave, dragon, or lotus
      })
      -- finally, set the colorscheme
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
