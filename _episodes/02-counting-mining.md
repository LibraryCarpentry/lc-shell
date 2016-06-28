---
title: "Counting and mining with the shell"
teaching: 10
exercises: 0
questions:
- "How do you find data within files?"
- "How do you count data?"
objectives:
- "TODO: add objectives"
keypoints:
- "TODO: add key points"
---
###  Manipulating, counting and mining research data

Now you can work with the unix shell you can move onto learning how to count and mine data. 
These are rather simple and are unlikely to totally revolutionise your work. 
They are, however, alongside the consistent file structure and naming I touched on last week, 
the foundation of a more powerful set of commands that can count and mine your data.

## Counting

You will begin by counting the contents of files using the Unix shell. 
The Unix shell can be used to quickly generate counts from across files, 
something that is tricky to achieve using the graphical user interfaces of standard office suites.

In the Unix shell, use the `cd` command to navigate to the directory 
that contains our data: the `tabular` subdirectory of the `...libcarp-wk2-data` directory. 
Remember, if at any time you are not sure where you are in your directory structure, type `pwd` and hit enter.

Type `ls -lh` and then hit enter. This prints, or displays, a list that includes a file and a subdirectory.

The file in this directory is a zipped up version of the dataset `2014-01_JA.tsv` that contains journal article metadata.

The subdirectory is named `derived_data`. It contains a single text file 
(to which we shall return) and four .tsv files derived from `2014-01_JA.tsv`. 
Each of these four includes all data where a keyword such as `africa` or `america` 
appears in the 'Title' field of `2014-01_JA.tsv`. The `derived_data` directory 
also includes a subdirectory called `results`.

*Note: TSV files are those in which within each row the units of data 
(or cells) are separated by tabs. They are similar to CSV (comma separated value) 
files were the values are separated by commas. The latter are more common
but can cause problems with the kind of data we have, where commas can be 
found within the cells (though with the right encoding this can be overcome). 
Either way both can be read in simple text editors or in spreadsheet programs 
such as Libre Office Calc or Microsoft Excel.*

Before you begin working with these files, you should move into the directory 
in which they are stored. Navigate to `...libcarp-wk2-data/tabular/derived_data` directory.

Now that you are here you can count the contents of the files.

The Unix command for counting is `wc`. Type `wc -w 2014-01-31_JA-africa.tsv` 
and hit enter. The flag `-w` combined with `wc` instructs the computer to print 
a word count, and the name of the file that has been counted, into the shell.

As was seen earlier today flags such as `-w` are an essential part of getting 
the most out of the Unix shell as they give you better control over commands.

If your reader request or piece of work is more concerned number of entries (or lines) 
than the number of words, you can use the line count flag. 
Type `wc -l 2014-01-31_JA-africa.tsv` and hit enter. Combined with `wc` the flag `-l` 
prints a line count and the name of the file that has been counted.

Finally, type `wc -c 2014-01-31_JA-africa.tsv` and hit enter. This uses 
the flag `-c` in combination with the command `wc` to print a character 
count for `2014-01-31_JA-africa.tsv` *Note: OS X users should replace the -c flag with -m.*

With these three flags, the most obvious thing we can use `wc` for is to 
quickly compare the shape of sources in digital format - for example word 
counts per page of a book, the distribution of characters per page across 
a collection of newspapers, the average line lengths used by poets. 
You can also use `wc` with a combination of wildcards and flags to build more complex queries.

Can you guess what the line `wc -l 2014-01-31_JA-a*.tsv` will do? 
Correct! This prints the line counts for `2014-01-31_JA-africa.tsv` 
and `2014-01-31_JA-america.tsv`, offering a simple means of comparing 
these two sets of research data. Of course, it may be faster if you 
only have a handful of files to compare the line count for the two 
documents in Libre Office Calc, Microsoft Excel, or a similar spreadsheet 
program. But when wishing to compare the line count for tens, hundreds, or 
thousands of documents, the Unix shell has a clear speed advantage.

Moreover, as our datasets increase in size you can use the Unix 
shell to do more than copy these line counts by hand, by the use of 
print screen, or by copy and paste methods. Using the `>` redirect 
operator we saw earlier you can export our query results to a new file. 
Type `wc -l 2014-01-31_JA-a*.tsv > results/DATE_JA-a-wc.txt` (or 
something like that, the last bit after `results/` could be anything!) and 
hit enter. This runs the same query as before, but rather than print the 
results within the Unix shell it saves the results as `DATE_JA_a-wc.txt`. 
By prefacing this with `results/` the shelll is instructed to save the .txt 
file to the `results` sub-directory. To check this, navigate to the `results` 
subdirectory, hit enter, type `ls`, and hit enter again to see this file. 
Type `head DATE_JA-a-wc.txt` to see the file contents in the shell (as it 
is 10 lines or fewer in length, all the file contents will be shown here).

## Mining

