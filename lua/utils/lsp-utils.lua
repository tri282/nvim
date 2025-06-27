-- utils/lsp.lua
local M = {}

function M.print_active_clients()
  for _, client in pairs(vim.lsp.get_active_clients()) do
    print(client.name)
  end
end

return M
