---
title: "Automating the tedious with loops"
teaching: 20
exercises: 10
questions:
- "What is a loop?""ループとはなにか"
- "How can a loop be used to repeat a task?"”繰り返しの仕事をするのにどのようにループを使うか。”
objectives:
- "Describe how loops can be used to repeat tasks""ループを使って複数のファイルを繰り返しリネームできるようになる。"
- "Implement a loop to rename several files"
keypoints:
- "Looping is the foundation for working smarter with the command line""ループは生産性向上の鍵"
- "Loops help us to do the same (or similar) things to a bunch of items""なぜならこれは繰り返し実行することでワイルドカードやタブ補完とどうようにタイピングの量と間違いを避けることｇできる"
---
### Writing a Loop

**Loops** are key to productivity improvements through automation as they allow us to execute
commands repetitively. Similar to wildcards and tab completion, using loops also reduces the
amount of typing (and typing mistakes).
Suppose we have several hundred document files named `project_1825.txt`, `project_1863.txt`, `XML_project.txt` and so on.100個くらいあるとしましょう
We would like to change these files, but also save a version of the original files, naming the copiesもとのファイルはバックアップを作っておきたい
`backup_project_1825.txt` and so on.とします・

We can use a **loop** to do that.そういうことをするためにループが使えます。
Here's a simple example that creates a backup copy of four text files in turn.バックアップをすることができます。

Let's first create those files:

~~~
$ touch a.txt b.txt c.txt d.txt
~~~
This will create four empty files with those names. It is easy to use the shell to create a batch of files in one go.

Now we will use a loop to create a backup version of those files. First let’s look at the general form of a loop:

```
for thing in list_of_things　リストがあって
do　do
    operation_using $thing    # Indentation within the loop is not required, but aids legibility ここにdoとdoneの間に作業を書くインデントを書くと見やすくなります。
done
```
{: .language-bash}

We can apply this to our example like this:


~~~
$ for filename in ?.txt
> do
>    echo "$filename"
>    cp "$filename" backup_"$filename"
> done
~~~
{: .bash}

~~~
a.txt
b.txt
c.txt
d.txt
~~~
{: .output}

When the shell sees the keyword `for`,
it knows to repeat a command (or group of commands) once for each thing `in` a list.
For each iteration,
the name of each thing is sequentially assigned to
the **loop variable** and the commands inside the loop are executed before moving on to
the next thing in the list.
Inside the loop,
we call for the variable's value by putting `$` in front of it.
The `$` tells the shell interpreter to treat
the **variable** as a variable name and substitute its value in its place,
rather than treat it as text or an external command.
コマンドにあるリストに伝わります。
各繰り返しの中でそれぞれのリストの中の一個一個の名前はループ変数が一個一個に割り当てられます。
ループの中のコマンドが次のリストに行く前に実行されます。
変数にはドルマークが頭につきます。
ドルマークはシェルのインタープリターのプログラムに＄は変数だよというのを伝えて実際の値を代入します。
リストの値で置き換えてください。なんとかテキストというのは４つあって、この一個一個をdoからdoneの間に
入って、cp a.txt backup_a.txt繰り返されるという仕組み。

