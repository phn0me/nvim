return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false, -- load immediately, so your colorscheme is ready
    priority = 1000, -- ensure it's loaded before other UI plugins
    config = function()
      -- 2) (Optional) customize the nordfox palette here:
      require("nightfox").setup({
        palettes = {
          nordfox = {
            -- override any colors you like, for example:
            fg0 = "#D8DEE9",
            black = "#2E3440",
          },
        },
        options = {
          dim_inactive = true,
          -- other global options…
        },
      })
      -- 3) Finally, set the colorscheme to nordfox
      vim.cmd("colorscheme nordfox")
    end,
  },
}
