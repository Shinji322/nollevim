{ pkgs, ... }: {
  plugins.lsp = {
    enable = true;
    servers = {
      clangd.enable = true;
      rnix-lsp.enable = true;
      pyright.enable = true;
      rust-analyzer.enable = true;
      html.enable = true;
      cssls.enable = true;
      jsonls = {
        enable = true;
        extraOptions = {
          settings = {
            json = {
              schemas = { __raw = "require('schemastore').json.schemas()"; };
              validate = {
                enable = true;
              };
            };
          };
        };
      };
      eslint.enable = true;
      gdscript.enable = true;
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    lsp_signature-nvim
    SchemaStore-nvim
  ];

  extraPackages = with pkgs; [
    nodePackages.typescript
    nodePackages.typescript-language-server
  ];
}
