# Rapport d'activité sur Chess

# Sommaire

- [Kata remove nil check](#kata-remove-nil-check)
- [Kata fix pawn move](#kata-fix-pawn-move)
- [Kata Refactor Piece Rendering](#Kata-Refactor-piece-rendering)

## Kata remove nil check

### Lien

https://github.com/LeoDefossez/Chess/tree/feat/remove-nil-check

### Organisation

> Jusqu'au 9 octobre le travail a été fait en commun, donc la personne qui commit n'était pas forcément la personne ayant écrit le code/commit.
> Après le 9 octobre, seul Leo à continuer à travailler sur cette branche.  

### Ce qu'on a fait

#### NB

> Tous les refactor ne sont pas sur les nils checks, certains permettait simplement de comprendre comment agissait le code, et à le nettoyer.

#### Nil checks sur les squares

> Pour les squares, on a décidé d'ajouter un object MyNilChessSquare, qui sera rendu à la place des nils, ayant une API neutre/identité.  
> En premier lieu, on a ajouté à celui-ci la même API et comportement que nil (ifNil:, isNil, notNil etc...) pour conserver le bon fonctionnement du jeu.  
> Ce qui a été fait est donc une itération sur chacun des points/méthodes où sont utilisé des nil checks, pour refactor et utiliser du dispatch.  
> Les méthodes clées que j'ai ajoutés dans l'API des squares sont les suivantes :
> 
> - collectSquares:while:forPieceColor:  
>   Initialement dans MyPiece, mais je l'ai remonté pour pouvoir profiter de la récursivité plutôt qu'une simple boucle. La récursivité me permet de faire un arrêt lorsque la méthode est appelée sur MyNilChessSquare.
> - addTo:  
>   Le principe est simple, un square s'ajoute à une collection, mais un nil square ne s'ajoute pas.

#### Nil checks sur les pièces

> Pour les pièces, je n'ai pas pu utiliser l'API des nils checks, car la plupart des problèmes qui étaient créés était dû à la méthode hasPiece de square, de plus plusieurs problèmes ont pu arriver.  
> Les méthodes importantes que j'ai ajoutées sur MyPiece et MyNilPiece sont les méthodes isAllyOf:, canBeCapturedBy: et blocksMovementFor:, qui ont permis d'appeler les comparaisons entre couleur les couleurs des pièces en utilisant un simple dispatch.  
> Les principaux problèmes que j'ai pu rencontrer était surtout sur la partie "graphique", j'ai changé l'initialisation des squares, ce qui par ma modification n'affichais plus de différence entre les squares blanc et noir, contenant un MyNilPiece, pour finir un simple changement d'ordre d'initialisation des variables à corriger le problème.  
> De plus à chaque itération, je corrigeais des interactions, mais en cassai d'autre, j'ai malgré tout push ces changements itératifs, pour pouvoir montrer le procéssus de modification que j'ai finalement suivi.

#### Conclusion et remarques

> Une remarque sur ma façon d'agir à posteriori a été que j'aurai du ajouter l'API isNil et notNil sur MyNilPiece, ce qui aurai réduit le nombre de tests échouant.  
> Et j'ai corrigé certaines erreurs sans ajouter directement un test de non regression, ce qui m'a mené à les recréer par la suite.
> Bien, que j'ai pu oublier des tests d'intégration, j'ai tout de même cherché à ajouter des tests au cours du processus pour m'aider au refactor des méthodes clés.

## kata fix pawn move

### Organisation :

> Fait par Xavier et Gautier à partir du 10 Octobre

### Lien :

[Lien vers la branche du kata](https://github.com/LeoDefossez/Chess/tree/FixPawnMoves)

### Problématique :

Les mouvements des pions ne fonctionne pas correctement. Les pions peuvent manger des ennemies devant eux et pas en diagonales. De plus, les pions n'ont pas la possibilité de se déplacer de 1 ou 2 cases pendant leur premier tour. Et pour finir la prise "En passant" n'est pas implémenter dans les mouvement possible des pions quand toutes les conditions sont réunies.   

### Observations :

- Le mouvements des pions lors d'un tour automatique est géré par `play` de MyPlayer  qui récupère les prochains emplacement possible avec la méthode `targetLegalSquares` qui est aussi appelé par `moveTo:` de MyPiece afin de vérifier que la case vers laquelle le joueur va est accessible et autorisée.

- La méthode `targetLegalSquares` vérifie d'abord la couleur du pion (ce qui ne respecte pas la règle "Don't ask TELL IT") puis en fonction de la couleur va récupérer la case suivante suivante (Case vers le haut en cas de pion blanc et vers le bas sinon). Ensuite, on tri le résultat obtenu pour ne récupérer que les cases existantes et sur lesquelles il n'y a aucunes pièces.
  Ainsi la méthode ne retourne que les cases accessibles pour le pion courant.

### Corrections du comportement simple du pion:

- Pour commencer nous avons décidé d'utiliser le design pattern "template method" pour remplacer la vérification de la couleur du pion. 
  Au lieu de demander au pion sa couleur pour ensuite déterminer qu'elle est la case devant lui, on va plutôt lui demander de nous retourner directement cette information.
  Pour cela nous avons décidé d'étendre la classe MyPawn avec deux nouvelles classes : 
  
  - MyPawnBlack
  
  - MyPawnWhite
    
    Ces deux dernières contiennent une méthode `nextMoveAhead` qui retourne la case devant le pion. Cette méthode est ensuite utilisée par la méthode `targetSquaresLegal:` de `MyPawn`. 
    
    ```smalltalk
    "Ancienne version"
    (self isWhite ifTrue: [ { square up } ] ifFalse: [ { square down } ]).
    "Nouvelle solution"
    self nextMoveAhead.
    ```
    
    Cela n'est à priori pas une grosse modification, mais nous permettra de limiter la duplication de code lors de l'évolution des règles de mouvements du pion.

- Après avoir appliquer un Hook and Template nous avons décidé d'ajouter un blocage sur le pion en cas de pion en face de lui. Ainsi, un pion ne pourra pas avancer si une autre piece est devant lui. Pour cela, nous avons modifié la méthode `targetLegalSquares` pour y ajouter une vérification sur la présence d'un pion. 
  
  ```smalltalk
  targetSquaresLegal: aBoolean
  
      | col nextSquare |
      col := OrderedCollection new.
      nextSquare := self nextMoveAhead.
      nextSquare notNil ifTrue: [
          nextSquare hasPiece ifFalse: [ col add: nextSquare ] ].
      ^col
  ```

- Ensuite, nous avons réfléchi à comment implémenter le fait que le pion puisse choisir entre se déplacer d'une case ou 2 pendant son premier mouvement.
  Nous avons ajouter un state du nom de ```isFirstMove```.
  
  Donc nous l'ajoutons à notre initialize et il est modifié au moment de l'appel de la methode `moveTo` sur le pion.

### Rendre au pion ses possibilités d'attaques normales :

Maintenant que le pion ne peut plus manger devant lui nous allons lui rendre ses mouvements d'attaques normaux.

Pour commencer ils faut que notre pions puisse manger en diagonale :

- Comment récupérer les bons squares ? :
  
  Pour cela nous avons fait une méthode spécifique pour la récupération des cases d'attaques en diagonal , nous avons aussi fait attention à ce que les cases ne soit pas vides. Car sinon nous aurions eu des possibilités de mouvement illégaux.
  
  ```smalltalk
  getDiagonalTarget
	|nextMove col|
	nextMove := self nextMoveAhead.
	col:= OrderedCollection new.
	nextMove notNil ifTrue: [ 
				col add: nextMove right.
				col add: nextMove left.	].
	^ col select: [ :s |
		  s notNil and:[
			  s hasPiece and:[ s contents color ~= self color ]]]
  ```

- Comment ne pas manger ses alliés ? :
  
  Dans la méthode ci dessus on peut remarquer le filtre mis en place sur la collection qui ne prendra en compte que les contenus du square de couleur différente, ce qui empêche toutes actions avec les alliés. 
  
  ```smalltalk
  col select: [ :s |
		  s notNil and:[
			  s hasPiece and:[ s contents color ~= self color ]]]
  ```

Réalisation du "En passant" :

Notre pion sait manger en diagonal mais on nous demande d'implémenter la célébre prise "En passant" voici comment nous avons fait :

- Comment savoir si le pion est éligible à la prise en passant ? :
  
  Nous avons ajouté un state `canBeEatEnPassant` qui s'occupe de donner l'information aux autres pions pour savoir si la pièce peut être mangée ou non avec la prise "EnPassant".
  
  ```smalltalk
  initialize
  	canBeEatEnPassant := false.
  ```

Ensuite pendant le `moveTo` si le pion a bien fait 2 cases directement il sera donc éligible à la prise, par pragmatisme nous réutilisons une méthode nous retournants les cases devant le pion on compare cette case théorique à la case cible `aSquare` , puis on s'assure que c'est pendant son `firstMove` pour ne pas changer son statut si le mouvement réaliser est un coup illégal : 

```smalltalk
moveTo: aSquare
	|enemieSquareEnPassant changePos|
	changePos := (aSquare == self square )not.
	(self getEnPassantTarget select: [ :s| s == aSquare ] )ifNotEmpty: [ enemieSquareEnPassant:= aSquare ].
	canBeEatEnPassant := (self nextMoveAheadFromASquare: self nextMoveAhead) == aSquare and: isFirstMove.
	super moveTo: aSquare.
	enemieSquareEnPassant ifNotNil: [ 
		(self nextMoveBackWardFromASquare: enemieSquareEnPassant) contents: nil.
		 ].
	(self square == aSquare and:[changePos]) ifTrue: [  isFirstMove :=false]
```

- Donner la possibilité au pion adverse de réaliser le mouvement en passant :
  
  On va tout simplement regarder à droite et à gauche du pion si il y a des pions éligibles à la prise en passant si c'est le cas on les ajoute dans une collection spécifique retourné par cette méthode :
  
  ```smalltalk
  getEnPassantTarget
  	|col|
  	col:= OrderedCollection new
  			add: self square right;
  			add: self square left;
  			yourself.
  	col:=(col select: [ :s |
  		  s notNil and:[
  			  s hasPiece and:[ s contents color ~= self color 
                  and: s contents canBeEatEnPassant ]]])
                  collect: [ :s|self nextMoveAheadFromASquare:s ].
  	^col
  ```
  
  On utilise donc ici le state `canBeEatEnPassant` pour confirmer l'ajout des cases.
  
  

- Faire en sorte que le pion mange "vraiment" le pion adverse en effectuant le "en passant" : 

Dans la méthode `moveTo` nous avons réutilisé la méthode `getEnPassantTarget`,  afin de vérifier que la case ciblé est une case devant une cible "enPassant" et nous stockons cette information.
Une fois le mouvement effectué, si la case cible était bien unen case "en passant" alors on récupère la case derièrre la cible avec une nouvelle méthode `nextMoveBackWardFromASquare:` et on retire le pion qui est dessus.

```smalltalk
moveTo: aSquare
	|enemieSquareEnPassant|
	...
  (self getEnPassantTarget select: [ :s| s == aSquare ] )ifNotEmpty: [ enemieSquareEnPassant:= aSquare ].
	canBeEatEnPassant := (self nextMoveAheadFromASquare: self nextMoveAhead) == aSquare and: isFirstMove.
	super moveTo: aSquare.
	enemieSquareEnPassant ifNotNil: [ 
		(self nextMoveBackWardFromASquare: enemieSquareEnPassant) contents: nil.
		 ].
    ...
```


#### Fusion de toutes les possibilités de mouvement d'un pion :

Afin de récupérer l'ensemble des coups possible pour un pion, nous avons intégré, les deux méthodes `getDiagonalTarget` et `getEnPassantTarget` dans notre méthode `targetSquaresLegal:` ainsi, notre pion peut se déplacer sur les cases en diagonales si elles ont un enemies ou si elle sont "enPassant".

```smalltalk
targetSquaresLegal: aBoolean

	| col nextSquare |
	col := OrderedCollection new.
	nextSquare := self nextMoveAhead.

	nextSquare notNil ifTrue: [
		nextSquare hasPiece ifFalse: [ col add: nextSquare ] ].
	col addAll: self getDiagonalTarget;
		addAll:self getEnPassantTarget.
	self isFirstMove ifTrue: [
			nextSquare hasPiece ifFalse: [
				col add: (self nextMoveAheadFromASquare: nextSquare) ] ].
	^ col
```
Ainsi, notre méthode `targetSquaresLegal` récupère la case devant lui si elle n'a pas de pion, puis la case encore (Mouvement en avant simple). Puis ajoute à ses coups possibles, les cases en diagonales sur lesquelles il y a des ennemies avec la méthode `getDiagonalTarget` (Mouvements en diagonales). Ensuite, la méthode ajoute les mouvement avec l'attaque "enPassant" via la méthode `getEnPassantTarget` (Fameux mouvement en passant). Et pour terminer  si c'est son premier coup et qu'il n'y avait pas de pion sur la case devant lui, la méthode ajoute la case à deux cases devant le pion courrant si il n'y a pas d'ennemie dessus (Mouvements double).


## Kata Refactor Piece Rendering

### Lien

https://github.com/LeoDefossez/Chess/commits/RefactorPieceRendering/

### Organisation

> Réaliser entitlement par Léo, le 16 octobre.

### Problème

> L'objectif est de refactor la méthode ci-dessous et les autres méthodes render[...], pour supprimer les conditionnelles.
> 
> ```Smalltalk
> MyChessSquare >> renderKnight: aPiece
> 
>    ^ aPiece isWhite
>          ifFalse: [ color isBlack
>                  ifFalse: [ 'M' ]
>                  ifTrue: [ 'm' ] ]
>          ifTrue: [
>              color isBlack
>                  ifFalse: [ 'N' ]
>                  ifTrue: [ 'n' ] ]
> ```

### Phase de réflexion

> Le problème est donc, comment supprimer les conditions ?
> 
> - [Des doubles dispatch ?](#1-des-doubles-dispatch-)
> - [Un table dispatch ?](#2-un-table-dispatch-)
> - [Choix final ?](#3-choix-final-)
> 
> #### 1. Des doubles dispatch ?
> 
> ##### 1.1. Si on crée notre propre object couleur, et qu'on l'utilisait pour créer deux nouveaux doubles dispatch ?
> 
> Actuellement, chaque méthode render[...] est déjà présente dûe à un double dispatch, on a donc :  
> 
> - 1 méthode renderPieceOn: sur chaque pièce 
> - 1 méthode renderKnight/Bishop/...: par pièce sur MyChessSquare
>   Donc 6 méthodes
> 
> Un résumé de ci-dessous, car il est peu probable que quelqu'un aient la force de lire ce que j'ai écrit, beaucoup de méthodes seront créé à cause de chacune des combinaisons possibles (environ 36 sur MyChessSquare).
> 
> > Si fait un double dispatch sur la pièce en fonction de la couleur, on aurait à première vue :  
> > 
> > - 1 méthode renderPieceOn: sur chaque pièce
> > - 1 méthode renderKnight:on: sur l'objet couleur de la pièce par couple pièce/couleur
> >   Donc 6 méthodes par couleur 
> > - 1 méthode render(Black/White)(Kight/Bishop/...): sur MyChessSquare par couple pièce/couleur  
> >   Donc 12 méthodes sur MyChessSquare
> > - 1 méthode render(Black/White)(Kight/Bishop/...):on: sur l'objet couleur du square  
> >   Donc 12 méthodes par couleur
> > - 1 méthode render(Black/White)(Kight/Bishop/...)On(White/Black)Square: par combinaisons sur MyChessSquare  
> >   Donc 24 méthodes sur MyChessSquare
> 
> ##### 1.2. Si ont sous classe MyChessSquare avec MyBlackChessSquare et MyWhiteChessSquare, et pareil pour les pièces ?
> 
> Cela permettrait de réduire le problème à seulement 12 nouvelles méthodes sur MyChessSquare pour chaque couple pièce/couleur, que l'on pourrait redéfinir dans les sous classes.  
> Mais c'est un design discutable, car cela crée une explosion du nombre de classes.
> 
> #### 2. Un table dispatch ?
> 
> Moin d'explosion en nombre de méthodes.  
> Mais cela crée des instances en plus pour le rendering ?  
> Qu'utilise-t-on comme clé pour les dictionnaires ?
> 
> #### 3. Choix final ?
> 
> Initialement, je suis parti sur l'idée de créer un nouvel object qui représenterai les couleurs au sein du jeu.  
> Cela représentait des problèmes, tout le code était impacté, et le nombre de méthodes aurait explosé.  
> C'est pourquoi les deux premiers commits que j'ai réalisés sont contradictoires :
> 
> - Adding classes for colors in the chess
>     [c352739c3466533a8e7935bb8e66981ccb349a0e](https://github.com/LeoDefossez/Chess/commit/c352739c3466533a8e7935bb8e66981ccb349a0e) :  
>   J'ajoute les couleurs pour faire le double dispatch par la suite
> - Removing last commit changes, this is not yet needed [2508ca0d91c20a460fe88357783d92d89f34984a](https://github.com/LeoDefossez/Chess/commit/2508ca0d91c20a460fe88357783d92d89f34984a) :  
>   Abandon stratégique
> 
> Ensuite, j'ai pensé à dupliquer les classes en fonctions des couleurs.  
> Il y aurait eu moins de double duplication de méthodes le nombre de doubles dispatch serait réduit, car bien que le double dispatch est puissant, en abusé peut rendre le code trop complexe.  
> Le problème est que doubler le nombre d'objets en fonction de la couleur est discutable :  
> Dans le cadre d'un jeu d'échec, ont peu imaginé que l'on n'ajouterait pas nécessairement d'autres couleurs de pièces, donc cela n'impliquerait pas vraiment de problème.
> 
> Malgré cette reflexion, je me suis tout de même tourné vers le table dispatch, car dupliquer les classes de MyChessSquare et chacun des enfants de MyPiece, n'était pas une option que je voulais prendre.

### Application du table dispatch

> 1. Pour commencer, j'ai ajouté des tests pour chacune des méthodes render[...] pour éviter les regressions
>    [b3128b665935fbfb1fb7ae40b6da0606bfb9c4eb](https://github.com/LeoDefossez/Chess/commit/b3128b665935fbfb1fb7ae40b6da0606bfb9c4eb).  
> 
> 2. J'ai ensuite créé un objet MyChessBasicRendering, dont chaque instance est stocké dans MyChessSquare dans la variable d'instance "rendering".  
>    Voici le commentaire de classe de MyChessBasicRendering :
>    
>    > I define a basic rendering for chess pieces depending on the color of their square and their own color.
>    > 
>    > Each variable named [..]Rendering follows the structure:
>    > SquareColor → PieceColor → RenderCharacter
>    > 
>    > For example, the variable knightRendering is a nested dictionary organized as:  
>    > knightRendering  
>    > at: Color black → (Dictionary mapping piece colors to characters for black squares)  
>    > at: Color white → (Dictionary mapping piece colors to characters for white squares)  
> 
> Pour finir dans ce commit j'ai refactor la méthode renderKnight de MyChessSquare pour vérifier que ce design était fonctionnel [0eb92cb14ff65d860be3d5390348ee0bdc91da82](https://github.com/LeoDefossez/Chess/commit/0eb92cb14ff65d860be3d5390348ee0bdc91da82).
> 
> 3. Ensuite, j'ai refactor chacune des méthodes [..]Render de MyChessSquare pour utiliser le table dispatch [5acd6c8e1b41a57bccb12f46f2273f8cbd75ce9a](https://github.com/LeoDefossez/Chess/commit/5acd6c8e1b41a57bccb12f46f2273f8cbd75ce9a).
> 4. Cette implémentation permet de conserver un nombre réduit de méthodes, tout en conservant leurs petites tailles.  
>    Le dernier problème est que cette implémentation crée une instance de MyChessBasicRendering pour chaque square, ce qui crée un grand nombre de dictionnaires, non nécessaires.  
>    Pour pallier ce problème, l'instantiation de MyChessBasicRendering est remontée dans MyChessBoard, et une unique instance est assigné à chacun des squares lors de la création de ceux-ci [5a1b8b83bd4252f05691b29d66422274d9a04427](https://github.com/LeoDefossez/Chess/commit/5a1b8b83bd4252f05691b29d66422274d9a04427).
> 5. Les commits suivants ajoutent des commentaires de classes sur MyChessSquare et MyChessBasicRendering