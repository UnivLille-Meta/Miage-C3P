# Myg Chess Game

This is a chess game for Pharo based on Bloc, Toplo and Myg.

## What is this repository really about

The goal of this repository is not to be a complete full blown game, but a good enough implementation to practice software engineering skills:
 - testing
 - reading existing code
 - refactorings
 - profiling
 - debugging

## Getting started

### Getting the code

This code has been tested in Pharo 12. You can get it by installing the following baseline code:

```smalltalk
Metacello new
	repository: 'github://UnivLille-Meta/Chess:main';
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

## Relevant Design Points

This repository contains:
 - a chess model: the board/squares, the pieces, their movements, how they threat each other
 - a UI using Bloc and Toplo: a board is rendered as bloc UI elements. Each square is a UI element that contains a selection, an optional piece. Pieces are rendered using a text element and a special chess font (https://github.com/joshwalters/open-chess-font/tree/master).
 - Textual game importers for the PGN and FEN standards (see https://ia902908.us.archive.org/26/items/pgn-standard-1994-03-12/PGN_standard_1994-03-12.txt and https://www.chessprogramming.org/Forsyth-Edwards_Notation#Samples)

## Katas

These are some ideas of exercises you may try:

### Fix pawn moves!

**Goal:** Practice debugging and testing

Pawns are one of the most complicated pieces of chess to implement.
They move forward, one square at a time, except for their first movement.
However, they can move diagonally to capture other pieces.
And in addition, there is the (in)famous "En passant" move that complicates everything (see https://en.wikipedia.org/wiki/En_passant, and the FEN documentation for ideas on how to encode this information https://www.chessprogramming.org/Forsyth-Edwards_Notation#En_passant_target_square).
As any *complicated* feature, the original developer (Guille P) left this for the end, and then left the project.
But you can do it.

Questions and ideas that can help you in the process:
- Can you write tests showing the bugs?
- What kind of tools can you use to spot the bug?
- Can you approach this incrementally? This is, splitting this task in many subtasks. How would you prioritize them?

### Restrict legal moves

**Goal:** Practice code understanding, refactorings and debugging

In chess, when we are not in danger we can move any piece we want in general, as soon as we follow the rules.
However, when the king gets threatened, we must protect it!
The only legal moves in that scenario are the ones that save the king (or otherwise we lose).
What are moves that protect the king? The ones that capture the attacker, block the attack, or move the king out of danger.
Another way to see it is: A move protects the king if it moves it out of check.

The current implementation does not support this restriction.
As any *complicated* feature, the original developer (Guille P) left this for the end, and then left the project.
But you can do it.

Questions and ideas that can help you in the process:
- What tools help you finding the right place to put this new code?
- How do you avoid repeating all the existing code computing legal moves and checks?

### Fuzz the board

**Goal:** Practice fuzzing and automated testing on the board

Are we sure the game works? We would like to add automated testing in the loop.
You can do it.

Questions and ideas that can help you in the process:
- A board can be configured from a FEN format string. What if you generate FEN strings automatically?
- Once a board is configured, you can test moves. Can you generate (in)valid moves and validate they were correct?
- The parsers inside the game are probably a nice target for fuzzing too. Did you consider that they may be buggy?
- Do not forget to test "ugly and invalid scenarios" too

### Implement more bot gaming strategies

**Goal:** Practice refactorings and algorithms

Currently the engine allows players to play automatically using a "random move" strategy.
However, many different automatic strategies can be implemented: https://www.youtube.com/watch?v=DpXy041BIlA.
How can we plug those into the game?
As any *crazy* feature, the original developer (Guille P) did not prepare the engine for this.
But you can do it.

Questions and ideas that can help you in the process:
- How could you know that you're not breaking something while refactoring?
- Can you write tests that help you with the process?
- Can you do the refactoring in little steps that avoid breaking the code?
- Introducing a new game "AI" may require that we expose new methods in the engine.

### Remove nil checks

**Goal:** Practice refactorings and patterns

In the game, each square has optionally a piece.
The absence of a piece is represented as a `nil`.
As any project done in stress during a short period of time (a couple of evenings when the son is sick), the original developer (Guille P) was not 100% following coding standards and quality recommendations.
We would like to clean up the game logic and remove `nil` checks using some polymorphism.
You can do it.

Questions and ideas that can help you in the process:
- How do we transform nil checks into polymorphism?
- What kind of API should you design?
- Can tests help you do it with less pain?
- Something similar happens when a pieces wants to move outside of the board, can you find it and fix it?

### Refactor piece rendering

**Goal:** Practice refactorings, double dispatch and table dispatch

The game renders pieces with methods that look like these:

```smalltalk
MyChessSquare >> renderKnight: aPiece

	^ aPiece isWhite
		  ifFalse: [ color isBlack
				  ifFalse: [ 'M' ]
				  ifTrue: [ 'm' ] ]
		  ifTrue: [
			  color isBlack
				  ifFalse: [ 'N' ]
				  ifTrue: [ 'n' ] ]
