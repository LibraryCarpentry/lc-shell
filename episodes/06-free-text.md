---
title: Working with free text
teaching: 20
exercises: 40
---

::::::::::::::::::::::::::::::::::::::: objectives

- Use shell tools to clean and transform free text

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- How do we work with complex files?

::::::::::::::::::::::::::::::::::::::::::::::::::

### Working with free text

So far we have looked at how to use the Unix shell to manipulate, count, and
mine tabulated data. Some library data, especially digitised documents, is much messier than
tabular metadata. Nonetheless, many of the same techniques can be applied
to non-tabulated data such as free text. We need to think carefully about
what it is we are counting and how we can get the best out of the Unix shell.

Thankfully there are plenty of folks out there doing this sort of work and we
can borrow what they do as an introduction to working with these more complex files.
So for this final exercise we're going to leap forward a little in terms
of difficulty to a scenario where we won't learn about everything that
is happening in detail or discuss at length each command. We're going
to prepare and pull apart texts to demonstrate some of the potential applications of the Unix shell. And where commands we've learnt about are used,
I've left some of the figuring out to do to you - so please refer to your notes if you get stuck!

Before going any further, speak to the person next to you and choose which type of text you'd like to work on together. You have three options:

- An example of hand transcribed text: *Gulliver's Travels* (1735)
- An example of text captured by an optical character recognition process: *General Report on the Physiography of Maryland. A dissertation, etc. (Reprinted from Report of Maryland State Weather Service.) [With maps and illustrations.]* 1898 (from [https://doi.org/10.21250/db12](https://doi.org/10.21250/db12))
- An example of a webpage: Piper's World (a GeoCities page from 1999 saved at [archive.org](https://wayback.archive.org/web/20091020080943/http:/geocities.com/Heartland/Hills/7649/diary.html))

## Option 1: Hand transcribed text

### Grabbing a text, cleaning it up

We're going to work with the `gulliver.txt` file, which we made in [Episode 3, 'Working with files and directories'](03-working-with-files-and-folders.md).
You should (still) be working in the `shell-lesson` directory.

Let's look at the file.

```bash
$ less -N gulliver.txt
```

```output
      1 <U+FEFF>The Project Gutenberg eBook, Gulliver's Travels, by Jonatha
      1 n Swift
      2
      3
      4 This eBook is for the use of anyone anywhere at no cost and with
      5 almost no restrictions whatsoever.  You may copy it, give it away o
      5 r
      6 re-use it under the terms of the Project Gutenberg License included
      7 with this eBook or online at www.gutenberg.org
      8
      9
     10
     11
     12
     13 Title: Gulliver's Travels
     14        into several remote nations of the world
     15
     16
     17 Author: Jonathan Swift
     18
     19
     20
     21 Release Date: June 15, 2009  [eBook #829]
     22
     23 Language: English
     24
     25 Character set encoding: UTF-8
     26
     27
     28 ***START OF THE PROJECT GUTENBERG EBOOK GULLIVER'S TRAVELS***
     29
     30
     31 Transcribed from the 1892 George Bell and Sons edition by David Pri
     31 ce,
     32 email ccx074@pglaf.org
     33
     34
     35
```

We're going to start by using the `sed` command. The command allows you to edit files directly.

```bash
$ sed '9352,9714d' gulliver.txt > gulliver-nofoot.txt
```

The command `sed` in combination with the `d`
value will look at `gulliver.txt` and delete all
values between the rows specified. The `>` action then
prompts the script to this edited text to the new file specified.

```bash
$ sed '1,37d' gulliver-nofoot.txt > gulliver-noheadfoot.txt
```

This does the same as before, but for the header.

You now have a cleaner text. The next step is to
prepare it even further for rigorous analysis.

We now use the `tr` command, used for translating or
deleting characters. Type and run:

```bash
$ tr -d '[:punct:]\r' < gulliver-noheadfoot.txt > gulliver-noheadfootpunct.txt
```

This uses the translate command and a special syntax to remove all punctuation
(`[:punct:]`) and carriage returns (`\r`).
It also requires the use of both the output redirect `>` we have seen and the input redirect `<` we haven't seen.

Finally regularise the text by removing all the uppercase lettering.

```bash
$ tr '[:upper:]' '[:lower:]' < gulliver-noheadfootpunct.txt > gulliver-clean.txt
```

Open the `gulliver-clean.txt` in a text editor. Note how the text has been transformed ready for analysis.

### Pulling a text apart, counting word frequencies

We are now ready to pull the text apart.

```bash
$ tr ' ' '\n' < gulliver-clean.txt | sort | uniq -c | sort -nr > gulliver-final.txt
```

Here we've made extended use of the pipes we saw in [Counting and mining with the shell](05-counting-mining.md). The first part of this script uses the translate command again, this time to translate every blank space into `\n` which renders as a new line. Every word in the file will at this stage have its own line.

The second part uses the `sort` command to rearrange the text from its original order into an alphabetical configuration.

The third part uses `uniq`, another new command, in combination with the `-c` flag to remove duplicate lines and to produce a word count of those duplicates.

The fourth and final part sorts the text again by the counts of duplicates generated in step three.

:::::::::::::::::::::::::::::::::::::::  challenge

## Challenge

There are still some remaining punctuation marks in the text. They are called 'smart' or 'curly' quotes.
Can you remove them using `sed`?

Hint: These quote marks are not among the 128 characters of the ASCII standard,
so in the file they are encoded using a different standard, UTF-8.
While this is no problem for `sed`, the window you are typing into may not understand UTF-8.
If so you will need to use a Bash script; we encountered these at the end of episode 4,
'Automating the tedious with loops'.

As a reminder, use the text editor of your choice to write a file that looks like this:

```bash
#!/bin/bash
# This script removes quote marks from gulliver-clean.txt and saves the result as gulliver-noquotes.txt
(replace this line with your solution)
```

Save the file as `remove-quotes.sh` and run it from the command line like this:

```bash
bash remove-quotes.sh
```

:::::::::::::::  solution

## Solution

```bash
#!/bin/bash
# This script removes quote marks from gulliver-clean.txt and saves the result as gulliver-noquotes.txt
sed -Ee 's/[""‘']//g' gulliver-clean.txt > gulliver-noquotes.txt
```

If this doesn't work for you, you might need to check whether your text editor can
save files using the UTF-8 encoding.

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

We have now taken the text apart and produced a
count for each word in it. This is data we can prod and poke
and visualise, that can form the basis of our investigations,
and can compare with other texts processed in the same way.
And if we need to run a different set of transformation for
a different analysis, we can return to `gulliver-clean.txt` to start that work.

And all this using a few commands on an otherwise unassuming but very powerful command line.

## Option 2: Optical character recognised text

### Grabbing a text, cleaning it up

We're going to work with `201403160_01_text.json`.

Let's look at the file.

```bash
$ less -N 201403160_01_text.json
```

```output
      1 [[1, ""], [2, ""], [3, ""], [4, ""], [5, ""], [6, ""], [7, "A GENERAL RE
      1 PORT ON THE PHYSIOGRAPHY OF MARYLAND A DISSERTATION PRESENTED TO THE PRE
      1 SIDENT AND FACULTY OF THE JOHNS HOPKINS UNIVERSITY FOR THE DEGREE OF DOC
      1 TOR OF PHILOSOPHY BY CLEVELAND ABBE, Jr. BALTIMORE, MD. MAY, 1898."], [8
      1 , ""], [9, ""], [10, "A MAP S H OW I N G THE PHYSIOGRAPHIC PROVINCES OF
      1 MARYLAND AND Their Subdivisions Scale 1 : 2,000.000. 32 Miles-1 Inch"],
      1 [11, "A GENERAL REPORT ON THE PHYSIOGRAPHY OF MARYLAND A DISSERTATION PR
      1 ESENTED TO THE PRESIDENT AND FACULTY OF THE JOHNS HOPKINS UNIVERSITY FOR
      1  THE DEGREE OF DOCTOR OF PHILOSOPHY BY CLEVELAND ABBE, Jr. BALTIMORE, MD
      1 . MAY, 1898."], [12, "PRINTED BY tL%t jfricbcnrtxifti Compang BALTIMORE,
      1  MD., U. S. A. REPRINTED FROM Report of Maryland State Weather Service,
      1 Vol. 1, 1899, pp. 41-216."], [13, "A GENERAL REPORT ON THE PHYSIOGRAPHY
      1 OF MARYLAND Physiographic Processes. INTRODUCTION. From the earliest tim
      1 es men have observed more or less closely the various phenomena which na
      1 ture presents, and have sought to find an explanation for them. Among th
      1 e most interesting of these phe nomena have been those which bear on the
      1  development of the sur face features of the earth or its topography. Im
      1 pressed by the size and grandeur of the mountains, their jagged crests a
      1 nd scarred sides, early students of geographical features were prone to
      1 ascribe their origin to great convulsions of the earth's crust, earthqua
      1 kes and vol canic eruptions. One generation after another comes and goes
      1 , yet the mountains continue to rear their heads to the same heights, th
      1 e rivers to run down the mountain sides in the same courses and follow t
```

We're going to start by using the `tr` command, used for translating or
deleting characters. Type and run:

```bash
$ tr -d '[:punct:]' < 201403160_01_text.json > 201403160_01_text-nopunct.txt
```

This uses the translate command and a special syntax to remove all punctuation.
It also requires the use of both the output redirect `>` we have seen and the input redirect `<` we haven't seen.

Finally regularise the text by removing all the uppercase lettering.

```bash
$ tr '[:upper:]' '[:lower:]' < 201403160_01_text-nopunct.txt > 201403160_01_text-clean.txt
```

Open the `201403160_01_text-clean.txt` in a text editor. Note how the text has been transformed ready for analysis.

### Pulling a text apart, counting word frequencies

We are now ready to pull the text apart.

```bash
$ tr ' ' '\n' < 201403160_01_text-clean.txt | sort | uniq -c | sort -nr > 201403160_01_text-final.txt
```

Here we've made extended use of the pipes we saw in [Counting and mining with the shell](05-counting-mining.md). The first part of this script uses the translate command again, this time to translate every blank space into `\n` which renders as a new line. Every word in the file will at this stage have its own line.

The second part uses the `sort` command to rearrange the text from its original order into an alphabetical configuration.

The third part uses `uniq`, another new command, in combination with the `-c` flag to remove duplicate lines and to produce a word count of those duplicates.

The fourth and final part sorts the text again by the counts of duplicates generated in step three.

**Note: your final output will have one problem - not all the words counted are real words (see the words counted only 1 or 2 times). To better understand what has happened, search online to find out more about Optical Character Recognition of texts**

Either way we have now taken the text apart and produced a
count for each word in it. This is data we can prod and poke
and visualise, that can form the basis of our investigations,
and can compare with other texts processed in the same way.
And if we need to run a different set of transformation for
a different analysis, we can return to `201403160_01_text-clean.txt` to start that work.

And all this using a few commands on an otherwise unassuming but very powerful command line.

## Option 3: A webpage

### Grabbing a text, cleaning it up

We're going to work with `diary.html`.

Let's look at the file.

```bash
$ less -N diary.html
```

```output
      1 <!-- This document was created with HomeSite v2.5 -->
      2 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
      3 <html>
      4
      5 <head>
      6
      7
      8 <script type="text/javascript" src="/static/js/analytics.js"></script>
      9 <script type="text/javascript">archive_analytics.values.server_name="www
      9 b-app6.us.archive.org";archive_analytics.values.server_ms=105;</script>
     10 <link type="text/css" rel="stylesheet" href="/static/css/banner-styles.c
     10 ss"/>
     11
     12
     13 <title>Piper's Diary</title>
     14 <meta name="description"
     15 content="Come visit our shih tzu, Piper.  He has his very own photo gall
     15 ary, monthly diary, newsletter, and dog site award.  He also maintains d
     15 og book reviews and quotations.  Come check him out!">
     16 <meta name="keywords"
     17 content="shih tzu, dog, pet, quotations, award, diary, advice, book, rev
     17 iew, piper">
     18 <style TYPE="text/css" TITLE="Basic Fonts">

```

We're going to start by using the `sed` command. The command allows you to edit files directly.

```bash
$ sed '265,330d' diary.html > diary-nofoot.txt
```

The command `sed` in combination with the `d`
value will look at `diary.html` and delete all
values between the rows specified. The `>` action then
prompts the script to this edited text to the new file specified.

```bash
$ sed '1,221d' diary-nofoot.txt > diary-noheadfoot.txt
```

This does the same as before, but for the header.

You now have a cleaner text. The next step is to
prepare it even further for rigorous analysis.

First we wil remove all the html tags. Type and run:

```bash
$ sed -e 's/<[^>]*>//g' diary-noheadfoot.txt > diary-notags.txt
```

Here we are using a regular expression (see the [Library Carpentry regular expression lesson](https://librarycarpentry.org/lc-data-intro/01-regular-expressions) to find all valid html tags (anything within angle brackets) and delete them). This is a complex regular expression, so don't worry too much about how it works! The script also requires the use of both the output redirect `>` we have seen and the input redirect `<` we haven't seen.

We're going to start by using the `tr` command, used for translating or
deleting characters. Type and run:

```bash
$ tr -d '[:punct:]\r' < diary-notags.txt > diary-notagspunct.txt
```

This uses the translate command and a special syntax to remove all punctuation
(`[:punct:]`) and carriage returns (`\r`).

Finally regularise the text by removing all the uppercase lettering.

```bash
$ tr '[:upper:]' '[:lower:]' < diary-notagspunct.txt > diary-clean.txt
```

Open the `diary-clean.txt` in a text editor. Note how the text has been transformed ready for analysis.

### Pulling a text apart, counting word frequencies

We are now ready to pull the text apart.

```bash
$ tr ' ' '\n' < diary-clean.txt | sort | uniq -c | sort -nr > diary-final.txt
```

Here we've made extended use of the pipes we saw in [Counting and mining with the shell](05-counting-mining.md). The first part of this script uses the translate command again, this time to translate every blank space into `\n` which renders as a new line. Every word in the file will at this stage have its own line.

The second part uses the `sort` command to rearrange the text from its original order into an alphabetical configuration.

The third part uses `uniq`, another new command, in combination with the `-c` flag to remove duplicate lines and to produce a word count of those duplicates.

The fourth and final part sorts the text again by the counts of duplicates generated in step three.

We have now taken the text apart and produced a
count for each word in it. This is data we can prod and poke
and visualise, that can form the basis of our investigations,
and can compare with other texts processed in the same way.
And if we need to run a different set of transformation for
a different analysis, we can return to `diary-final.txt` to start that work.

And all this using a few commands on an otherwise unassuming but very powerful command line.

## Where to go next

Deborah S. Ray and Eric J. Ray, *Unix and Linux: visual quickstart guide*, 4th edition (2009).
Invaluable (and not expensive) as a reference guide - especially if you only use the command line sporadically!

[The Command Line Crash Course](https://learncodethehardway.org/unix/)
'Learn UNIX the Hard Way' -- good for reminders of the basics.

[Automate the Boring Stuff](https://automatetheboringstuff.com/)

Another Coursera course, [Programming for Everybody (Python)](https://www.coursera.org/course/pythonlearn)
is available and lasts 10 weeks, if you have 2-4 hours to spare per week.
Python is popular in research programming as it is readable, relatively simple, and very powerful.

Bill Turkel and the Digital History community more broadly.
The second lesson you did today was based on a lesson Bill has on [his website](https://williamjturkel.net/2013/06/15/basic-text-analysis-with-command-line-tools-in-linux/) and Bill is also a general editor of the [Programming Historian](https://programminghistorian.org/project-team). The Programming Historian is an open, collaborative book aimed at providing programming lessons to historians. Although the lessons are hooked around problems historians have, their lessons - which cover various programming languages - have a wide applicability - indeed today's course is based on two lessons I wrote with Ian Milligan, an historian at Waterloo, Canada - for ProgHist. Bill also has a wonderful tutorial on ['Named Entity Recognition with Command Line Tools in Linux'](https://williamjturkel.net/2013/06/30/named-entity-recognition-with-command-line-tools-in-linux/) which I thoroughly recommend if you want to automatically find, markup, and count names, places, and organisations in text files...

## Conclusion

In this session you have learned to navigate the Unix shell, to undertake some
basic file counting, concatenation and deletion, to query across data for common
strings, to save results and derived data, and to prepare textual data for rigorous computational analysis.

This only scratches the surface of what the Unix environment is capable of.
It is hoped, however, that this session has provided a taster sufficient to
prompt further investigation and productive play.

Keep in mind that the full potential the tools can offer may only
emerge upon embedding these skills into real projects. Nonetheless,
being able to manipulate, count and mine thousands of files is extremely useful.
Even a large collection of files which do not contain any alpha-numeric data
elements, such as image files, can be easily sorted, selected and queried depending
on the amount of description, of metadata contained in each filename.
If not a prerequisite of working with the Unix, then taking the time
to structure your data in a consistent and predictable manner is
certainly a significant step towards getting the most out of Unix
commands. And if you can find a way of using the Unix shell regularly - perhaps
only to copy or amend files - you'll keep the basics fresh, meaning that
next time you have cause to use the Unix shell for more complex commands,
you shouldn't need to learn it all over again.

## References

James Baker and Ian Milligan, 'Counting and mining research data with Unix', *The Programming Historian* ([2014](https://programminghistorian.org/lessons/research-data-with-unix))

Ian Milligan and James Baker, 'Introduction to the Bash Command Line', *The Programming Historian* ([2014](https://programminghistorian.org/lessons/intro-to-bash))

William J. Turkel, 'Named Entity Recognition with Command Line Tools in Linux' ([30 June 2013](https://williamjturkel.net/2013/06/30/named-entity-recognition-with-command-line-tools-in-linux/)). The section 'NER Demo' is adapted from this and shared under a [Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported](https://creativecommons.org/licenses/by-nc-sa/3.0/).

William J. Turkel, 'Basic Text Analysis with Command Line Tools in Linux' ([15 June 2013](https://williamjturkel.net/2013/06/15/basic-text-analysis-with-command-line-tools-in-linux/)). The sections 'Grabbing a text, cleaning it up' and 'Pulling a text apart, counting word frequencies' are adapted from this and shared under a [Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported](https://creativecommons.org/licenses/by-nc-sa/3.0/).

:::::::::::::::::::::::::::::::::::::::: keypoints

- Shell tools can be combined to powerful effect

::::::::::::::::::::::::::::::::::::::::::::::::::


