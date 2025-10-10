FANOMEZANTSOA Vonjiniaina Angela Béatrice :
    What is a collection and what is it used for? What kind of collections does Pharo standard library provide? 
Collection is an object that can store a group of elements. Collections are used to group related objects together and to perform operations on them as a single unit. Pharo standard library provides various types of collections, including Arrays, OrderedCollections, Sets, Dictionaries, pluggablesDictionnary, sortedCollection and Bags.
 How do you iterate collections and what are differences between them? How did you find this information?

        There are many ways to iterate collections in Pharo.
        in this example, we use collect to iterate a collection and apply a block of code to each element in the collection.
    #(2 −3 4 −35 4) collect: [ :each | each abs ]
    > #(2 3 4 35 4)

    So in this iteration, the collect evaluates every elements and every elements is sent its abs so the negative elements become positive.

    This is another example of iterators that pharo use:
    #(16 11 68 19) collect: [ :i | i odd ]
    > #(false true false true)
    This method verify if the element is odd or even and return a boolean value.
    I found this information in the PDF in the module 0 of the course(iterators).
    How do you write conditionals in Pharo? What is different from other programming languages? Can you think about the benefits and drawbacks of the approach? How did you find this information?      
 

How do you write conditionals in Pharo? What is different from other programming languages? Can you think about the benefits and drawbacks of the approach? How did you find this information?
    In pharo, candition is considered as a message  that is sent to a boolean object(true or false). The message is either ifTrue: or ifFalse:.
    In another programming language, conditionals are usually written using keywords such as "if", "else if", and "else". 
    In pharo, the use of messages for conditionals allows for a more flexible and dynamic approach to control flow.
    i found this information in the PDF in the module 0 of the course(C019-W1S05-PharoSyntaxInANutshell.pdf).


How do you write a small program with classes and methods in Pharo? Pharo is indeed, very IDE oriented and you have to get used to the tooling. How did you find this information?

To create a class and methods in Pharo, we send a message to the superclass:
Object subclass: #Point
instanceVariableNames: 'x y'
classVariableNames: ''
package: 'Graphics'
And for the method, we need to select a class where it belongs, it's return the receiver Self.
This is is an example of that explication:
Game >> initializePlayers
self players
at: 'tileAction'
put: ( MITileAction director: self )
is equivalent to
Game >> initializePlayers
self players
at: 'tileAction'
put: ( MITileAction director: self ).
^ self "<−− optional"
What program did you write? What problems did you find? Please provide a github repository link.
i try the exercise Counter for the exercise and it was hard for me to link the class with its instance and fir the test too but i did it anyway
The link of my github repository is: https://github.com/Fanomezantsoa-Beatrice/MyCounter_Angela


Pharo methods are usually small and readable. What rules are common to follow? Are there tools that show you violations to such rules?

common rules to follow in Pharo methods are: make it public, return by defaualt the receiver(self) and it should be only for the class side.
There are tools that show violations to such rules, such as the "Code Critic" tool


Can you learn about cascades and block closures? How do you approach it?

blocks are anonymous methods and are in every Pharo's code. 
cascadesis a way to send multiple messages to the same object without having to repeat the object's name.
        ranscript cr.
Transcript show: 1.
Transcript show: 2
is equivalent to:
Transcript
cr ;
show: 1 ;
show: 2
; is called a cascade

This is the approach how to use cascade.

And for the blocks:
A block is defined by [ ]
[ expressions. ... ]
[ 1 / 0 ]
> [ 1 /0 ]

Did you ask questions in the discord channels or mailing lists?

Non i didn't ask any questions for now.