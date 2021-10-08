#!/usr/bin/env fish
set -gx PLAN9 /usr/lib/plan9
set -gx PATH $PATH $PLAN9/bin
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye >/dev/null
