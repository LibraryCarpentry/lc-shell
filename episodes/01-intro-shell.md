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
interface.  This session will cover a small number of basic commands using Git Bash for Windows users, 
Terminal for Mac OS. These commands constitute building blocks upon which more 
complex commands can be constructed to fit your data or project.

The motivations for wanting to learn shell commands are many and various. 

[](# From SW Carpentry)
What you can quickly learn is how to query lots of data for the information you want super fast. Using Bash or any other shell sometimes feels more like programming than like using a mouse. Commands are terse (often only a couple of characters long), their names are frequently cryptic, and their output is lines of text rather than something visual like a graph. On the other hand, with only a few keystrokes, the shell allows us to combine existing tools into powerful pipelines and handle large volumes of data automatically. This automation not only makes us more productive, but also improves the reproducibility of our workflows by allowing us to repeat them with few simple commands.
[](# Added)
Also, understanding the basics of the shell is very useful as a foundation before learning to program, since most programming languages necessitate working with the shell.

## Basics - navigating the shell

We will begin with the basics of navigating the Unix shell.

Let's start by opening the shell. This likely results in seeing a black window with a cursor flashing next to a dollar sign. 
This is our command line, and the `$` is the command **prompt** to show the system is ready for your input.

If, when opening a command window or at any other time today, 
we are unsure of where we are in a computer's file system, 
we can find out what directory we are in by using `pwd` command, 
which stands for "print working directory", and hitting enter - which executes commands in the shell. 

~~~
$ pwd
~~~
{: .bash}
~~~
/Users/riley
~~~
{: .output}

To orient ourselves, let's get a listing of what files are in this directory. 
By typing `ls` we will see a list of every file and directory within your current location.

~~~
$ ls
~~~
{: .bash}
~~~ 
Applications Documents    Library      Music        Public
Desktop      Downloads    Movies       Pictures
~~~
{: .output}

We may want more information than just a list of files. 
We can do this by specifying various **flags** (also known as arguments or parameters) to go with our basic commands. 
These are additions to a command that provide the computer with a bit more guidance 
of what sort of output or manipulation you want.

If we type `ls -l` and hit enter, the computer returns a long list of files that contains 
information similar to what we would find in our finder or explorer: 
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
Let's go somewhere else. We can do that through the `cd` or Change Directory command. 

After typing `cd desktop` we are now on our desktop 
(note: for Windows users, the case of the file/directory doesn't matter. 
For Linux and Mac users it does). 
To double check, let's type `pwd` and we should see something that represents our desktop.

~~~
$ cd Desktop
~~~
{: .bash}

Note that this only takes you 'down' through our directory structure 
(as in into more nested directories). If we want to go back, we can type `cd ..`. 
This moves us 'up' one directory, putting us back where we started. 
**If you ever get completely lost, the command `cd` will bring 
you right back to the home directory, right where you started.**

> ## Previous Directory
> To switch back and forth between two directories use `cd -`.
{: .callout}

> ## Try Exploring
>
> Move around the computer, get used to moving in and out of directories, 
> see how different file types appear in the Unix shell. 
>
> > ## Answer 
> > ~~~
> > Try to use all the commands.
> > ~~~
> > {: .bash}
> {: .solution}
{: .challenge}


Being able to navigate the file system using the bash shell is very important for using the Unix shell effectively. 
And as we become more comfortable, we may skip directly to the directory that we want.

>## Getting help
> Use the `man` command to invoke the manual page (documentation) for a Shell command. 
> For example, `man ls` displays all the flags/options available to you - which saves 
> you remembering them all! Try this for each command you've learned so far. 
> Use the `spacebar` to navigate the manual pages, and `q` to quit. 
> ** *Note:* this command is for Mac and Linux users only**. It does not work directly for Windows users. An online alternative is for instance [http://man.he.net/](http://man.he.net/), where one can search for a command and view the associated manual page.
{: .callout}

~~~
$ man ls
~~~
{: .bash}
~~~
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

~~~
{: .output}

## Basics

As well as navigating directories, we can interact with files on the command line: 
we can read them, open them, run them, and even edit them, often without ever 
having to leave the shell. Sometimes it is easier to do this using a 
Graphical User Interface, such as Word or the normal explorer,
but the more we work here, the more it is useful, and the more we write scripts, the more we'll need this basic knowledge.

Here are a few basic ways to interact with files. 

First, we can create a new directory.
For convenience's sake, we will create it in the directory where we extracted the 
data provided in advance. Let's confirm that. 

~~~
$ pwd
~~~
{: .bash}
~~~
/Users/riley
~~~
{: .output}

Now let's create the directory. 

~~~
$ mkdir firstdir
$ cd firstdir
~~~
{: .bash}

This used the `mkdir` command (meaning 'make directories') to create a directory named 'firstdir'. Then we move into that directory using the `cd` command.

But wait! There's a trick to make things a bit quicker. Let's go up one directory.

~~~
$ cd ..
~~~
{: .bash}

To navigate to the `firstdir` directory we could type `cd firstdir`. 
Alternatively, we can type `cd f` and then hit tab
We notice that the interface completes the line to `cd firstdir`. 

> ## Tab for Auto-complete
> Hitting tab at any time within the shell will prompt it to attempt to auto-complete
> the line based on the files or sub-directories in the current directory. 
> Where two or more files have the same characters, the auto-complete will only fill up to the 
> first point of difference, after which we can add more characters, and 
> try using tab again. We would encourage using this method throughout 
> today to see how it behaves (as it saves loads of time and effort!).
{: .callout}

The next step is to manipulate files.

Therefore, we navigate to the `data` directory in the pre-circulated data directory. 

~~~
$ cd data
~~~
{: .bash}

In here there is a copy of Jonathan Swift's *Gulliver's Travels* downloaded from 
Project Gutenberg along with other files we will cover later. Type `ls -lh` and hit enter to see details of this file.

~~~
$ ls -lh
~~~
{: .bash}
~~~
total 92040
-rwxr-xr-x  1 riley  staff   3.6M Jul 16 11:50 2014-01-31_JA-africa.tsv
-rwxr-xr-x  1 riley  staff   7.4M Jul 16 11:50 2014-01-31_JA-america.tsv
-rw-r--r--  1 riley  staff    30M Jul 16 12:54 2014-01_JA.tsv.zip
-rwxr-xr-x  1 riley  staff   1.8M Jul 16 11:50 2014-02-01_JA-art .tsv
-rwxr-xr-x  1 riley  staff   1.4M Jul 16 11:50 2014-02-02_JA-britain.tsv
-rwxr-xr-x  1 riley  staff   598K Jul 16 11:50 829-0.txt
-rwxr-xr-x  1 riley  staff    13B Jul 16 11:50 gallic.txt
~~~
{: .output}

The file we are interested in is `829-0.txt`, which corresponds to eBook #829 on Project Gutenberg and is the book *Gulliver's Travels*.
We can read the text on the command line by using the `cat` command. 

~~~
$ cat 829-0.txt
~~~
{: .bash}

The terminal window erupts and *Gulliver's Travels* cascades by: this is what is known as printing to the shell. 
And it is great, in theory, but we can't really make any sense of that amount of text. 

> ## Canceling Commands
> To cancel this print of `829-0.txt`, or indeed any ongoing processes in the Unix shell, hit `ctrl+c`
{: .callout}

Instead, we may want to just look at the first or the last bit of the file. 

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
whereas `tail 829-0.txt` provides a perspective on the last ten lines. 
This is a good way to quickly determine the contents of the file.

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

Another way to navigate files is to view the contents one screen at a time. 
Type `less 829-0.txt` to see the first screen, `spacebar` to see the 
next screen and so on, then `q` to quit (return to the command prompt).

~~~
$ less 829-0.txt
~~~
{: .bash}

We may also want to change the file name to something more descriptive. 
We can **move** it to a new name by using the `mv` or move command. 

~~~
$ mv 829-0.txt gulliver.txt
~~~
{: .bash}

This is equivalent to the 'rename file' function.

Afterwards, when we perform a `ls` command, we will see that it is now `gulliver.txt`.

~~~
$ ls 
~~~
{: .bash}
~~~
2014-01-31_JA-africa.tsv    2014-02-01_JA-art .tsv      gulliver.txt
2014-01-31_JA-america.tsv   2014-02-02_JA-britain.tsv
2014-01_JA.tsv.zip      gallic.txt
~~~
{: .output}

Had we wanted to duplicate it, we could have used the `cp` or copy command.

~~~
$ cp 829-0.txt gulliver.txt
~~~
{: .bash}

That would have created a a new file with the title `gulliver.txt` while leaving the original file `829-0.txt` intact.

Now that we have seen and used several new commands, it's time for another trick. 
Hit the up arrow twice on your keyboard. Notice that `mv 829-0.txt gulliver.txt` 
appears before your cursor. We can continue pressing the up arrow to cycle 
through your previous commands. The down arrow cycles back toward your most recent command. 
This is another important labour-saving function and something we'll use a lot.

> ## Using `history`
> Use the `history` command to see a list of all the commands 
> you've entered during the current session. You can also use `Ctrl + r` to do 
> a reverse lookup. Hit `Ctrl + r`, then start typing any part of the command you're 
> looking for. The past command will autocomplete. Hit `enter` to run the command again, 
> or press the arrow keys to start editing the command. If you can't find what you're 
> looking for in the reverse lookup, use `Ctrl + c` to return to the prompt.
{: .callout}

> ## Duplicating a File
>
> Use `cp` to duplicate the Gulliver 
> file and give it the filename `gulliver-backup.txt`: any ideas how you do that? 
>
> > ## Answer 
> > ~~~
> > cp gulliver.txt gulliver-backup.txt
> > ~~~
> > {: .bash}
> {: .solution}
{: .challenge}

After having read and renamed several files, we may wish to bring their text together into one file. Let's 
put them together to make an **even longer** book. 

To combine, or concatenate, two or more files let's use the `cat` command again. 

~~~
$ cat gulliver.txt gulliver-backup.txt
~~~
{: .bash}

This prints, or displays, the combined files within the shell. 
However, it is too long to read on this window! 
Luckily, by using the `>` redirector, we can send the output to 
a new file, rather than the terminal window. 

Hit up arrow to get to your last command and amend the line to: 

~~~
$ cat gulliver.txt gulliver-backup.txt > gulliver-twice.txt
~~~
{: .bash}

Now, when we type `ls` we'll see `gulliver-twice.txt` appear in our directory.

~~~
$ ls
~~~
{: .bash}
~~~
2014-01-31_JA-africa.tsv    2014-02-01_JA-art .tsv      gulliver-backup.txt
2014-01-31_JA-america.tsv   2014-02-02_JA-britain.tsv   gulliver-twice.txt
2014-01_JA.tsv.zip      gallic.txt          gulliver.txt
~~~
{: .output}

When combining more than two files, using a wildcard can 
help avoid having to write out each filename individually. 
Again, labour saving! A useful wildcard is `*` which is a place holder for zero or 
more characters or numbers (note: this is slightly different from regex...). 
So, if we type:

~~~
$ cat *.txt > everything-together.txt
~~~
{: .bash}

and hit enter, a combination of all the `.txt` files in the current directory 
are combined in alphabetical order as `everything-together.txt`. 
This can be very useful if we need to combine a large number of 
smaller files within a directory so that we can work with them in 
a text analysis program. 

Another wildcard worth remembering is `?` which is a place holder 
for a single character or number. We shall return to shell wildcards later - for 
now, note again that they are similar to but not excatly the same as the Regex we saw in the previous episode.

Finally, onto deleting. We won't use it now, but if you do want to delete a file, 
for whatever reason, the command is `rm`, or remove. 

**Be careful with the `rm` command**, as you don't want to delete files that you do not mean to. 
**Unlike deleting from within your Graphical User Interface, there is *no* recycling bin 
or undo options**. For that reason, if you are in doubt, you may want to exercise caution 
or maintain a regular backup of your data.

The syntax for `rm` is the same as `cp` and `mv`: 
for example:  

~~~
$ rm gulliver-twice.txt
~~~
{: .bash}
 
We can add wildcards above as appropriate to specify the files to delete.
