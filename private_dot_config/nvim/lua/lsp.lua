-- nvim-cmp related
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())

local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gR', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>df', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '<leader>db', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, bufopts)
end

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        "ansiblels", "sumneko_lua", "angularls", "tsserver", "yamlls",
        "rust_analyzer", "html", "emmet_ls", "jsonls", "vuels"
    }
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then return end

require('mason-lspconfig').setup_handlers({
    function(server_name)
        lspconfig[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach
        }
    end,

    ["sumneko_lua"] = function()
        lspconfig.sumneko_lua.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    runtime = {version = 'LuaJIT'},
                    format = {enable = false},
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {'vim'}
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true)
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {enable = false}
                }
            }
        })
    end,

    ["yamlls"] = function()
        lspconfig.yamlls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                yaml = {
                    schemas = {
                        ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "/**/*.gitlab-ci.yml"
                    }
                }
            }
        })
    end
})
