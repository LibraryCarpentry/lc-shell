
UNIX SHELL

Have you downloaded the files for the lesson?
https://github.com/LibraryCarpentry/lc-shell/raw/gh-pages/data/shell-lesson.zip

Note: Something to look out for, sometimes there are issues in getting to the shell lesson folder via Windows Git Bash
Go to directory, right click, open/select Git Bash or cd /c/...

First, if you were unable to install Git Bash then try this:
https://console.cloud.google.com/cloudshell/editor?shellonly=true&pli=1
wget github.com/LibraryCarpentry/lc-shell/raw/gh-pages/data/shell-lesson.zip
unzip shell-lesson.zip

Before we had graphical interfaces we had command line interface
Unix Shell began in 1970s
https://en.wikipedia.org/wiki/History_of_Unix#/media/File:Ken_Thompson_(sitting)_and_Dennis_Ritchie_at_PDP-11_(2876612463).jpg
Work at a terminal but now you can work on your laptop or remotely

You can use Shell for lightweight programming
Most popular version is BASH which we will be using

Shell is still useful in programming, data science work, research computing

I've used Shell for wrangling with and cleaning lots of data/files
Example: ORCID data dump via Figshare
https://orcid.figshare.com/articles/ORCID_Public_Data_File_2018/7234028
Example: Mining journal article PDFs at the European Southern Observatory
https://www.eso.org/sci/libraries/telbib_methodology.html

But maybe the most pressing example is that you will use Shell when you work with research computing
At MTSU, looks like this is via Computer Science?
https://www.mtsu.edu/csc/facilities.php

pwd - present working directory

cd - change directory
-, .., ~
ls - list directory contents
	flags or options  (flags -l and -lh)

Permissions / symbolic links / user / group / size / date / folder or filename

d stands for directory / chmod 777 (file) / extensible @ / ls -a (see hidden files)

man(ls) or help(ls) or Google it or Explain Shell:
https://explainshell.com/explain?cmd=ls+-lh


QUIZ:
What flags do you use to list contents of a directory in long listing format and sort by modification date, newest first?
And how can you order by file size?
How can you see hidden files?
ANSWERS:
ls -lt (order by mod date)
ls -lS (order by file size)
ls - a (do not ignore entries starting with .)


pwd
mkdir firstdirectory
cd firstdirectory
cd ..

ls -lh
cat - concatenate files and print on the standard output
(in other words open and print a file to screen)
type 82 + [TAB]
cat 829-0.txt


QUIZ:
What is the title of 829-0?
ANSWER:
GULLIVER’S TRAVELS

head
output the first part of files (first 10 lines)
head 829-0.txt

tail
output the last part of files (last 10 lines)
tail 829-0.txt


QUIZ:
How can you return the first 20 lines of 829-0.txt?
How can you return the last 30 lines of 829-0.txt?
ANSWER:
head -n20 829-0.txt
tail -n30 829-0.txt
Example: Sometimes files are too big to open and head and tail can be a lightweight way
to peak inside or to get header information in automated way.

less - allows you to scroll/page through file
less 829-0.txt
Space bar to page, up and down arrows, q to quit

mv - move (rename) files
mv 829-0.txt gulliver.txt


QUIZ:
What is the title of 33504-0.txt and can you rename it to it's title.txt?
ANSWER:
Opticks and mv opticks.txt


mv renames a file, cp copies a file and places to new file name wherever you want it to go
QUIZ:
Can you create backup files of the two titles above in a "backup" folder naming the files by adding "_backup.txt"?
ANSWER:
mkdir backup
cp gulliver.txt backup/gulliver_backup.txt
cp opticks.txt backup/opticks_backup.txt


Wildcards
What does * do?
QUIZ:
How can we use this wildcard to match + list all the .txt files?
ANSWER:
ls *.txt


How can you see the history of your commands?
- You can use the up and down arrow keys
- You can use history
	history !number to print out specific command
You can also redirect output of your history to a text file
	history > history.txt
For a taste of Shell programming, let's create a variable which holds a value:
	NAME=Groot
And let's print out to the command line:
	echo "I am $NAME"

<<<BREAK>>>

Create a number of files quickly using touch
touch a.txt b.txt c.txt d.txt

Now for the scripting!
We will create a Bash script on the command line
For our script we are going to loop through all the text files
And we are going to print the file name
Then we are going to finish

$ for filename in *.txt
> do
>    echo $filename
> done

Before our exercise, how can we create and edit a file on the command line?
Let's use the command line tool "nano"
nano myfile.txt
Editor screen appears
Write "This is my file!"
Ctrl + X to close
Enter to save file
Exit w/ "y" or "yes"


EXERCISE:
- Create a file called myscript.sh
- Add a similar for loop to the myscript file
- In this loop you will print the file name to screen
- And you will print the first and last 5 lines of the file to screen
- Then you will end the loop
Note: Add...
#!/bin/bash
# My first script
... to the top of the file

ANSWER:
myscript.sh

#!/bin/bash
# My first script
for filename in *.txt
do
  echo $filename
  head -n 5 $filename
  tail -n 5 $filename
done

bash myscript.sh
Note: chmod 700?


FYI Ctrl + C to quit when in infinite loop


Navigate to shell-lesson dir
ls -lh
wc - word count
wc *.tsv (see words and lines)
QUIZ:
What options are available to you in wc?


wc -l *.tsv > lengths.txt
cat lengths.txt

Piping
Two or more commands connect together via a "|"
Order is <command> -> | <command> -> | ...

wc -l *.tsv | sort
wc -l *.tsv | sort -r
QUIZ:
How would you get the file with the lowest number of lines?
And how can you save that to a txt file?
ANSWER:
wc -l *.tsv | sort -n | head -n 1
wc -l *.tsv | sort -n | head -n 1 > topsort.txt

Note: If you wanted to add a date stamp to the top of the file you just created:
date >> topsort.txt


grep - print lines matching a pattern
grep is probably one of the most useful command line tools for searching for matches within files/directories

grep 1999 *.tsv
By the way, how could we have redirected the output to a txt file?
grep -c 1999 *.tsv (lists number of matches per file)
grep -c revolution *.tsv (lists case sensitive search)
grep -ci revolution *.tsv (lists insensitive)
## Try other keywords here like America or German

Here is an example that I used at the European Southern Observatory to find instrument names in context:
grep -C 2 'HARPS' * (get two lines for context of match)

QUIZ:
How would you search for the China journal in the same files?
ANSWER:
grep 'China Journal' *.tsv


grep -iwE 'fr[ae]nc[eh]' *.tsv (flags i insensitive, w word, E expression)
## Try to find variations of organize
How can we tell if the number of matches has changed with our regex?
grep -o 'needle' haystack | wc -l


EXERCISE:
How would we find issns in 014-01_JA.tsv using grep, regex, and redirect output to a issns.tsv file?
We can walk through this together and write it on the board...
ANSWER:
grep -E '\d{4}-\d{4}' 2014-01_JA.tsv > issns.tsv
grep -P '\d{4}-\d{4}' 2014-01_JA.tsv > issns.tsv


EXERCISE:
Combine what you learned of the for loop with using grep to find the word counts of names in gulliver.txt...
ANSWER:
$ for name in "Gulliver" "Mary" "Lilliputians"
> do
>    echo $name
>    grep $name gulliver.txt | wc -l
> done
Note: Why is the count off for Gulliver? Hint: cases!

Quick demo of sed which allows you to replace words in file:
less diary.html
Look inside and replace foo with bar (some word)
sed -i '' 's/Daddy/Mommy/g' diary.html
