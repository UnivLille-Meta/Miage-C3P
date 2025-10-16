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
> - collectSquares:while:forPieceColor:  
> Initialement dans MyPiece, mais je l'ai remonté pour pouvoir profiter de la récursivité plutôt qu'une simple boucle. La récursivité me permet de faire un arrêt lorsque la méthode est appelée sur MyNilChessSquare.
> - addTo:  
> Le principe est simple, un square s'ajoute à une collection, mais un nil square ne s'ajoute pas.

> Pour les pièces, je n'ai pas pu utiliser l'API des nils checks, car la plupart des problèmes qui étaient créés était dû à la méthode hasPiece de square, de plus plusieurs problèmes ont pu arriver.  
> Les méthodes importantes que j'ai ajoutées sur MyPiece et MyNilPiece sont les méthodes isAllyOf:, canBeCapturedBy: et blocksMovementFor:, qui ont permis d'appeler les comparaisons entre couleur les couleurs des pièces en utilisant un simple dispatch.  
> Les principaux problèmes que j'ai pu rencontrer était surtout sur la partie "graphique", j'ai changé l'initialisation des squares, ce qui par ma modification n'affichais plus de différence entre les squares blanc et noir, contenant un MyNilPiece, pour finir un simple changement d'ordre d'initialisation des variables à corriger le problème.  
> De plus à chaque itération, je corrigeais des interactions, mais en cassai d'autre, j'ai malgré tout push ces changements itératifs, pour pouvoir montrer le procéssus de modification que j'ai finalement suivi.

> Une remarque sur ma façon d'agir à posteriori a été que j'aurai du ajouter l'API isNil et notNil sur MyNilPiece, ce qui aurai réduit le nombre de tests échouant.  
> Et j'ai corrigé certaines erreurs sans ajouter directement un test de non regression, ce qui m'a mené à les recréer par la suite.
> Bien, que j'ai pu oublier des tests d'intégration, j'ai tout de même cherché à ajouter des tests au cours du processus pour m'aider au refactor des méthodes clés.

## kata fix pawn move
### Organisation
>Fait par Xavier et Gautier à partir du 10 Octobre

### Lien 
[Lien vers la branche du kata](https://github.com/LeoDefossez/Chess/tree/FixPawnMoves)

### Observations : 

- Le mouvements des pions lors d'un tour automatique est géré par `nextMove` qui récupère les prochains emplacement possible avec la méthode `targetLegalSquares` qui est aussi appelé par .



### Corrections : 

