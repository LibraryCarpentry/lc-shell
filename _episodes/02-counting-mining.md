---
title: "Counting and mining with the shell"
teaching: 40
exercises: 20
questions:
- "How do you find data within files?"
- "How do you count data?"
objectives:
- "understand how to count lines, words, and characters with the shell"
- "understand how to mine files and extract matched lines with the shell"
- "understand how to combine mining with the shell and regular expressions"
keypoints:
- "`wc` is a command that counts"
- "use the `wc` command with the flags `-w` and `-l` to count the words and lines in a file or a series of files"
- "use the redirector and structure `> subdirectory/filename` to save results into a subdirectory"
- "use the `grep` command to search for instances of a string inside files"
- "use `grep` with the `-c` flag to count instances of a string, the `-i` flag to return a case insensitive search for a string, the `-v` flag to exclude a string from the results, and `-w` to return a whole word only search"
- "use `--file=list.txt` to use the file `list.txt` as the source of strings used in a query"
- "combine these commands and flags to build complex queries in a way that suggests the potential for using the Unix shell to count and mine your research data and research projects"

---
##  Manipulating, counting and mining (research) data

Now that you know a little bit about navigating the shell, we will move onto
learning how to count and mine data using a few of the standard shell commands.
While these commands are unlikely to revolutionise your work by themselves,
they're very versatile and will add to your foundation for working in the shell.

## Counting and sorting

We will begin by counting the contents of files using the Unix shell.
We can use the Unix shell to quickly generate counts from across files,
something that is tricky to achieve using the graphical user interfaces of standard office suites.

Let's start by navigating to the directory that contains our data using the
`cd` command:

~~~
$ cd shell-lesson
~~~
{: .bash}

Remember, if at any time you are not sure where you are in your directory structure,
use the `pwd` command to find out:

~~~
$ pwd
~~~
{: .bash}
~~~
/Users/riley/Desktop/shell-lesson
~~~
{: .output}

And let's just check what files are in the directory and how large they
are with `ls -lh`:

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
drwxr-xr-x 2 riley staff   68 Feb  2 00:58 backup
-rw-r--r-- 1 riley staff 598K Jan 31 18:47 gulliver.txt
-rw-r--r-- 1 riley staff   13 Jan 31 18:47 gallic.txt
~~~
{: .output}

In this episode we'll focus on the dataset `2014-01_JA.tsv`, that contains
journal article metadata, and the three `.tsv` files derived from the original
dataset. Each of these three .tsv files includes all data where a keyword such
as `africa` or `america` appears in the 'Title' field of `2014-01_JA.tsv`.

> ## CSV and TSV Files
> CSV (Comma-separated values) is a common plain text format for storing tabular
> data, where each record occupies one line and the values are separated by commas.
> TSV (Tab-separated values) is just the same except that values are separated by
> tabs rather than commas. Confusingly, CSV is sometimes used to refer to both CSV,
> TSV and variations of them. The simplicity of the formats make them great for
> exchange and archival. They are not bound to a specific program (unlike Excel
> files, say, there is no `CSV` program, just lots and lots of programs that
> support the format, including Excel by the way.), and you wouldn't have any
> problems opening a 40 year old file today if you came across one.
{: .callout}
<!-- hm, reminds me of MARC -->

`wc` is the "word count" command: it counts the number of lines, words, and
characters in files. Let's run the command `wc *.tsv` to get counts for all
the `.tsv` files in the current directory (it takes a little time to complete):

~~~~
$ wc *.tsv
~~~~
{: .bash}
~~~
    13712    511261   3773660 2014-01-31_JA-africa.tsv
    27392   1049601   7731914 2014-01-31_JA-america.tsv
   507732  17606310 131122144 2014-01_JA.tsv
     5375    196999   1453418 2014-02-02_JA-britain.tsv
   554211  19364171 144081136 total
~~~
{: .output}

If we only have a handful of files to compare, it might be faster or more convenient
to just check with Microsoft Excel, OpenRefine or your favourite text editor, but
when we have tens, hundres or thousands of documents, the Unix shell has a clear
speed advantage. The real power of the shell comes from being able to combine commands
and automate tasks, though. We will touch upon this slightly.

For now though, we're only interested in the number of lines, so we could use the `-l`
flag to ask the command for just that:

~~~~
$ wc -l *.tsv
~~~~
{: .bash}
~~~
    13712 2014-01-31_JA-africa.tsv
    27392 2014-01-31_JA-america.tsv
   507732 2014-01_JA.tsv
     5375 2014-02-02_JA-britain.tsv
   554211 total~~~
~~~
{: .output}

