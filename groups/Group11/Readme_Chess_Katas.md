## Link to TP-Chess Repository: https://github.com/JA-DEL2/Chess-Group11-Obede-JeanAlexis-Adil

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


# Obed 

## Chess - Kata "Add Pawn Promotion"

### Testing Pawn Promotion

1. **Manual testing with UI:**
   - Move a pawn to the last rank (row 8 for white, row 1 for black)
   - A dialog window will appear asking you to choose a piece
   - Click on your preferred piece (Queen, Rook, Bishop, or Knight)

2. **Testing with Bot:**
   - Click the "Play!" button
   - Bots automatically promote pawns to queens

### Running Tests

```smalltalk
"Run all tests"
MyPromotionTest suite run.
MyPawnTest suite run.

"Run specific test"
MyPromotionTest new testBotPromotionCreatesQueen.
```

## Code Location

```
src/
├── Myg-Chess-Core/          # Main game logic
│   ├── MyChessGame.class.st # Game controller
│   ├── MyPawn.class.st      # Pawn piece with promotion detection
│   ├── MyPlayer.class.st    # Player with promotion strategy
│   ├── MyPromotion.class.st # Abstract promotion strategy
│   ├── BotPromotion.class.st # Automatic promotion
│   └── UIPromotion.class.st  # Interactive promotion dialog
├── Myg-Chess-Tests/         # Test suites
│   ├── MyPromotionTest.class.st
│   └── MyPawnTest.class.st
```

---

## Kata Completed: Add Pawn Promotion

### Objective
Implement pawn promotion when pawns reach the last rank of the board:
- **For UI players**: Display a dialog to choose the promotion piece
- **For bots**: Automatic promotion to Queen

---

## Reverse Engineering Process

### 1. Problem Understanding (FOCUS)

**Initial questions from the kata:**
1. Where to place the new code?
2. How to implement the graphical part?
3. How to manage bots without breaking existing code?

**Initial code mapping:**
- `MyChessGame` → game controller
- `MyPawn` → pawn piece
- `MyPlayer` → player representation
- `MyPiece` → parent class for pieces
- `MyChessSquare` → board square

**BACKLOG (temporarily ignored):**
- Other piece movements
- FEN/PGN parsers
- Bloc/Toplo framework internals

### 2. Existing Flow Analysis

**Entry point discovery:**
Examining `MyChessGame`, I found the `move:to:` method:

```smalltalk
MyChessGame >> move: piece to: square
    piece moveTo: square.
    self recordMovementOf: piece to: square.
```

**Finding:** No promotion handling. This is where intervention is needed.

**MyPawn analysis:**
The `MyPawn` class had movement methods but nothing for promotion detection.

### 3. Progressive Implementation

#### Step 1: Promotion Detection
**Added to MyPawn:**
```smalltalk
MyPawn >> isPromotable
    ^(self isWhite and: [ self square file = $8 ])
        or: [ self color isBlack and: [ self square file = $1 ]].

MyPawn >> shouldBePromoted
    ^ self isPromotable.
```

**Logic:** White pawn on rank 8 or black pawn on rank 1 must be promoted.

#### Step 2: Game Flow Integration
**Modified MyChessGame >> move:to::**
```smalltalk
MyChessGame >> move: piece to: square
    piece moveTo: square.
    self recordMovementOf: piece to: square.
    
    (piece shouldBePromoted) ifTrue: [
        currentPlayer promotion promoteAsync: piece inGame: self
    ]
```

**Observation:** Need different promotion strategies for Bot vs UI.

#### Step 3: Strategy Pattern Application
**Created hierarchy:**
```
MyPromotion (abstract class)
    ├── BotPromotion (automatic promotion)
    └── UIPromotion (user dialog)
```

**Added to MyPlayer:**
```smalltalk
MyPlayer >> initialize
    super initialize. 
    promotion := BotPromotion new.

MyPlayer >> useUIPromotion
    self promotion: UIPromotion new.

MyPlayer >> useBotPromotion
    self promotion: BotPromotion new.
```

#### Step 4: Bot Promotion (Simple)
```smalltalk
BotPromotion >> promoteAsync: aPawn inGame: aGame
    | newPiece square |
    square := aPawn square.
    newPiece := MyQueen new.
    newPiece color: aPawn color.
    newPiece square: square.
    square contents: newPiece
```

**Principle:** Directly replace pawn with queen.

#### Step 5: UI Promotion (Complex)
**Documentation research:**
- Explored existing Bloc classes in the project
- Analyzed `MyChessGame` and `MyChessSquare` to understand Bloc
- Identified `ToButton` and `BlElement` as UI components

