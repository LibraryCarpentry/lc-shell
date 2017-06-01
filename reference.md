---
layout: reference
title: Reference
permalink: /reference/
---

## Shell Cheat Sheet

_____
### Shell: Basics

**`pwd`** print working directory

**`ls`** list directory

- `-l`: list file information
- `-lh`: list human readable file information

**`cd`** change directory

______
### Shell: Interacting with Files

**`mkdir`** make directory

**`cat`** send file or files to output (in most cases, print to shell)

**`head`** output first 10 lines of a file or files

**`tail`** output last 10 lines of a file or files

**`mv`** rename or move a file or files. Syntax for renaming a file: `mv FILENAME NEWFILENAME`

**`cp`** copy a file or files. Syntax: `cp FILENAME NEWFILENAME`

**`>`** redirect output. Syntax with `cat`: `cat FILENAME1 FILENAME2 > NEWFILENAME`

**`rm`** remove a file or files. NB: *USE WITH EXTREME CAUTION!!!*

______
### Shell: Wildcards

**`?`** a placeholder for one character or number

**`*`** a placeholder for zero or more characters or numbers

**`[]`** defines a class of characters

*Examples*

- `foobar?`: matches seven character strings starting with `foobar` and ending with one character or number
- `foobar*`: matches strings starting with `foobar` ending with zero or more further characters or numbers
- `foobar*txt`: matches strings starting with `foobar` and ending with `txt`
- `[1-9]foobar?`: matches eight character strings starting that start with a number, have `foobar` after the number, and end with any character or number.

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
- `**|**`: (vertical bar character) send output from one command into another comma
