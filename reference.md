---
layout: reference
title: Reference
---

## Shell Cheat Sheet

_____
### Shell: Basics

**`pwd`** - print working directory

**`ls`** - list contents of a directory

- `ls -l` - list file information
- `ls -lh` - list human readable file information
- `ls -F` - list files and directories (directories will have a trailing `/`)
- `ls -a` - list all files, including hidden files
- `ls *.txt` - list all files that end with `.txt`

**`cd`** change directory

  `cd pathname` - takes you to the directory specified by `pathname`
  
  `cd ~` -  takes you to your home directory

______
### Shell: Interacting with Files

**`mkdir`** make a directory

**`cat`** print to shell or send file or files to output 

**`head`** output first 10 lines of a file or files

**`tail`** output last 10 lines of a file or files

**`mv`** rename or move a file or files. Syntax for renaming a file: `mv FILENAME NEWFILENAME`

**`cp`** make a backup copy of a file or files. Syntax: `cp FILENAME NEWFILENAME`

**`>`** redirect output. Syntax with `cat`: `cat FILENAME1 FILENAME2 > NEWFILENAME`

**`>>`** redirect output by appending to the filename specified. Syntax with `cat`: `cat FILENAME1 FILENAME2 >> NEWFILENAME`

**`rm`** remove a file or files. NB: *USE WITH EXTREME CAUTION!!!*

**`rmdir -r`** will delete a directory, even if it is not empty.

**`rmdir -r-i`** will delete a directory, even if it is not empty, but will ask you to confirm each deletion.


______
### Shell: Wildcards

**`?`** a placeholder for one character or number

**`*`** a placeholder for zero or more characters or numbers

**`[]`** defines a class of characters

*Examples*

- `foobar?`: matches 7-character strings starting with `foobar` and ending with one character or number
- `foobar*`: matches strings that start with `foobar` and end with zero or more other characters or numbers
- `foobar*txt`: matches strings that start with `foobar` and end with `txt`
- `[1-9]foobar?`: matches 8-character strings that start that start with a number, have `foobar` after the number, and end with any character or number.

_____
### Shell: Counting and Mining

**`wc`** word count

- `-w`: count words
- `-l`: count lines
- `-c`: count characters

**sort** sort input 

**`grep`** global regular expression print

- `-c`: displays counts of matches for each file
- `-i`: match with case insensitivity
- `-w`: match whole words
- `-v`: exclude match
- `--file=FILENAME.txt`: use the file `FILENAME.txt` as the source of strings used in query
- `|`: (vertical bar character) send output from one command into another comma