**Implementation structure:**
```smalltalk
UIPromotion >> promoteAsync: aPawn inGame: aGame
    | space container |
    
    "1. Main container"
    container := BlElement new
        layout: (BlLinearLayout vertical cellSpacing: 15);
        background: Color white;
        padding: (BlInsets all: 25);
        ...
    
    "2. Create button for each piece"
    { ('Q Queen' -> MyQueen).
      ('R Rook'  -> MyRook).
      ('B Bishop' -> MyBishop).
      ('N Knight' -> MyKnight)
    } do: [ :pair |
        button whenClickedDo: [ 
            | newPiece square |
            square := aPawn square.
            newPiece := pair value new.
            newPiece color: aPawn color.
            newPiece square: square.
            square contents: newPiece.
            space close ].
        container addChild: button ].
    
    "3. Display window"
    space := BlSpace new.
    space root addChild: container.
    space show
```

#### Step 6: Initial Configuration
**In MyChessGame >> initializeFromFENGame::**
```smalltalk
whitePlayer useUIPromotion. 
blackPlayer useUIPromotion.
```

### 4. Reverse Engineering Tools Used

**Flow followed:**
```
High-Level View → Find Entry Point → Progressive Implementation
```

**Tools:**
- **Code reading**: `MyChessGame`, `MyPawn`
- **Senders of move:to:**: to understand the flow
- **References of BlElement**: to understand Bloc
- **Manual testing**: to validate each step

**"Ignore to Focus" strategy:**

**IGNORED:**
- Bloc/Toplo internal complexity
- Font loading details
- Advanced rendering
- Other chess rules

**FOCUSED:**
- Promotion detection
- Flow integration
- Strategy Pattern
- Minimal functional UI

---

## Design Decisions

### 1. Why Strategy Pattern?

**Problem:** Two completely different behaviors (Bot vs UI) for the same action (promotion).

**Solution:** Strategy Pattern allows:
- Clean separation of concerns
- Easy addition of new promotion strategies
- No conditional logic in game flow
- Testability of each strategy independently

### 2. Why Asynchronous Promotion?

The method `promoteAsync:inGame:` was chosen because:
- UI promotion requires user interaction (non-blocking)
- Maintains consistency between Bot and UI strategies
- Future-proof for network play or AI thinking time

### 3. Why Default to BotPromotion?

In `MyPlayer >> initialize`, the default is `BotPromotion` because:
- Safe fallback behavior
- Prevents null pointer errors
- Ensures automated testing works without UI

### 4. Code Organization Priorities

**High priority:**
1. Promotion detection correctness (ranks 1 and 8)
2. Strategy pattern implementation
3. UI functionality

**Lower priority (acceptable technical debt):**
4. UI aesthetics and animations
5. Promotion undo functionality
6. Advanced promotion rules (e.g., underpromotion tracking)

### 5. Testing Strategy

**More tested:**
- Promotion conditions (`isPromotable`)
- Bot promotion logic
- Game flow integration

**Less tested:**
- UI rendering (requires visual inspection)
- Font loading
- Bloc framework integration

**Rationale:** Core logic is critical and easily testable. UI is validated manually.

---

## Difficulties Encountered and Solutions

### Difficulty 1: Constructor Error
**Problem:** `MyChessGame new` throws error "Please use one of the other constructors"

**Solution:** Use proper constructors:
```smalltalk
MyChessGame freshGame
MyChessGame fromFENString: 'fen...'
```

### Difficulty 2: Understanding Bloc Framework
**Problem:** No prior knowledge of Bloc/Toplo UI framework

**Solution:**
- Analyzed existing UI code in `MyChessGame` and `MyChessSquare`
- Identified patterns: `BlElement`, `ToButton`, `BlLinearLayout`
- Built minimal working UI through experimentation
- Ignored advanced features (animations, styling)

### Difficulty 3: Piece Replacement
**Problem:** How to properly replace pawn with new piece?

**Solution:** Discovered the pattern:
```smalltalk
newPiece square: square.
square contents: newPiece.
```
This maintains bidirectional association between piece and square.

---

## What I Learned

### Technical Skills
Finding the right insertion point in existing flow  
Applying Strategy Pattern for behavior separation  
Creating dialogs with Bloc/Toplo  
Integrating code without breaking existing functionality  
Using proper Pharo constructors and class methods

### Methodological Skills
Reverse engineering methodology (High-Level → Entry Point → Implementation)  
"Ignore to Focus" strategy for managing complexity  
Progressive implementation (detection → bot → UI)  
Testing at each step  

---



# Alexis 





