# Commits de chess

Dépôt : https://github.com/azd-billal/Chess

## 1. Fix pawn moves

### Double pas initial avec MyInitPawn 
- https://github.com/azd-billal/Chess/commit/ea182f4 : creation MyInitPawn
- https://github.com/azd-billal/Chess/commit/9f14e82 : implementation MyPawnTest
- https://github.com/azd-billal/Chess/commit/26dc38d : placer MyInitPawn à l'initialisation
- https://github.com/azd-billal/Chess/commit/2ccacbf : remplacer MyInitPawn par MyPawn après le premier mouvement
- https://github.com/azd-billal/Chess/commit/e583b4d : remplacer MyInitPawn par MyPawn après le premier mouvement
- https://github.com/azd-billal/Chess/commit/4cc1918 : test remplace MyInitPawn par MyPawn après un mouvement
- https://github.com/azd-billal/Chess/commit/40c9b08 : moveTo sans becomeForward
- https://github.com/azd-billal/Chess/commit/5008297 : bug du double clic sur la même pièce
- https://github.com/azd-billal/Chess/commit/d91c136 : double pas bloqué par un obstacle
- https://github.com/azd-billal/Chess/commit/1051b04 : correction de testReplaceMyInitPawnWithMyPawnAfterMove
- https://github.com/azd-billal/Chess/commit/54632b9 : tests double pas et captures

### Capture en diagonale
- https://github.com/azd-billal/Chess/commit/1508c16 : manger en diagonale
- https://github.com/azd-billal/Chess/commit/c58ebc4 : simplification de moveTo de MyPawn

### En passant
- https://github.com/azd-billal/Chess/commit/1d00f7f : implémentation de la prise en passant
- https://github.com/azd-billal/Chess/commit/ac05501 : test de capture en passant
- https://github.com/azd-billal/Chess/commit/1868bd9 : correction de moveBack (MyWhiteDirection) et du test
- https://github.com/azd-billal/Chess/commit/2d51b79 : loi de Déméter pour previousMove
- https://github.com/azd-billal/Chess/commit/602ac1f : nouveaux cas d'en passant

## 2. Remove nil checks
- https://github.com/azd-billal/Chess/commit/3f1f66e : Null Object MyChessNoSquare
- https://github.com/azd-billal/Chess/commit/7bdbbc6 : début de suppression des nil
- https://github.com/azd-billal/Chess/commit/518a08d : MyNoPiece remplace les nil
- https://github.com/azd-billal/Chess/commit/9885d6f : crash au clic sur les pièces non-pions

## 3. Suppression de isWhite
- https://github.com/azd-billal/Chess/commit/cf671c7 : MyMoveDirection (MyBlackDirection, MyWhiteDirection)
- https://github.com/azd-billal/Chess/commit/b6f927e : MyColor strategy (MyWhiteColor, MyBlackColor)
- https://github.com/azd-billal/Chess/commit/720ac4f : colorStrategy remplace isWhite
- https://github.com/azd-billal/Chess/commit/5915d01 : direction utilisée dans moveTo et targetSquaresLegal
- https://github.com/azd-billal/Chess/commit/c074ac2 : rendu des pièces délégué à colorStrategy
- https://github.com/azd-billal/Chess/commit/1071607 : tests MyColor strategy
- https://github.com/azd-billal/Chess/commit/9287ba9 : tests MyDirection strategy
- https://github.com/azd-billal/Chess/commit/b492b21 : test de colorStrategy

