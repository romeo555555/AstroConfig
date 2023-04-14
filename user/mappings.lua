-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer"
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer"
    },
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    ["<leader>r"] = { name = "Rust" },
    ["<leader>ra"] = { "<cmd>RustCodeAction<cr>", desc = "Code action" },
    ["<leader>ry"] = { function() require("rust-tools").hover_range.hover_range() end, desc = "Hover range" },
    ["<leader>rc"] = { function() require("rust-tools").open_cargo_toml.open_cargo_toml() end,
      desc = "Cargo.toml" },
    ["<leader>ru"] = { function() require("rust-tools").move_item.move_item(true) end, desc = "Item up" },
    ["<leader>rd"] = { function() require("rust-tools").move_item.move_item(false) end, desc = "Item down" },
    ["<leader>ro"] = { function() require("rust-tools").external_docs.open_external_docs() end,
      desc = "Open select crate doc" },
    ["<leader>rr"] = { function() require("rust-tools").workspace_refresh.reload_workspace() end,
      desc = "Reload workspase" },
    ["<leader>rm"] = { function() require("rust-tools").expand_macro.expand_macro() end,
      desc = "Expand select macro" },
    ["<leader>rj"] = { function() require("rust-tools").join_lines.join_lines() end, desc = "Joint line" },
    ["<leader>rx"] = { function() require("rust-tools").debuggables.debuggables() end, desc = "Debugg (if dap)" },
    ["<leader>rz"] = { "<cmd>RustViewCrateGraph<cr>", desc = "Grate gpah (if graphit)" },
    -- ["<C-T>"] = { function() require('telekasten').toggle_todo() end },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<C-b>"] = { function() require("telescope.builtin").buffers() end },
    ["<C-i>"] = { function()
      local aerial_avail, _ = pcall(require, "aerial")
      if aerial_avail then
        require("telescope").extensions.aerial.aerial()
      else
        require("telescope.builtin").lsp_document_symbols()
      end
    end },
    require("which-key").register({
      ["<C-x>c"] = { ":e ~/.config/nvim/lua/user/init.lua<cr>", "conf_init" },
      ["<C-x>m"] = { ":e ~/.config/nvim/lua/user/mappings.lua.lua<cr>", "conf_mapping" },
      ["<C-x>n"] = { ":e ~/Notes/main.md<cr>", "notice" },
      -- ["<C-Z>f"] = { name = "+file" },
      -- ["<C-Z>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
      -- ["<C-Z>fr"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      -- ["<C-Z>fn"] = { "<cmd>enew<cr>", "New File" },
    }),
    -- ["<C-z>"] = { name = " LSP" },
    -- require("which-key").register({
    --   ["<C-z>a"] = {
    --     function() vim.lsp.buf.workspace_symbol() end,
    --     "Search workspace symbols",
    --   },
    --   --   maps.n["<leader>lD"] = { function() require("telescope.builtin").diagnostics() end, desc = "Search diagnostics" }
    --   --   maps.n["<leader>ls"] = {
    --   --     function()
    --   --       local aerial_avail, _ = pcall(require, "aerial")
    --   --       if aerial_avail then
    --   --         require("telescope").extensions.aerial.aerial()
    --   --       else
    --   --         require("telescope.builtin").lsp_document_symbols()
    --   --       end
    --   --     end,
    --   --     desc = "Search symbols",
    --   --   }
    --   -- end
    -- }),

  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
