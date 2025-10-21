## Link to Chess repo : https://github.com/JA-DEL2/Chess-Group11-Obede-JeanAlexis-Adil

# Adil Kata refactoring rendering pieces 

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


