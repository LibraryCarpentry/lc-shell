---
title: "What is the shell?"
teaching: 10
exercises: 0
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
- "TODO: add key points"
---
## Introduction

In this session we will introduce programming by looking at how data can be manipulated, counted, and mined using the Unix shell, 
a command line interface to your computer and the files to which it has access.

A Unix shell is a command-line interpreter that provides a user interface for the Linux 
operating system and for Unix-like systems (such as iOS). 
For Windows users, popular shells such as Cygwin or Git Bash provide a Unix-like 
interface (a command line interface preferable - to me at least - to Windows own flavour of command line). 
This session will cover a small number of basic commands using Git Bash for Windows users, 
Terminal for iOS. These commands constitute building blocks upon which more 
complex commands can be constructed to fit your data or project.

**SLIDE** The motivations for wanting to learn shell commands are many and various. 
What you can quickly learn is how to query lots of data for the information you want super fast. 
Say, for example, you have a query from a reader about the number of articles published in 
2009 in academic history journals whose title contains the word 'International'. 
Now you could search a database. Alternatively you could work directly with the relevant data. 
The British Library has open data on journal articles, and I've prepared from that...

`wc -l 2014-01_JA.tsv`

... a 500,000 line data file containing that information. Excel will struggle to manipulate that, 
but the shell won't. Let's look at this shell command:

`grep 2009 2014-01_JA.tsv | grep INTERNATIONAL | awk -F'\t' '{print $5}' | sort | uniq -c`

This is simple, powerful, and does what we want. 
It may seem intimidating but, as you'll discover this evening, 
it is deeply logical and eminently within your reach. Let us go through each part in turn:

- `grep 2009 2014-01_JA.tsv` : this tells the machine to look in the spreadsheet 2014-01_JA.tsv for all the lines that contain the string 2009 and to store those in memory. The pipe then tells the machine to hold those in memory for the minute as we have something else we want to do...
- `grep INTERNATIONAL` : ...that is look for the capitalised string `international` on those lines that have 2009 in them. The shell is case sensitive by default and I know that in my data most (if not all) occurrences of international in caps will be in a column that lists journal titles. Note: this isn't super exact, but I know my data and know it'll do the job of now (think back to the automate vs manual discussion last week). Again it holds this subset in memory and...
- `awk -F'\t' '{print $5}'` : ...moves on to the next bit. This is the most fiddly of the bits and not something we will cover properly today. But all it says is that 2014-01_JA.tsv is a tab separated spreadsheet and to print out to the shell the 5th column (which is the one I know contains journal titles) of all the lines we've queried down to (those with 2009 in them, and then those with INTERNATIONAL in them) and to hold that in memory so that we can then...
- `sort` : ...sort that column. `sort` does what is says on the tin, and sorts the data we have left (which should just a single column containing journal titles) holding that sorted list in memory...
- `uniq -c` : ... so that we can then, finally, tell the machine to remove duplicates but as it is doing so count those duplicates and hold that data in memory.

As this is the last bit, the shell then - by default - prints the results to a shell: 
the number of articles published in 2009 in academic journals whose title contains the word 'International', 
with counts separated by journal. This last bit I have added in as, as we can see, 
we have a few false positives. We'd have to go back to our data to find out why, but this is a very good start: 
from 500,000 lines of journal article metadata to a few numbers and names in a small line of code.

You won't be doing exactly this by the end, but you won't be far off. 
We'll be covering quite a lot but the key commands are in the handout for reference.
We'll proceed in a follow my leader fashion. The format will be that I'll demo a command, you copy, 
and then we'll discuss the results. Stickies for when you get stuck or something doesn't appear to work.

## Basics - navigating the shell

We will begin with the basics of navigating the Unix shell.

Start by opening your shell. When you run it, you will likely see a black window with a cursor flashing next to a dollar sign. 
This is our command line, and the $ is the command prompt to show the system is ready for your input.

If, when opening a command window or at any other time today, 
you are unsure of where you are in a computer's file system, 
you can find out what directory you are in using `pwd` command, 
which stands for "print working directory", and hitting enter - which executes commands in the shell. 
Try typing `pwd` and hitting enter.

To orient ourselves, let's get a listing of what files are in this directory. 
Type `ls` and you will see a list of every file and directory within your current location.

