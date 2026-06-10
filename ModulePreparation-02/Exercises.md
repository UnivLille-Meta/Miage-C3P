# Exercises

The objectives of these exercises are to get acquainted to the Pharo programming language.
This step is important to correctly follow the rest of the lectures, which will increase in complexity and will assume that you have some mastery of the language.

Of course, you will not be asked to know obscure or implementation specific details of the language.
But, you will need to learn how to write simple programs including:
- classes and methods
- the syntax, operator precedence
- assignments, conditional and loops
- tests

This will also get you started with *reading* code, which will be a recurrent topic in this lecture.
We will need to read and understand code that we did not write.
And we need to do that efficiently.
For that, we first need to take care of the silly obstacules like understanding the syntax.
Later we will know how to abstract a bit more and care less about details.

## Step 1: Install Pharo
Installing Pharo is easier using the Pharo launcher.
The Pharo launcher is an application that allows you to download different versions of Pharo and managing the installation details for your platform.

Go to the download page https://pharo.org/download and download the Pharo launcher.
Once downloaded, you can open it and see an application that looks like this:

<img width="1088" alt="imagen" src="https://github.com/UnivLille-Meta/Miage23/assets/708322/7a40399c-8e44-42d9-aa8e-bfd9b7a347d5">

Click on the *New* button and create a new Pharo 11 image with the name you want. Finish the creation by clicking on *Create Image*.

<img width="1088" alt="imagen" src="https://github.com/UnivLille-Meta/Miage23/assets/708322/30a8ebec-688d-4b93-b4ca-b6c1ee9d0188">

After downloading everything necessary, click on the image, and click on the *Launch* button. You will see the Pharo IDE opening for you.

<img width="1088" alt="imagen" src="https://github.com/UnivLille-Meta/Miage23/assets/708322/c8a8a156-fb31-4b26-a083-6b4419ef0512">

## Step 2: ProfStef interactive tutorial

Pharo includes an interactive tutorial inside the IDE called *ProfStef*.
You can open it from a playground that you can get in the menu *Browse > Playground*.
A playground is like an interactive console with vitamins.
Inside you can type any code you want and execute it by 
 - selecting the code you want
 - right click -> *Do it*

<img width="510" alt="imagen" src="https://github.com/UnivLille-Meta/Miage23/assets/708322/af8f9f82-4ad7-4a51-8e82-19fb0ca94b02">

If you tried the two lines of code before, you probably noticed that a *Do it* on *1 + 1* did nothing.
That is because *1 + 1* is an expression with a value, but it does not have any observable side effect.
If you want to see the return value of an expression, you need to do *Print it* or *Do it and go* instead.
For more, the ProfStef tutorial will guide you through the syntax of the language and the main ways to interact with the playground.

## Step 3: Writing classes, methods and tests

The next step to get acquainted to Pharo is to write some *real* code (what's real anyways?).
For that, follow the PDF tutorial in http://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC/Week1/Exo-Counter.pdf.

This tutorial will guide you on writing a `Counter` class that has `increment` and `decrement` methods using a TDD approach.
It will also show you how to use the code browser and the debugger a bit.

You may want to check the videos here: 
- *Creating packages, classes and methods:* https://www.youtube.com/watch?v=8Do1TjMHLAI&list=PL2okA_2qDJ-kCHVcNXdO5wsUZJCY31zwf&index=11
- *Creating tests:* https://www.youtube.com/watch?v=FZBDNRJWpLE&list=PL2okA_2qDJ-kCHVcNXdO5wsUZJCY31zwf&index=12
- *Alternative method creation:* https://www.youtube.com/watch?v=iAPo3j_DaXE&list=PL2okA_2qDJ-kCHVcNXdO5wsUZJCY31zwf&index=13
- *Committing the code in Git:* https://www.youtube.com/watch?v=NDJv7TRhwRE&list=PL2okA_2qDJ-kCHVcNXdO5wsUZJCY31zwf&index=14

Or the powerful version with eXtrement TDD (Test driven development):
- https://www.youtube.com/watch?v=K8CVAKE_9pI&list=PL2okA_2qDJ-kCHVcNXdO5wsUZJCY31zwf&index=32

You can check for more info on Pharo in the mooc website: http://mooc.pharo.org

## Step 4: Write your report

Remember to write the report on:
 - what you did
 - what you did not (and why)
 - what difficulties you found and **more importantly** how did you *overcome* them! You are going to become a professional software engineer, you need to be able to get through problems.

## Git related resources

Check the GlobalResources.md file it contains some slides and tutorials on git.
