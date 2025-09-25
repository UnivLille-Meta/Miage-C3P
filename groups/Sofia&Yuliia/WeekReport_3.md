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

Overall, these ideas helped me understand that good OOP is about reuse, extensibility, and clarity. Patterns, small methods, and avoiding globals all contribute to cleaner and more adaptable code.
