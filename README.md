dotfiles
========
My personal collection of configuration files and some misc scripts that don't
deserve their own repo.

Management
=========
Warning, dftool script is pretty hacky, use at your own risk!

run the dftool script.
```
dftool [-vcqh] install/uninstall/list
    -c  overwrite existing files
    -v  verbose, show same information as the log
    -q  quiet, supress all output
    -h  show this help text and exit"
```
Symlinks are overwritten automatically so be carefull when running the script.

If the -c switch is used then regular files are backed up to a folder
before being overwritten.

A log can be found in ./dotfiles.log.  
