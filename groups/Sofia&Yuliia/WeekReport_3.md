Report 3

Yuliia LOS:

From these lectures, I learned several important ideas about object-oriented design in Pharo.

First, design patterns are not just random tricks, but proven solutions to recurring problems. They give developers a shared vocabulary—like Strategy, Observer, or Template Method—that makes it easier to discuss and structure designs.
A key point was that sending messages to self creates hooks. These hooks let subclasses redefine parts of the behavior without duplicating code.This makes programs more flexible and encourages writing small methods, which are easier to understand, test, and extend.

I also discovered the Template Method pattern, where a method defines the skeleton of an algorithm and delegates some steps to “hooks.” Subclasses can then redefine these hooks to change details, while the overall structure remains the same.

Another practical topic was streams. Instead of creating many temporary strings, it’s better to use streams directly (e.g., aStream print: object instead of object printString). This avoids unnecessary intermediate objects and keeps the code efficient.

Finally, I learned why relying on globals (like Transcript) is problematic. Globals reduce testability and flexibility. A better design is to pass dependencies as parameters or store them in instance variables, so each object can have its own configuration.

Here’s a tiny example that shows a hook in action:
Object subclass: #MyPrinter
    instanceVariableNames: ''.

MyPrinter >> print
    "Template method"
    self header.
    self content.
    self footer.

MyPrinter >> header
    Transcript show: '---'; cr.

MyPrinter >> content
    Transcript show: 'Default content'; cr.

MyPrinter >> footer
    Transcript show: '---'; cr.

A subclass can just redefine content to change the middle part, while keeping the structure.

# WeekReport3 Demchuk Sofia 
After watching videos from module 3 (Hook&template).
From the videos I reviewed, I repeated that there are different kinds of design patterns:

- **Creational** (Factory, Builder, Prototype, Singleton) – focus on how objects are created.  
- **Structural** (Adapter, Composite, Decorator, Proxy, etc.) – show how classes and objects can be combined.  
- **Behavioral** (Strategy, Observer, Template Method, Command, etc.) – deal with communication and responsibilities.  

I learned that design patterns are just reusable solutions to common coding problems. They are useful because they give programmers a shared language. For example, saying “let’s use Strategy here” is enough to explain the idea without describing every detail. But it’s also important not to use patterns everywhere, because they can make code more complicated.

Another useful point is that when a class sends a message to self, it is like creating a hook. Subclasses can change the behavior by redefining that method, without rewriting everything. This is the idea behind the Template Method pattern: the parent defines the main structure, and subclasses decide the details.

Overall, these ideas helped me understand that good OOP is about reuse, extensibility, and clarity. Patterns, small methods, and avoiding globals all contribute to cleaner and more adaptable code.
A very simple example:

```smalltalk
Object subclass: Animal [
    Animal >> speak
        ^ '...'
]

Animal subclass: Dog [
    Dog >> speak
        ^ 'Woof!'
]

Animal subclass: Cat [
    Cat >> speak
        ^ 'Meow!'
]
```
Here speak is a hook. Every animal has it, but each subclass (Dog, Cat) redefines it in its own way.
I also learned about streams. Instead of creating extra strings, you can write directly into a stream. For example:
```smalltalk
String streamContents: [ :s |
    s nextPutAll: 'Hello, '.
    s nextPutAll: 'world!'
].
```

This builds "Hello, world!" step by step, without making extra strings in memory.

Finally, I understood why globals are dangerous. If you always write logs to a global place, like Transcript, it is hard to test and reuse code later. A better way is to pass a stream as a parameter:
```smalltalk
myMethodOn: aStream
    aStream nextPutAll: 'Something happened'.
```
This way you can decide where the log goes — to the console, to a file, or somewhere else.

# Takeaway

The key lesson for me is to keep code simple and flexible. Writing small methods makes the design clearer and easier to test. Avoiding global variables keeps programs clean and independent. And using hooks and templates gives subclasses a safe way to extend behavior without breaking the whole system. Altogether, these ideas help build software that is modular, reliable, and easy to understand.
