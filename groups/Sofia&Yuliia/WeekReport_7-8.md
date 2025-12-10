Weekly Report

Yuliia LOS:

This week I focused on understanding three design patterns: Composite, State, and Visitor.
I studied the PDF files and watched the related MOOC videos.

1. Composite Pattern

Goal: treat single objects and groups of objects in the same way.
From the PDF I learned that Composite lets us build tree structures (like folders, diagrams, documents).
A leaf and a container have the same API, so the client doesn’t need to check “is this a leaf or a group?”

Example:
Graphic >> draw

Circle >> draw
    Transcript show: 'Drawing circle'.

Diagram >> draw
    elements do: [:each | each draw].

Now I can call:
aGraphic draw   "Works for Circle, Text, or a whole Diagram"

2. State Pattern

Goal: avoid long if/else based on object state.
From the State PDF I learned that instead of doing:
(machineState = #idle) ifFalse: [...]
we create one class per state (IdleState, ToPayState, etc.) and delegate behavior to them.

Example:
CoffeeMachine >> acceptOrder: anOrder
    ^ state acceptOrder: anOrder onMachine: self

IdleState >> acceptOrder: anOrder onMachine: machine
    machine doOrder.
    machine state: ToPayState new.
This removes conditionals and makes adding new states easier.

3. Visitor Pattern

Goal: separate operations from the object structure.
From the Visitor PDF I learned that Visitor is useful when we want to run many different operations (print, evaluate, export…) on a complex structure (like expressions or documents).

Each element implements:
acceptVisitor: aVisitor
    ^ aVisitor visitNumber: self   "example for Number"

And a Visitor implements:
Evaluator >> visitPlus: expr
    ^ (expr left acceptVisitor: self)
       + (expr right acceptVisitor: self)

This avoids putting all logic inside the domain classes.

What I Understood:

Composite

I understood that the Composite pattern helps build tree-like structures, where a single item (like a Circle) and a group of items (like a Diagram) can be used with the same API. This means I don’t need to write checks like “is this a leaf or a group?” — everything responds to the same messages. It makes the code cleaner and easier to extend when we add new elements.

State

I learned that the State pattern is useful when an object changes its behavior depending on its internal state. Instead of using many if or case statements, we create separate classes for each state. Each state knows what it can or cannot do. This makes the behavior easier to understand and modify, especially when the number of states grows.

Visitor

I also understood that the Visitor pattern allows us to keep the data classes simple and move different operations into separate Visitor classes. When we need to evaluate, print, export, or transform something, we just create a new Visitor without touching the original classes. This is very helpful when we have many operations on the same structure. The mechanism of double dispatch ensures the correct method is chosen for each element type.



## Weekly Report Sofia Demchuk

This week I reviewed what we learned in the previous lesson about the Law of Demeter. I refreshed the main idea: an object should only talk to its direct collaborators. This helps reduce coupling and prevents long “message chains.”

For example, instead of writing something like:
```smalltalk
car engine carburetor openFuelValve.
```
which breaks the Law of Demeter, we should move behavior closer to the right place:
```smalltalk
car speedUp. "Car internally tells the engine what to do"
```
This keeps the logic encapsulated and avoids leaking deep references.

I also prepared for the next lesson. I watched the videos on Composite and Visitor design patterns.

**What I understood**
- Composite allows us to treat single objects and groups of objects the same way.
For example, both a single Circle and a Diagram with many elements can answer draw:
```smalltalk
aGraphic draw. "Works whether it's a Circle, Text, or a whole Diagram"
```
Inside a composite:
```smalltalk
draw
   children do: [:each | each draw ].
```
- Visitor separates algorithms from the object structure. Instead of spreading logic inside all node classes, we create a visitor:
```smalltalk
aNode accept: aVisitor.
```
And each node implements:

```smalltalk
accept: aVisitor
   aVisitor visitCircle: self.
```
This makes it easy to add new operations without changing the entire hierarchy.


Finally, I successfully downloaded and set up the **Sokoban** project.
I started working on the first tasks — counting moves and pushes, and displaying moves.

