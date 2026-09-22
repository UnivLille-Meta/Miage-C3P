# Rapport hebdomadaire semaine 3

## Ce que j'ai fait 

Cette semaine, j’ai regardé plusieurs vidéos de cours sur le dispatch, self, les hooks, les Template Methods et le double dispatch. J’ai pris le temps de bien comprendre les différentes notions et leur fonctionnement en Pharo.

Pour mieux maîtriser le double dispatch, j’ai également codé l’exemple Stone / Paper / Scissors dans Pharo. Cela m’a permis de pratiquer le mécanisme directement, de mieux comprendre les deux envois de messages successifs et de retenir plus facilement le principe pour la suite.

## Projet Chess 

J’ai également commencé à travailler sur le projet Chess.

L’objectif était de lancer l’interface du jeu, repérer des incohérences par rapport aux règles normales des échecs, écrire des tests permettant de reproduire les problèmes, debugger le programme puis corriger le code afin de faire passer les tests de rouge à vert.

### 1. Observation du comportement du pion

En testant le jeu et en regardant la classe `MyPawn`, j’ai remarqué qu’un pion placé sur sa position initiale ne pouvait avancer que d’une seule case.

Dans un jeu d’échecs normal, un pion qui se trouve encore sur sa position de départ peut avancer soit d’une case, soit de deux cases, à condition que les cases devant lui soient libres.

J’ai donc choisi cette incohérence comme premier bug à corriger.

J’ai également remarqué une autre incohérence potentielle dans la gestion des captures du pion : un pion ne doit pas pouvoir capturer une pièce située directement devant lui, car les captures se font en diagonale. Je ne l’ai pas encore corrigée.

### 2. Écriture d’un test

Le package `Myg-Chess-Tests` contenait déjà plusieurs classes de tests comme `MyRookTests`, `MyBishopTests` et `MyKingTest`, mais aucun test pour les pions.

J’ai donc créé une nouvelle classe :

`MyPawnTest`

qui hérite de `TestCase`.

J’ai écrit le test suivant :

```
testWhitePawnCanMoveTwoSquaresFromInitialPosition

    | pawn squares board |

    board := MyChessBoard empty.
    board at: 'a2' put: (pawn := MyPawn white).

    squares := pawn targetSquares.

    self
        assertCollection: squares
        includesAll: (#(a3 a4) collect: [ :name |
            board at: name ])

  ```
Ce test crée un plateau vide, place un pion blanc en a2, demande ses déplacements possibles et vérifie que les cases a3 et a4 sont disponibles.

Au premier lancement, le test était rouge.

### 3. Debugging 

J’ai utilisé le debugger de Pharo pour comprendre pourquoi le test échouait.

J’ai placé un breakpoint avant l’appel :
```
squares := pawn targetSquares.
```

puis j’ai suivi l’exécution avec Into.

Le chemin d’exécution m’a amenée jusqu’à :
```
MyPawn >> targetSquaresLegal:
```
Dans le debugger, j’ai constaté que :

le pion était bien placé en a2 ;
le pion était blanc ;
la collection des déplacements ne contenait que a3.

La méthode originale utilisait uniquement :
```
square up
```
pour un pion blanc. La deuxième case a4 n’était donc jamais calculée.

Cela m’a permis d’identifier la cause du test rouge.

### 4. Correction

Pour rendre le code plus lisible, j’ai séparé le calcul des déplacements dans plusieurs méthodes.

J’ai ajouté :

```
forwardSquare

    ^ self isWhite
        ifTrue: [ square up ]
        ifFalse: [ square down ]
```
Cette méthode retourne la case située directement devant le pion.

J’ai également ajouté :
```
secondForwardSquare

    ^ self isWhite
        ifTrue: [ square up up ]
        ifFalse: [ square down down ]
```

Cette méthode retourne la case située deux positions devant le pion.

Enfin, j’ai ajouté :

```
initialFile

    ^ self isWhite
        ifTrue: [ $2 ]
        ifFalse: [ $7 ]
```

Cette méthode permet de reconnaître la ligne initiale du pion en utilisant la méthode file de MyChessSquare.

J’ai ensuite modifié targetSquaresLegal: 
```
targetSquaresLegal: aBoolean

	| targets oneStep twoSteps |
	
	targets := OrderedCollection new.
	oneStep := self forwardSquare.
	
	(oneStep notNil and: [ oneStep hasPiece not])
		ifFalse: [ ^targets ].
		
	targets add: oneStep. 
	
	square file = self initialFile 
		ifTrue: [ 
			twoSteps := self secondForwardSquare.
			(twoSteps notNil and: [twoSteps  hasPiece not ])
				ifTrue: [  targets add: twoSteps ]
		].
	^ targets 
  
```

afin :

- d’autoriser le déplacement d’une case si la case est libre ;
- d’autoriser le déplacement de deux cases uniquement depuis la position initiale ;
- de vérifier que les cases nécessaires sont libres.

### 5. Résultat

Après la correction, j’ai relancé le même test sans le modifier.

Le test est passé de : Rouge -> Vert 

Ce travail m’a permis de pratiquer la démarche suivante :

observer un bug → écrire un test  → debugger → identifier la cause → corriger → relancer le test.





















  
