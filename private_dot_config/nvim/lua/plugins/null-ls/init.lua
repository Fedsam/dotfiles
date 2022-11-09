local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  b.formatting.prettierd.with { filetypes = { "html", "yaml", "typescript", "json" } },
  b.formatting.eslint_d.with { filetypes = { "html", "yaml", "typescript", "vue" } },
  b.code_actions.eslint_d.with { filetypes = { "html", "yaml", "typescript", "vue" } },
  b.diagnostics.eslint_d.with { filetypes = { "html", "yaml", "typescript", "vue" } },
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
