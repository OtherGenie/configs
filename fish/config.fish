#set -l fish_trace on
set -g -x fish_greeting ''
# set -g -x fish_greeting ''

# exit on <c-d>
bind \cd exit

# vi stuff
# <c-c> clears input now
set -g fish_key_bindings fish_vi_key_bindings
bind -M insert \cc kill-whole-line force-repaint


# <a-f> auto complete the suggestion
function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \ef forward-char
    end
end

function loadenv
    for line in (cat .env)
        if test -z "$line"; or string match -qr '^#' -- $line
            continue
        end
        set -l key (echo $line | cut -d '=' -f 1)
        set -l value (echo $line | cut -d '=' -f 2-)

        if string match -qr '^[A-Za-z_][A-Za-z0-9_]*$' -- $key
            set -gx $key $value
        end
    end
    eval $argv
end

# starship
starship init fish | source

#set -x DENO_INSTALL ~/.deno
#set -x PATH $DENO_INSTALL/bin:$PATH
# USE gvm
#set -x GOPATH ~/opt/go
#set -x PATH $HOME/.cargo/bin:$GOPATH/bin:$PATH
#set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
#set -U fish_user_paths $HOME/.local/share/solana/install/active_release/bin $fish_user_paths
set -U fish_user_paths $HOME/.rvm/bin $fish_user_paths
set -U fish_user_paths /opt/nvim/ $fish_user_paths
set -U fish_user_paths $HOME/.local/bin $fish_user_paths
set -U fish_user_paths /snap/bin $fish_user_paths
set -U fish_user_paths /opt/flutter/bin $fish_user_paths
set -U fish_user_paths $HOME/.pub-cache/bin/ $fish_user_paths

#pyenv init - | source

# aliases
alias g="git"
#alias k="kubectl"
#alias mk="minikube"
#alias mkk="minikube kubectl --"
alias d="docker"
alias docker-compose="docker compose"
alias dpsf='docker ps --format "table {{.Names}}\t{{.RunningFor}}\t{{.Ports}}"'
alias lazyvim="NVIM_APPNAME=lazyvim nvim"
alias lvim="lazyvim"

function dpsql
    set -l host localhost # default host

    # Ensure at least 4 arguments remain: container, user, port, and database
    if test (count $argv) -lt 4
        echo "Usage: dpsql <container_name> <user> <port> <database> [-h <host>]"
        return 1
    end

    # Check if -h flag is provided
    if test (count $argv) -gt 5
        if test $argv[5] = -h
            set host $argv[6]
        end
    end

    # usage: dpsql <container_name> <user> <port> <database> [-h <host>]
    docker exec -it $argv[1] \
        bash -c "echo 'set -o vi'>~/.bashrc && \
	             echo 'set editing-mode vi'>~/.inputrc && \
	             psql -h $host -U $argv[2] -p $argv[3] -d $argv[4] -W"
end

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# ====> fzf
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# fuzzy search on <c-f> (-M cuz vi binding is enabled)
# --preview="less {}"
# --bind "enter:execute(less {})"

# fuzzy find directories and cd into it
bind -M insert \cf 'cd (fdfind -t d . --exclude node_modules --exclude target "/home/$USER/" | fzf); commandline -f repaint'
# fuzzy find directory, cd into it and start tmux session
# bind -M insert \ct 'cd (fdfind -t d . --exclude node_modules --exclude target "/home/$USER/" | fzf) && tmux_session.sh'
# bind -M insert \ct 'cd (fdfind -t d . --exclude node_modules --exclude target "/home/$USER/" | fzf) && yes "" | tmux_session.sh; commandline -f repaint'
bind -M insert \ct ct
function ct
    set dirname (fdfind -t d . --exclude node_modules --exclude target "/home/$USER/" | fzf)
    count $dirname >0 && cd $dirname && read -l -P "Session name: " name && commandline -f repaint && tmux_session.sh $name -a
end
# fuzzy find wallpaper images and set as bg
bind -M insert \cw 'fdfind --exclude node_modules --exclude target -t f . ~/images/wallpapers/ | fzf --bind "enter:execute(feh --bg-scale {})"'

# fuzzy find file and nvim it
bind -M insert \cn 'fdfind --exclude node_modules --exclude target -t f . "/home/$USER" | fzf --bind "enter:execute(nvim {})"'

# bind -M insert "ç" fzf-cd-widget

set -x FZF_DEFAULT_OPTS '--cycle --height=50% --border=rounded --margin=1,1,1,1 --pointer="->" --color=16'
# set -x FZF_ALT_C_COMMAND 'fd -t d . "/home/$USER/mit"'

# if not set --query FZF_ALT_C_COMMAND
#   set --global --export FZF_ALT_C_COMMAND 'fd -t d . "/home/$USER/mit"'
# end

# if not set --query FZF_DEFAULT_OPTS
#   set --global --export FZF_DEFAULT_OPTS '--cycle --height=50% --border=rounded --margin=1,1,1,1 --pointer="->" --color=16'
# end

# rbenv
#status --is-interactive; and source (rbenv init -|psub)


# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/home/$USER/opt/gcloud/google-cloud-sdk/path.fish.inc' ]
#    . '/home/$USER/opt/gcloud/google-cloud-sdk/path.fish.inc'
#end

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /home/$USER/.ghcup/bin $PATH # ghcup-env

#set --erase fish_trace

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

#minikube completion fish | source
#kubectl completion fish | source

#rvm default
#set -x GEM_HOME (rvm gemdir)

fish_add_path -a /home/other_genie/.foundry/bin
