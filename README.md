# dot-files
Welcome to my development setup environment. Please read the below as it will help smooth the process of installation.

**NOTE: The Neovim config in these dot-files are designed to work with v0.9.5. Results using later or earlier versions of Neovim may vary. By default, the plugins will try to install the latest versions of themselves unless otherwise explicitly versioned in the lua file; if you find that some of the plugins are not working, I would suggest pinning the version in the plugin file for a more stable experience. Or, if you are feeling particularly brave, and/or are already familiar with lua and Neovim, you are more than welcome to install the latest version of Neovim and troubleshoot from there.**

### Prerequisites
1. Neovim - If you haven't got it installed yet, visit this page here https://github.com/neovim/neovim/releases and choose the version of Neovim you wish to install. You can install Neovim a variety of ways snap, apt, brew (mac) etc, however, if you don't have root access, for example a work machine. I'd recommend downloading the nvim.appimage file and symlinking/moving the and renaming it to nvim in your local binary folder. If you are on linux this will be ~/.local/bin - more complete instructions about how to download the appimage can be found on the repository page.

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
1.1 Nvim file structure - The directory structure is highly modularised, where each *plugin is self contained in its own lua file; I believe that this makes for a more manageable and more maintainable repo. I have split the plugins up into what I deem to be *required* and *additional*. I would recommend spending some time understanding the plugins in *required* first before moving to *additional*. Happy Neovim-ing!

2) **.tmux.conf* This is the tmux configuration file. This is where you can set all the necessary keybindings and plugins. The plugins in the config file are installed by the tmux plugin manager (see prerequisites), unlike Neovim though you have to manually tell by tpm to install the plugins by doing Prefix + I. By default the Prefix for tmux is Ctrl + B, however I have remapped this to Ctrl + A as its more comfortable to type on your standard column staggered QWERTY keyboard.

3) *.zshrc* - This is purely personal preference. I happen to like the customizability of Zsh, with the ability to have plugins for git, themes, fzf and many many others. I'm yet to explore the full capability of this so I cannot say much on the topic.

### Installation 
Below is my recommend way of installing the setup.
1. Fork this repo to your own github.
2. Clone the repo to your home directory called ~/dot-files
3. Run the install.sh script (All this script does in symlink the files in the repo to the respective places in your home directory where the configuration files/folders are expected to be. Please be aware that this script is very crude and not well tested. If you find that it is not working for you I would recommend doing this manually.

