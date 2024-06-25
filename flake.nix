{
  description = "Neovim derivation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    gen-luarc.url = "github:mrcjkb/nix-gen-luarc-json";

    # Plugins
    haskell-tools = {
      url = "github:mrcjkb/haskell-tools.nvim";
    };
    # haskell-snippets = {
    #   url = "github:mrcjkb/haskell-snippets.nvim";
    # };
    # neotest-haskell = {
    #   url = "github:mrcjkb/neotest-haskell";
    # };
    # telescope-manix = {
    #   url = "github:mrcjkb/telescope-manix";
    # };
    plenary = {
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };
    sqlite = {
      url = "github:kkharji/sqlite.lua";
      flake = false;
    };
    nvim-web-devicons = {
      url = "github:nvim-tree/nvim-web-devicons";
      flake = false;
    };
    diffview = {
      url = "github:sindrets/diffview.nvim";
      flake = false;
    };
    # vim-wordmotion = {
      # Vimscript
    #   url = "github:chaoren/vim-wordmotion";
    #   flake = false;
    # };
    nvim-highlight-colors = {
      url = "github:brenoprata10/nvim-highlight-colors";
      flake = false;
    };
    # flash-nvim = {
    #   url = "github:folke/flash.nvim";
    #   flake = false;
    # };
    # eyeliner-nvim = {
    #   url = "github:jinh0/eyeliner.nvim";
    #   flake = false;
    # };
    # neogit = {
    #   url = "github:NeogitOrg/neogit";
    #   flake = false;
    # };
    # gitlinker = {
    #   url = "github:linrongbin16/gitlinker.nvim";
    #   flake = false;
    # };
    repeat = {
      url = "github:tpope/vim-repeat";
      flake = false;
    };
    unimpaired = {
      # bracket mappings
      url = "github:tpope/vim-unimpaired";
      flake = false;
    };
    surround = {
      url = "github:kylechui/nvim-surround";
      flake = false;
    };
    # substitute = {
    #   url = "github:gbprod/substitute.nvim";
    #   flake = false;
    # };
    persistence = {
      url = "github:folke/persistence.nvim";
      flake = false;
    };
    nvim-lastplace.url = "github:mrcjkb/nvim-lastplace";
    comment = {
      url = "github:numToStr/Comment.nvim";
      flake = false;
    };
    material-theme = {
      url = "github:marko-cerovac/material.nvim";
      # url = "github:mrcjkb/material.nvim.fork/tree-sitter-highlight-groups";
      flake = false;
    };
    # neotest = {
    #   url = "github:nvim-neotest/neotest";
    #   # url = "github:mrcjkb/neotest/watcher";
    #   flake = false;
    # };
    # nio = {
    #   url = "github:nvim-neotest/nvim-nio";
    #   flake = false;
    # };
    schemastore-nvim = {
      url = "github:b0o/SchemaStore.nvim";
      flake = false;
    };
    # nvim-dap = {
    #   url = "github:mfussenegger/nvim-dap";
    #   flake = false;
    # };
    # nvim-dap-ui = {
    #   url = "github:rcarriga/nvim-dap-ui";
    #   flake = false;
    # };
    lsp-status = {
      url = "github:nvim-lua/lsp-status.nvim";
      flake = false;
    };
    lsp_signature = {
      url = "github:ray-x/lsp_signature.nvim";
      flake = false;
    };
    fidget = {
      url = "git+https://github.com/j-hui/fidget.nvim.git";
      flake = false;
    };
    illuminate = {
      url = "github:RRethy/vim-illuminate";
      flake = false;
    };
    nvim-cmp = {
      url = "github:hrsh7th/nvim-cmp";
      flake = false;
    };
    cmp-buffer = {
      url = "github:hrsh7th/cmp-buffer";
      flake = false;
    };
    cmp-path = {
      url = "github:hrsh7th/cmp-path";
      flake = false;
    };
    cmp-cmdline = {
      url = "github:hrsh7th/cmp-cmdline";
      flake = false;
    };
    cmp-cmdline-history = {
      url = "github:dmitmel/cmp-cmdline-history";
      flake = false;
    };
    cmp-nvim-lua = {
      url = "github:hrsh7th/cmp-nvim-lua";
      flake = false;
    };
    cmp-nvim-lsp = {
      url = "github:hrsh7th/cmp-nvim-lsp";
      flake = false;
    };
    cmp-nvim-lsp-document-symbol = {
      url = "github:hrsh7th/cmp-nvim-lsp-document-symbol";
      flake = false;
    };
    cmp-nvim-lsp-signature-help = {
      url = "github:hrsh7th/cmp-nvim-lsp-signature-help";
      flake = false;
    };
    # cmp-luasnip = {
    #   url = "github:saadparwaiz1/cmp_luasnip";
    #   flake = false;
    # };
    # cmp-luasnip-choice = {
    #   url = "github:L3MON4D3/cmp-luasnip-choice";
    #   flake = false;
    # };
    cmp-rg = {
      url = "github:lukas-reineke/cmp-rg";
      flake = false;
    };
    lspkind-nvim = {
      # vscode-style completion pictograms
      url = "github:onsails/lspkind-nvim";
      flake = false;
    };
    actions-preview-nvim = {
      url = "github:aznhe21/actions-preview.nvim";
      flake = false;
    };
    nvim-treesitter = {
      url = "github:nvim-treesitter/nvim-treesitter";
      flake = false;
    };
    treesitter-textobjects = {
      url = "github:nvim-treesitter/nvim-treesitter-textobjects";
      flake = false;
    };
    treesitter-context = {
      url = "github:nvim-treesitter/nvim-treesitter-context";
      flake = false;
    };
    nvim-ts-context-commentstring = {
      # url = "github:JoosepAlviste/nvim-ts-context-commentstring";
      url = "github:mrcjkb/nvim-ts-context-commentstring/haskell";
      flake = false;
    };
    wildfire-nvim = {
      url = "github:sustech-data/wildfire.nvim";
      flake = false;
    };
    rainbow-delimiters-nvim = {
      url = "github:hiphish/rainbow-delimiters.nvim";
      flake = false;
    };
    vim-matchup = {
      # tree-sitter powered % motions
      url = "github:andymass/vim-matchup";
      flake = false;
    };
    # iswap-nvim = {
    #   url = "github:mizlan/iswap.nvim";
    #   flake = false;
    # };
    nvim-lint = {
      url = "github:mfussenegger/nvim-lint";
      flake = false;
    };
    telescope = {
      url = "github:nvim-telescope/telescope.nvim/0.1.x";
      flake = false;
    };
    telescope_hoogle = {
      url = "github:luc-tielen/telescope_hoogle";
      flake = false;
    };
    telescope-smart-history = {
      url = "github:nvim-telescope/telescope-smart-history.nvim";
      flake = false;
    };
    telescope-zf-native = {
      url = "github:natecraddock/telescope-zf-native.nvim";
      flake = false;
    };
    todo-comments = {
      url = "github:folke/todo-comments.nvim";
      flake = false;
    };
    fzf-lua = {
      url = "github:ibhagwan/fzf-lua";
      flake = false;
    };
    lualine = {
      url = "github:hoob3rt/lualine.nvim";
      flake = false;
    };
    nvim-navic = {
      url = "github:SmiteshP/nvim-navic";
      flake = false;
    };
    oil-nvim = {
      url = "github:stevearc/oil.nvim";
      flake = false;
    };
    oil-git-status-nvim = {
      url = "github:mrcjkb/oil-git-status.nvim/ftplugin";
      flake = false;
    };
    toggleterm = {
      url = "github:akinsho/toggleterm.nvim";
      flake = false;
    };
    # harpoon = {
    #   url = "github:ThePrimeagen/harpoon/harpoon2";
    #   flake = false;
    # };
    gitsigns = {
      url = "github:lewis6991/gitsigns.nvim";
      flake = false;
    };
    nvim-bqf = {
      url = "github:kevinhwang91/nvim-bqf";
      flake = false;
    };
    formatter = {
      url = "github:mhartington/formatter.nvim";
      flake = false;
    };
    yanky = {
      url = "github:gbprod/yanky.nvim";
      flake = false;
    };
    promise-async = {
      # Dependency of nvim-ufo
      url = "github:kevinhwang91/promise-async";
      flake = false;
    };
    nvim-ufo = {
      url = "github:kevinhwang91/nvim-ufo";
      flake = false;
    };
    statuscol = {
      url = "github:luukvbaal/statuscol.nvim";
      flake = false;
    };
    nvim-unception = {
      # Prevent nested neovim instances
      url = "github:samjwill/nvim-unception";
      flake = false;
    };
    # hardtime-nvim = {
    #   url = "github:m4xshen/hardtime.nvim";
    #   flake = false;
    # };
    term-edit-nvim = {
      url = "github:chomosuke/term-edit.nvim";
      flake = false;
    };
    other-nvim = {
      url = "github:rgroli/other.nvim";
      flake = false;
    };
    which-key-nvim = {
      url = "github:folke/which-key.nvim";
      flake = false;
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-utils,
    gen-luarc,
    ...
  }: let
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];

    # This is where the Neovim derivation is built.
    neovim-overlay = import ./nix/neovim-overlay.nix {inherit inputs;};
  in
    flake-utils.lib.eachSystem supportedSystems (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          # Import the overlay, so that the final Neovim derivation(s) can be accessed via pkgs.<nvim-pkg>
          neovim-overlay
          # This adds a function can be used to generate a .luarc.json
          # containing the Neovim API all plugins in the workspace directory.
          # The generated file can be symlinked in the devShell's shellHook.
          gen-luarc.overlays.default
        ];
      };
      shell = pkgs.mkShell {
        name = "nvim-devShell";
        buildInputs = with pkgs; [
          # Tools for Lua and Nix development, useful for editing files in this repo
          lua-language-server
          nil
          stylua
          luajitPackages.luacheck
        ];
        shellHook = ''
          # symlink the .luarc.json generated in the overlay
          ln -fs ${pkgs.nvim-luarc-json} .luarc.json
        '';
      };
    in {
      packages = rec {
        default = nvim;
        nvim = pkgs.nvim-pkg;
      };
      devShells = {
        default = shell;
      };
    })
    // {
      # You can add this overlay to your NixOS configuration
      overlays.default = neovim-overlay;
    };
}
