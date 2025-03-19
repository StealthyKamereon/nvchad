local nvlsp = require "nvchad.configs.lspconfig"
vim.g.rustaceanvim = {
  server = {
    on_init = function(client, bufnr)
      nvlsp.on_init(client, bufnr)
    end,
    on_attach = function(client, bufnr)
      nvlsp.on_attach(client, bufnr)

      vim.keymap.set("n", "<leader>a", function()
        vim.cmd.RustLsp("codeAction")
      end,
        { buffer = bufnr, silent = true, desc = "Code [a]ction group" })
      
      vim.keymap.set("n", "K", function()
        vim.cmd.RustLsp({"hover", "actions"})
      end,
        { buffer = bufnr, silent = true, desc = "[h]over actions" })

      local nmap = function(keys, func, desc)
        if desc ~= nil then
          desc = 'LSP: ' .. desc
        end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

      -- See `:help K` for why this keymap
      nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

      -- Telescope related
      nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
      nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      nmap('<leader>ks', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      nmap('<leader>q', require('telescope.builtin').diagnostics, 'Open diagnostics list')
    end
  }
}
return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  }
}