```
As any project done in stress during a short period of time (a couple of evenings when the son is sick), the original developer (Guille P) was not 100% following coding standards and quality recommendations.
We would like you to clean up this rendering logic and remove as much conditionals as possible, for the sake of it.
You can do it.

Questions and ideas that can help you in the process:
- Can you do an implementation with double dispatch?
- Can you do an implementation with table dispatch?
- What are the good and bad parts of them in *this scenario*? Do you understand why?

### Make the chess board graphical editor

**Goal:** Practice large refactorings to decouple game logic from rendering

The current UI is really tied to the game engine. Clicking on the squares will try to move the pieces and play the game.
We would like to do a graphical board editor and reuse the graphics.
But this editor does not need the game logic behind.
As any *crazy* feature, the original developer (Guille P) did not prepare the engine for this.
But you can do it.

Questions and ideas that can help you in the process:
- How could you know that you're not breaking something while refactoring?
- Can you write tests that help you with the process?
- Refactoring and testing UI code can be challenging: this does not mean it is impossible!
- Can you do the refactoring in little steps that avoid breaking the code?

### Make the game UI themable

**Goal:** Practice large refactorings to decouple game logic from rendering

Instead of using a font, try using assets from https://opengameart.org/art-search-advanced?field_art_tags_tid=chess or https://game-icons.net/.
As any *crazy* feature, the original developer (Guille P) did not prepare the engine for this.
But you can do it.

Questions and ideas that can help you in the process:
- How could you know that you're not breaking something while refactoring?
- Can you write tests that help you with the process?
- Refactoring and testing UI code can be challenging: this does not mean it is impossible!
- Can you do the refactoring in little steps that avoid breaking the code?

### Add pawn promotion

**Goal:** Practice code understanding and debugging

When pawns arrive to the back of the board, the pawn is promoted: it is transfomed into a major (queen, rook) or minor piece (knight, bishop), choice of the player.
When in an interactive UI, this requires asking the user what to do.
When in an automatic player/bot, this requires some automated decision approach.

As any *complicated* feature, the original developer (Guille P) left this for the end, and then left the project.
But you can do it.

Questions and ideas that can help you in the process:
- What tools help you finding the right place to put this new code?
- How can you find documentation and help to understand the graphical part that will implement, for example, a pop-up?
- The bot will not need a UI, how would you make it work without breaking the other existing code?

### Implement the 9 queens problem

**Goal:** Practice refactoring and algorithms

Chess players like puzzles. One well-known puzzle is the 9 queens puzzle (https://www.chessvariants.com/problems.dir/9queens.html).
The player should put 9 queens on the board without having them threat each other.
You have to implement the game reusing the existing code (the queens implementation, the board).
As any *crazy* feature, the original developer (Guille P) did not prepare the engine for this.
But you can do it.

Questions and ideas that can help you in the process:
- What parts of the original code are useful for you and which ones are not? Can you make the game extensible to take this into account?
- The 9 queens game has a different winning condition than a normal game chess, how can you plug different winning conditions?

### Game Replay

**Goal:** Practice refactoring and debugging

A common practice between chess players is to study old games.
Fortunately, many old games exist digitalized in PGN format, and the engine has initial support for it!
You have to implement a replay feature, where a game is imported and the player move the game forward/backwards given the list of moves.
As any *crazy* feature, the original developer (Guille P) did not prepare the engine for this.
But you can do it.

Questions and ideas that can help you in the process:
- How should you extend the UI to implement this feature?
- What would happen if the PGN support is not complete/perfect? How can you manage to improve it?

### Positional Heatmap

**Goal:** Practice refactoring, code understanding and a bit of profiling

Chess pieces have a certain influence in the board.
For example, a queen controls all squares in its diagonals, ranks and columns.
However, when many pieces are in the game, understanding how such control gives advantage to a player is difficult.
Players need a lot of mental calculation.

Your task is to build a heatmap as in https://tlee753.com/chess-visualizer/, where the background color of the square is chosen depending on the influence of each player.
Strong white control is green. Strong black control is red.
As any *crazy* feature, the original developer (Guille P) did not prepare the engine for this.
But you can do it.

Questions and ideas that can help you in the process:
- How can this support be plugged in as an optional feature in the game?
- Computing the influence could be an expensive analysis. Can you profile your code to see if there are potential improvements you can do?

### Chess Variants

https://www.chess.com/terms/chess-variants

 - Horde
 - Fog of War
 - Atomic
 - 3-check
 - King of the hill

### Chess puzzles database integration

http://www.bstephen.me.uk/meson/meson.pl?opt=top
https://www.yacpdb.org/#static/home

## Troubleshotting

- Exceptions in the Myg UI thread stop the event cycle. This makes the game "freeze": it receives events but the thread that treats them is not running. To restart the UI thread, execute the following:
```smalltalk
BlParallelUniverse all do: #startUniverse.
```
