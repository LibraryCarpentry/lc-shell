---
title: "What is the shell?シェルって何？"
teaching: 5
exercises: 0
questions:git@github.com:daitokengzteam/lc-shell.gitgit@github.com:daitokengzteam/lc-shell.gitgit@github.com:daitokengzteam/lc-shell.git
- "What is the shell?
シェルって何？"
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
初めに：シェルって何ですか？何故、私がシェルを使うべきなの？

If you've ever had to deal with large amounts of data or large numbers of digital files scattered across your computer or a remote server, 
もし、あなたが、自分のコンピュータやリモートサーバーに散在する膨大なデータや大量のデジタルファイルを扱う必要がある場合、

you know that copying, moving, renaming, counting, searching through, or otherwise processing those files manually can be immensely time-consuming and error-prone. 
ご存じのように、コピー、移動、名前変更、カウント、検索、その他の処理を手作業ですると、非常に時間がかかるし、エラーが発生しやすいものです。

Fortunately, there is an extraordinarily powerful and flexible tool designed for just that purpose.
幸いなことに、そのような目的のために設計された、非常に強力で柔軟なツールがあります。

The shell (sometimes referred to as the "Unix shell", for the operating system where it was first developed) is a program that allows you to interact with your computer using typed text commands. 
シェル（最初に開発されたところのOSではUnixシェルと呼ばれてたこともありました。）は、入力したテキストコマンドを使ってコンピューターと対話することを可能にするプログラムです。

It is the primary interface used on Linux and Unix-based systems, such as macOS, and can be installed optionally on other operating systems such as Windows. 
それは、LinuxやUnixを元にしたシステムの主要なインターフェースで、macOSもそうで、Windowsも同様に、他のOSに追加してインストールすることができます。

It is the definitive example of a "command line interface", where instructions are given to the computer by typing in commands, and the computer responds by performing a task or generating an output. 
シェルは、「コマンドラインインターフェース」の決定版で、指示はコマンドの入力でコンピュータに与えられ、コンピュータはそれに応答してタスクを実行や出力します。

This output is often directed to the screen, but can be directed to a file, or even to other commands, creating powerful chains of actions with very little effort.
この出力先は、画面によく向けられますが、ファイルや他のコマンドに向けらることもあり、他のコマンドについては、わずかな努力で強力なアクションの連鎖を作り出すことがでます。

<2022−09−18＞

Using a shell sometimes feels more like programming than like using a mouse. Commands are terse (often only a couple of characters long), their names are frequently cryptic, and their output is lines of text rather than something visual like a graph. On the other hand, with only a few keystrokes, the shell allows you to combine existing tools into powerful pipelines and to handle large volumes of data automatically. This automation not only makes you more productive, but also improves the reproducibility of your workflows by allowing you to save and then repeat them with a few simple commands. Understanding the basics of the shell provides a useful foundation for learning to program, since some of the concepts you will learn here—such as loops, values, and variables—will translate to programming.

シェルを使うというのはマウスを使うというよりはプログラミングという感じです。コマンドは簡単、簡略（たいてい数文字の簡潔でコマンドの名前は暗号みたいな）、出力はグラフのようなものではなくって何行かのテキストです。一方数文字のキーの入力で既存のツールを組み合わせて、強力なパイプラインを作り上げることができるし、大量のデータを自動的に処理することができます。この自動化はあなたの生産性を向上するだけではなくて、単純なコマンドの組み合わせを保存したり、繰り返したりすることでワークフローの再現性をあげることができる。マウスの繰り返しでできなくはないけどシェルの基本を理解することはこのプログラムを学ぶことの基礎になります。ここで学ぶいくつかのコンセプト、ループ（繰り返し処理ができる）、値、変数はプログラミングに変換されるからです。

The shell is one of the most productive programming environments ever created. Once mastered, you can use it to experiment with different commands interactively, then use what you have learned to automate your work. 

シェルは今までに作られた中でもっとも生産性が高いプログラミング環境の一つです。一旦マスターすると色々なコマンドを対話的に操作して、あなたの仕事を自動化するためにそれらを使うことができるようにになります。

In this session we will introduce task automation by looking at how data can be manipulated, counted, and mined using the shell. The session will cover a small number of basic commands, which will constitute building blocks upon which more complex commands can be constructed to fit your data or project. Even if you do not do your own programming or your work currently does not involve the command line, knowing some basics about the shell can be useful.

このセッションでは私たちはこのタスクの自動化っていうのをデータの操作、集計、発見することであなたのタスクの自動化の方法というのを紹介します。
このセッションでは基本的なコマンドをカバーします。これらのコマンドはもっとあなたのデータとかプロジェクトにあうようなコマンドを作るためのブロックを作るためのコマンドをカバーします。
もし今のあなたの仕事がプログラミングに関係していなくてもしなくてもコマンドラインなんか使っていなくてもとても知っておくことは役に立ちます。

*Note to Lesson Instructor: Consider providing an example here of how you’ve used the Unix shell to solve a problem in the last week or month*

講師の皆様へ
ユニックスシェルをどのように使っているか説明しましょう。

### Where is my shell?　私のシェルはどこですか？

The shell is a program that is usually launched on your computer much in the way you would start any other program. However, there are numerous kinds of shells with different names, and they may or may not be already installed. The shell is central to Linux-based computers, and macOS machines ship with Terminal, a shell program. For Windows users, popular shells such as Cygwin or Git Bash provide a Unix-like interface, but may need to be installed separately. In Windows 10, the PowerShell natively provides that functionality.

シェルというのはあなたがプログラムを起動するときに通常起動するプログラムです。そこでシェルが起動している。しかし、世の中には色々な種類のシェルが違った名前で存在しています。すでにイントールされているかもしれないし、されていないかもしれない。Linuxベースのコンピュータの中心です。マックはターミナル。WindowsはポピュラーなシェルはCygwinやGihub Bash、Powershellはこのような機能を提供します。

For this lesson, we will use Git Bash for Windows users, Terminal for macOS, and the shell for Linux users.
このレッスンはWindowsの人はGit Bush、mac OSはターミナル、Linuxの人はシェルを使います。

シェルは強力。組みあわせたりして使います。
