
Cette semaine je me suis concentré sur ma deuxième kata : Refactor piece rendering

le problème qui se posait : chaque piece (pawn, king, queen ... etc) avait sa propre methode de render (renderPawn:, renderKing:, renderQueen: ... etc) et 
elles faisaient toutes la meme chose, avec deux ifTrue:/ifFalse: imbriqués chacune, chaque pièce avait aussi une méthode renderPieceOn: qui appelait la bonne méthode, et ca faisait vraiment beaucoup de code répété

du coup j'ai remplacé ces méthodes par une seule, renderPiece: qui donne la lettre a afficher pour une pièce
si elle est blanche on récupère son id (lettre ) directement depuis la sous classe 
si elle est noire elle va chercher sa lettre dans blackPieceLetters qui est un Dictionary qui associe chaque lettre a sa version noir 
comme ca on recupere la bonne lettre noir, au lieu de faire les ifTrue ifFalse

ensuite : 	^ color isBlack ifTrue: [ lettre asLowercase ] ifFalse: [ lettre ]
on renvoi les lettre en minuscule si la case est noir si non majuscule si elle est blanche 

avec cette kata on est passé de 12 ifTrue ifFalse a seulement 2

pour les tests j'ai créé MyChessSquareTest avec 5 tests, ils vérifient que chaque pièce affiche la bonne lettre selon sa couleur et celle de la case,
par exemple : un pion blanc sur une case blanche donne 'P' et un pion noir sur une case noire donne 'o'



lien du commit : https://github.com/UnivLille-Meta/Chess/commit/8099927cf047264fd08f457b7d6b6136f5090223