The Unix shell can do much more than count the words, characters, and lines within a file. 
The `grep` command (meaning 'global regular expression print') is 
used to search across multiple files for specific strings of characters. 
It is able to do so much faster than the graphical search interface 
offered by most operating systems or office suites. And combined with the `>` 
operator, the `grep` command becomes a powerful research tool can be used 
to mine your data for characteristics or word clusters that appear across 
multiple files and then export that data to a new file. The only limitations 
here are your imagination, the shape of your data, and - when working with 
thousands or millions of files - the processing power at your disposal.

To begin using `grep`, first navigate to the `derived_data` directory (`cd ..`). 
Here type `grep 1999 *.tsv` and hit enter. This query looks across all files in 
the directory that fit the given criteria (the .tsv files) for instances of the string, 
or character cluster, '1999'. It then prints them within the shell.

Press the up arrow once in order to cycle back to your most recent action. 
Amend `grep 1999 *.tsv` to `grep -c 1999 *.tsv` and hit enter. The shell 
now prints the number of times the string 1999 appeared in each `*.tsv file`. 
If you look at the output from the previous command, this tends to be refer to the 
date field for each journal article.

Strings need not be numbers. `grep -c revolution *.tsv`, for example, counts 
the instances of the string `revolution` within the defined files and prints 
those counts to the shell. Run this, observe the output, and then amend it 
to `grep -ci revolution *.tsv`. This repeats the query, but prints a case 
insensitive count (including instances of both `revolution` and `Revolution`). 
Note how the count has increased nearly 30 fold for those journal article 
titles that contain the keyword 'america'. As before, cycling back and 
adding `> results/`, followed by a filename (ideally in .txt format), will save the results to a data file.

So far we have counted strings in file and printed to the shell or to 
file those counts. But the real power of `grep` comes in that you can 
also use it to create subsets of tabulated data (or indeed any data) 
from one or multiple files. Type `grep -i revolution *.tsv` and hit enter. 
This script looks in the defined files and prints any lines containing `revolution` 
(without regard to case) to the shell. `grep -i revolution *.tsv > results/DATE_JAi-revolution.tsv` 
saves it to file.

However if we look at this file, it contains every instance of the 
string 'revolution' including as a single word and as part of other words 
such as 'revolutionary'. This perhaps isn't as useful as we thought... 
Thankfully, the `-w` flag instructs `grep` to look for whole words only, 
giving us greater precision in our search. 
Type `grep -iw revolution *.tsv > results/DATE_JAiw-revolution.tsv` 
and hit enter. This script looks in both of the defined files and
exports any lines containing the whole word `revolution` (without regard to case) 
to the specified .tsv file. `wc -l *revolution` shows us the difference between them.

Finally, you can use the regular expression syntax covered earlier to search for similar words. 
In `gallic.txt` we have the string `fr[ae]nc[eh]`. 
The square brackets here ask the machine to match any character 
in the range specified. So when used with grep as `grep -iw --file=gallic.txt *.tsv` 
the shell will print out each line containing the string:

- france
- french
- frence
- franch

**Tip:** include the `-o` flag to print only the matching part 
of the lines e.g. `grep -iwo revolution *.tsv` or `grep -iwo --file=gallic.txt *.tsv` 
(handy for isolating/checking results).

## Exercise

With the person next to you, select a word to search for and use what you have learnt do to the following:

Search for all case sensitive instances of 
that word in all four derived tsv files in this directory. 
Print your results to the shell.

- `grep hero *.tsv`

Search for all case sensitive instances of that word in 
the 'America' and 'Africa' tsv files in this directory. 
Print your results to the shell.

- `grep hero 2014-01-31*`

Count all case sensitive instances of that word in 
the 'America' and 'Africa' tsv files in this directory. 
Print your results to the shell.

- `grep -c hero 2014-01-31*`

Count all case insensitive instances of that word in the 'America' and 'Africa' tsv files 
in this directory. Print your results to the shell.

- `grep -ci hero 2014-01-31*`

Search for all case insensitive instances of that 
word in the 'America' and 'Africa' tsv files in this directory. Print your results to a new .tsv file. 

- `grep -i hero 2014-01-31* > new.tsv`

Search for all case insensitive instances of that whole word 
in the 'America' and 'Africa' tsv files in this directory. Print your results to a new .tsv file.

- `grep -iw hero 2014-01-31* > new2.tsv`

Compare the line counts of the last two files.

- `wc -l FILENAMES`

Open both files in a text editor (Notepad++, Atom, Kate, 
whatever you prefer) or Excel-like program to see the difference 
between searching strings and searching whole words using `grep`

## Recap

Within the Unix shell you can now:

- use the `wc` command with the flags `-w` and `-l` to count the words and lines in a file or a series of files.
- use the redirector and structure `> subdirectory/filename` to save results into a subdirectory.
- use the `grep` command to search for instances of a string.
- use with `grep` the `-c` flag to count instances of a string, the `-i` flag to return a case insensitive search for a string, the `-v` flag to exclude a string from the results, and -w to return a whole word only search
- use - `--file=list.txt` to use the file `list.txt` as the source of strings used in a query
- combine these commands and flags to build complex queries in a way that suggests the potential for using the Unix shell to count and mine your research data and research projects.

**DATA CAPTURE**

At this point, I'd like you to describe on your sticky note, briefly, a use case for this that might change your practice.