But which is the shortest file in terms of number of lines?

First: redirect operator (greater than sign)

~~~
$ wc -l *.tsv > counts.txt
~~~
{: .bash}

There's no output since the output went into the file `counts.txt`.

@TODO: Copy stuff from https://swcarpentry.github.io/shell-novice/04-pipefilter/

Finally:

~~~~
$ wc -l *.tsv | sort -n
~~~~
{: .bash}
~~~
     5375 2014-02-02_JA-britain.tsv
    13712 2014-01-31_JA-africa.tsv
    27392 2014-01-31_JA-america.tsv
   507732 2014-01_JA.tsv
   554211 total
~~~
{: .output}

Notice that no output occurs on the screen before everything suddenly occurs at
the same time. This is because the `sort` command cannot output anything before
it's sure about the order, which it cannot be before it has received all the
output from the `wc` command.

> ## Pipes and Filters
> This simple idea is why Unix has been so successful. Instead of creating enormous
> programs that try to do many different things, Unix programmers focus on creating
> lots of simple tools that each do one job well, and that work well with each other.
> This programming model is called “pipes and filters”. We’ve already seen pipes; a
> filter is a program like `wc` or `sort` that transforms a stream of input into a
> stream of output. Almost all of the standard Unix tools can work this way: unless
> told to do otherwise, they read from standard input, do something with what they’ve
> read, and write to standard output.
>
> The key is that any program that reads lines of text from standard input and writes
> lines of text to standard output can be combined with every other program that
> behaves this way as well. You can and should write your programs this way so that
> you and other people can put those programs into pipes to multiply their power.
{: .callout}
<!-- Copied from https://swcarpentry.github.io/shell-novice/04-pipefilter/ -->

> ## Findind the shortest file
> We saw how to use `wc -l *.tsv | sort -n` to output a file list sorted
> by number of lines. How could you combine this with `head` to print
> only the shortest file? Tip: Use `man head` or `head --help` if you
> don't remember the flag to use.
>
> > ## Solution
> > ~~~
> > $ wc -l *.tsv | sort -n | head -n 1
> > ~~~
> > or
> > ~~~
> > $ wc -l *.tsv | sort -n | head -1
> > ~~~
> > {: .bash}
> {: .solution}
{: .challenge}


## Mining

The Unix shell can do much more than count the words, characters, and lines within a file.
The `grep` command (meaning **global regular expression print**) is
used to search across multiple files for specific strings of characters.
It is able to do so much faster than the graphical search interface
offered by most operating systems or office suites. And combined with the `>`
operator, the `grep` command becomes a powerful research tool can be used
to mine your data for characteristics or word clusters that appear in
multiple files and then export that data to a new file. The only limitations
here are your imagination, the shape of your data, and - when working with
thousands or millions of files - the processing power at your disposal.

To begin using `grep`, first navigate to the `data` directory (from results/ type `cd ..`).

~~~
$ grep 1999 *.tsv
~~~
{: .bash}

This query looks across all files in  the directory that fit the given criteria (the .tsv files) for instances of the string, or character cluster, '1999'. It then prints them within the shell.

Press the up arrow once in order to cycle back to your most recent action.
Amend `grep 1999 *.tsv` to `grep -c 1999 *.tsv` and hit enter.

~~~
$ grep -c 1999 *.tsv
~~~
{: .bash}
~~~
2014-01-31_JA-africa.tsv:804
2014-01-31_JA-america.tsv:1478
2014-01_JA.tsv:28767
2014-02-02_JA-britain.tsv:284
~~~
{: .output}

The shell now prints the number of times the string 1999 appeared in each `*.tsv file`.
If you look at the output from the previous command, this tends to be refer to the
date field for each journal article.

Strings need not be numbers.

~~~
$ grep -c revolution *.tsv
~~~
{: .bash}
~~~
2014-01-31_JA-africa.tsv:20
2014-01-31_JA-america.tsv:34
2014-01_JA.tsv:867
2014-02-02_JA-britain.tsv:9
~~~
{: .output}

Counts
the instances of the string `revolution` within the defined files and prints
those counts to the shell. Now, amend the above command to the below and observer how the outpu of each is different:

~~~
$ grep -ci revolution *.tsv
~~~
{: .bash}
~~~
2014-01-31_JA-africa.tsv:118
2014-01-31_JA-america.tsv:1018
2014-01_JA.tsv:9327
2014-02-02_JA-britain.tsv:122
~~~
{: .output}

