Report 2

Yuliia LOS:

I wrote a few tiny Pharo code examples to test how message dispatch works: how an object picks which method to run when I send a message, what “self” and “super” do, what happens when classes have inheritance, etc.

Examples and results

1. Simple inheritance & dispatch

Object subclass: #Animal
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Test'.

Animal >> speak
    ^ 'generic sound'.

Object subclass: #Dog
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Test'.

Dog >> speak
    ^ 'woof!'.

| a d |
a := Animal new.
d := Dog new.
Transcript show: a speak; cr.  "=> generic sound"
Transcript show: d speak; cr.  "=> woof!"

Dispatch is working: at runtime, Pharo looks up the class of the receiver (Animal vs Dog), finds the best method there or up in superclasses.

2. Using super keyword

Dog >> speak
    ^ super speak , ' and woof!'

The result is "generic sound and woof!"

3. What about missing method

| d |
d := Dog new.
Transcript show: d eat; cr.

I got a MessageNotUnderstood exception. Pharo says the message is not found, so dispatch fails.

Summary what I learned:

- message dispatch: when you send a message like object messageName, Pharo looks in the class of the object, if method is there uses it; if not, looks up in superclass chain.

- super changes where lookup starts (from superclass rather than current class).

- if no class in the chain has the method, a runtime error happens.

- this behaviour is dynamic: the actual class of the receiver (at runtime) matters, so polymorphism works (different subclasses respond differently).

I read the MOOC material about Module 1: Understanding messages — especially lectures about lookup, self vs super.
