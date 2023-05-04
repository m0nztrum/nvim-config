-- Enable ALE
vim.g.ale_enabled = 1

-- Set the linters you want to use (replace `eslint` with your preferred linter)
vim.g.ale_linters = {
  javascript = {'eslint'},
  typescript = {'eslint'},
}

-- Set the fixers you want to use (replace `prettier` with your preferred fixer)
vim.g.ale_fixers = {
  javascript = {'prettier'},
  typescript = {'prettier'},
}

