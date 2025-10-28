## Link to the project: https://github.com/JA-DEL2/Chess-Group11-Obede-JeanAlexis-Adil

## Installation Instructions

### Prerequisites
- Pharo 12 installed on your system

### Installation Steps

1. **Clone the repository**
```bash
git clone https://github.com/JA-DEL2/Chess-Group11-Obede-JeanAlexis-Adil
cd Chess
```

2. **Load the baseline in Pharo 12**
```smalltalk
Metacello new
    repository: 'github://UnivLille-Meta/Chess:main';
    baseline: 'MygChess';
    onConflictUseLoaded;
    load.
```

3. **Wait for dependencies to load**
   - Bloc (graphics framework)
   - Toplo (UI components)
   - Chess font assets

## Usage Instructions

### Running the Game

```smalltalk
board := MyChessGame freshGame.
board size: 800@600.
space := BlSpace new.
space root addChild: board.
space pulse.
space resizable: true.
space show.
```


# Adil

# Chess - Kata "Refactoring rendering pieces done"

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


# Obede 

## Chess - Kata "Add Pawn Promotion"

## Kata Objective

### Implement pawn promotion with:
- **UI players**: Dialog to choose piece (Queen/Rook/Bishop/Knight)
- **Bots**: Automatic promotion to Queen

---
## Testing Pawn Promotion

### 1. Manual testing with UI:

- Move a pawn to the last rank (row 8 for white, row 1 for black)
- A dialog window will appear asking you to choose a piece
- Click on your preferred piece (Queen, Rook, Bishop, or Knight)


### 2. Testing with Bot:

- Click the "Play!" button
- Bots automatically promote pawns to queens

## Reverse Engineering Process (Following Course Methodology)

### 1. High-Level View (FOCUS)

**Initial mapping:**
- `MyChessGame >> move:to:` → central move execution point
- `MyPawn` → has movement, missing promotion
- `MyPlayer` → represents player

**BACKLOG (ignored):** Bloc internals, other rules (castling, en passant), rendering details

### 2. Finding Entry Point

**Tool used:** Senders of `move:to:`

**Found:**
```smalltalk
MyChessGame >> move: piece to: square
    piece moveTo: square.
    self recordMovementOf: piece to: square.
    "← No promotion handling here"
```

**Decision:** Hook into this method after move execution.

### 3. Progressive Implementation

#### Step 1: Detection
```smalltalk
MyPawn >> isPromotable
    ^(self isWhite and: [ self square file = $8 ])
        or: [ self color isBlack and: [ self square file = $1 ]].

MyPawn >> shouldBePromoted
    ^ self isPromotable.
```

#### Step 2: Integration
```smalltalk
MyChessGame >> move: piece to: square
    piece moveTo: square.
    self recordMovementOf: piece to: square.
    
    (piece shouldBePromoted) ifTrue: [
        currentPlayer promotion promoteAsync: piece inGame: self
    ]
```

#### Step 3: Double Dispatch (Course Concept!)

**Hierarchy created:**
```
MyPromotion
    ├── BotPromotion (auto Queen)
    └── UIPromotion (dialog)
```

**Double dispatch flow:**
```smalltalk
currentPlayer promotion              "1st dispatch → get strategy"
    ↓
promotion promoteAsync: piece inGame: "2nd dispatch → execute behavior"
```


#### Step 4-5: Implementation

**BotPromotion (simple):**
```smalltalk
BotPromotion >> promoteAsync: aPawn inGame: aGame
    | newPiece square |
    square := aPawn square.
    newPiece := MyQueen new.
    newPiece color: aPawn color.
    newPiece square: square.
    square contents: newPiece
```

**UIPromotion (complex):**
- Used `BlElement`, `ToButton`, `BlSpace` (found via References tool)
- Created dialog with 4 buttons (Q/R/B/N)
- Each button replaces pawn and closes window
<p align="center">
  <img src="https://github.com/JA-DEL2/Chess-Group11-Obede-JeanAlexis-Adil/blob/main/add_pawn_promotion.png">
</p>

## Key Design Decisions

### 1. Double Dispatch Pattern

**Why?** Same pattern as piece rendering already in codebase.

**Benefits:**
- No `if bot then... else...` conditionals
- Easy to extend (add NetworkPromotion later)
- Decouples game logic from promotion behavior

### 2. Hook Method `shouldBePromoted`

**Instead of:** `(piece isKindOf: MyPawn) and: [...]`

**Use:** `piece shouldBePromoted` (polymorphic, all pieces respond)

### 3. Default BotPromotion

Safe fallback in `MyPlayer >> initialize` for tests and error prevention.

---

## Testing

```smalltalk
MyPromotionTest >> testBotPromotionCreatesQueen
    game := MyChessGame freshGame.
    board := game board.
    board at: 'e8' put: (pawn := MyPawn white).
    
    promotion := BotPromotion new.
    promotion promoteAsync: pawn inGame: game.
    
    self assert: (board at: 'e8') contents class equals: MyQueen.
```

**Coverage:** Automated tests for logic, manual tests for UI.

---

## What I Learned

**Technical:**
- Applied double dispatch (first time implementing myself)
- Used Senders/References tools to navigate codebase
- Worked with Bloc/Toplo framework through exploration

**Methodological:**
- High-Level View → Entry Point → Progressive Implementation
- "Ignore to Focus" strategy (BACKLOG management)
- Recognized and reused existing patterns (rendering → promotion)

---

## Code Location

```
src/Myg-Chess-Core/
├── MyPromotion.class.st      # Abstract
├── BotPromotion.class.st     # Auto Queen
└── UIPromotion.class.st      # Dialog

src/Myg-Chess-Tests/
├── MyPromotionTest.class.st
└── MyPawnTest.class.st
```



