#!/usr/bin/env fish
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye >/dev/null
