{
  keymaps = [
    # Global Mappings
    # Default mode is "" which means normal-visual-op
    {
      # Toggle NvimTree
      key = "<C-n>";
      action = "<CMD>NvimTreeToggle<CR>";
    }
    {
      # Format file
      key = "<space>fm";
      action = "<CMD>lua vim.lsp.buf.format()<CR>";
    }

    # Terminal Mappings
    {
      # Escape terminal mode using ESC
      mode = "t";
      key = "<esc>";
      action = "<C-\\><C-n>";
    }

    {
      key = ";";
      action = ":";
    }
  ];
  maps = {
    # Nvim tree
    normal."<leader>nn" = ":NvimTreeToggle<CR>";
    normal."<leader>nf" = ":NvimTreeFindFile<CR>";
    normal."<leader>nr" = ":NvimTreeRefresh<CR>";

    # LSP stuff
    normal."gD" = "<cmd>lua vim.lsp.buf.declaration()<CR>";
    normal."gd" = "<cmd>lua vim.lsp.buf.definition()<CR>";
    normal."K" = "<cmd>lua vim.lsp.buf.hover()<CR>";
    normal."gi" = "<cmd>lua vim.lsp.buf.implementation()<CR>";
    # normal."<C-k>" = "<cmd>lua vim.lsp.buf.signature_help()<CR>";
    normal."gr" = "<cmd>lua vim.lsp.buf.references()<CR>";
    normal."<leader>ck" = "<cmd>lua vim.diagnostic.open_float()<CR>";
    normal."<leader>ca" = "<cmd>lua vim.lsp.buf.code_action()<CR>";
    normal."<leader>cf" = "<cmd>lua vim.lsp.buf.format({ timeout_ms = 3500 })<CR>";

    # Telescope
    normal."<leader>p" = "<cmd>Telescope find_files<CR>";
    normal."<leader>ff" = "<cmd>Telescope find_files<CR>";
    normal."<leader>fl" = "<cmd>Telescope live_grep<CR>";
    normal."<leader>fr" = "<cmd>Telescope resume<CR>";
    normal."<leader>fp" = "<cmd>Telescope projects<CR>";

    # Gitsigns
    normal."<leader>hs" = "<cmd>Gitsigns stage_hunk<CR>";
    visual."<leader>hs" = "<cmd>Gitsigns stage_hunk<CR>";
    normal."<leader>hr" = "<cmd>Gitsigns reset_hunk<CR>";
    visual."<leader>hr" = "<cmd>Gitsigns reset_hunk<CR>";
    normal."<leader>hb" = "<cmd>Gitsigns blame_line<CR>";
    normal."<leader>hd" = "<cmd>Gitsigns diffthis<CR>";
    normal."<leader>hp" = "<cmd>Gitsigns preview_hunk<CR>";
    normal."<leader>hn" = "<cmd>Gitsigns next_hunk<CR>";
    normal."<leader>hN" = "<cmd>Gitsigns prev_hunk<CR>";
  };
}
