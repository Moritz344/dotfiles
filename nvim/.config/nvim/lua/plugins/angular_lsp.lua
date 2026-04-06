require 'lspconfig'.angularls.setup {
  cmd = { "ngserver", "--stdio" },
  filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
  root_dir = require 'lspconfig'.util.root_pattern("angular.json", "package.json"),
  settings = {
    angular = {
      lint = true,
    },
  },
}
