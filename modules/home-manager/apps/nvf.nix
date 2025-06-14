{ inputs, ... }:

{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        options = {
          tabstop = 2;
          shiftwidth = 2;
          softtabstop = 2;
          expandtab = true;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        filetree.neo-tree = {
          enable = true;
        };

        lsp.enable = true;
        languages = {
          enableTreesitter = true;

          nix.enable = true;
          java.enable = true;
          rust.enable = true;
          python.enable = true;
        };
      };
    };
  };
}
