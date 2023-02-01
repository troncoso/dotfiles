# dotfiles
My dotfiles

# Install

## brew

* iterm2
* tmux
* neovim
* git
* lazygit
* fig
* rust
	* rust_analyzer
	* clippy
* ripgrep

## Other

* NVM
* Node
* Typescript

# Configure tmux plugins

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

In tmux, press <C-a>I to install plugins

# Terminal Aliases

```
alias vim='nvim --listen /tmp/nvim-server.pipe'
alias t='tmux'
alias ta='tmux a -t'
```
