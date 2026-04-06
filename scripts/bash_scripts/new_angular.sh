#!/bin/bash 

PROJECT_NAME=""
PROJECT_PATH=""
FULL_PATH=""
CREATE_PROJECT=""

echo "Wie soll das Projekt heißen? "
PROJECT_NAME=$(gum input --placeholder "new-project123")

cho ""

echo "Wo soll das Projekt hin?"
PROJECT_PATH=$(gum input --value "/home/moritz/programming/")

mkdir $PROJECT_PATH

ng new $PROJECT_NAME --style css --skip-tests --skip-git
