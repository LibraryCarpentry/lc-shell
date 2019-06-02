---
layout: page
title: Setup
---

To participate in this Library Carpentry lesson, you will need a working UNIX-like shell environment.
Specifically we will be using Bash ([Bourne Again Shell](https://en.wikipedia.org/wiki/Bash_(Unix_shell))) which is standard on Linux and Mac OS. 
Even if you are a Windows user, learning Bash will open up a powerful set of tools on your personal machine, in addition to familiarizing you with the standard remote interface used on almost all servers and super computers. 

## Terminal Setup

Bash is the default shell on most Linux distributions and Mac OS. 
Windows users will need to install Git Bash to provide a UNIX-like environment.

- **Linux:** The default shell is usually Bash, but if your machine is set up differently you can run it by opening a terminal and typing `bash`.  There is no need to install anything. Look for Terminal in your applications to start the Bash shell.
- **Mac OS:** Bash is the default shell in all versions of Mac OS, you do not need to install anything. Open Terminal from `/Applications/Utilities` or spotlight search to start the Bash shell.
- **Windows:** On Windows, CMD or PowerShell are normally available as the default shell environments. These use a syntax and set of applications unique to Windows systems and are incompatible with the more widely used UNIX utilities. However, a Bash shell can be installed on Windows to provide a UNIX-like environment. For this lesson we suggest using Git Bash, part of the [Git for Windows](https://git-for-windows.github.io/) package:
    - Download the latest Git for Windows [installer](https://git-for-windows.github.io/).
    - Double click the `.exe` to run the installer (for example, `Git-2.13.3-64-bit.exe`) using the default settings.
    - Once installed, open the shell by selecting Git Bash from the start menu (in the Git folder).

If you encounter issues, Software Carpentry maintains a [Configuration Problems and Solutions wiki page](https://github.com/swcarpentry/workshop-template/wiki/Configuration-Problems-and-Solutions) that may help.
    
## Data Files

You need to download some files to follow this lesson:

1. Download [shell-lesson.zip](https://github.com/LibraryCarpentry/lc-shell/raw/gh-pages/data/shell-lesson.zip) and move the file to your Desktop.
2. Unzip/extract the file (ask your instructor if you need help with this step). You should end up with a new folder called `shell-lesson` on your Desktop.
3. Open a terminal and type:

~~~
$ cd
~~~
{: .bash}

In the lesson, you will find out how to access the data in this folder.

[template]: {{ site.workshop_repo }}
