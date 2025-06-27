--- TREESITTER
--- handles highlighting, building parenthesis trees, etc

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = {
          "c", "lua", "vim", "vimdoc", "query", "csv", "json", "sql",
          "markdown", "markdown_inline", "javascript", "java", "python"
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}

