local lspconfig = require('lspconfig')
local lspinstall = require('lspinstall')
local function setup_servers()
    lspinstall.setup()
    local servers = lspinstall.installed_servers()
    for _, server in pairs(servers) do
        lspconfig[server].setup{
            on_attach=on_attach,
            flags = {
                debounce_text_changes = 150,
            }
        }
    end
end

setup_servers()

lspinstall.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

