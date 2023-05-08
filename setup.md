---
title: Setup
---

To participate in this Library Carpentry lesson, you will need a working Unix-like shell environment.
Specifically we will be using Bash ([Bourne Again Shell](https://en.wikipedia.org/wiki/Bash_\(Unix_shell\))) which is standard on Linux and macOS. macOS Catalina users will have zsh (Z shell) as their default version.
Even if you are a Windows user, learning Bash will open up a powerful set of tools on your personal machine, in addition to familiarizing you with the standard remote interface used on almost all servers and super computers.

::::::::::::::::::::::::::::::::::::::::::  prereq

## Terminal Setup

Bash is the default shell on most Linux distributions and macOS.
Windows users will need to install Git Bash to provide a Unix-like environment.

- **Linux:** The default shell is usually Bash, but if your machine is set up differently you can run it by opening a terminal >and typing `bash`.  There is no need to install anything. Look for Terminal in your applications to start the Bash shell.

- **macOS:** Bash is the default shell in all versions of macOS prior to Catalina, you do not need to install anything. Open Terminal from >`/Applications/Utilities` or spotlight search to start the Bash shell. zsh is the default in Catalina.

- **Windows:** On Windows, CMD or PowerShell are normally available as the default shell environments. These use a syntax and set of applications unique to Windows systems and are incompatible with the more widely used Unix utilities. However, a Bash shell can be installed on Windows to provide a Unix-like environment. For this lesson we suggest using Git Bash, part of the >[Git for Windows](https://gitforwindows.org/) package:
  
  - Download the latest Git for Windows [installer](https://gitforwindows.org/).
  - Double click the `.exe` to run the installer (for example, `Git-2.13.3-64-bit.exe`) using the default settings.
  - Once installed, open the shell by selecting Git Bash from the start menu (in the Git folder).
  
  There are also some more advanced solutions available for running Bash
  commands on Windows.  A Bash shell command-line tool is available for
  Windows 10, which you can use if you enable the [Windows Subsystem for
  Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
  Additionally, you can run Bash commands on a remote computer or server
  that already has a Unix Shell, from your Windows machine.  This can
  usually be done through a Secure Shell (SSH) client.  One such client
  available for free for Windows computers is
  [PuTTY](https://www.putty.org/).

If you encounter issues, the Carpentries maintains a [Configuration Problems and Solutions wiki page](https://github.com/carpentries/workshop-template/wiki/Configuration-Problems-and-Solutions) that may help.


::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::  prereq

## Data Files

You need to download some files to follow this lesson:

1. Download [shell-lesson.zip](data/shell-lesson.zip) and move the file to your Desktop.
2. Unzip/extract the file (ask your instructor if you need help with this step). You should end up with a new folder called `shell-lesson` on your Desktop.
3. Open the terminal and type `ls` followed by the <kbd>enter</kbd> key.

```bash
$ ls
```

You should see a list of files and folders in your current directory.
4\. Then type:

```bash
$ pwd
```

This command will show you where you are in your file system, which should now be your home directory. In the lesson, you will find out more about the commands `ls`, `pwd` and how to work with the data in `shell-lesson` folder.


::::::::::::::::::::::::::::::::::::::::::::::::::


