local options = {
  enabled = true,
  snippet_engine = "luasnip",
  input_after_comment = true,
  languages = {
    python = {
      template = {
        annotation_convention = "google_docstrings",
      },
    },
    cpp = {
      template = {
        annotation_convention = "doxygen",
      },
    },
    javascript = {
      template = {
        annotation_convention = "jsdoc",
      },
    },
    lua = {
      template = {
        annotation_convention = "emmylua",
      },
    },
  },
}

return options
