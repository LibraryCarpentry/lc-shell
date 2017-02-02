---
title: "What is the shell?"
teaching: 60
exercises: 2
questions:
- "What is the shell?"
- "What is the command line?"
- "Why should I use it?"
objectives:
- "understand the basics of the Unix shell"
- "understand why and how to use the command line"
- "use shell commands to work with directories and files"
- "use shell commands to find and manipulate data"
keypoints:
- "the shell is powerful"
- "the shell can be used to copy, move, and combine multiple files"
- "use the command pwd to find out where you are in on your computer"
- "use the command ls to list directory contents"
- "use flags -l and -lh to guide the output of the ls command"
- "use the command cd to move around your computer"
- "use the man command to check the manual page"
- "use the command `mv` to rename and move files."
- "use the command `cp` to create a file from an existing file."
- "use the command `cat` to combine more than one file of the same file type."
- "use the wildcards `*` and `?` as place holders that delimit which files are to be manipulated by a given an action."
- "use the `rm` command to delete unwanted files, with caution."
---
## Introduction

In this session we will introduce programming by looking at how data can be manipulated, counted, and mined using the Unix shell,
a command line interface to your computer and the files to which it has access.

The shell is one of the most productive programming environments ever created. Its syntax may be cryptic, but people who have mastered it can experiment with different commands interactively, then use what they have learned to automate their work. Graphical user interfaces may be better at the first, but the shell is still unbeaten at the second.

A Unix shell is a command-line interpreter that provides a user interface for the Linux
operating system and for Unix-like systems (such as Mac OS).

For Windows users, popular shells such as Cygwin or Git Bash provide a Unix-like
interface. This session will cover a small number of basic commands using Git Bash for Windows users,
Terminal for Mac OS. These commands constitute building blocks upon which more
complex commands can be constructed to fit your data or project.
<!-- Mention native Bash in Windows 10 -->

The motivations for wanting to learn shell commands are many and various.

