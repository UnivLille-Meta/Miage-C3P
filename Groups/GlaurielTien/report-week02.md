# Weekly Report 02

## Glauriel

### 1. Chess Exercise – Understanding the Codebase

I chose to work on the first problem in the Chess Game repository, called “Fix pawn moves!”.

I started by understanding the different classes and the relationships between them. Each class has a specific role in the game: MyChessBoard represents the chessboard, MyChessSquare represents a square on the board, and MyPiece represents a chess piece. MyPiece is the superclass of the different piece classes, including MyPawn, which is the class I worked on.

My goal was to understand the existing implementation before making any changes and to identify the bugs related to pawn movement.

### 2. Writing Tests

After gaining a general understanding of the project, I took inspiration from the existing tests in the repository to write my own tests.

I first wrote basic tests to make sure that pawns could move correctly on the board. I then focused on specific pawn movement rules, especially:

- a pawn can move two squares forward on its first move from its starting rank (rank 2 for White and rank 7 for Black);
- a pawn cannot move forward if there is a piece directly in front of it;
- a pawn can capture an opponent's piece diagonally.

Writing these tests first allowed me to identify the incorrect behaviors in the existing implementation before modifying the code.

### 3. Updating the Code

The method responsible for determining which squares a piece can move to is called targetSquaresLegal: aBoolean. I had to modify this method in MyPawn to make my tests pass.

I started by checking the pawn's color to determine the direction in which it should move: White pawns move upward, while Black pawns move downward.

I then implemented the logic for the pawn's initial two-square move and the rule preventing a pawn from moving forward when another piece is directly in front of it.

So far, two of the three pawn movement rules I tested are working successfully: the initial two-square move and the restriction on moving forward when a piece is blocking the pawn.

The diagonal capture rule is the next part I am working on.

Repository

Here is the link to the repository containing my modifications: https://github.com/badjilaglaurielfauster-glitch/Chess

---

## Tien

### What I have learnt

#### 1. Template Method Pattern (Hook & Template)

- **Template method:** Defined in the superclass to set the workflow order and invoke hook(s).
* **Hook method:** Using self and let subclass define it.

---

#### 2. `printOn:` vs `printString`

- **Implement `printOn: aStream`:** This is where you describe how your object looks. Use streams to avoid creating throwaway strings.
- **Call `printString`:** Use this when you actually need a `String` (like printing it with `Ctrl + P`). It will call `printOn:` behind the scenes.

```
Person >> printOn: aStream
    super printOn: aStream.
    aStream 
        nextPut: $(;
        nextPutAll: firstName;
        space;
        nextPutAll: lastName;
        nextPut: $)

```
- In addition, `Transcript show: ...; cr` for console/ log streaming. `cr` inserts a line break.

---

#### 3. Initialization

Always call `super initialize` first when setting up your object's default state to avoid a warning:

```
MyClass >> initialize
    super initialize.
    items := OrderedCollection new.

```

---

#### 4. `yourself` vs `self`

- `self` is the object itself inside a method.
- `yourself` is a helper message (`^ self`) used at the end of a cascade (`;`). It makes sure the entire expression returns the original object, not whatever the last message returned.

```
"Without yourself, you would get the number 2 instead of the collection"
numbers := OrderedCollection new
    add: 1;
    add: 2;
    yourself.

```

---

#### 5. Extending Existing Classes (like `Integer`)

In Pharo, you don't need to subclass to add a method to built-in classes:

1. Select `Integer` in the browser.
2. Add new methods to `Integer`
3. Add new protocol by clicking `Extension` at the bottom right of console and typing name of package


## Exercise & Difficulty

### Exercise
Link to Dice reporitory: https://github.com/nttt1400/Dice (finished).

Link to Chess reporitory: https://github.com/nttt1400/Chess.
I have: 
- added new Test classes for other missing chess pieces
- followed the structure of other test classes to create similar tests for new ones: isPiece, id and some moves.

### Difficulty
Since it's the beginning of the class, I found it challenging to do this exercise without a guided instruction but still interesting to discover it by myself.
