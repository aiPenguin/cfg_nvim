local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "json" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.formatting.black.with {
    generator_opts = {
      command = "black",
      args = {
        "-l 120",
        "--stdin-filename",
        "$FILENAME",
        "-",
      },
      to_stdin = true,
    },
  },

  -- cmake
  b.formatting.cmake_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
