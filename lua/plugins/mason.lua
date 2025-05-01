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
        ensure_installed = { "lua_ls", "rust_analyzer" },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = "mason-lspconfig.nvim",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
              -- Make sure the server can resolve modules on your package.path
              path = vim.split(package.path, ";"),
            },
            diagnostics = {
              globals = { "love" },
            },
            workspace = {
              -- https://github.com/love2d-community/love-api.git
              -- Combine Neovim’s runtime with your Love2D stubs folder
              library = vim.list_extend(vim.api.nvim_get_runtime_file("", true), { "~/.config/nvim/lua/love-api" }),
            },
            completion = {
              callSnippet = "Replace",
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- Rust
      lspconfig.rust_analyzer.setup({
        -- your rust-specific settings here
      })
    end,
  },
}