[](# From SW Carpentry)
What you can quickly learn is how to query lots of data for the information you want super fast. Using Bash or any other shell sometimes feels more like programming than like using a mouse. Commands are terse (often only a couple of characters long), their names are frequently cryptic, and their output is lines of text rather than something visual like a graph. On the other hand, with only a few keystrokes, the shell allows us to combine existing tools into powerful pipelines and handle large volumes of data automatically. This automation not only makes us more productive, but also improves the reproducibility of our workflows by allowing us to repeat them with few simple commands.
[](# Custom addition)
Also, understanding the basics of the shell is very useful as a foundation before learning to program, since most programming languages necessitate working with the shell.

## Navigating the shell

We will begin with the basics of navigating the Unix shell.

Let's start by opening the shell. This likely results in seeing a black window with a cursor flashing next to a dollar sign.
This is our command line, and the `$` is the command **prompt** to show the system is ready for our input.
The prompt can look somewhat different from system to system, but it usually ends with a `$`.

When working in the shell, you are always *somewhere* in the computer's
file system, in some folder (directory). We will therefore start by finding out
where we are by using the `pwd` command, which you can use whenever you are unsure
about where you are. It stands for "print working directory" and the result of the
command is printed to your standard output, which is the terminal, not your office
printer.

Let's type `pwd` and hit enter to execute the command:

~~~
$ pwd
~~~
{: .bash}
~~~
/Users/riley
~~~
{: .output}

The output will be a path to your home directory. Let's check if we recognize it
by listing the contents of the directory. To do that, we use the `ls` command:

~~~
$ ls
~~~
{: .bash}
~~~
Applications Documents    Library      Music        Public
Desktop      Downloads    Movies       Pictures
~~~
{: .output}

We may want more information than just a list of files and directories.
We can get this by specifying various **flags** (also known as options or switches) to go with our basic commands.
These are additions to a command that provide the computer with a bit more guidance
of what sort of output or manipulation you want.

If we type `ls -l` and hit enter, the computer returns a list of files that contains
information similar to what we would find in our Finder (Mac) or Explorer (Windows):
the size of the files in bytes, the date it was created or last modified, and the file name.

~~~
$ ls -l
~~~
{: .bash}
~~~
total 0
drwx------+  6 riley  staff   204 Jul 16 11:50 Desktop
drwx------+  3 riley  staff   102 Jul 16 11:30 Documents
drwx------+  3 riley  staff   102 Jul 16 11:30 Downloads
drwx------@ 46 riley  staff  1564 Jul 16 11:38 Library
drwx------+  3 riley  staff   102 Jul 16 11:30 Movies
drwx------+  3 riley  staff   102 Jul 16 11:30 Music
drwx------+  3 riley  staff   102 Jul 16 11:30 Pictures
drwxr-xr-x+  5 riley  staff   170 Jul 16 11:30 Public
~~~
{: .output}

In everyday usage we are more used to units of measurement like kilobytes, megabytes, and gigabytes.
Luckily, there's another flag `-h` that when used with the -l option, use unit suffixes:
Byte, Kilobyte, Megabyte, Gigabyte, Terabyte and Petabyte in order to reduce the
number of digits to three or less using base 2 for sizes.

Now `ls -h` won't work on its own. When we want to combine two flags,
we can just run them together. So, by typing `ls -lh` and hitting
enter we receive an output in a human-readable format (note: the order here doesn't matter).

~~~
$ ls -lh
~~~
{: .bash}
~~~
total 0
drwx------+  6 riley  staff   204B Jul 16 11:50 Desktop
drwx------+  3 riley  staff   102B Jul 16 11:30 Documents
drwx------+  3 riley  staff   102B Jul 16 11:30 Downloads
drwx------@ 46 riley  staff   1.5K Jul 16 11:38 Library
drwx------+  3 riley  staff   102B Jul 16 11:30 Movies
drwx------+  3 riley  staff   102B Jul 16 11:30 Music
drwx------+  3 riley  staff   102B Jul 16 11:30 Pictures
drwxr-xr-x+  5 riley  staff   170B Jul 16 11:30 Public
~~~
{: .output}

We've now spent a great deal of time in our home directory.
Let's go somewhere else. We can do that through the `cd` or Change Directory command:
(Note: On Windows and Mac, by default, the case of the file/directory doesn't matter
On Linux it does.)

~~~
$ cd Desktop
~~~
{: .bash}

Notice that the command didn't output anything. This means that it was carried
out successfully. Let's check by using `pwd`:

~~~
$ pwd
~~~
{: .bash}
~~~
/Users/riley/Desktop
~~~
{: .output}

If something had gone wrong, however, the command would have told you. Let's
see by trying to move into a (hopefully) non-existing directory:

~~~
$ cd "Evil plan to destroy the world"
~~~
{: .bash}
~~~
bash: cd: Evil plan to destroy the world: No such file or directory
~~~
{: .output}

Notice that we surrounded the name by quotation marks. The *arguments* given
to any shell command are separated by spaces, so a way to let them know that
we mean 'one single thing called "Evil plan to destroy the world"', not
'six different things', is to use (single or double) quotation marks.

We've now seen how we can do 'down' through our directory structure
(as in into more nested directories). If we want to go back, we can type `cd ..`.
This moves us 'up' one directory, putting us back where we started.
**If we ever get completely lost, the command `cd` without any arguments will bring
us right back to the home directory, right where we started.**

> ## Previous Directory
> To switch back and forth between two directories use `cd -`.
{: .callout}

> ## Try exploring
>
> Move around the computer, get used to moving in and out of directories,
> see how different file types appear in the Unix shell. Be sure to use the `pwd` and 
> `cd` commands, and the different flags for the `ls` command you learned so far.
> 
> If you run Windows,
> also try typing `explorer .` to open Explorer for the current directory
> (the single dot means "current directory"). If you're on Mac or Linux,
> try `open .` instead.
>
{: .challenge}


Being able to navigate the file system is very important for using the Unix shell effectively.
As we become more comfortable, we can get very quickly to the directory that we want.

> ## Getting help
>
> Use the `man` command to invoke the manual page (documentation) for a shell command.
> For example, `man ls` displays all the flags/options available to you - which saves
> you remembering them all! Try this for each command you've learned so far.
> Use the `spacebar` to navigate the manual pages, and `q` to quit.
>
> ***Note*: this command is for Mac and Linux users only**. It does not work directly for Windows users.
> If you use windows, you can search for the Shell command on [http://man.he.net/](http://man.he.net/),
> and view the associated manual page.
>
> >## Answer
> >~~~
> >$ man ls
> >~~~
> >{: .bash}
> >~~~
> >LS(1)                     BSD General Commands Manual                    LS(1)
> >
> >NAME
> >     ls -- list directory contents
> >
> >SYNOPSIS
> >     ls [-ABCFGHLOPRSTUW@abcdefghiklmnopqrstuwx1] [file ...]
> >
> >DESCRIPTION
> >     For each operand that names a file of a type other than directory, ls
> >     displays its name as well as any requested, associated information.  For
> >     each operand that names a file of type directory, ls displays the names
> >     of files contained within that directory, as well as any requested, asso-
> >     ciated information.
> >
> >     If no operands are given, the contents of the current directory are dis-
> >     played.  If more than one operand is given, non-directory operands are
> >     displayed first; directory and non-directory operands are sorted sepa-
> >     rately and in lexicographical order.
> >
> >     The following options are available:
> >
> >     -@      Display extended attribute keys and sizes in long (-l) output.
> >
> >     -1      (The numeric digit ``one''.)  Force output to be one entry per
> >             line.  This is the default when output is not to a terminal.
> >
> >     -A      List all entries except for . and ...  Always set for the super-
> >             user.
> >
> >...several more pages...
> >
> >BUGS
> >     To maintain backward compatibility, the relationships between the many
> >     options are quite complex.
> >
> >BSD                              May 19, 2002                              BSD
> >
> >~~~
> >{: .output}
> {: .solution}
{: .challenge}


## Working with files and folders

As well as navigating directories, we can interact with files on the command line:
we can read them, open them, run them, and even edit them. In fact, there's really
no limit to what we *can* do in the shell, but even experienced shell users still switch to
graphical user interfaces (GUIs) for many tasks, such as editing formatted text
documents (Word or OpenOffice), browsing the web, editing images, etc. But if we
wanted to make the same crop on hundreds of images, say, the pages of a scanned book,
then we could automate the cropping using shell commands.

We will try a few basic ways to interact with files. Let's first move into the
`shell-lesson` directory on your desktop (if you don't have this directory,
please use a red sticky note to attract help).

~~~
$ cd
$ cd Desktop/shell-lesson
$ pwd
~~~
{: .bash}
~~~
/Users/riley/Desktop/shell-lesson
~~~
{: .output}

Here, we will create a new directory and move into it:

~~~
$ mkdir firstdir
$ cd firstdir
~~~
{: .bash}

Here we used the `mkdir` command (meaning 'make directories') to create a directory
named 'firstdir'. Then we moved into that directory using the `cd` command.

But wait! There's a trick to make things a bit quicker. Let's go up one directory.

~~~
$ cd ..
~~~
{: .bash}

Instead of typing `cd firstdir`, let's try to type `cd f` and then hit the Tab key.
We notice that the shell completes the line to `cd firstdir/`.

> ## Tab for Auto-complete
> Hitting tab at any time within the shell will prompt it to attempt to auto-complete
> the line based on the files or sub-directories in the current directory.
> Where two or more files have the same characters, the auto-complete will only fill up to the
> first point of difference, after which we can add more characters, and
> try using tab again. We would encourage using this method throughout
> today to see how it behaves (as it saves loads of time and effort!).
{: .callout}

### Reading files

If you are in `firstdir`, use `cd ..` to get back to the `shell-lesson` directory.

Here there are copies of two public domain books downloaded from
[Project Gutenberg](https://www.gutenberg.org/) along with other files we will
cover later.

~~~
$ ls -lh
~~~
{: .bash}
~~~
total 139M
-rw-r--r-- 1 riley staff 3.6M Jan 31 18:47 2014-01-31_JA-africa.tsv
-rw-r--r-- 1 riley staff 7.4M Jan 31 18:47 2014-01-31_JA-america.tsv
-rw-rw-r-- 1 riley staff 126M Jun 10  2015 2014-01_JA.tsv
-rw-r--r-- 1 riley staff 1.4M Jan 31 18:47 2014-02-02_JA-britain.tsv
-rw-r--r-- 1 riley staff 583K Feb  1 22:53 33504-0.txt
-rw-r--r-- 1 riley staff 598K Jan 31 18:47 829-0.txt
-rw-r--r-- 1 riley staff   13 Jan 31 18:47 gallic.txt
~~~
{: .output}

The files `829-0.txt` and `33504-0.txt` holds the content of book #829
and #33504 on Project Gutenberg. But we've forgot *which* books, so
we try the `cat` command to read the text of the first file:

~~~
$ cat 829-0.txt
~~~
{: .bash}

The terminal window erupts and the whole book cascades by (it is printed to
your terminal). Great, but we can't really make any sense of that amount of text.

> ## Canceling Commands
> To cancel this print of `829-0.txt`, or indeed any ongoing processes in the Unix shell, hit `Ctrl+C`
{: .callout}

Often we just want a quick glimpse of the first or the last part of a file to
get an idea about what the file is about. To let us do that, the Unix shell
provides us with the commands `head` and `tail`.

~~~
$ head 829-0.txt
~~~
{: .bash}
~~~
The Project Gutenberg eBook, Gulliver's Travels, by Jonathan Swift


This eBook is for the use of anyone anywhere at no cost and with
almost no restrictions whatsoever.  You may copy it, give it away or
re-use it under the terms of the Project Gutenberg License included
with this eBook or online at www.gutenberg.org
~~~
{: .output}

This provides a view of the first ten lines,
whereas `tail 829-0.txt` provides a perspective on the last ten lines:

~~~
$ tail 829-0.txt
~~~
{: .bash}
~~~
Most people start at our Web site which has the main PG search facility:

    http://www.gutenberg.org

This Web site includes information about Project Gutenberg-tm,
including how to make donations to the Project Gutenberg Literary
Archive Foundation, how to help produce our new eBooks, and how to
subscribe to our email newsletter to hear about new eBooks.
~~~
{: .output}

If ten lines is not enough (or too much), we would check `man head`
to see if there exists an option to specify the number of lines to get
(there is: `head -n 20` will print 20 lines).

Another way to navigate files is to view the contents one screen at a time.
Type `less 829-0.txt` to see the first screen, `spacebar` to see the
next screen and so on, then `q` to quit (return to the command prompt).

~~~
$ less 829-0.txt
~~~
{: .bash}

Like many other shell commands, the commands `cat`, `head`, `tail` and `less`
can take any number of arguments (they can work with any number of files).
We will see how we can get the first lines of several files at once.
To save some typing, we introduce a very useful trick first.

> ## Re-using commands
> On a blank command prompt, hit the up arrow key and notice that the previous
> command you typed appears before your cursor. We can continue pressing the
> up arrow to cycle through your previous commands. The down arrow cycles back
> toward your most recent command. This is another important labour-saving
> function and something we'll use a lot.
{: .callout}

Hit the up arrow until you get to the `head 829-0.txt` command. Add a space
and then `33504-0.txt` (Remember your friend Tab? Type `3` followed by Tab to
get `33504-0.txt`), to produce the following command:

~~~
$ head 829-0.txt 33504-0.txt
~~~
{: .bash}
~~~
==> 829-0.txt <==
The Project Gutenberg eBook, Gulliver's Travels, by Jonathan Swift


This eBook is for the use of anyone anywhere at no cost and with
almost no restrictions whatsoever.  You may copy it, give it away or
re-use it under the terms of the Project Gutenberg License included
with this eBook or online at www.gutenberg.org




==> 33504-0.txt <==
The Project Gutenberg EBook of Opticks, by Isaac Newton

This eBook is for the use of anyone anywhere at no cost and with
almost no restrictions whatsoever.  You may copy it, give it away or
re-use it under the terms of the Project Gutenberg License included
with this eBook or online at www.gutenberg.org


Title: Opticks
       or, a Treatise of the Reflections, Refractions, Inflections,
~~~
{: .output}

All good so far, but if we had *lots* of books, it would be tedious to enter
all the filenames. Luckily the shell supports wildcards! The `?` (matches exactly
one character) and `*` (matches zero or more characters) are probably familiar
from library search systems. We can use the `*` wildcard to write the above `head`
command in a more compact way:

~~~
$ head *0.txt
~~~
{: .bash}

We included the `0` since we weren't interested in the file `gallic.txt`.

> ## More on wildcards
> Wildcards are a feature of the shell and will therefore work with *any* command.
> The shell will expand wildcards to a list of files and/or directories before
> the command is executed, and the command will never see the wildcards.
> As an exception, if a wildcard expression does not match any file, Bash
> will pass the expression as a parameter to the command as it is. For example
> typing `ls *.pdf` results in an error message that there is no file called *.pdf.
{: .callout}

### Moving, copying and deleting files

We may also want to change the file name to something more descriptive.
We can **move** it to a new name by using the `mv` or move command,
giving it the old name as the first argument and the new name as the second
argument:

~~~
$ mv 829-0.txt gulliver.txt
~~~
{: .bash}

This is equivalent to the 'rename file' function.

Afterwards, when we perform a `ls` command, we will see that it is now `gulliver.txt`:

~~~
$ ls
~~~
{: .bash}
~~~
2014-01-31_JA-africa.tsv   2014-02-02_JA-britain.tsv  gulliver.txt
2014-01-31_JA-america.tsv  33504-0.txt
2014-01_JA.tsv             gallic.txt
~~~
{: .output}

> ## Copying a file
>
> Instead of *moving* a file, you might want to *copy* a file (make a duplicate),
> for instance to make a backup before modifying a file using some script you're
> not quite sure how works.
> Just like the `mv` command, the `cp` command takes two arguments: the old name
> and the new name. How would you make a copy of the file `gulliver.txt` called
> `gulliver-backup.txt`? Try it!
>
> > ## Answer
> > ~~~
> > cp gulliver.txt gulliver-backup.txt
> > ~~~
> > {: .bash}
> {: .solution}
{: .challenge}

> ## Renaming a directory
>
> Renaming a directory works in the same way as renaming a file. Try using the
> `mv` command to rename the `firstdir` directory to `backup`.
>
> > ## Answer
> > ~~~
> > mv firstdir backup
> > ~~~
> > {: .bash}
> {: .solution}
{: .challenge}

> ## Moving a file into a directory
>
> If the last argument you give to the `mv` command is a directory, not a file,
> the file given in the first argument will be moved to that directory. Try
> using the `mv` command to move the file `gulliver-backup.txt` into the
> `backup` folder.
>
> > ## Answer
> > ~~~
> > mv gulliver-backup.txt backup
> > ~~~
> > {: .bash}
> >
> > This would also work:
> >
> > ~~~
> > mv gulliver-backup.txt backup/gulliver-backup.txt
> > ~~~
> > {: .bash}
> {: .solution}
{: .challenge}

> ## The wildcards and regular expressions
>
> The `?` wildcard matches one character. The `*` wildcard matches zero or
> more characters. If you attended the lesson on regular expressions, do you
> remember how you would express that as regular expressions?
>
> (Regular expressions are not a feature of the shell, but some commands support
> them, we'll get back to that.)
>
> > ## Answer
> > * The `?` wildcard matches the regular expression `.` (a dot)
> > * The `*` wildcard matches the regular expression `.*`
> {: .solution}
{: .challenge}

> ## Using `history`
> Use the `history` command to see a list of all the commands
> you've entered during the current session. You can also use `Ctrl + r` to do
> a reverse lookup. Hit `Ctrl + r`, then start typing any part of the command you're
> looking for. The past command will autocomplete. Hit `enter` to run the command again,
> or press the arrow keys to start editing the command. If you can't find what you're
> looking for in the reverse lookup, use `Ctrl + c` to return to the prompt.
{: .challenge}


Finally, onto deleting. We won't use it now, but if you do want to delete a file,
for whatever reason, the command is `rm`, or remove.

Using wildcards, we can even delete lots of files. And adding the `-r` flag we
can delete folders with all their content.

**Unlike deleting from within our graphical user interface, there is *no* warning,
*no* recycling bin from which you can get the files back and no other undo options!**
For that reason, please be very careful with `rm` and extremely careful with `rm -r`.
