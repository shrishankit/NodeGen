#! /bin/bash
RED='\033[0;31m'
GREEN='\033[1;32m'
YELLOW='\e[93m'
NC='\033[0m' #no color

printf "New Node.js Project,Enter the name of Project Directory."
read RESPONSE

mkdir $RESPONSE
cd $RESPONSE

printf "Generating Node Folder/directory Structure...\n"
printf "\n"

# array of all the names of folders/directories
dirName=( "config" "models" "loader" "controller" "view" "service" "static" "tests" "apiRoute" )

printf "   Creating folders/Directories...\n"

for i in "${dirName[@]}"
do
	mkdir $i
    printf "$i\t \t ${GREEN} \u2714 created ${NC} \n"
done


for d in */ ; do
    
    if [[ "$d" == "config/" ]]; then
        cd config
        echo Environment variables and configuration related stuff > "readMe.md"
        cd ..
    
    elif [[ "$d" == "models/" ]]; then
        cd models
        echo Database models and ORMs > "readMe.md"
        cd ..   
    
    elif [[ "$d" == "loader/" ]]; then
        cd loader
        echo  Split the startup process into modules > "readMe.md"
        cd ..
    
    elif [[ "$d" == "controller/" ]]; then
        # printf "${YELLOW} Ignore ${NC}"
        cd controller
        echo  Contain all your express routes, separated by module/area of your application > "readMe.md"
        cd ..
    
    elif [[ "$d" == "view/" ]]; then
        # printf "${YELLOW} Ignore ${NC}"
        cd view
        echo  contains your view-templates \(using any templating language supported in express\) > "readMe.md"
        cd ..
    
    elif [[ "$d" == "service/" ]]; then
        # printf "${YELLOW} Ignore ${NC}"
        cd service
        echo  All the business logic is here > "readMe.md"
        cd ..
    
    elif [[ "$d" == "static/" ]]; then
        # printf "${YELLOW} Ignore ${NC}" 
        cd static
        echo   contains all static content \(images, style-sheets, client-side JavaScript\) > "readMe.md"
        cd ..
    
    elif [[ "$d" == "tests/" ]]; then
        # printf "${YELLOW} Ignore ${NC}"
        cd tests
        echo  contains the unit-tests for an application \(using a testing framework\) > "readMe.md"
        cd ..
    
    else
        # printf "${YELLOW} Ignore ${NC}"
        cd apiRoute
        echo  Express route controllers for all the endpoints of the app > "readMe.md"
        cd ..
    fi
done

printf "Do you want ant custom directory? Enter Yes/y or No/n : "
read CUSTDIR

if [[ "$RESPONSE" == "Y" || "$RESPONSE" == "y" || "$RESPONSE" == "Yes" || "$RESPONSE" == "yes" ]];
    then
    mkdir $CUSTDIR
    printf "$CUSTDIR\t \t ${GREEN} \u2714 created ${NC} \n"
fi



printf "Creating Enter Point index.js \n"

touch index.js
if (( $? )); then
            exit 1
fi

printf "Initiating npm package..... \n"
printf "${YELLOW}DO NOT CHANGE THE ENTRY POINT IN NPM PACKAGE CONFIG ${NC} \n"
npm init

