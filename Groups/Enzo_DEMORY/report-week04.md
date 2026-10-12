# Rapport
> DEMORY Enzo - groupe 2 M1 MIAGE

## Semaine 4 :

### Description générale :

Cette semaine, j'ai fait les exercices sur le Composite et le Visitor, j'ai implémenté un petit système de fichiers
(`FSEntry`, `FSFile`, `FSDirectory`) avec des recherches par nom et par contenu et un `path`, puis je l'ai réimplémenté
avec un visiteur, en ajoutant un calcul de taille, des symlinks et des fichiers zip.
J'ai également continué le kata "Fix pawn moves!" sur Chess, j'ai corrigé le comportement des pions (avance d'une ou deux cases,
captures en diagonale, capture de face interdite). Il ne me reste plus que l'en passant, après quoi je pourrai passer à un autre kata.


### Ce que j'ai appris :

#### Exercice Composite

L'exercice m'a fait travailler sur la récursion dans un Composite, chaque noeud délègue la recherche à ses enfants, et
pour que ça marche, toutes les implémentations de `searchByName:` doivent renvoyer le même type de résultat (une collection).
J'ai aussi cherché à éviter les conditions (`ifTrue:` et `ifFalse:`), pour savoir si un nom correspond, j'utilise `select:` 
sur une collection d'un seul élément, et pour calculer `path`, j'ai utilisé un Null Object (`FSNil`) à la place d'un 
`ifNil:`. La comparaison de nom (par préfixe, avec `beginsWith:`) est écrite à un seul endroit dans`FSEntry`, donc la 
changer ne touche qu'une méthode.

#### Exercice Visitor

J'ai enfin compris le pattern Visitor, chaque entrée a une méthode `accept:` qui rappelle le visiteur avec un message qui
dépend de son type (`visitFile:`, `visitDirectory:`), ce qui est un double dispatch. J'ai aussi appris à le distinguer
du pattern Strategy, au départ je ne voyais pas bien la différence, puisque les deux externalisent un comportement dans
une autre classe, mais un visiteur a une méthode par type d'élément du modèle et utilise du double dispatch. Pour le modèle,
le seul changement a été l'ajout de `accept:`, et le visiteur de taille n'a demandé aucune modification du modèle. Ajouter
une opération est donc facile, mais ajouter un type d'entrée (symlink, zip) oblige à ajouter un `visit...:` dans tous les
visiteurs.

#### Chess

J'ai travaillé sur le kata "Fix pawn moves!" en TDD. Après avoir lu le code existant (`MyPiece`, `MyPawn`, `MyChessBoard`,
`MyChessSquare`), j'ai écrit des tests pour les pions, couvrant les cas suivants.

- l'avance d'une seule case, uniquement vers l'avant
- l'avance d'une ou deux cases au départ
- les captures en diagonale
- l'interdiction de capturer une pièce de sa propre couleur
- l'interdiction de capturer de face
- l'impossibilité de sauter par-dessus une pièce (au premier mouvement)
- la disparition du plateau d'une pièce capturée

J'ai été confronté à pas mal d'erreurs, ce qui m'a obligé à me servir du debugger et de l'inspecteur (de très bons outils !).

J'ai réécrit la grosse méthode `targetSquaresLegal:` pour qu'elle délègue à des méthodes plus ciblées, qui ne font chacune
qu'une chose (`forwardSquare`, `forwardOf:`, `oneStepForward`, `twoStepForward`, `diagonalSquares` et `captureMoves`).
`forwardSquare` et `forwardOf:` donnent la case devant, et c'est le seul endroit qui dépend de la couleur. La seconde case
du double pas est calculée à partir de la première case libre, donc "sauter par-dessus une pièce" est devenu impossible.

J'ai aussi pris des décisions de conception. Pour savoir si un pion est à son premier coup, j'ai choisi de le déduire de
sa position (rangée de départ) plutôt que de stocker un état "a déjà bougé". J'aimerais par la suite créer une classe
`MyMovement` qui permettrait de gérer cela un peu mieux, mais je garde ça pour un refactor.

Pour l'en passant, il faudra mémoriser le dernier coup, et je pense qu'il doit être stocké sur le plateau (`MyChessBoard`).
La classe `MyMovement` sera sûrement d'une grande aide. Il me reste à faire l'en passant (tests, mémoire du dernier coup
sur le plateau, retrait du pion capturé), et plus tard la promotion, qui est un autre kata.


### Difficultés :

Les principales difficultés ont été des erreurs de syntaxe qui m'ont fait perdre du temps. J'ai aussi eu du mal à bien
cerner le pattern Visitor au début, notamment ce qui se passe à chaque étape du double dispatch, et à choisir la
conception du zip (de quelle classe le faire hériter, et comment combiner son comportement de fichier et de dossier).

Sur Chess, ce qui m'a posé le plus de problèmes, c'est que je n'arrivais pas à me décider sur ce que je voulais faire,
car je voulais que mon code soit le plus optimisé possible dès le début. En discutant avec certains de mes camarades,
ils m'ont fait comprendre que faire un code optimisé c'est bien, mais qu'il faut d'abord faire un code qui fonctionne.
Et même si ce n'est pas joli, je pourrai toujours faire des refactorings ensuite pour l'améliorer. J'ai donc perdu
énormément de temps là-dessus.

En plus de ça, je suis une personne qui apprend assez lentement et qui a souvent besoin de tout comprendre avant de pouvoir
faire quelque chose, car je veux être sûr de ce que je fais. Je suis donc conscient que j'avance lentement (avec toujours
un rapport de retard). Mais ce cours me fait énormément de bien, car il m'aide à travailler sur moi-même et j'ai l'impression
de réellement comprendre des notions qui ont été survolées dans d'autres cours, et de pouvoir enfin les comprendre à mon aise.

Mon objectif est donc vraiment de commencer à avancer plus vite et de me lancer sans attendre d'avoir tout compris.