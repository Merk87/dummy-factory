#!/bin/bash

echo -n "Input the name to use Dummy Factory globally in your system  i.e: DummyFactory: ";

read NAME;

echo "Creating folder for the Dummy Factory in your HOME directory...";
FOLDER=$HOME/dummyFactory;
mkdir $FOLDER;

echo "Moving dummy-factory.sh to $FOLDER";
cp dummy-factory.sh $FOLDER/;

echo "Giving executable permissions to the file...";
chmod a+x $FOLDER/dummy-factory.sh

echo "Installing it..."
echo "The Dummy Factory is now operative! :)";
if [ -n "$NAME" ];
then
    sudo ln -s $FOLDER/dummy-factory.sh /bin/$NAME;
    echo "You can create your new dummy files with the $NAME command";
else
    sudo ln -s $FOLDER/dummy-factory.sh /bin/produce-dummies;
    echo "You can create your new dummy files with the produce-dummies command";
fi