> ## Double-quoting variable substitutions
>
> Because real-world filenames often contain white-spaces,
> we wrap `$filename` in double quotes (`"`). If we didn't, the
> shell would treat the white-space within a filename as a separator
> between two different filenames, which usually results in errors.
> Therefore, it's best and generally safer to use `"$..."` unless
> you are absolutely sure that no elements with white-space can ever
> enter your loop variable (such as in [episode 5]({{ page.root }}/05-counting-mining/index.html#using-a-loop-to-count-words)).実際のファイルネームにはスペースを含むことがあるので変数をダブルクォート、タブルクォートしないとコマンドの区切りとします。これも大抵エラーになります。なので変数はダブルクォートで囲うのがベストで安全です。
> どのファイルにもスペースが含まれていないと確信していない場合は囲むほうがいいです。
{: .callout}

In this example, the list is four filenames: 'a.txt', 'b.txt', 'c.txt', and 'd.txt'
Each time the loop iterates, it will assign a file name to the variable `filename`
and run the `cp` command.上記の例ではファイル名は4つです。ファイル名を代入します。コピーコマンドを実行します。
The first time through the loop,最初のループはa.txt
`$filename` is `a.txt`.
The interpreter prints the filename to the screen and then runs the command `cp` on `a.txt`, (because we asked it to echo each filename as it works its way through the loop).ファイル名を出力します。コピーコマンドを実行します。
For the second iteration, `$filename` becomes
`b.txt`. This time, the shell prints the filename `b.txt` to the screen, then runs `cp` on `b.txt`. The loop performs the same operations for `c.txt` and then for `d.txt` and then, since　ループが実行されていればファイル名を表示するようにしています。2番目はb、3番めはc
the list only included these four items, the shell exits the `for` loop at that point.4つ全部終わったらこのシェルが終了します。

> ## Follow the Prompt
>
> The shell prompt changes from `$` to `>` and back again as we were
> typing in our loop. The second prompt, `>`, is different to remind
> us that we haven't finished typing a complete command yet. A semicolon, `;`,
> can be used to separate two commands written on a single line.
{: .callout}

> ## Same Symbols, Different Meanings
>
> Here we see `>` being used as a shell prompt, but `>` can also be
> used to redirect output from a command (i.e. send it somewhere else, such as to a file, instead of displaying the output in the terminal) ---
> we'll use redirection in [episode 5]({{ page.root }}{% link _episodes/05-counting-mining.md %}).
> Similarly, `$` is used as a shell prompt, but, as we saw earlier,
> it is also used to ask the shell to get the value of a variable.
>
> If the *shell* prints `>` or `$` then it expects you to type something,
> and the symbol is a prompt.
>
> If *you* type `>` or `$` yourself, it is an instruction from you that
> the shell to redirect output or get the value of a variable.
{: .callout}

We have called the variable in this loop `filename`
in order to make its purpose clearer to human readers.
The shell itself doesn't care what the variable is called.

> ## For loop exercise
> Complete the blanks in the for loop below to print the name, first line, and last line
> of each text file in the current directory.
>
> ```
> ___ file in *.txt
> __
> 	echo "_file"
> 	head -n 1 _______
> 	____ __ _ _______
> ____
> ```
> {: .bash}
>
> > ## Solution
> > ```
> > for file in *.txt
> > do
> > 	echo "$file"
> > 	head -n 1 "$file"
> > 	tail -n 1 "$file"
> > done
> > ```
> > {: .bash}
> {: .solution}
{: .challenge}

This is our first look at loops. We will run another loop in the
[Counting and Mining with the Shell]({{ page.root }}{% link _episodes/05-counting-mining.md %}) episode.

![For Loop in Action](../fig/shell_script_for_loop_flow_chart.svg)

> ## Running the loop from a Bash script
>
> Alternatively, rather than running the loop above on the command line, you can 
> save it in a script file and run it from the command line without having to rewrite
> the loop again. This is what is called a Bash script which is a plain text file that 
> contains a series of commands like the loop you created above. In the example script below, 
> the first line of the file contains what is called a Shebang (`#!`) followed by the path to the interpreter 
> (or program) that will run the rest of the lines in the file (`/bin/bash`). The second line demonstrates how 
> comments are made in scripts. This provides you with more information about what the script does. 
> The remaining lines contain the loop you created above. You can create this file in the same directory 
> you've been using for the lesson and by using the text editor of your choice (e.g. nano) but when you save the 
> file, make sure it has the extension **.sh** (e.g. `my_first_bash_script.sh`). When you've done this, you can run the
> Bash script by typing the command bash and the file name via the command line (e.g. `bash my_first_bash_script.sh`). 
> > ```
> > #!/bin/bash
> > # This script loops through .txt files, returns the file name, first line, and last line of the file
> > for file in *.txt
> > do
> > 	echo $file
> > 	head -n 1 $file
> > 	tail -n 1 $file
> > done
> > ```
> > {: .bash}
> Download/copy [my_first_bash_script.sh](https://raw.githubusercontent.com/LibraryCarpentry/lc-shell/gh-pages/files/my_first_bash_script.sh). For more on Bash scripts, see [Bash Scripting Tutorial - Ryans Tutorials](https://ryanstutorials.net/bash-scripting-tutorial/).
{: .callout}
