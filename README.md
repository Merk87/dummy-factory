# dummy-factory
Small bash script to generate random named files with random Lore Ipsum text.

# Thanks:
 
[Thanks to dead10ck](https://github.com/dead10ck) for his work on [Lorem](https://github.com/per9000/lorem) that is used on this small script.

# Requirements:

* wget
* shuf

# Installation
The script is shipped with an install.sh file that will handle the move and link into /bin/ of the dummy-factory script.

You can personalize the symlink name that will be created on /bin/. The installation script will ask you about it.

# Usage

You only need to run the script if you decided to don't install it in /bin.

If you have installed it you should use your custom command or use the command by default:

```
produce-dummies
```

In the interactive part if not values are given, the script set files default to 100, and will create a folder wherever you are called dummyFiles.