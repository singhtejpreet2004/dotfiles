return {

  -- Treesitter: syntax highlighting for all your languages
  { "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "python", "lua", "bash", "yaml", "json", "toml",
        "dockerfile", "sql", "markdown", "go", "javascript", "hcl",
      },
    },
  },

  -- Mason: installs LSP servers, linters, formatters
  { "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",               -- Python LSP
        "ruff-lsp",              -- Python linter
        "bash-language-server",
        "yaml-language-server",
        "docker-langserver",
        "sqlls",                 -- SQL
        "terraform-ls",          -- Terraform
        "lua-language-server",
        "marksman",              -- Markdown
      },
    },
  },

  -- Theme: Catppuccin Mocha
  { "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  -- Surround: cs'" to change surrounding chars
  { "kylechui/nvim-surround", event = "VeryLazy" },

  -- Auto-pairs: closes brackets and quotes
  { "windwp/nvim-autopairs", event = "InsertEnter" },

  -- LazyGit inside nvim
  { "kdheepak/lazygit.nvim" },

  -- Floating terminal (Ctrl+\)
  { "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-\>]],
        direction = "float",
        float_opts = { border = "curved" },
      })
    end,
  },

  -- CSV / data file viewer
  { "vidocqh/data-viewer.nvim" },

  -- GitHub Copilot
  { "github/copilot.vim" },

  -- Flash: jump anywhere on screen with 2 chars
  { "folke/flash.nvim", event = "VeryLazy" },

  -- Noice: beautiful cmdline + notifications
  { "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  },

}
