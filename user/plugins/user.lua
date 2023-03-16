return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "tikhomirov/vim-glsl",
  },
  {
    laze = false,
    'toppair/peek.nvim',
    run = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup({
        auto_load = true,        -- whether to automatically load preview when
        -- entering another markdown buffer
        close_on_bdelete = true, -- close preview window on buffer delete
        syntax = true,           -- enable syntax highlighting, affects performance
        theme = 'dark',          -- 'dark' or 'light'
        update_on_change = true,
        app = 'webview',         -- 'webview', 'browser', string or a table of strings
        -- explained below

        filetype = { 'markdown' }, -- list of filetypes to recognize as markdown
        -- relevant if update_on_change is true
        throttle_at = 200000,      -- start throttling when file exceeds this
        -- amount of bytes in size
        throttle_time = 'auto',    -- minimum amount of time in milliseconds
        -- that has to pass before starting new render
      })
    end
  },
  { "EdenEast/nightfox.nvim" },
  {
    "simrat39/rust-tools.nvim",
    dependencies = "mason-lspconfig.nvim",
  },
  { "tpope/vim-repeat" },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
    config = function()
      require("lightspeed").setup {
        ignore_case = false,
        exit_after_idle_msecs = { unlabeled = nil, labeled = nil },
        --- s/x ---
        jump_to_unique_chars = { safety_timeout = 400 },
        match_only_the_start_of_same_char_seqs = true,
        force_beacons_into_match_width = false,
        -- Display characters in a custom way in the highlighted matches.
        substitute_chars = { ['\r'] = '¬', },
        -- Leaving the appropriate list empty effectively disables "smart" mode,
        -- and forces auto-jump to be on or off.
        -- safe_labels = { . . . },
        -- labels = { . . . },
        -- These keys are captured directly by the plugin at runtime.
        special_keys = {
          next_match_group = '<space>',
          prev_match_group = '<tab>',
        },
        --- f/t ---
        limit_ft_matches = 4,
        repeat_ft_with_target_char = false,
      }
    end
  },
}
