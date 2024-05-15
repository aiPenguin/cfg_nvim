local M = {}

M.treesitter = {
  ensure_installed = {
    -- defaults
    "vim",
    "lua",
    "vimdoc",

    -- web dev
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",

    -- low level
    "c",
    "cpp",
    "cmake",
    "zig",

    -- dev
    "python",

    -- text
    "markdown",
    "markdown_inline",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "json-lsp",
    "prettier",

    -- python
    "pyright",
    "black",

    -- cpp
    "clangd",
    "clang-format",

    -- cmake
    "cmake-language-server",
    "cmakelang",
  },
}

-- git support in nvimtree
M.nvimtree = {
  renderer = {
    full_name = true,
    root_folder_label = ":~:s?$?/..?",
    -- highlight_opened_files = "icon",
  },
}

M.cmp = {
  sources = {
    { name = "cmp-cmdline" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

M.telescope = {
  extensions_list = { "themes", "terms", "projects", "todo-comments" },
}

M.gitsigns = {
  on_attach = function(bufnr)
    local gitsigns = package.loaded.gitsigns
    local function opts(desc)
      return { buffer = bufnr, desc = desc }
    end

    local map = vim.keymap.set


    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end,
    opts "Gitsigns Next Hunk")

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end,
    opts "Gitsigns Prev Hunk")

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk, opts "Gitsigns Stage Hunk")
    map('n', '<leader>hr', gitsigns.reset_hunk, opts "Gitsigns Reset Hunk")
    map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, opts "Gitsigns Stage Hunk")
    map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, opts "Gitsigns Reset Hunk")
    map('n', '<leader>hS', gitsigns.stage_buffer, opts "Gitsigns Stage Buffer")
    map('n', '<leader>hu', gitsigns.undo_stage_hunk, opts "Gitsigns Undo Stage Hunk")
    map('n', '<leader>hR', gitsigns.reset_buffer, opts "Gitsigns Reset Buffer")
    map('n', '<leader>hp', gitsigns.preview_hunk, opts "Gitsigns Preview Hunk")
    map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, opts "Gitsigns Blame Line")
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, opts "Gitsigns Toggle Blame Line")
    map('n', '<leader>hd', gitsigns.diffthis, opts "Gitsigns Diff This")
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end, opts "Gitsigns Diff This (cached)")
    map('n', '<leader>td', gitsigns.toggle_deleted, opts "Gitsigns Toggle Deleted")

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts "Gitsigns Select Hunk")
  end
}

return M
