# dot-files
Welcome to my development setup environment. Please read the below as it will help smooth the process of installation.

**NOTE: The Neovim config in these dot-files are designed to work with v0.9.5. Results using later or earlier versions of Neovim may vary. By default, the plugins will try to install the latest versions of themselves unless otherwise explicitly versioned in the lua file; if you find that some of the plugins are not working, I would suggest pinning the version in the plugin file for a more stable experience. Or, if you are feeling particularly brave, and/or are already familiar with lua and Neovim, you are more than welcome to install the latest version of Neovim and troubleshoot from there.**

### Intro

These are some very simple dot-files. There are only 3 files in here which I find to be very important to my dev workflow - they are listed below.

1. .config/nvim
2. .tmux.conf
3. .zshrc

1) **.config/nvim** - This contains all my neovim setup configurations. It should work natively with Python, with Ruff and Pyright as the chosen LSP's. You may notice that there are no global formatters or linters set for Python. This is because some projects that I work on require different configurations per project, e.g Black and Flake8 for project A and Ruff and Semgrep for project B. There is a nice feature in Neovim, similar to the .vscode/ in VSCode where you can create a project specific lua file *.nvim.lua* in your project root; if you are working in a git repository, this would be at the same tree level as a .gitignore, or .git folder. Please see a below example of how you can set up this file.
~~~
local conform = require("conform")
conform.setup({
      formatters_by_ft = {
            python = { "ruff_fix", "ruff_format" },
      },
      format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_fallback = true,
      },
})

local lint = require("lint")
lint.linters_by_ft = {
     python = { "mypy" },
}
~~~
