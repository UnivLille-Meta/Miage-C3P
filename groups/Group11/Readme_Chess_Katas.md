## Link to TP-Chess Repository: https://github.com/JA-DEL2/Chess-Group11-Obede-JeanAlexis-Adil

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

# Chess - Kata "Add Pawn Promotion"

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

### Kata Guiding Questions
1. What tools help you find the right place to put this new code?
2. How can you find documentation and help to understand the graphical part that will implement, for example, a pop-up?
3. The bot will not need a UI, how would you make it work without breaking the other existing code?

---

## Reverse Engineering Process

Following the methodology from "Reverse Engineering Pharo's LRUCache", I applied a structured approach to understand and extend the codebase.

### 1. Problem Understanding (FOCUS)

**FOCUS: What needs to be done?**
- Detect when a pawn reaches the last rank
- Provide two different behaviors: UI dialog vs automatic promotion
- Integrate seamlessly into existing game flow

**Initial code mapping:**
- `MyChessGame` → game controller, coordinates moves
- `MyPawn` → pawn piece implementation
- `MyPlayer` → represents a player (human or bot)
- `MyPiece` → abstract parent class for all pieces
- `MyChessSquare` → board square representation

**BACKLOG (temporarily ignored):**
- Other piece movement rules (castling, en passant)
- FEN/PGN parsers implementation details
- Bloc/Toplo framework internals
- Rendering optimization
- Move validation complexity

### 2. High-Level View: Finding the Entry Point

**Tool used: Senders and References**

I searched for where pieces move in the game:

**Found in `MyChessGame >> move:to:`:**
```smalltalk
MyChessGame >> move: piece to: square
    piece moveTo: square.
    self recordMovementOf: piece to: square.
```

**Key observation:** 
- This is the central point where ALL moves are executed
- No promotion handling exists
- This is where I need to intervene

**Reading `MyPawn` class:**
- Has `targetSquaresLegal:` for movement
- Has `moveTo:` inherited from `MyPiece`
- **Missing:** Detection of when promotion should happen

**Decision:** Add promotion detection in `MyPawn`, hook into `MyChessGame >> move:to:`

### 3. Progressive Implementation

#### Step 1: Promotion Detection

**Implementation in MyPawn:**
```smalltalk
MyPawn >> isPromotable
    "A pawn is promotable when it reaches the opponent's back rank"
    ^(self isWhite and: [ self square file = $8 ])
        or: [ self color isBlack and: [ self square file = $1 ]].

MyPawn >> shouldBePromoted
    "Hook method to check if this piece needs promotion"
    ^ self isPromotable.
```

**Design decision:** 
- `shouldBePromoted` is a polymorphic hook that returns `false` by default in `MyPiece`
- Only `MyPawn` overrides it to return `true` when on last rank
- This avoids type checking (`piece isKindOf: MyPawn`)

#### Step 2: Game Flow Integration

**Modified `MyChessGame >> move:to:`:**
```smalltalk
MyChessGame >> move: piece to: square
    piece moveTo: square.
    self recordMovementOf: piece to: square.
    
    (piece shouldBePromoted) ifTrue: [
        currentPlayer promotion promoteAsync: piece inGame: self
    ]
```

**Observation:** 
- Need `currentPlayer promotion` to return something
- Need different behaviors for Bot vs UI
- This is a **double dispatch** opportunity!

#### Step 3: Double Dispatch with Polymorphism

**Problem:** Bot and UI have completely different promotion behaviors.

**Solution:** Double dispatch pattern 

**Created hierarchy:**
```
MyPromotion (abstract class - defines interface)
    ├── BotPromotion (automatic promotion to queen)
    └── UIPromotion (displays dialog for user choice)
```

**Why double dispatch?**
```smalltalk
"First dispatch: Get the promotion strategy from player"
currentPlayer promotion  
    ↓
"Second dispatch: Execute the appropriate promotion behavior"
promotion promoteAsync: piece inGame: self
```

**Added to MyPlayer:**
```smalltalk
MyPlayer >> initialize
    super initialize. 
    promotion := BotPromotion new.  "Safe default"

MyPlayer >> useUIPromotion
    self promotion: UIPromotion new.

MyPlayer >> useBotPromotion
    self promotion: BotPromotion new.

MyPlayer >> promotion
    ^ promotion
```

