#!/usr/bin/env fish
set fish_greeting

set -gx EDITOR nvim
set -gx BROWSER chromium
set -gx PAGER less
set -gx LANG en_US.UTF-8
set -gx LD_LIBRARY_PATH /usr/local/lib/:/usr/lib/

set -gx PATH ~/bin/(hostname) ~/bin /usr/local/bin /usr/bin /bin /sbin /usr/sbin
set -gx GOPATH ~/.local/share/go
set -gx GOPROXY direct
set -gx PATH $PATH $GOPATH/bin
set -gx PATH $PATH ~/.local/share/go/bin
set -gx PLAN9 /usr/lib/plan9
set -gx PATH $PATH $PLAN9/bin
set -gx PASSWORD_STORE_DIR ~/secrets/password-store
set -gx PASSWORD_STORE_GENERATED_LENGTH 32
set -gx PASSWORD_STORE_CHARACTER_SET abcdefghijklmnopqrstuvwxyz

function fish_prompt
	prompt
	printf ' $ '
end

source ~/.config/fish/(hostname).fish
