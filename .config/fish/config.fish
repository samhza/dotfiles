#!/usr/bin/env fish
set fish_greeting

set -gx XDG_DESKTOP_DIR "$HOME/desktop"
set -gx XDG_DOCUMENTS_DIR "$HOME/doc"
set -gx XDG_DOWNLOAD_DIR "$HOME/tmp"
set -gx XDG_MUSIC_DIR "$HOME/music"
set -gx XDG_PICTURES_DIR "$HOME/img"
set -gx XDG_PUBLICSHARE_DIR "$HOME/pub"
set -gx XDG_TEMPLATES_DIR "$HOME/templates"
set -gx XDG_VIDEOS_DIR "$HOME/videos"

set -gx DOWNLOADS ~/tmp
set -gx EDITOR nvim
set -gx BROWSER vivaldi-stable
set -gx PAGER less
set -gx LANG en_US.UTF-8
set -gx LD_LIBRARY_PATH /usr/local/lib/:/usr/lib/

set -gx PATH ~/bin/(hostname) ~/bin ~/.local/bin /usr/local/bin /usr/bin /bin /sbin /usr/sbin
set -gx GOPATH ~/.local/share/go
set -gx GOPROXY direct
set -gx PATH $PATH $GOPATH/bin
set -gx PATH $PATH ~/.local/share/go/bin
set -gx PLAN9 /usr/lib/plan9
set -gx PATH $PATH $PLAN9/bin
set -gx PASSWORD_STORE_DIR ~/secrets/password-store
set -gx PASSWORD_STORE_GENERATED_LENGTH 32
set -gx PASSWORD_STORE_CHARACTER_SET abcdefghijklmnopqrstuvwxyz

alias config 'git --git-dir=$HOME/sources/dotfiles --work-tree=$HOME'

function fish_prompt
	set -lx last_status $status
	if test $status -ne 0
		printf 'status code %d\n' $last_status
	end
	prompt
	printf ' $ '
end

source ~/.config/fish/(hostname).fish