#### Step 4: BotPromotion Implementation (Simple)

```smalltalk
BotPromotion >> promoteAsync: aPawn inGame: aGame
    "Automatic promotion: always promote to Queen"
    | newPiece square |
    square := aPawn square.
    newPiece := MyQueen new.
    newPiece color: aPawn color.
    newPiece square: square.
    square contents: newPiece
```

**Design principle:** 
- Simple and deterministic behavior
- No user interaction needed
- Fast execution for automated play

#### Step 5: UIPromotion Implementation (Complex)

**Challenge:** How to create a dialog in Bloc/Toplo?

**Tools used for research:**
- **References of `BlElement`:** Found how UI elements are created
- **Senders of `BlSpace`:** Found how windows are shown
- **Reading `MyChessGame`:** Found examples of `ToButton` usage
- **Reading `MyChessSquare`:** Found layout patterns

**Implementation structure:**
```smalltalk
UIPromotion >> promoteAsync: aPawn inGame: aGame
    "Show dialog for user to choose promotion piece"
    | space container |
    
    "1. Create main container with vertical layout"
    container := BlElement new
        layout: (BlLinearLayout vertical cellSpacing: 15);
        background: Color white;
        padding: (BlInsets all: 25);
        geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
        constraintsDo: [ :c |
            c horizontal fitContent.
            c vertical fitContent ];
        yourself.
    
    "2. Add title"
    container addChild: (BlTextElement new
        text: ('Choose your piece' asRopedText 
            fontSize: 17;
            yourself);
        yourself).
    
    "3. Create a button for each possible piece"
    { ('Q Queen' -> MyQueen).
      ('R Rook'  -> MyRook).
      ('B Bishop' -> MyBishop).
      ('N Knight' -> MyKnight)
    } do: [ :pair |
        | button label |
        
        "Create label with icon + text"
        label := BlElement new
            layout: (BlLinearLayout horizontal cellSpacing: 10);
            constraintsDo: [ :c | 
                c horizontal fitContent.
                c vertical fitContent ];
            yourself.
        
        "Add chess piece icon"
        label addChild: (BlTextElement new
            text: (pair key first asString asRopedText
                fontSize: 24;
                fontName: MyOpenChessDownloadedFont new familyName;
                yourself);
            yourself).
        
        "Add piece name"
        label addChild: (BlTextElement new
            text: (pair key allButFirst asRopedText
                fontSize: 16;
                yourself);
            yourself).
        
        "Create the button"
        button := ToButton new.
        button removeChildren.
        button addChild: label.
        button geometry: (BlRoundedRectangleGeometry cornerRadius: 8).
        button padding: (BlInsets all: 15).
        button constraintsDo: [ :c | c horizontal matchParent ].
        
        "APPLY promotion on click"
        button whenClickedDo: [ 
            | newPiece square |
            square := aPawn square.
            newPiece := pair value new.  "pair value contains the CLASS"
            newPiece color: aPawn color.
            newPiece square: square.
            square contents: newPiece.
            space close ].
        
        container addChild: button ].
    
    "4. Display the window"
    space := BlSpace new.
    space root addChild: container.
    space title: 'Pawn Promotion'.
    space extent: 250@250.
    space show
```

**Key discoveries:**
- `BlElement` is the base for all UI components
- `BlLinearLayout` for vertical/horizontal arrangements
- `ToButton` for buttons (from Toplo)
- `BlSpace` creates a new window
- Chess font already available via `MyOpenChessDownloadedFont`

#### Step 6: Initial Configuration

**In `MyChessGame >> initializeFromFENGame:`:**
```smalltalk
whitePlayer useUIPromotion. 
blackPlayer useUIPromotion.
```

**Design decision:** Default to UI promotion for interactive play. Tests can override with `useBotPromotion` for automated testing.

### 4. Reverse Engineering Methodology Applied

**Flow followed (from course):**
```
High-Level View → API Usage → Implementation Details
```

**Specific flow for this kata:**
```
1. Understand WHAT: Pawn promotion feature
2. Find WHERE: MyChessGame >> move:to: entry point
3. Implement: Detection → Bot → UI
```