This repeats the query, but prints a case
insensitive count (including instances of both `revolution` and `Revolution`).
Note how the count has increased nearly 30 fold for those journal article
titles that contain the keyword 'america'. As before, cycling back and
adding `> results/`, followed by a filename (ideally in .txt format), will save the results to a data file.

So far we have counted strings in file and printed to the shell or to
file those counts. But the real power of `grep` comes in that you can
also use it to create subsets of tabulated data (or indeed any data)
from one or multiple files.  

~~~
$ grep -i revolution *.tsv
~~~
{: .bash}

This script looks in the defined files and prints any lines containing `revolution`
(without regard to case) to the shell.

~~~
$ grep -i revolution *.tsv > results/2016-07-19_JAi-revolution.tsv
~~~
{: .bash}

This saves the subsetted data to file.

However if we look at this file, it contains every instance of the
string 'revolution' including as a single word and as part of other words
such as 'revolutionary'. This perhaps isn't as useful as we thought...
Thankfully, the `-w` flag instructs `grep` to look for whole words only,
giving us greater precision in our search.

~~~
$ grep -iw revolution *.tsv > results/DATE_JAiw-revolution.tsv
~~~
{: .bash}

This script looks in both of the defined files and
exports any lines containing the whole word `revolution` (without regard to case)
to the specified .tsv file.

We can show the difference between the files we created.

~~~
$ wc -l results/*.tsv
~~~
{: .bash}
~~~
   10695 2016-07-19_JAi-revolution.tsv
    7859 2016-07-19_JAw-revolution.tsv
   18554 total
~~~
{: .output}

Finally, you can use the **regular expression syntax** covered earlier to search for similar words.

In `gallic.txt` we have the string `fr[ae]nc[eh]`.

~~~
$ cat gallic.txt
~~~
{: .bash}
~~~
fr[ae]nc[eh]
~~~
{: .output}

The square brackets here ask the machine to match any character
in the range specified. So when used with grep:

~~~
$ grep -iw --file=gallic.txt *.tsv
~~~
{: .bash}

the shell will print out each line containing the string:

~~~
- france
- french
- frence
- franch
~~~
{: .output}

Include the `-o` flag to print only the matching part of the lines e.g. (handy for isolating/checking results).

~~~
$ grep -iwo revolution *.tsv
~~~
{: .bash}

OR:

~~~
$ grep -iwo --file=gallic.txt *.tsv
~~~
{: .bash}

Pair up with your neighbor and work on these exercies:

> ## Case sensitive search
> Search for all case sensitive instances of
> a word you choose in all four derived tsv files in this directory.
> Print your results to the shell.
>
> > ## Solution
> > ~~~
> > grep hero *.tsv
> > ~~~
> > {: .bash}
> {: .solution}
{: .challenge}

> ## Case sensitive search in select files
> Search for all case sensitive instances of a word you choose in
> the 'America' and 'Africa' tsv files in this directory.
> Print your results to the shell.
>
> > ## Solution
> > ~~~
> > grep hero *a.tsv
> > ~~~
> > {: .bash}
> {: .solution}
{: .challenge}

> ## Count words (case sensitive)
> Count all case sensitive instances of a word you choose in
> the 'America' and 'Africa' tsv files in this directory.
> Print your results to the shell.
>
> > ## Solution
> > ~~~
> > grep -c hero *a.tsv
> > ~~~
> > {: .bash}
> {: .solution}
{: .challenge}

> ## Count words (case insensitive)
> Count all case insensitive instances of that word in the 'America' and 'Africa' tsv files
> in this directory. Print your results to the shell.
>
> > ## Solution
> > ~~~
> > grep -ci hero *a.tsv
> > ~~~
> > {: .bash}
> {: .solution}
{: .challenge}

> ## Case insensitive search in select files
> Search for all case insensitive instances of that
> word in the 'America' and 'Africa' tsv files in this directory. Print your results to a `new >.tsv` file.
>
> > ## Solution
> > ~~~
> > grep -i hero *a.tsv > new.tsv
> > ~~~
> > {: .bash}
> {: .solution}
{: .challenge}

> ## Case insensitive search in select files (whole word)
> Search for all case insensitive instances of that whole word
> in the 'America' and 'Africa' tsv files in this directory. Print your results to a new.tsv > file.
>
> > ## Solution
> > ~~~
> > grep -iw hero *a.tsv > new2.tsv
> > ~~~
> > {: .bash}
> {: .solution}
{: .challenge}

Compare the line counts of the last two files you created.

~~~
wc -l FILENAMES
~~~
{: .bash}

Open both files in a text editor (Notepad++, Atom, Kate,
whatever you prefer) or Excel-like program to see the difference
between searching strings and searching whole words using `grep`.
