#!/bin/bash
echo "Delete unused flatpak apps"
flatpak uninstall --unused

echo "Delete Downloads/"
rm -rf ~/Downloads/*

echo "Remove Videos/"
rm -rf ~/Videos/*

echo "Clean npm cache"
npm cache clean --force


df -h /
echo "ALSO DELETE SNAPSHOTS THEY ARE BIG";
