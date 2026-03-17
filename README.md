# Neovim Config

## Install

Clone this Repository and @ ~./config/

## TMUX

I personally use this configuration in combination with tmux.
Contents of my ~/.tmux.conf file:

```
# remap default prefix from ctrl+b to ctrl+space
unbind C-b
set -g prefix C-Space
bind C-Space send-prefix

# split panes using | and -
# default for closing a pane is x and we take that
bind v split-window -h
bind m split-window -v
unbind '"'
unbind %

bind h select-pane -L
bind l select-pane -R
bind k select-pane -U
bind j select-pane -D

# you know, because sometimes...
set -g mouse on
```

For a nicer design I also installed catppuccin/tmux
as well as catppuccin/kitty
