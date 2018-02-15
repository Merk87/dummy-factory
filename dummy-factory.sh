#!/bin/bash
# Script to generate random named files.
# Also it will install lorem generator (https://github.com/per9000/lorem)
# to add a random number of lines to each file based in the lore ipsum.

echo -n "In which folder you want to generate the dummy files? (use absolute path and no trailing slash): ";
read  TARGET_FOLDER;

echo -n "How many files you want to generate?: "
read FILE_NUMBER;

if [ -z "$TARGET_FOLDER" ];
then
    TARGET_FOLDER=$(pwd)/dummyFiles
fi

if [ -z $FILE_NUMBER ];
then
    FILE_NUMBER=100;
fi

which lorem
USE_LORE_IPSUM=$?
echo "Creating random files in: $TARGET_FOLDER";

if [ $USE_LORE_IPSUM -eq 1 ]; then
    mkdir $HOME/lorem;
    wget https://raw.githubusercontent.com/per9000/lorem/master/lorem -P $HOME/lorem/ -O $HOME/lorem/lorem.sh;
    chmod a+x $HOME/lorem/lorem.sh;
    sudo ln -s $HOME/lorem/lorem.sh /bin/lorem;
fi

# We try to create the target folder.
mkdir -p $TARGET_FOLDER;
# We iterate from 0 to n
for (( i=0; i<=$FILE_NUMBER; i++ ))
do
    # We create the name as 5 chars length
    NAME=$( shuf -i 10000-99999 -n 1);
    # We create the file
    FILE_PATH=$TARGET_FOLDER/$NAME;
    touch $FILE_PATH;

    # We check if lore generator is installed, if so we add content  
    echo "$(lorem -l $(( ( RANDOM % 10 )  + 1 )))" >> $FILE_PATH;    
	    
    # We check if the file is divisible by 5 and if so, we change the  permissions.
    if (( $i % 3 == 0))
    then
        PERMISSIONS=$( shuf -i 1-3 -n 1);
        case $PERMISSIONS in
		1)
		    sudo chmod 777 $FILE_PATH;
		    ;;
		2)
		    sudo chmod 744 $FILE_PATH;
		    ;;
		3)
		    sudo chmod 707 $FILE_PATH;
		    ;;
	esac
    	fi
done
