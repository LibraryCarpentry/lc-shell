---
title: "What is the shell?"
teaching: 20
exercises: 10
questions:
- "What is the shell?"
- "What is the command line?"
- "Why should I use it?"
objectives:
- "Explain the basics of the Unix shell"
- "Explain why and how to use the command line"
keypoints:
- "The shell is powerful"
- "Knowing where you are in your directory structure is key to working with the shell"
- "The shell can be used to copy, move, and combine multiple files"
---
## Introduction

In this session we will introduce task automation by looking at how data can be manipulated, counted, and mined using the Unix shell,
a command line interface to your computer and the files to which it has access.

The shell is a program that allows you to interact with your computer using commands. It is the interface used on Linux and UNIX-based systems, such as Mac OS, and can be used on Windows, if installed.

For Windows users, popular shells such as Cygwin or Git Bash provide a Unix-like
interface. In Windows 10, the Power Shell provides that functionality.

This session will cover a small number of basic commands using Git Bash for Windows users,
Terminal for Mac OS, and the shell for Linux users. These commands constitute building blocks upon which more
complex commands can be constructed to fit your data or project.
<!-- Mention native Bash in Windows 10 -->
Even if you do not do your own programming or your work currently does not involve the command line, knowing some basics about the shell can be useful.

The shell is one of the most productive programming environments ever created. Once mastered, you can use it to experiment with different commands interactively, then use what you have learned to automate your work. Graphical user interfaces may be better at the first, but the shell is still unbeaten at the second.

*Note to Lesson Instructor: consider providing an example here of how you've used the Unix shell to solve a problem in the last week or month*

[](# From SW Carpentry)
What you can quickly learn is how to query lots of data for the information you want very quickly. Using Bash or any other shell sometimes feels more like programming than like using a mouse. Commands are terse (often only a couple of characters long), their names are frequently cryptic, and their output is lines of text rather than something visual like a graph. On the other hand, with only a few keystrokes, the shell allows you to combine existing tools into powerful pipelines and to handle large volumes of data automatically. This automation not only makes you more productive, but also improves the reproducibility of your workflows by allowing you to save and then repeat them with a few simple commands.
[](# Custom addition)
Understanding the basics of the shell provides a useful foundation for learning to program, since some of the tasks you learn here such as loops, and the language - values, variables - will translate to programming.
