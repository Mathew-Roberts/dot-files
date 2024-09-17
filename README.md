# dot-files
Welcome to my development setup environment. Please read the below as it will help smooth the process of installation.

**NOTE: The Neovim config in these dot-files are designed to work with v0.9.5. Results using later or earlier versions of Neovim may vary. By default, the plugins will try to install the latest versions of themselves unless otherwise explicitly versioned in the lua file; if you find that some of the plugins are not working, I would suggest pinning the version in the plugin file for a more stable experience. Or, if you are feeling particularly brave, and/or are already familiar with lua and Neovim, you are more than welcome to install the latest version of Neovim and troubleshoot from there. If you are unfamiliar with Lua please refer to https://www.lua.org/pil/1.1.html as it contains some great resources to learn the language**

### Prerequisites
1. Neovim - If you haven't got it installed yet, visit this page here https://github.com/neovim/neovim/releases and choose the version of Neovim you wish to install. You can install Neovim through a variety of ways (snap, apt, brew (mac) etc), however, if you don't have root access, I'd recommend downloading the nvim.appimage file and symlinking/moving the and renaming it to nvim in your local binary folder. If you are on linux this will be ~/.local/bin - more complete instructions about how to download the appimage can be found on the repository page.

*Remark*: For those who use Guix as a package manager, Neovim is available within guix however the version may be quite outdated depending on what version of Guix you have installed. Please run ```guix show neovim``` and ensure that the version is > v0.9.5 before installing.

2. Tmux and Tmux plugin manager (tpm) - Tmux is available in pretty much all linux environments. The config file for tmux in the repo is less sensitive to versioning so hopefully it should work natively with your preferred version of linux. You will need to install the Tmux plugin manager which can be found here https://github.com/tmux-plugins/tpm. The installation is very simple and complete instructions are available on the link. Please read the tpm documentation carefully because there are some things you need to do in order to ensure that the plugins are working as expected. (Main pitfall is usually people forgetting to do Prefix + I to install the plugins after you have added them)

3. Ripgrep - This is needed to ensure that the grepping features of some of the neovim plugins works as expected.
   
4. OhMyZsh (Optional) - I use Zsh as my default terminal so that is why there is a .zshrc dot-file here. I'm yet to become a linux master so the zshrc is bare for the time being.
   
5. fzf (Optional) - This has made my terminal experience much better and I would highly recommend checking it out. https://github.com/junegunn/fzf

### Files

These are some very simple dot-files. There are only 3 files in here which I find to be very important to my dev workflow - they are listed below.

1. .config/nvim
2. .tmux.conf
3. .zshrc

1) **.config/nvim** - This contains all my neovim setup configurations. It should work natively with Python, with Ruff and Pyright as the chosen LSP's. The LSP's should be able to resolve all imports automatically if neovim is started with a virtual environment. For example, if you use guix, if you do ```guix shell -D <package>``` and start Neovim inside this shell, all imports/definitions/references and refactor capabilities should be available to you out of the box. You may notice that there are no global formatters or linters set for Python. This is because some projects that I work on require different configurations per project, e.g Black and Flake8 for project A and Ruff and Semgrep for project B. There is a nice feature in Neovim, similar to the .vscode/ in VSCode where you can create a project specific lua file *.nvim.lua* in your project root; if you are working in a git repository, this would be at the same tree level as a .gitignore, or .git folder. Please see a below example of how you can set up this file.
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
*Nvim file structure* - The directory structure is highly modularised, where each *plugin is self contained in its own lua file; I believe that this makes for a more manageable and more maintainable repo. I have split the plugins up into what I deem to be *required* and *additional*. I would recommend spending some time understanding the plugins in *required* first before moving to *additional*. Happy Neovim-ing!

#### Notable Plugins:

- *tree-sitter* 
Tree-sitter in Neovim provides fast and accurate syntax highlighting, code navigation, and structural editing by parsing code into an abstract syntax tree, enabling better understanding and manipulation of source code compared to traditional regex-based methods.
- *nvim-lspconfig*
This plugin simplifies the setup and configuration of Language Server Protocol (LSP) servers, enabling features like autocompletion, diagnostics, code navigation, and more, to enhance development workflows with minimal configuration required.
- *telescope*
Telescope is a highly customizable fuzzy finder that allows users to efficiently search, filter, and preview files, buffers, LSP symbols, and more, providing a powerful interface for navigating and managing code within the editor
- *oil*
Personal favourite, oil is a file explorer plugin that presents directories as editable buffers, allowing users to navigate and manage their file system as if interacting with regular text, enabling intuitive file operations and streamlined directory management.
- *nvim-dap*
nvim-dap in Neovim provides a flexible and powerful debugging interface that integrates with various Debug Adapter Protocol (DAP) servers, enabling features like breakpoints, step-through debugging, variable inspection, and more, directly within the editor to enhance the debugging workflow for multiple programming languages.
- *conform*
conform.nvim is a lightweight and extensible auto-formatting plugin that integrates with various code formatters, allowing users to easily format their code on demand or automatically, while providing a simple interface to configure formatting behavior across multiple languages.
- *nvim-lint*
nvim-lint is a minimal and configurable plugin that integrates with external linting tools to provide real-time or on-demand diagnostics, helping developers identify and fix code issues such as errors, warnings, and stylistic problems across multiple languages directly within the editor.
- *gitsigns*
gitsigns.nvim provides Git integration by displaying inline Git changes, such as added, modified, or deleted lines in the sign column, and offers features like staging, reverting changes, hunk previews, and live blame, enhancing version control workflows within the editor.

2) **.tmux.conf** This is the tmux configuration file. This is where you can set all the necessary keybindings and plugins. The plugins in the config file are installed by the tmux plugin manager (see prerequisites), unlike Neovim though you have to manually tell by tpm to install the plugins by doing Prefix + I. By default the Prefix for tmux is Ctrl + B, however I have remapped this to Ctrl + A as its more comfortable to type on your standard column staggered QWERTY keyboard.

3) **.zshrc** - This is purely personal preference. I happen to like the customizability of Zsh, with the ability to have plugins for git, themes, fzf and many many others. I'm yet to explore the full capability of this so I cannot say much on the topic.

### Installation 
Below is my recommend way of installing the setup.
1. Fork this repo to your own github.
2. Clone the repo to your home directory called ~/dot-files
3. Install GNU Stow using your favourite linux package manager. Please see documentation on GNU Stow as its a great tool for maintaining your dot-files.
4. Navigate to your dot-files/ directory and execute the following command ```stow --dotfiles .```, this will symlink all of your dot files to your home directory. The ```--dotfiles``` option tells stow to replace the prefix ```dot-``` with a ```.``` when creating the symlink to your target directory, for example ```.bashrc -> ~/dot-files/dot-bashrc```; this means that your dot-files directory no longer needs to contain hidden files. NOTE: You need to configure your dot-files repo as if they were located in your home directory at "~/".
5. Open a new terminal session and check that the symlinks have been correctly set. If not, double check that ```stow --dotfiles .``` was called in the correct directory.
