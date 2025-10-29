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

# Chess - Kata "Refactor piece rendering"

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

---

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

---

## Progressive Implementation Steps

### Step 1: Detection Logic
```smalltalk
MyPawn >> shouldBePromoted
    ^ self isPromotable.

MyPawn >> isPromotable
    ^ (self isWhite and: [ self square file = $8 ])
        or: [ self isBlack and: [ self square file = $1 ]].
```

**Hook Method Pattern:** All pieces respond to `shouldBePromoted` (default: `false`).

### Step 2: Integration Point
```smalltalk
MyChessGame >> move: piece to: square
    piece moveTo: square.
    self recordMovementOf: piece to: square.
    
    (piece shouldBePromoted) ifTrue: [
        currentPlayer promotion promoteAsync: piece inGame: self
    ]
```

### Step 3: Strategy Hierarchy Creation
```
MyPromotion (abstract)
    ├── BotPromotion (concrete strategy #1)
    └── UIPromotion (concrete strategy #2)
```

### Step 4: BotPromotion Implementation

```smalltalk
MyPromotion subclass: #BotPromotion

BotPromotion >> promoteAsync: aPawn inGame: aGame
    "Strategy: Always promote to Queen (optimal choice)"
    | newPiece square |
    square := aPawn square.
    newPiece := MyQueen new.
    newPiece color: aPawn color.
    newPiece square: square.
    square contents: newPiece
```

### Step 5: UIPromotion Implementation
Complex, asynchronous, requires Bloc framework exploration.

<p align="center">
  <img src="https://github.com/JA-DEL2/Chess-Group11-Obede-JeanAlexis-Adil/blob/main/add_pawn_promotion.png">
</p>

---
## Design Pattern: Strategy Pattern Application

### What is the Strategy Pattern?

The **Strategy Pattern** defines a family of algorithms, encapsulates each one, and makes them interchangeable. The strategy lets the algorithm vary independently from clients that use it.

**Key components:**
- **Context**: The object that uses a strategy (`MyPlayer`)
- **Strategy Interface**: Common protocol (`MyPromotion`)
- **Concrete Strategies**: Different implementations (`BotPromotion`, `UIPromotion`)

### Why Strategy Pattern for Promotion?

**Problem:** Different players need different promotion behaviors:
- Human players → need UI dialog to choose
- Bot players → automatic Queen promotion

**Without Strategy Pattern (Bad approach):**
```smalltalk
MyChessGame >> handlePromotion: aPawn
    currentPlayer isBot
        ifTrue: [ "create Queen automatically" ]
        ifFalse: [ "show dialog, wait for choice..." ]
```

**Problems with this approach:**
- Violates Open/Closed Principle (can't add new player types)
- Game logic mixed with player-specific behavior
- Hard to test each behavior independently
- No polymorphism

**With Strategy Pattern (Good approach):**
```smalltalk
MyChessGame >> move: piece to: square
    piece moveTo: square.
    self recordMovementOf: piece to: square.
    
    (piece shouldBePromoted) ifTrue: [
        currentPlayer promotion promoteAsync: piece inGame: self
    ]
```

### 4. **Polymorphism**
No conditionals (`if/else`), just polymorphic message sends:
```smalltalk
currentPlayer promotion promoteAsync: piece inGame: self
```

The same message, different behaviors based on the strategy object.

### 5. **Reusability**
Strategies are reusable objects:
```smalltalk
sharedBotStrategy := BotPromotion new.
bot1 promotion: sharedBotStrategy.
bot2 promotion: sharedBotStrategy.
```
----
## Testing

```smalltalk
MyPromotionTest >> testBotPromotionCreatesQueenWithCorrectColor
    | board pawn square promotion |
    board := MyChessBoard empty.
    board at: 'd8' put: (pawn := MyPawn white).
    square := board at: 'd8'.
    
    promotion := BotPromotion new.
    promotion promoteAsync: pawn inGame: nil.
    
    self assert: square contents class equals: MyQueen.
    self assert: square contents color equals: Color white.
```

**Coverage:** Automated tests for logic, manual tests for UI.

---

## What I Learned

### Technical Skills

**Pattern Recognition:**
- Identified where Strategy Pattern fits naturally
- Understood when to use Strategy vs Double Dispatch

**Implementation:**
- Created abstract class with `subclassResponsibility`
- Implemented two concrete strategies with different complexities
- Used Bloc/Toplo framework through exploration (References tool)

**Testing:**
- Wrote unit tests for isolated strategies
- Used manual testing for UI validation

### Methodological Skills

**Reverse Engineering:**
1. High-Level View → identified key classes
2. Entry Point → found `move:to:` using Senders
3. Progressive Implementation → detection → integration → strategies


**Course Concepts Applied:**
- Strategy Pattern (main pattern)
- Hook Method Pattern (`shouldBePromoted`)
- Template Method (abstract `MyPromotion`)
- Polymorphism over conditionals
- "Ignore to Focus" (BACKLOG management)


## Code Location

```
src/Myg-Chess-Core/
├── MyPromotion.class.st      # Abstract strategy
├── BotPromotion.class.st     # Concrete strategy #1
├── UIPromotion.class.st      # Concrete strategy #2
├── MyPlayer.class.st         # Context (holds strategy)
├── MyPawn.class.st           # Detection logic
└── MyChessGame.class.st      # Integration point

src/Myg-Chess-Tests/
├── MyPromotionTest.class.st  # Strategy tests
└── MyPawnTest.class.st       # Detection tests
```

# JeanAlexis


