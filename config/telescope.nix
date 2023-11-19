{ pkgs, ... }: {
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>fg" = "live_grep";
      "<C-p>" = {
        action = "git_files";
        desc = "Telescope Git Files";
      };
    };
    defaults = {
      # path_display = "smart";
      winblend = 5;
      borderchars = [ " " " " " " " " " " " " " " " " ];
      border = [ ];
      prompt_prefix = "󰛞 ";
      entry_prefix = " ";
      selection_caret = " ";
      layout_config = {
        horizontal = {
          prompt_position = "top";
          results_width = 0.5;
          preview_width = 0.5;
        };
      };
    };
    extensions.fzf-native = { enable = true; };
  };

  extraPackages = with pkgs; [
    ripgrep
  ];
}
