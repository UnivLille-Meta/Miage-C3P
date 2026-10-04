 # Weekly Report 04

## Glauriel

Glauriel

**What I Learned**

* **Composite Design Pattern**: Thanks to the System Files exercise, I now have a better understanding of recursion and how it is used in the Composite design pattern.

* **NullObject**: I learned why it can be useful to avoid returning nil, as it forces client code to constantly perform null checks. Instead, there are different approaches, such as returning an empty collection or using a lazy object.

**Exercises & Projects**

* **FileSystem-Composite**

To improve my understanding of the Composite design pattern, I completed the FileSystem exercise. Here the link for the project : 
https://github.com/badjilaglaurielfauster-glitch/SystemFiles

DoubleDispatch

Completed the Double Dispatch exercise. Here the link for the project : https://github.com/badjilaglaurielfauster-glitch/DoubleDispatch

Chess

Continued working on the first chess kata, focusing on pawn movement.
Pawns can now capture enemy pieces diagonally.
The repository has not been updated yet because I currently have an issue with Pharo Launcher.

https://github.com/badjilaglaurielfauster-glitch/Chess


## Tien

**What I Learned**

* **Avoid returning `nil**`: It forces constant null checks everywhere in the client code.
* **Embrace recursion**: In a file system, a directory can simply delegate tasks to its children (using `self subclassResponsibility`).
* **Design Patterns**: Got hands-on practice implementing the **Composite** and **Visitor** patterns.

**Exercises & Projects**

**[Chess Game](https://github.com/nttt1400/Chess)**
* Rendered chess pieces with side-specific colors (and also chess squares) (`MyChessSquare`).
* Pawn mouvement and capture (`MyPawn`)
* Filtered out moves that leave your king in check so 2 players can play (`MyPiece`).
* Fixed a bug so the king can now capture unprotected enemy pieces (`MyKing`).
* Enforced strict turn to other player after each move (`MyChessGame`).
* Visual indicators now only show up for legal moves (`MyUnselectedState`).

**[FileSystem-Composite](https://github.com/nttt1400/FileSystem-Composite)**

* Built out the package using the Composite design pattern, along with a few extensions.