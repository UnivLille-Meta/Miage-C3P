# Avancement du projet Myg Chess

## Présentation

Dans le cadre de ce projet, je travaille sur l'application **Myg Chess**, un jeu d'échecs développé en **Pharo** à l'aide de **Bloc**, **Toplo** et **Myg**.

L'objectif de mon travail est dans un premier temps de **comprendre le fonctionnement général du projet et son architecture**, puis de mettre progressivement en pratique les concepts étudiés en cours, notamment les tests, le débogage, la compréhension de code existant et le refactoring.

## Compréhension du projet

J'ai commencé par étudier la structure du dépôt ainsi que les différentes parties qui composent l'application.

Le projet est principalement organisé autour de plusieurs éléments :

* le **modèle du jeu d'échecs**, qui contient le plateau, les cases et les différentes pièces ;
* la gestion des **mouvements des pièces** et des règles associées ;
* la partie **interface graphique**, basée sur Bloc et Toplo ;
* les mécanismes permettant de charger des parties et des positions à partir de formats textuels comme **PGN** et **FEN** ;
* les tests permettant de vérifier le comportement du jeu.

Cette première étape me permet de mieux comprendre les relations entre les différentes classes et méthodes avant de commencer les modifications.

## Mise en place du projet

J'ai également commencé par installer et charger le projet dans **Pharo 13** afin de pouvoir exécuter l'application et observer son fonctionnement.

Le projet peut être chargé avec :

```smalltalk
Metacello new
    repository: 'github://UnivLille-Meta/Chess:main';
    baseline: 'MygChess';
    onConflictUseLoaded;
    load.
```

Après le chargement, j'ai testé le lancement du jeu avec :

```smalltalk
board := MyChessGame freshGame.
board size: 800@600.

space := BlSpace new.
space root addChild: board.
space pulse.
space resizable: true.
space show.
```

Cette étape m'a permis de vérifier que l'environnement fonctionne correctement et de commencer à explorer l'interface graphique.

## Travail en cours

À ce stade, mon travail consiste principalement à **comprendre progressivement le code existant avant d'effectuer les modifications demandées**.

Je cherche notamment à :

* identifier les classes principales du projet ;
* comprendre le rôle de chaque classe ;
* suivre l'exécution des méthodes importantes ;
* comprendre la représentation du plateau et des pièces ;
* analyser la manière dont les mouvements sont calculés ;
* comprendre le lien entre le modèle du jeu et l'interface graphique ;
* exécuter les tests existants ;
* identifier les problèmes et les fonctionnalités qui doivent être améliorées.

Je vais ensuite avancer progressivement sur les exercices proposés dans le dépôt, en ajoutant des tests avant les corrections lorsque cela est nécessaire.

## Méthode de travail

Pour chaque fonctionnalité, je souhaite suivre une démarche progressive :

1. **Comprendre** le fonctionnement actuel du code.
2. **Identifier** le problème ou la fonctionnalité à ajouter.
3. **Écrire des tests** permettant de vérifier le comportement attendu.
4. **Modifier le code** de manière progressive.
5. **Exécuter les tests** afin de vérifier que les modifications fonctionnent.
6. **Refactorer** le code lorsque cela est nécessaire.
7. **Documenter** les changements et les résultats obtenus.

Cette approche me permet de mieux comprendre le code existant tout en évitant de modifier plusieurs parties du projet sans vérifier leur impact.

## État d'avancement

Le projet est actuellement **en cours de réalisation**.

La première étape consiste à comprendre l'architecture et le fonctionnement du jeu. Les différentes fonctionnalités et katas proposées dans le dépôt seront ensuite étudiées et réalisées progressivement.

L'objectif n'est donc pas uniquement d'obtenir un jeu fonctionnel, mais surtout de **mettre en pratique les techniques de développement logiciel étudiées en cours**, notamment les tests, le débogage, le refactoring et l'analyse du code existant.
