#!/bin/bash

#File usefull to create openl project file if maven compile fails. zip could be uploaded to websudio using CURL. After activation could be fixed all issues.

project_name=${PWD##*/}

(rm ${project_name}.zip; zip ${project_name} rules/*  rules-deploy.xml rules.xml)


project_label=`cat rules.xml | grep "<name>" | head -1 | sed 's/\s*<name>//' | sed 's/<\/name>//'| sed 's/ /%20/g'`

# Copy paste from command line if we want to import to localhost webstudio
echo "curl \"http://localhost:8080/webstudio/rest/repo/project/$project_label\" -F file=@./$project_name.zip -F comment=\"Initial from the script\""
#Put to clipboard in case I would like to paste
echo "curl \"http://localhost:8080/webstudio/rest/repo/project/$project_label\" -F file=@./$project_name.zip -F comment=\"Initial from the script\"" | xclip -sel clip

