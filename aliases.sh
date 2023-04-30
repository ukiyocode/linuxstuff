#!/bin/sh
grep -qxF 'alias ll=' $HOME/.zshrc || echo 'alias ll="ls -lah --color=auto --group-directories-first"' >> $HOME/.zshrc
