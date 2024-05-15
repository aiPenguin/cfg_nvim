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
  
}

return M
