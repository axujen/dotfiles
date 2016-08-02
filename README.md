dotfiles
========
My personal collection of configuration files and some misc scripts that don't
deserve their own repo.

Unpacking
=========
run the unpack script.
```
unpack [-h] [-v] [-q] [-c] [-b path] [-l path] unpack dotfiles to their configured path 
 
where: 
	-h	show this help text and exit 
	-v	verbose, show same information as the log 
	-q	quiet, supress all output 
	-b	backup directory, default: ./dotfiles_backups 
	-l	logfile, default: ./dotfiles.log 
	-s	specify directory to unpack, default: ./home
	-c	overwrite existing files
```

Symlinks are overwritten automatically so be carefull when running the script.

If the -c switch is used then regular files are backed up to ./dotfiles_backup
before being overwritten.

A log can be found in ./dotfiles.log.  


Encryption
==========
Private files are encrypted inside private.encrypted
cryptool is used to manage this file

Usage:
```
cryptool (lock|unlock|unpack)
```

just run cryptool unpack to decrypt and unpack everything,
and cryptool lock when you want to rencrypt the private dir so you can commit it.

**JUST MAKE SURE TO NEVER COMMIT/PUSH THE RAW PRIVATE DIR**
