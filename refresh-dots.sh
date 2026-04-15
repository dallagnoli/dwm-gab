#!/bin/sh

rsync -a config/ ~/.config/
rsync -a scripts/ ~/.local/bin/

chmod +x ~/.local/bin/*

echo "Config files and scripts were updated!"
