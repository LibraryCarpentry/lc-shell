---
title: "Working with free text"
teaching: 10
exercises: 0
questions:
- "How do we work with complex files?"
objectives:
- "TODO: add objectives"
keypoints:
- "TODO: add key points"
---

### Working with free text

So far we have looked at how to use the Unix shell to manipulate, count, and 
mine tabulated data. Most libary data, especially digitised documents used by 
some of research communities libraries support, is much messier than 
journal article metadata. Nonetheless many of the same techniques can be applied 
to non-tabulated data, such as free text, we just need to think carefully about 
what it is we are counting and how we can get the best out of the Unix shell. 

Thankfully there are plenty of folks out there doing this sort of work and we 
can borrow what they do as an introduction to working with these more complex files. 
So for this final exercise we're going to leap forward a little in terms 
of difficulty to a scenario where we won't learn about everything that 
is happening in detail or discuss at length each command. We're going 
to prepare and pull apart a text to show the potential of using the Unix 
shell in research. And where commands we've learnt about are used, 
I've left some of the figuring out to do to you - so please refer to your notes if you get stuck!

**NB: leave 10 minutes at the end to go through final bits**

## Grabbing a text, cleaning it up

*Work on this exercise with the person next to you*

Head to `.../libcarp-wk2-data/text/`. 
We're going to work again with the `gulliver.txt` file we saw earlier.

**SHOW THE FILE WITH `less -N gulliver.txt`**

We're going to start by using the `sed` command. 
The command allows you to edit files directly.

Type `sed '9352,9714d' gulliver.txt > gulliver-nofoot.txt` and hit enter.

The command `sed` in combination with the `d` 
value will look at `gulliver.txt` and delete all 
values between the rows specified. The `>` action then 
prompts the script to this edited text to the new file specified.

Now type `sed '1,37d' gulliver-nofoot.txt > gulliver-noheadfoot.txt` and hit enter. 
This does the same as before, but for the header.

You now have a cleaner text. The next step is to 
prepare it even further for rigorous analysis.

We now use the `tr` command, used for translating or 
deleting characters. Type `tr -d [:punct:] < gulliver-noheadfoot.txt > gulliver-noheadfootpunct.txt` and hit enter.

This uses the translate command and a special syntax to remove all punctuation. 
It also requires the use of both the output redirect `>` we have seen and the input redirect `<` we haven't seen. 

Finally regularise the text by removing all the uppercase lettering. 
Type `tr [:upper:] [:lower:] < gulliver-noheadfootpunct.txt > gulliver-clean.txt` and hit enter.

Open the `gulliver-clean.txt` in a text editor. Note how the text has been transformed ready for analysis.

## Pulling a text apart, counting word frequencies

We are now ready to pull the text apart.

Type `tr ' ' '\n' < gulliver-clean.txt > gulliver-linebyline.txt` and hit enter.

This uses the translate command again, this time to translate every blank 
space into `\n` which renders as a new line. Every word in the file will now have its own line.

This isn't much use, so to get a better sense of the data we need to use another 
new command called `sort`. Type `sort gulliver-linebyline.txt > gulliver-ordered.txt` and hit enter.

This script uses the `sort` command to rearrange the text from its 
original order into an alphabetical configuration. Open the file in 
a text editor and after scrolling past some blank space you will 
begin to see some numbers and finally words, or at least lots of copies of 'a'!

This is looking more useful, but we can go one step further. 
Type `uniq -c gulliver-ordered.txt > gulliver-final.txt` and hit enter.

This script uses `uniq`, another new command, in combination 
with the `-c` flag to both remove duplicate lines and produce a word count of those duplicates.

**Note: there is a windows/linux issue here worth flagging 
about special characters**

Note that these steps can be simplified by building 'pipes'. So...

`tr ' ' '\n' < gulliver-clean.txt | sort | uniq -c > gulliver-final.txt`

...would have done the line-by-line, sorting, and removal of duplicates in one go.

Either way we have now taken the text apart and produced a 
count for each word in it. This is data we can prod and poke 
and visualise, that can form the basis of our investigations, 
and can compare with other texts processed in the same way. 
And if we need to run a different set of transformation for 
a different analysis, we can return to `gulliver-clean.txt` to start that work.

**note there are a few bits of punctuation in here - I've left these in 
deliberately as you should always bug fix! The internet is a always a 
good place to start searching for why this might have happened (something about the `punct` command we used...)**

And all this using a few commands on an otherwise unassuming but very powerful command line.

Before we move on, we'll go back to the opening command:

