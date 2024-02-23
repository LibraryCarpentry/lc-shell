---
title: Navigating the filesystem
teaching: 20
exercises: 10
---

::::::::::::::::::::::::::::::::::::::: objectives

- Use shell commands to work with directories and files
- Use shell commands to find and manipulate data

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- How do you move around the filesystem in the shell?

::::::::::::::::::::::::::::::::::::::::::::::::::

## Navigating the shell

We will begin with the basics of navigating the Unix shell.

Let's start by opening the shell. This likely results in seeing a black or white window with a cursor flashing next to a dollar sign. This is our command line, and the `$` is the command **prompt** to show that the system is ready for our input. The appearance of the prompt will vary from system to system, depending on how the set up has been configured. Other common prompts include the `%` or `#` signs, but we will use `$` in this lesson to represent the prompt generally.

When working in the shell, you are always *somewhere* in the computer's file system, in some folder (directory). We will therefore start by finding out where we are by using the `pwd` command, which you can use whenever you are unsure about where you are. It stands for "print working directory" and the result of the command is printed to your standard output, which is the screen.

Let's type `pwd` and press enter to execute the command (Note that the `$` sign is used to indicate a command to be typed on the command prompt,
but we never type the `$` sign itself, just what follows after it.):

```bash
$ pwd
```

```output
/Users/riley
```

The output will be a path to your home directory. Let's check if we recognise it by looking at the contents of the directory. To do that, we use the `ls` command. This stands for "list" and the result is a print out of all the contents in the directory:

```bash
$ ls
```

```output
Applications Documents    Library      Music        Public
Desktop      Downloads    Movies       Pictures
```

We may want more information than just a list of files and directories. We can get this by specifying various **flags** (also known as `options`, `parameters`, or, most frequently, `arguments`) to go with our basic commands. Arguments modify the workings of the command by telling the computer what sort of output or manipulation we want.

If we type `ls -l` and press enter, the computer returns a list of files that contains information similar to what we would find in our Finder (Mac) or Explorer (Windows): the size of the files in bytes, the date it was created or last modified, and the file name.

```bash
$ ls -l
```

```output
total 0
drwx------+  6 riley  staff   204 Jul 16 11:50 Desktop
drwx------+  3 riley  staff   102 Jul 16 11:30 Documents
drwx------+  3 riley  staff   102 Jul 16 11:30 Downloads
drwx------@ 46 riley  staff  1564 Jul 16 11:38 Library
drwx------+  3 riley  staff   102 Jul 16 11:30 Movies
drwx------+  3 riley  staff   102 Jul 16 11:30 Music
drwx------+  3 riley  staff   102 Jul 16 11:30 Pictures
drwxr-xr-x+  5 riley  staff   170 Jul 16 11:30 Public
```

In everyday usage we are more accustomed to units of measurement like kilobytes, megabytes, and gigabytes. Luckily, there's another flag `-h` that when used with the -l option, prints unit suffixes: Byte, Kilobyte, Megabyte, Gigabyte, Terabyte and Petabyte in order to reduce the number of digits to three or fewer using base 2 for sizes.

Now `ls -h` won't work on its own. When we want to combine two flags, we can just run them together. So, by typing `ls -lh` and pressing enter we receive an output in a human-readable format (note: the order here doesn't matter).

```bash
$ ls -lh
```

```output
total 0
drwx------+  6 riley  staff   204B Jul 16 11:50 Desktop
drwx------+  3 riley  staff   102B Jul 16 11:30 Documents
drwx------+  3 riley  staff   102B Jul 16 11:30 Downloads
drwx------@ 46 riley  staff   1.5K Jul 16 11:38 Library
drwx------+  3 riley  staff   102B Jul 16 11:30 Movies
drwx------+  3 riley  staff   102B Jul 16 11:30 Music
drwx------+  3 riley  staff   102B Jul 16 11:30 Pictures
drwxr-xr-x+  5 riley  staff   170B Jul 16 11:30 Public
```

