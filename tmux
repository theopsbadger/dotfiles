# remap prefix from 'C-b' to 'C-Space'
unbind C-b
set-option -g prefix C-Space
bind-key C-Space send-prefix

# split panes using | and -
bind b split-window -h
bind v split-window -v
unbind '"'
unbind %

# navigate panes with hjkl like in vim
bind -r h select-pane -L
bind -r j select-pane -D
bind -r k select-pane -U
bind -r l select-pane -R

# switch panes using Alt-arrow without prefix
bind -n M-h select-pane -L
bind -n M-j select-pane -D
bind -n M-k select-pane -U
bind -n M-l select-pane -R

# reload tmux file
bind r source-file ~/.tmux.conf \; display "Reloaded config"

# Start window numbering at 1
set -g base-index 1

set -g mouse on
