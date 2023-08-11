local lspconfig = require'lspconfig'
lspconfig.clangd.setup {
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
  }
}