We've now spent a great deal of time in our home directory. Let's go somewhere else. We can do that through the `cd` or Change Directory command: (Note: On Windows and Mac, by default, the case of the file/directory doesn't matter. On Linux it does.)

```bash
$ cd Desktop
```

Notice that the command didn't output anything. This means that it was carried out successfully. Let's check by using `pwd`:

```bash
$ pwd
```

```output
/Users/riley/Desktop
```

If something had gone wrong, however, the command would have told you. Let's test that by trying to move into a non-existent directory:

```bash
$ cd "things to learn about the shell"
```

```output
bash: cd: things to learn about the shell: No such file or directory
```

Notice that we surrounded the name by quotation marks. The *arguments* given to any shell command are separated by spaces, so a way to let them know that we mean 'one single thing called "things to learn about the shell"', not 'six different things', is to use (single or double) quotation marks.

We've now seen how we can go 'down' through our directory structure (as in into more nested directories). If we want to go back, we can type `cd ..`. This moves us 'up' one directory, putting us back where we started. **If we ever get completely lost, the command `cd` without any arguments will bring
us right back to the home directory, the place where we started.**

:::::::::::::::::::::::::::::::::::::::::  callout

## Previous Directory

To switch back and forth between two directories use `cd -`.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## Try exploring

Move around the computer, get used to moving in and out of directories, see how different file types appear in the Unix shell. Be sure to use the `pwd` and `cd` commands, and the different flags for the `ls` command you learned so far.

If you run Windows, also try typing `explorer .` to open Explorer for the current directory (the single dot means "current directory"). If you're on a Mac, try `open .` and for Linux try `xdg-open .` to open their graphical file manager.

::::::::::::::::::::::::::::::::::::::::::::::::::

Being able to navigate the file system is very important for using the Unix shell effectively.
As we become more comfortable, we can get very quickly to the directory that we want.

:::::::::::::::::::::::::::::::::::::::  challenge

## Getting help

Use the `man` command to invoke the manual page (documentation) for a shell command. For example, `man ls` displays all the arguments available to you - which saves you remembering them all! Try this for each command you've learned so far. Use the <kbd>spacebar</kbd> to navigate the manual pages. Use <kbd>q</kbd> at any time to quit.

***Note*: this command is for Mac and Linux users only**. It does not work directly for Windows users. If you use Windows, you can search for the shell command on [http://man.he.net/](https://man.he.net/), and view the associated manual page. In some systems the command name followed by `--help` will work, e.g. `ls --help`.

Also, the manual lists commands individually, e.g., although `-h` can only be used together with the `-l` option, you'll find it listed as `-h` in the manual, not as `-lh`.

:::::::::::::::  solution

## Answer

```bash
$ man ls
```

```output
LS(1)                     BSD General Commands Manual                    LS(1)

NAME
    ls -- list directory contents

SYNOPSIS
    ls [-ABCFGHLOPRSTUW@abcdefghiklmnopqrstuwx1] [file ...]

DESCRIPTION
    For each operand that names a file of a type other than directory, ls
    displays its name as well as any requested, associated information.  For
    each operand that names a file of type directory, ls displays the names
    of files contained within that directory, as well as any requested, asso-
    ciated information.

    If no operands are given, the contents of the current directory are dis-
    played.  If more than one operand is given, non-directory operands are
    displayed first; directory and non-directory operands are sorted sepa-
    rately and in lexicographical order.

    The following options are available:

    -@      Display extended attribute keys and sizes in long (-l) output.

    -1      (The numeric digit ``one''.)  Force output to be one entry per
            line.  This is the default when output is not to a terminal.

    -A      List all entries except for . and ...  Always set for the super-
            user.

...several more pages...

BUGS
    To maintain backward compatibility, the relationships between the many
    options are quite complex.

BSD                              May 19, 2002                              BSD

```

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::  challenge

## Find out about advanced `ls` commands

Find out, using the manual page, how to list the files in a directory ordered by their filesize. Try it out in different directories. Can you combine it with the `-l` *argument* you learned before?

Afterwards, find out how you can order a list of files based on their last modification date. Try ordering files in different directories.

:::::::::::::::  solution

## Answer

To order files in a directory by their filesize, in combination with the `-l` argument:

```bash
ls -lS
```

Note that the `S` is **case-sensitive!**

To order files in a directory by their last modification date, in combination with the `-l` argument:

```bash
ls -lt
```

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: keypoints

- Knowing where you are in your directory structure is key to working with the shell

::::::::::::::::::::::::::::::::::::::::::::::::::


