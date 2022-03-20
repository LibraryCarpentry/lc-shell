---
title: "What is the shell?シェルって何？"
teaching: 5
exercises: 0
questions:
- "What is the shell?シェルって何？"
- "What is the command line?コマンドラインって何？"
- "Why should I use it?どうして使わないといけないの？"
objectives:
- "Describe the basics of the Unix shellシェルの基本を説明できるようになる。"
- "Explain why and how to use the command lineなぜ使わないといけないようになるか説明が必要になる。"
keypoints:
- "The shell is powerful"；シェルってパワフル？
- "The shell can be used to copy, move, and combine multiple files"；シェルは、複数のファイルをコピーしたり、移動したり、結合するために使うことができます。
---

## Introduction: What is the shell, and why should I use it?
初めに：シェルって何ですか？何故、シェルを使うべきなの？

If you've ever had to deal with large amounts of data or large numbers of digital files scattered across your computer or a remote server, you know that copying, moving, renaming, counting, searching through, or otherwise processing those files manually can be immensely time-consuming and error-prone. Fortunately, there is an extraordinarily powerful and flexible tool designed for just that purpose.
大量のデジタルファイルを自分のコンピュータとリモートにある大量のファイルを扱うには、ファイルのリネーム、集計、検索、

The shell (sometimes referred to as the "Unix shell", for the operating system where it was first developed) is a program that allows you to interact with your computer using typed text commands. It is the primary interface used on Linux and Unix-based systems, such as macOS, and can be installed optionally on other operating systems such as Windows. 

シェル（最初に開発されたところのOSではUnixシェル呼ばれていた。）は、入力したテキストコマンドを使ってコンピューターと対話することを可能にするプログラムです。それは、LinuxやUnixを元にしたシステムを利用した主要なインターフェースで、macOSもそうで、Windowsも同様に、他のOSに追加してインストールできます。

It is the definitive example of a "command line interface", where instructions are given to the computer by typing in commands, and the computer responds by performing a task or generating an output. This output is often directed to the screen, but can be directed to a file, or even to other commands, creating powerful chains of actions with very little effort.
テキストのコマンドを使ってテキストのファイルを操作することができるプログラムです。コマンドを打ってプログラムを動かす。
ShellはLinuxやUnixベースのシステムの主要なインターフェースです。Windowsのような主要なOSでも利用できます。
コマンドを打つと何かタスクを実行するとか、出力を生成することで反応するインターフェースです。
出力は画面に表示されますが、出力にファイルに保存することもできます。他のコマンドに出力にコマンドを受け渡すこともできます。
他のコマンドに出力を渡すことで、操作のチェーン、わずかな力で実行することができます。

Using a shell sometimes feels more like programming than like using a mouse. Commands are terse (often only a couple of characters long), their names are frequently cryptic, and their output is lines of text rather than something visual like a graph. On the other hand, with only a few keystrokes, the shell allows you to combine existing tools into powerful pipelines and to handle large volumes of data automatically. This automation not only makes you more productive, but also improves the reproducibility of your workflows by allowing you to save and then repeat them with a few simple commands. Understanding the basics of the shell provides a useful foundation for learning to program, since some of the concepts you will learn here—such as loops, values, and variables—will translate to programming.

The shell is one of the most productive programming environments ever created. Once mastered, you can use it to experiment with different commands interactively, then use what you have learned to automate your work. 

In this session we will introduce task automation by looking at how data can be manipulated, counted, and mined using the shell. The session will cover a small number of basic commands, which will constitute building blocks upon which more complex commands can be constructed to fit your data or project. Even if you do not do your own programming or your work currently does not involve the command line, knowing some basics about the shell can be useful.

*Note to Lesson Instructor: Consider providing an example here of how you’ve used the Unix shell to solve a problem in the last week or month*


### Where is my shell?

The shell is a program that is usually launched on your computer much in the way you would start any other program. However, there are numerous kinds of shells with different names, and they may or may not be already installed. The shell is central to Linux-based computers, and macOS machines ship with Terminal, a shell program. For Windows users, popular shells such as Cygwin or Git Bash provide a Unix-like interface, but may need to be installed separately. In Windows 10, the PowerShell natively provides that functionality.

For this lesson, we will use Git Bash for Windows users, Terminal for macOS, and the shell for Linux users.