**Tools used:**
- **Senders:** Found where `move:to:` is called
- **References:** Found usage patterns of `BlElement`, `MyPlayer`
- **Implementors:** Saw how other pieces implement movement
- **Code reading:** Analyzed existing rendering double dispatch
- **Comments:** Found intent in `MyChessGame` class comment


## Design Decisions

### 1. Why Double Dispatch?

**Problem:** Two completely different behaviors (Bot vs UI) for the same action (promotion).

**Solution:** Double dispatch with polymorphism

**How it works:**
```smalltalk
"Step 1: First dispatch - get strategy from player"
currentPlayer promotion
    ↓ returns BotPromotion or UIPromotion
    
"Step 2: Second dispatch - execute the strategy"
promotion promoteAsync: piece inGame: self
    ↓ calls either BotPromotion>>promoteAsync:inGame:
              or UIPromotion>>promoteAsync:inGame:
```

**Why double dispatch specifically?**
1. **Decouples game logic from promotion strategy**
   - `MyChessGame` doesn't know about Bot vs UI
   - Just calls `currentPlayer promotion promoteAsync:...`

2. **Follows existing codebase pattern**
   - Rendering already uses double dispatch: `square renderPiece: aPiece` → `aPiece renderOnLightSquare`
   - Promotion uses the same pattern: `currentPlayer promotion` → `promotion promoteAsync:...`

3. **Easy to extend**
   - Add `NetworkPromotion` for multiplayer
   - Add `AIPromotion` with evaluation logic
   - No changes needed in `MyChessGame`

4. **No type checking needed**
   - No `if player isBot then ... else ...`
   - Polymorphism handles the dispatch

**Course principle applied:** Same double dispatch pattern as piece rendering.

### 2. Why `shouldBePromoted` Hook Method?

**Instead of:**
```smalltalk
(piece isKindOf: MyPawn) and: [ piece isPromotable ]
```

**We use:**
```smalltalk
piece shouldBePromoted
```

**Advantages:**
- Polymorphic (all pieces respond to it)
- Default returns `false` in `MyPiece`
- Only `MyPawn` overrides to check rank
- Avoids type checking with `isKindOf:`
- Open for extension (other pieces could be promotable in variants)

### 3. Why Asynchronous `promoteAsync:inGame:`?

**Why "Async" in the name?**
- UI promotion requires user interaction (not immediate)
- Keeps interface consistent between Bot and UI
- Future-proof for network play or AI thinking time
- Even though it's not truly asynchronous in Pharo, the name signals the non-immediate nature

### 4. Why Default to BotPromotion?

**In `MyPlayer >> initialize`:**
```smalltalk
promotion := BotPromotion new.
```

## What I Learned

### Technical Skills Acquired

**Finding the right insertion point** in an existing codebase
- Used Senders/References tools effectively
- Identified `MyChessGame >> move:to:` as the entry point

**Implementing double dispatch** pattern
- First time applying it myself (only saw it in rendering before)
- Understood how it decouples sender from receiver behavior

**Using polymorphism** to eliminate conditionals
- Created class hierarchy with common interface
- Each subclass implements behavior its own way

**Delegation** for separation of concerns
- `MyPlayer` delegates to `promotion` strategy
- Reduces coupling between player and promotion logic

**Working with Bloc/Toplo** UI framework
- Created windows, buttons, layouts
- Used text elements with custom fonts
- Handled button click events

**Understanding Pharo conventions**
- Class-side constructors (`freshGame`, `fromFENString:`)
- Instance-side initialization (`initialize`)
- Hook methods (`shouldBePromoted`)

### Methodological Skills Acquired

**Reverse engineering methodology** (from course)
- High-Level View → Find Entry Point → Progressive Implementation
- Used tools systematically (Senders, References, Implementors)

**"Ignore to Focus" strategy**
- Identified what to ignore (Bloc internals, animations)
- Focused on essential functionality (detection, bot, UI)
- Kept technical debt list (BACKLOG)

**Progressive implementation**
- Step 1: Detection only
- Step 2: Game integration
- Step 3: Double dispatch structure
- Step 4: Bot implementation
- Step 5: UI implementation
- Step 6: Configuration