You may want more information than just a list of files. 
You can do this by specifying various *flags* to go with our basic commands. 
These are additions to a command that provide the computer with a bit more guidance 
of what sort of output or manipulation you want.

If you type `ls -l` and hit enter the computer returns a long list of files that contains 
information similar to what you'd find in your finder or explorer: 
the size of the files in bytes, the date it was created or last modified, and the file name.

In everyday usage you will be more used to units of measurement like kilobytes, megabytes, and gigabytes. 
Luckily, there's another flag `-h` that when used with the -l option, use unit suffixes: 
Byte, Kilobyte, Megabyte, Gigabyte, Terabyte and Petabyte in order to reduce the 
number of digits to three or less using base 2 for sizes.

Now `ls -h` won't work on its own. When you want to use two flags, 
you can just run them together. So, by typing `ls -lh` and hitting 
enter you receive an output in a human-readable format (note: that the order here doesn't matter).

You've now spent a great deal of time in your home directory. 
Let's go somewhere else. You can do that through the `cd` or Change Directory command. 

If you type `cd desktop` you are now on your desktop 
(note: for Windows users, the case of the file/directory doesn't matter. 
For Linux users like me, it does, and I believe that is the same for Mac people). 
To double check, type `pwd` and you should see something that represents your desktop.

You'll note that this only takes you 'down' through your directory structure 
(as in into more nested directories). If you want to go back, you can type `cd ..`. 
This moves us 'up' one directory, putting us back where we started. 
If you ever get completely lost, the command `cd --` (or `cd ~` or even just `cd`) will bring 
you right back to the home directory, right where you started.

**Tip:** To switch back and forth between two directories use `cd -`.

Try exploring: move around the computer, get used to moving in and out of directories, 
see how different file types appear in the Unix shell. 

Being able to navigate your file system using the bash shell is v
ery important for using the Unix shell effectively. 
And as you become more comfortable, you'll soon find yourself skipping directly to the directory that you want.

**TIP:** Use the `man` command to invoke the manual page (documentation) for a Shell command. 
For example, `man ls` displays all the flags/options available to you - which saves 
you remembering them all! Try this for each command you've learned so far. 
Use the `spacebar` to navigate the manual pages, and `q` to quit. 
*Note:* this command is for Mac and Linux users only. It may not work for Windows users.

### Summary

Within the Unix shell you can now:

- use the command `pwd` to find out where you are in on your computer
- use the command `ls` to list directory contents
- use flags `-l` and `-lh` to guide the output of the `ls` command
- use the command `cd` to move around your computer
- use the `man` command to check the manual page

## Basics

As well as navigating directories, you can interact with files on the command line: 
you can read them, open them, run them, and even edit them, often without ever 
having to leave the interface. Sometimes it is easier to do this using a 
Graphical User Interface, such as Word or your normal explorer,
but the more you work here, the more it is useful, and the more you write scripts, the more you'll need this basic knowledge.

Here's a few basic ways to interact with files. 

First, you can create a new directory. For convenience's sake, we will create it in the directory you extracted the 
data provided in advance. Here type `mkdir firstdir` and hit enter. This used the `mkdir` command 
(meaning 'Make Directorys') to create a directory named 'firstdir'. Now, move into that directory using the `cd` command.

But wait! There's a trick to make things a bit quicker. Go up one directory (`cd ..`). 
To navigate to the `firstdir` directory you could type `cd firstdir`. 
Alternatively, you could type `cd f` and then hit tab
You will notice that the interface completes the line to `cd firstdir`. 
**Hitting tab at any time within the shell will prompt it to attempt to auto-complete
the line based on the files or sub-directories in the current directory. 
Where two or more files have the same characters, the auto-complete will only fill up to the 
first point of difference, after which you can add more characters, and 
try using tab again. We would encourage using this method throughout 
today to see how it behaves (as it saves loads of time and effort!).**

The next step is to manipulate files.

Navigate to the `text` directory in the pre-circulated data directory. 
In here there is a copy of Jonathan Swift's *Gulliver's Travels* downloaded from 
Project Gutenberg. type `ls -lh` and hit enter to see details of this file.

You can read the text right here. To try this, type `cat 829-0.txt`. 
The terminal window erupts and *Gulliver's Travels* cascades by: this is what is known as printing to the shell. 
And it is great, in theory, but you can't really make any sense of that amount of text. 
Instead, you may want to just look at the first or the last bit of the file. 

**TIP: to cancel this print of `829-0.txt`, or indeed any ongoing in the Unix shell, hit `ctrl+c`**

Type `head 829-0.txt` and hit enter. This provides a view of the first ten lines,
whereas `tail 829-0.txt` provides a perspective on the last ten lines. 
This is a good way to quickly determine the contents of the file.

Another way to navigate files is to view the contents one screen at a time. 
Type `less 829-0.txt` to see the first screen, `spacebar` to see the 
next screen and so on, then `q` to quit (return to the command prompt).

You may also want to change the file name to something more descriptive. 
You can 'move' it to a new name by using the `mv` or move command. 
To do this type `mv 829-0.txt gulliver.txt` and hit enter. This is equivalent to the 'rename file' function.

Afterwards, when you perform a `ls` command, you will see that it is now `gulliver.txt`.
Had you wanted to duplicate it, you could have used the `cp` or copy command by typing `cp 829-0.txt gulliver.txt`
That would have created a a new file with the title `gulliver.txt` while leaving the original file `829-0.txt` intact.

Now that you have seen and used several new commands, it's time for another trick. 
Hit the up arrow twice on your keyboard. Notice that `mv 829-0.txt gulliver.txt` 
appears before your cursor. You can continue pressing the up arrow to cycle 
through your previous commands. The down arrow cycles back toward your most recent command. 
This is another important labour-saving function and something we'll use a lot.

**Tip:** use the `history` command to see a list of all the commands 
you've entered during the current session. You can also use `Ctrl + r` to do 
a reverse lookup. Hit `Ctrl + r`, then start typing any part of the command you're 
looking for. The past command will autocomplete. Hit `enter` to run the command again, 
or press the arrow keys to start editing the command. If you can't find what you're 
looking for in the reverse lookup, use `Ctrl + c` to return to the prompt.

After having read and renamed several files, you may wish to bring their text 
together into one file. Before we do that, let's use `cp` to duplicate the Gulliver 
file and give it the filename `gulliver-backup.txt`: any ideas how you do that? 

(**ANSWER**: `cp gulliver.txt gulliver-backup.txt`). 

Good, now that you have two copies of *Gulliver's Travels*, 
let's put them together to make an **even longer** book. 

To combine, or concatenate, two or more files use the `cat` command 
again. Type `cat gulliver.txt gulliver-backup.txt` and press enter. 
This prints, or displays, the combined files within the shell. 
However, it is too long to read on this window! 
Luckily, by using the `>` redirector, you can send the output to 
a new file, rather than the terminal window. 

Hit up arrow to get to your last command and amend the line to 
`cat gulliver.txt gulliver-backup.txt > gulliver-twice.txt` 
and hit enter. Now, when you type `ls` you'll see `gulliver-twice.txt` appear in your directory.

When combining more than two files, using a wildcard can 
help avoid having to write out each filename individually. 
Again, labour saving! A useful wildcard is `*` which is a place holder for zero or 
more characters or numbers (note: this is slightly different from regex...). 
So, if you type `cat *.txt > everything-together.txt` and hit 
enter, a combination of all the `.txt` files in the current directory 
are combined in alphabetical order as `everything-together.txt`. 
This can be very useful if you need to combine a large number of 
smaller files within a directory so that you can work with them in 
a text analysis program. 

Another wildcard worth remembering is `?` which is a place holder 
for a single character or number. We shall return to shell wildcards later - for 
now, note again that they are similar to but not excatly the same as the Regex we saw in the previous module.

Finally, onto deleting. We won't use it now, but if you do want to delete a file, 
for whatever reason, the command is `rm`, or remove. 

**Be careful with the `rm` command**, as you don't want to delete files that you do not mean to. 
Unlike deleting from within your Graphical User Interface, there is **no** recycling bin 
or undo options. For that reason, if you are in doubt, you may want to exercise caution 
or maintain a regular backup of your data.

The syntax for `rm` is the same as `cp` and `mv`: 
for example `rm gulliver.txt`, adding wildcards as appropriate to specify the files to delete.

## Summary

Within the Unix shell you can now:

- use the command `mv` to rename and move files.
- use the command `cp` to create a file from an existing file.
- use the command `cat` to combine more than one file of the same file type.
- use the wildcards `*` and `?` as place holders that delimit which files are to be manipulated by a given an action.
- use the `rm` command to delete unwanted files.
