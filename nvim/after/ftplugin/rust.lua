vim.g.rustaceanvim = {
  -- Plugin configuration
  -- tools = {
  -- },
  -- LSP configuration
  server = {
   default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
            cargo = {
              -- extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
              -- extraArgs = { "--profile", "rust-analyzer" },
              -- check = { command = "check", extraArgs = {} },
              target = "x86_64-unknown-linux-gnu",
        }
      },
    },
  },
  -- DAP configuration
  -- dap = {
  -- },
}

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<leader>a",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "<leader>ltw",
  function()
    vim.cmd.RustAnalyzer({'target', 'wasm32-unknown-unknown'})
  end,
  { silent = true, buffer = bufnr, desc = "Set target as wasm32" }
)
vim.keymap.set(
  "n",
  "<leader>ltx",
  function()
    vim.cmd.RustAnalyzer({'target', 'x86_64-unknown-linux-gnu'})
  end,
  { silent = true, buffer = bufnr, desc = "Set target as x86_64"}
)
vim.keymap.set(
  "n",
  "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({'hover', 'actions'})
  end,
  { silent = true, buffer = bufnr }
)
