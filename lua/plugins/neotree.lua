--- NEOTREE
--- reveals file system, like in modern ide like vscode

return {
  "nvim-neo-tree/neo-tree.nvim", -- neo-tree will show file system on the left
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
 lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
  },
  config = function()
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {}) 
  end
}

