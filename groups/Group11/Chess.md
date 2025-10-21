## Link to Chess repo Licensed under MIT : https://github.com/JA-DEL2/Chess-Group11-Obede-JeanAlexis-Adil

# Prepare your repository instructions
## Getting started

### Getting the code

This code has been tested in Pharo 12. You can get it by installing the following baseline code:

```smalltalk
Metacello new
	repository: 'github.com/JA-DEL2/Chess-Group11-Obede-JeanAlexis-Adil:main'; 
	baseline: 'MygChess';
	onConflictUseLoaded;
	load.
```

### Using it

You can open the chess game using the following expression:

```smalltalk
board := MyChessGame freshGame.
board size: 800@600.
space := BlSpace new.
space root addChild: board.
space pulse.
space resizable: true.
space show.
```


# Adil Kata refactoring rendering pieces done

## Code and tests location

* Code is under the `Myg-Chess-Core` package and use the classes MyChesssquare for **renderPiece** and Mypiece classe and subclasses(`MyBishop`, `MyRook`...).
* Tests are in the corresponding test classes in PieceRenderingTest.
* All tests run successfully, it's just a manual testing, no mutation ...

## Difficulties encountered

- At first, understanding how to use double dispatch correctly was confusing.
I solved it by isolating responsibilities between `MyChessSquare` and `MyPiece`, then testing step by step.
The exercises and previous exam (2024) helped me understand dispatch better.
---


### Double Dispatch Implementation (my approach) 

I implemented **double dispatch** for piece rendering. 
Each `MyChessSquare` decides which message to send (`renderOnDarkSquare` or `renderOnLightSquare`) according to its color, and each `MyPiece` (e.g. `MyBishop`, `MyKing`, etc.) decides what symbol to return based on its own color.

**Example:**

```smalltalk
MyChessSquare >> renderPiece: aPiece
    "First dispatch: the square chooses the message"
    ^ (self color isBlack)
        ifTrue:  [ aPiece renderOnDarkSquare ]
        ifFalse: [ aPiece renderOnLightSquare ].

MyBishop >> renderOnDarkSquare
    "Second dispatch: the piece decides what to draw"
    ^ self isWhite
        ifTrue: [ 'B' ]
        ifFalse: [ 'V' ].
```

**Double dispatch:**

 **Good:** Clear separation of responsibilities; easy to extend by adding new classes or behaviors. 
 
 **Bad:** Can lead to many small methods, increasing code complexity and maintenance effort. 

**Table dispatch:**

 **Good:** Centralizes all combinations in one place; easy to see and modify behavior for all cases. 
 
 **Bad:** Less object-oriented; harder to extend with new classes without changing the table; can become unwieldy as cases grow. 
 
In this scenario, double dispatch is better because it keeps the design object-oriented — each class is responsible for its own behavior, and adding new pieces or colors doesn’t require changing existing code. Table dispatch would centralize all cases but break encapsulation and make extensions harder. Double dispatch is cleaner and more maintainable here.


## Design Decisions

* **Why is the code like this?**
  I chose double dispatch (goal of this kata) to separate responsibilities: `MyChessSquare` decides which rendering method to call based on its color, and each `MyPiece` decides what symbol to display. This avoids large nested conditionals and keeps the design object-oriented.

* **Why is this part of the code more tested than the other?**
  Rendering logic is critical because it directly affects visual output and user experience. We focused tests on `renderPiece:` and the piece-specific `renderOnDarkSquare` / `renderOnLightSquare` methods to ensure all color and piece combinations work correctly.

* **Where did you put the priorities?**
  Priority was given to **correct rendering first**, then code readability, and finally extensibility for new pieces or board types.

* **Where did you use (or not) design patterns and why?**
  We used the **double dispatch pattern** to handle piece–square interactions cleanly. We avoided table dispatch because it would centralize all combinations, break encapsulation, and make the code harder to extend.


#Obed 

# Alexis 





