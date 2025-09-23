This week, I studied the concept of dispatch in Pharo through Module 1: Understanding Messages.
My goal was to better understand how objects react to messages and how they choose the right method to execute.


Dispatch is the mechanism by which, when we send a message to an object, it decides which method to execute.
In other words, it is the process of dynamic selection of a method depending on the actual class of the object that receives the message.
This means that:

- the executed code depends on the receiver object,

- the search starts in its class, then goes up through its superclasses,

- if no method is found, an error MessageNotUnderstood is raised.


## Example with the Person class
### I chose to work with a class Person having two instance variables: name and age.

Object subclass: #Person
   instanceVariableNames: 'name age'
   classVariableNames: ''
   package: 'MyPackage'

Person >> initializeWithName: aName age: anAge
   name := aName.
   age := anAge.
   ^ self

Person >> name
   ^ name

Person >> age
   ^ age

Person >> introduce
   ^ 'Hello, my name is ', name, ' and I am ', age asString, ' years old.'

## Example in the Playground:


p := Person new initializeWithName: 'Alice' age: 21.
p introduce.
"Hello, my name is Alice and I am 21 years old."

## My difficulties

- Finding the right code: at first, I tried to send p hobby but it raised a MessageNotUnderstood error.

- Using super correctly: I thought super always directly called the parent’s method, but it actually means “continue the method lookup in the superclass.”

- Avoiding syntax mistakes: sometimes I forgot things like ^ self in initialize, which prevented the class from answering messages properly.


## My solutions
### To solve these problems, I tried different approaches:
- Reading carefully the error messages to see what Pharo could not find.

- Checking the available methods directly in the *Class Browser*.

- Testing small variations in the Playground until I found a working version.

- Comparing my experiments with the explanations and examples from the PDF in *Module 1: Understanding Messages*.


After these challenges, I can say that I understand Pharo a little better.


The dsl-Exo also helped me to undersatand how object in pharo works that you can always send messages to objects and 
they will respond according to their class and methods and that every in Pharo in an object.