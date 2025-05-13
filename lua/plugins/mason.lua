-- lua/plugins/mason.lua
return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "mason.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason.nvim", "mason-lspconfig.nvim" },
    config = function()
      -- 2) Expand and point to the right directory
      local love_api_lua = vim.fn.stdpath("config") .. "/lua/love-api"

      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
              path = vim.split(package.path, ";"),
            },
            diagnostics = {
              globals = { "love" }, -- tell it that `love` is a built-in global
            },
            workspace = {
              -- include Neovim runtime AND your Love2D stubs folder
              library = vim.list_extend(vim.api.nvim_get_runtime_file("", true), { love_api_lua }),
            },
            telemetry = { enable = false },
          },
        },
      })
    end,
  },
}
