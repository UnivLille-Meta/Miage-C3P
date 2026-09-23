# Week 2 Report by: Souhail OUARGUI


# The Essence of What I learned:

## 1) Loops: 
I learned that there are 3 kinds of Messages : 
- Unary
- binary
- keyword
the order of precedence is like this:  () > Unary > Binary > Keywords
I learned also that conditionals and loops are also messages sent to other objects.   

## 2) composition and precedence: 
 I learned that we have to be careful when using mathematical operations, we have to be using the parenthesis right each time, the reason is that there is no mathematical precedence since mathematical operations are plain messages. 

## 3) Expression sequence
I learned that . is  an expression separator and that | | is used for local variables or temporary variables.  
I learned also that cascade ; is sending Multiple Messages to an object, which is useful to avoid repeating the receiver.

## 4) Blocks
I learned that Blocks are defined by opening and closing brackets,  and they also can take arguments, and | separated the block argument from te block body.
Blocks can be: 
- stored in a variable
- can be evaluated many times
### Yourself: 
Remember that cascade; and yourself are often used together. 

## 5) Inheritance in pharo: 
it is used for adapting  code by extending existing behavior or state  of existing classes, and this is called class inheritance. 
A sublasse can Add, Use or Redefine the superClass's behavior.
- There are two aspects pf Inheritance : 
	- static: for instance variables
	- dynamic for behavior
NB: a class has 1 and 1 only superclass. 


## What I didn't do this week : 
since I am still getting familiarized with the syntax of pharo and its components i didn't yet iplement the DLS but I am sure I'll get into it by the end of this week.