`grep 2009 2014-01_JA.tsv | grep INTERNATIONAL | awk -F'\t' '{print $5}' | sort | uniq -c`

Can you describe - without looking at your notes... - exactly what is going on here? 
(I'll forgive you not know the `awk` bit given that we've not covered that...)

## Where to go next

Deborah S. Ray and Eric J. Ray, *Unix and Linux: visual quickstart guide*, 4th edition (2009). 
Invaluable (and not expensive) as a reference guide - especially if you only use the command line sporadically!

[The Command Line Crash Course](http://cli.learncodethehardway.org/book/) 
'learn code the hard way' -- good for reminders of the basics.

[Automate the Boring Stuff](https://automatetheboringstuff.com/)

[Coursera Computer Science 101](https://www.coursera.org/course/cs101) 
If you feel you need some context to what we've done today, this is ideal 
covering how computers work, jargon, and key concepts in programming (such 
as loops and logic). Free, doesn't have to be taken as a class but in your own time.

Another Coursera course, [Programming for Everybody (Python)](https://www.coursera.org/course/pythonlearn) 
is available and lasts 10 weeks, if you have 2-4 hours to spare per week. 
Python is popular in research programming as it is readable, relatively simple, and very powerful.

Bill Turkel and the Digital History community more broadly. 
The second lesson you did today was based on a lesson Bill has on [his website](http://williamjturkel.net/2013/06/15/basic-text-analysis-with-command-line-tools-in-linux/) and Bill is also a general editor of the [Programming Historian](http://programminghistorian.org/project-team). The Programming Historian is an open, collaborative book aimed at providing programming lessons to historians. Although the lessons are hooked around problems historians have, their lessons - which cover various programming languages - have a wide applicability - indeed today's course is based on two lessons I wrote with Ian Milligan, an historian at Waterloo, Canada - for ProgHist. Bill also has a wonderful tutorial on ['Named Entity Recognition with Command Line Tools in Linux'](http://williamjturkel.net/2013/06/30/named-entity-recognition-with-command-line-tools-in-linux/) which I thoroughly recommend if you want to automatically find, markup, and count names, places, and organisations in text files...

## NER Demo

Although Named Entity Recognition relies on a number of processes we need to 
critique, it can be run across texts quickly and simply from the command line. 
We start by setting the named entity recognition running on a txt (here on a text with punctuation removed)

`stanford-ner/ner.sh gulliver-noheadfootpunct.txt > gulliver_ner.txt`

Looking at the text now, we can see that the NER has tagged some 
words with what it thinks are people, places, et al. We then clean up loose tags.

`sed 's/\/O / /g' < gulliver_ner.txt > gulliver_ner-clean.txt`

From which we can count persons...

`egrep -o -f personpattr gulliver_ner-clean.txt | sed 's/\/PERSON//g' | sort | uniq -c | sort -nr > gulliver_ner-pers-freq.txt` 
*note: `egrep` is merely a variant of grep that looks for patterns*

And count places....

`egrep -o -f locpattr gulliver_ner-clean.txt | sed 's/\/LOCATION//g' | sort | uniq -c | sort -nr > gulliver_ner-loc-freq.txt`

Now the results of this are up for debate. Many persons seem to me to be missing, 
suggesting the applicability of the software for this purpose may be questionable. 
But I hope you can see that the process is simple and can be reapplied to other textual 
data when you want to quickly get a sense of the people or places it contains. And that 
it is one of many tools (another useful one being `wget`, a command that enables you to archive webpages) 
that work well on the command line.

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

James Baker and Ian Milligan, 'Counting and mining research data with Unix', *The Programming Historian* ([2014](http://programminghistorian.org/lessons/research-data-with-unix))

Ian Milligan and James Baker, 'Introduction to the Bash Command Line', *The Programming Historian* ([2014](http://programminghistorian.org/lessons/intro-to-bash))

William J. Turkel, 'Named Entity Recognition with Command Line Tools in Linux' ([30 June 2013](http://williamjturkel.net/2013/06/30/named-entity-recognition-with-command-line-tools-in-linux/)). The section 'NER Demo' is adapted from this and shared under a [Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported](http://creativecommons.org/licenses/by-nc-sa/3.0/).

William J. Turkel, 'Basic Text Analysis with Command Line Tools in Linux' ([15 June 2013](http://williamjturkel.net/2013/06/15/basic-text-analysis-with-command-line-tools-in-linux/)). The sections 'Grabbing a text, cleaning it up' and 'Pulling a text apart, counting word frequencies' are adapted from this and shared under a [Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported](http://creativecommons.org/licenses/by-nc-sa/3.0/).

_____
### Next Week
