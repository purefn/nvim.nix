# This overlay, when applied to nixpkgs, adds the final neovim derivation to nixpkgs.
{inputs}: final: prev:
with final.pkgs.lib; let
  pkgs = final;

  # Use this to create a plugin from a flake input
  mkNvimPlugin = src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };

  # Make sure we use the pinned nixpkgs instance for wrapNeovimUnstable,
  # otherwise it could have an incompatible signature when applying this overlay.
  pkgs-wrapNeovim = inputs.nixpkgs.legacyPackages.${pkgs.system};

  # This is the helper function that builds the Neovim derivation.
  mkNeovim = pkgs.callPackage ./mkNeovim.nix { inherit pkgs-wrapNeovim; };

  # A plugin can either be a package or an attrset, such as
  # { plugin = <plugin>; # the package, e.g. pkgs.vimPlugins.nvim-cmp
  #   config = <config>; # String; a config that will be loaded with the plugin
  #   # Boolean; Whether to automatically load the plugin as a 'start' plugin,
  #   # or as an 'opt' plugin, that can be loaded with `:packadd!`
  #   optional = <true|false>; # Default: false
  #   ...
  # }
  all-plugins = with pkgs.vimPlugins; [
    # plugins from nixpkgs go in here.
    # https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=vimPlugins
    (mkNvimPlugin inputs.nvim-treesitter "nvim-treesitter") # nvim-treesitter.withAllGrammars
    luasnip # snippets | https://github.com/l3mon4d3/luasnip/
    # nvim-cmp (autocompletion) and extensions
    (mkNvimPlugin inputs.nvim-cmp "nvim-cmp") # nvim-cmp # https://github.com/hrsh7th/nvim-cmp
    # cmp_luasnip # snippets autocompletion extension for nvim-cmp | https://github.com/saadparwaiz1/cmp_luasnip/
    (mkNvimPlugin inputs.lspkind-nvim "lspkind-nvim") # lspkind-nvim # vscode-like LSP pictograms | https://github.com/onsails/lspkind.nvim/
    (mkNvimPlugin inputs.cmp-nvim-lsp "cmp-nvim-lsp") # cmp-nvim-lsp # LSP as completion source | https://github.com/hrsh7th/cmp-nvim-lsp/
    (mkNvimPlugin inputs.cmp-nvim-lsp-document-symbol "cmp-nvim-lsp-document-symbol")
    (mkNvimPlugin inputs.cmp-nvim-lsp-signature-help "cmp-nvim-lsp-signature-help") # cmp-nvim-lsp-signature-help # https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/
    (mkNvimPlugin inputs.cmp-buffer "cmp-buffer") # cmp-buffer # current buffer as completion source | https://github.com/hrsh7th/cmp-buffer/
    (mkNvimPlugin inputs.cmp-path "cmp-path") # cmp-path # file paths as completion source | https://github.com/hrsh7th/cmp-path/
    (mkNvimPlugin inputs.cmp-nvim-lua "cmp-nvim-lua") # cmp-nvim-lua # neovim lua API as completion source | https://github.com/hrsh7th/cmp-nvim-lua/
    (mkNvimPlugin inputs.cmp-cmdline "cmp-cmdline") # cmp-cmdline # cmp command line suggestions
    (mkNvimPlugin inputs.cmp-cmdline-history "cmp-cmdline-history") # cmp-cmdline-history # cmp command line history suggestions
    (mkNvimPlugin inputs.cmp-rg "cmp-rg")
    # ^ nvim-cmp extensions
    # git integration plugins
    (mkNvimPlugin inputs.diffview "diffview.nvim") # diffview-nvim # https://github.com/sindrets/diffview.nvim/
    # neogit # https://github.com/TimUntersberger/neogit/
    (mkNvimPlugin inputs.gitsigns "gitsigns.nvim") # gitsigns-nvim # https://github.com/lewis6991/gitsigns.nvim/
    vim-fugitive # https://github.com/tpope/vim-fugitive/
    # ^ git integration plugins
    # telescope and extensions
    (mkNvimPlugin inputs.telescope "telescope.nvim") # telescope-nvim # https://github.com/nvim-telescope/telescope.nvim/
    telescope-fzy-native-nvim # https://github.com/nvim-telescope/telescope-fzy-native.nvim
    (mkNvimPlugin inputs.telescope-zf-native "telescope-zf-native.nvim")
    (mkNvimPlugin inputs.telescope-smart-history "telescope-smart-history.nvim") # telescope-smart-history-nvim # https://github.com/nvim-telescope/telescope-smart-history.nvim
    # ^ telescope and extensions
    # UI
    (mkNvimPlugin inputs.lualine "lualine.nvim") # lualine-nvim # Status line | https://github.com/nvim-lualine/lualine.nvim/
    (mkNvimPlugin inputs.nvim-navic "nvim-navic") # nvim-navic # Add LSP location to lualine | https://github.com/SmiteshP/nvim-navic
    (mkNvimPlugin inputs.statuscol "statuscol.nvim") # statuscol-nvim # Status column | https://github.com/luukvbaal/statuscol.nvim/
    (mkNvimPlugin inputs.treesitter-context "nvim-treesitter-context") # nvim-treesitter-context # nvim-treesitter-context
    # ^ UI
    # language support
    (mkNvimPlugin inputs.haskell-tools "haskell-tools.nvim")
    # ^ language support
    # navigation/editing enhancement plugins
    (mkNvimPlugin inputs.unimpaired "vim-unimpaired") # vim-unimpaired # predefined ] and [ navigation keymaps | https://github.com/tpope/vim-unimpaired/
    # eyeliner-nvim # Highlights unique characters for f/F and t/T motions | https://github.com/jinh0/eyeliner.nvim
    (mkNvimPlugin inputs.surround "nvim-surround") # nvim-surround # https://github.com/kylechui/nvim-surround/
    (mkNvimPlugin inputs.treesitter-textobjects "nvim-treesitter-textobjects") # nvim-treesitter-textobjects  # https://github.com/nvim-treesitter/nvim-treesitter-textobjects/
    (mkNvimPlugin inputs.nvim-ts-context-commentstring "nvim-ts-context-commentstring") # nvim-ts-context-commentstring # https://github.com/joosepalviste/nvim-ts-context-commentstring/
    # ^ navigation/editing enhancement plugins
    # Useful utilities
    (mkNvimPlugin inputs.nvim-unception "nvim-unception") # nvim-unception # Prevent nested neovim sessions | nvim-unception
    # ^ Useful utilities
    # libraries that other plugins depend on
    (mkNvimPlugin inputs.sqlite "sqlite.lua") # sqlite-lua
    (mkNvimPlugin inputs.plenary "plenary.nvim") # plenary-nvim
    (mkNvimPlugin inputs.nvim-web-devicons "nvim-web-devicons") # nvim-web-devicons
    (mkNvimPlugin inputs.repeat "vim-repeat") # vim-repeat
    # ^ libraries that other plugins depend on
    # bleeding-edge plugins from flake inputs
    # (mkNvimPlugin inputs.wf-nvim "wf.nvim") # (example) keymap hints | https://github.com/Cassin01/wf.nvim
    # ^ bleeding-edge plugins from flake inputs
    (mkNvimPlugin inputs.which-key-nvim "which-key-nvim") # which-key-nvim

    (mkNvimPlugin inputs.nvim-highlight-colors "nvim-highlight-colors")
    (mkNvimPlugin inputs.persistence "persistence.nvim")
    (mkNvimPlugin inputs.nvim-lastplace "nvim-lastplace")
    (mkNvimPlugin inputs.comment "Comment.nvim")
    (mkNvimPlugin inputs.material-theme "material.nvim")
    (mkNvimPlugin inputs.schemastore-nvim "SchemaStore.nvim")
    (mkNvimPlugin inputs.lsp-status "lsp-status.nvim")
    (mkNvimPlugin inputs.lsp_signature "lsp_signature.nvim")
    (mkNvimPlugin inputs.fidget "fidget.nvim")
    (mkNvimPlugin inputs.illuminate "nvim-illuminate")
    (mkNvimPlugin inputs.actions-preview-nvim "actions-preview.nvim")
    (mkNvimPlugin inputs.wildfire-nvim "wildfire.nvim")
    (mkNvimPlugin inputs.rainbow-delimiters-nvim "rainbow-delimiters.nvim")
    (mkNvimPlugin inputs.vim-matchup "vim-matchup")
    (mkNvimPlugin inputs.nvim-lint "nvim-lint")
    (mkNvimPlugin inputs.todo-comments "todo-comments.nvim")
    (mkNvimPlugin inputs.fzf-lua "fzf-lua")
    (mkNvimPlugin inputs.oil-nvim "oil.nvim")
    (mkNvimPlugin inputs.oil-git-status-nvim "oil-git-status.nvim")
    (mkNvimPlugin inputs.toggleterm "toggleterm.nvim")
    (mkNvimPlugin inputs.nvim-bqf "nvim-bqf")
    (mkNvimPlugin inputs.formatter "formatter.nvim")
    (mkNvimPlugin inputs.yanky "yanky.nvim")
    (mkNvimPlugin inputs.promise-async "promise-async")
    (mkNvimPlugin inputs.nvim-ufo "nvim-ufo")
    (mkNvimPlugin inputs.term-edit-nvim "term-edit.nvim")
    (mkNvimPlugin inputs.other-nvim "other.nvim")
  ];

  extraPackages = with pkgs; [
    # language servers, etc.
    lua-language-server
    nil # nix LSP
  ];
in {
  # This is the neovim derivation
  # returned by the overlay
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };

  # This can be symlinked in the devShell's shellHook
  nvim-luarc-json = final.mk-luarc-json {
    plugins = all-plugins;
  };

  # You can add as many derivations as you like.
  # Use `ignoreConfigRegexes` to filter out config
  # files you would not like to include.
  #
  # For example:
  #
  # nvim-pkg-no-telescope = mkNeovim {
  #   plugins = [];
  #   ignoreConfigRegexes = [
  #     "^plugin/telescope.lua"
  #     "^ftplugin/.*.lua"
  #   ];
  #   inherit extraPackages;
  # };
}
