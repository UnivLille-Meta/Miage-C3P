Weekly Report5

Yuliia LOS:

This week I studied several presentations about Double Dispatch and the Visitor Design Pattern. These topics helped me understand how to design clean, extensible, and object-oriented systems without using many if statements.

Double Dispatch means that a program chooses the right method depending on both objects — the one that sends the message and the one that receives it. This technique lets two objects decide together what to do. For example, in the Stone–Paper–Scissors game, each object knows how to play against another:

Stone >> vs: anElement

   ^ anElement playAgainstStone

If the argument is Paper, it will call Paper >> playAgainstStone which returns #paper, meaning that paper wins. The same logic works for Scissors or Stone, and we can even extend the game with new elements like Lizard or Spock without changing the old code.

Another example was about adding numbers using Double Dispatch. The idea is to handle different combinations like Integer + Float, Float + Fraction, etc., without conditions. Each number class knows how to interact with the others:

Integer >> + aNumber
   
   ^ aNumber sumWithInteger: self

and

Float >> sumWithInteger: anInteger
   
   ^ addf(self, asFloat(anInteger))

This way, the correct operation is chosen automatically based on both types.

Then I learned about the Visitor Design Pattern, which also uses Double Dispatch. Visitor separates operations from the objects they work on. For example, in an expression like 1 + (3 * 2), we can use a Printer visitor to print it or an Evaluator visitor to calculate the result. Each expression element (Number, Plus, Times) only needs to implement:

acceptVisitor: aVisitor
   
   ^ aVisitor visitPlus: self

This makes it easy to add new operations (like “evaluate” or “pretty-print”) without modifying the original expression classes.

From these lessons, I understood that sending messages is a key idea in Pharo — it’s how we make choices in a pure object-oriented way. Double Dispatch and Visitor make programs more modular and easier to extend.

All the information was taken from the course materials on the website: https://advanced-design-mooc.pharo.org/

I also continued working on my Chess project this week.

# WeekReport №5 - Sofia Demchuk 
This week I studied two presentations from the Advanced Object-Oriented Design MOOC on https://advanced-design-mooc.pharo.org/:
- M6-1: Double Dispatch Starter – Stone Paper Scissors
- M6-2: Double Dispatch – Does not have to be symmetrical

Both talks helped me understand how double dispatch works and how it can replace big chains of if statements with a more flexible and modular design.

# Lecture 1 – Double Dispatch Starter: Stone, Paper, Scissors

The first lecture used the simple game “Stone, Paper, Scissors” to explain how double dispatch allows two objects to cooperate in choosing the right behavior without conditions.

The goal was to implement:
```smalltalk
Stone new vs: Paper new  → #paper
Paper new vs: Stone new  → #paper
```

Instead of using if or case, we let each object decide what to do through message sending:


```smalltalk
Stone >> vs: anElement
   ^ anElement playAgainstStone

Paper >> playAgainstStone
   ^ #paper

Scissors >> playAgainstStone
   ^ #stone

Stone >> playAgainstStone
   ^ #draw
```


Here, the system first chooses the vs: method based on the receiver (Stone),
and then sends another message - playAgainstStone to the argument.
This way, the correct result is selected dynamically — that’s the essence of double dispatch.

I learned that:
- Sending a message is a choice.
- Double dispatch uses two message sends to decide based on two objects.
- It makes the code modular and easy to extend — for example, we can add Lizard and Spock without changing existing code.

# Lecture 2 – Double Dispatch: Does Not Have to Be Symmetrical

The second presentation showed that double dispatch can be asymmetrical — it doesn’t always mean both sides behave the same way.

It started with a messy example full of nested if statements:


```smalltalk
GameView >> drawBlock: aBlock on: aCanvas
aBlock isWall
   ifTrue: [ self drawWall: aCanvas ]
   ifFalse: [ aBlock isEmptyBlock
      ifTrue: [ ... ]
      ifFalse: [ ... ] ].
```
This design is hard to maintain and extend.

The improved version used double dispatch:

```smalltalk
GameView >> drawBlock: aBlock on: aCanvas
   aBlock drawOn: aCanvas view: self

Wall >> drawOn: aCanvas view: aView
   aView drawWall: aCanvas

EmptyBlock >> drawOn: aCanvas view: aView
   aView drawEmptyBlock: aCanvas
```

Now, each block object , like Wall or EmptyBlock, knows how to draw itself, and the view just asks the block to do so.
This makes the design modular and extensible, and no conditions are needed.

I learned that:
	•	Double dispatch does not have to be symmetrical — one object , like GameView can delegate control to another - Block.
	•	It creates variation points without hardcoding logic.
	•	Sending messages replaces conditional checks and improves flexibility.

# Project: Chess — Game Replay (with Yulia)

This week I finally launched the Chess project successfully.
I am working in a pair with Yulia, and our task is to create the Game Replay feature.

The goal is to import a chess game from a PGN file and let the user go forward and backward through all the moves.
Like watching an old game step by step.

We **plan** to add simple buttons for this:
⏮ Start, ◀ Back, ▶ Next, ⏭ End.

What I understood about how to do it :

- So , to make replay work, we need a good history system that can go **both directions** — forward and backward.Right now, it looks like the history works only one way, so we will need to fix or improve it.

- Each move should be easy to apply and undo, so that after going forward and backward the board looks the same as before.

- PGN files are sometimes messy, so the parser should be tolerant — if it finds something unknown, it should just skip it and continue.We start with normal moves and later can add special cases like castling, promotion, or en passant.

 What things we need to check : 
- A simple PGN file can be read correctly.
- Going forward through all moves and then backward returns the board to the start.
- Special moves (promotion, castling, etc.) work correctly.
- The replay stops safely if the PGN has an error.
- The “Next” and “Back” buttons don’t crash when at the end or beginning of the game.


