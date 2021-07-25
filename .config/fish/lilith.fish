#!/usr/bin/env fish
set -gx PLAN9 /usr/lib/plan9
set -gx PATH $PATH $PLAN9/bin
export SSH_AUTH_SOCK=(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye >/dev/null
