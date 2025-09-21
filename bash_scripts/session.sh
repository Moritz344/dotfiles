#!/bin/bash


sessions=("programming" "book-site" "emerald-app" "minecraft" "new-angular-project" "new-js-project" )

selected_session=$(printf "%s\n" "${sessions[@]}" | fzf)


if [ "$selected_session" ]; then
				case $selected_session in
								"programming")
												cd ~/dev/programming/
												bash
												;;
								"book-site")
												cd ~/dev/programming/book-page/src/app/
												bash
												;;
								"emerald-app")
												cd ~/dev/programming/emerald-app/src/app/
												bash
												;;
								"minecraft")
												cd ~/Download
												./lunarclient.AppImage --no-sandbox
												;;
								"new-angular-project")
												cd ~/dev/programming/
												pwd
												echo "Ordnername:"
												read folderName
												mkdir $folderName
												echo "Created folder $folderName"
												cd $folderName
												sleep 1
												ng new
												cd src/app/
												bash
												;;
								"new-js-project")
												cd ~/dev/programming/
												echo "Ordnername:"
												read folderName
												mkdir $folderName
												cd $folderName
												pwd
												sleep 1
												npm init -y
												touch README.md 
												mkdir src 
												cd src/
												echo -e "function main() {\n // write your horrible code here \n }" > index.js
												cd ~/dev/programming/$folderName
												bash

												;;
								*)
				esac
else
				echo "Keine Session ausgewählt"

fi

