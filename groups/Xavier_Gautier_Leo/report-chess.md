# Rapport d'activité sur Chess

## Kata remove nil check

### Lien

https://github.com/LeoDefossez/Chess/tree/feat/remove-nil-check

### Organisation

> Jusqu'au 9 octobre le travail a été fait en commun, donc la personne qui commit n'était pas forcément la personne ayant écrit le code/commit.
> Après le 9 octobre, seul Leo à continuer à travailler sur cette branche.  

### Ce qu'on a fait

> NB : tous les refactor ne sont pas sur les nils checks, certains permettait simplement de comprendre comment agissait le code, et à le nettoyer.

> Pour les squares, on a décidé d'ajouter un object MyNilChessSquare, qui sera rendu à la place des nils, ayant une API neutre/identité.  
> En premier lieu, on a ajouté à celui-ci la même API et comportement que nil (ifNil:, isNil, notNil etc...) pour conserver le bon fonctionnement du jeu.  
> Ce qui a été fait est donc une itération sur chacun des points/méthodes où sont utilisé des nil checks, pour refactor et utiliser du dispatch.  
> Les méthodes clées que j'ai ajoutés dans l'API des squares sont les suivantes :
> 
> - collectSquares:while:forPieceColor:  
>   Initialement dans MyPiece, mais je l'ai remonté pour pouvoir profiter de la récursivité plutôt qu'une simple boucle. La récursivité me permet de faire un arrêt lorsque la méthode est appelée sur MyNilChessSquare.
> - addTo:  
>   Le principe est simple, un square s'ajoute à une collection, mais un nil square ne s'ajoute pas.

> Pour les pièces, je n'ai pas pu utiliser l'API des nils checks, car la plupart des problèmes qui étaient créés était dû à la méthode hasPiece de square, de plus plusieurs problèmes ont pu arriver.  
> Les méthodes importantes que j'ai ajoutées sur MyPiece et MyNilPiece sont les méthodes isAllyOf:, canBeCapturedBy: et blocksMovementFor:, qui ont permis d'appeler les comparaisons entre couleur les couleurs des pièces en utilisant un simple dispatch.  
> Les principaux problèmes que j'ai pu rencontrer était surtout sur la partie "graphique", j'ai changé l'initialisation des squares, ce qui par ma modification n'affichais plus de différence entre les squares blanc et noir, contenant un MyNilPiece, pour finir un simple changement d'ordre d'initialisation des variables à corriger le problème.  
> De plus à chaque itération, je corrigeais des interactions, mais en cassai d'autre, j'ai malgré tout push ces changements itératifs, pour pouvoir montrer le procéssus de modification que j'ai finalement suivi.

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

- Pour commencer nous avons décidé d'utiliser du Hook'nd Template pour remplacer la vérification de la couleur du pion. 
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

- Après avoir appliquer un Hook and Template nous avons décidé d'ajouter un blocage sur le pion en cas de pion en face de lui. Ainsi, un pion ne pourra pas avancer si un autre pion est devant lui. Pour cela, nous avons modifié la méthode `targetLegalSquares` pour y ajouter une vérification sur la présence d'un pion. 
  
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

## Rendre au pion ses possibilités d'attaques normales :

Maintenant que le pion ne peut plus manger devant lui nous allons lui rendre ses mouvements d'attaques normaux.

Pour commencer ils faut que notre pions puisse manger en diagonale :

- Comment récupérer les bons squares ? :

- Comment ne pas manger ses alliés ? :



Réalisation du "En passant" :

Notre pion sait manger en diagonal mais on nous demande d'implémenter la célébre prise "En passant" voici comment nous avons fait :



- Comment savoir si le pion est éligible à la prise en passant ? :
  
  

- Donner la possibilité au pion adverse de réaliser le mouvement en passant :
  
  

- Faire en sorte que le pion mange "vraiment" le pion adverse en effectuant le "en passant" :