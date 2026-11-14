# Chess — Rapport des travaux réalisés

**Auteur :** Mohamed Habbaz  
**Date :** 13 octobre 2026  
**Environnement utilisé :** Pharo 13 sous Windows  
**Dépôt personnel :** https://github.com/habbazmohamed/Chess  
**Projet d’origine :** https://github.com/UnivLille-Meta/Chess

## 1. Objectif

Ce travail porte sur l’amélioration d’un projet de jeu d’échecs existant en Pharo/Smalltalk. Les modifications concernent les déplacements des pions, leurs cases d’attaque et la prise en passant.

L’objectif était de comprendre le fonctionnement du projet, de corriger le comportement des pions, puis de vérifier les modifications avec des tests unitaires avant de les enregistrer sur GitHub.

## 2. Prise en main du projet

Les premières étapes ont consisté à :

- récupérer le projet dans un dépôt personnel et le cloner avec Git ;
- configurer l’authentification SSH pour GitHub ;
- charger et lancer le projet dans Pharo ;
- étudier les classes du jeu et le fonctionnement du bouton « Play! » ;
- comprendre le déplacement d’une pièce et l’enregistrement des coups.

### Classes concernées

| Classe | Rôle dans le travail |
| --- | --- |
| `MyChessGame` | Gestion de la partie, exécution des déplacements et mémorisation du dernier coup. |
| `MyChessBoard` | Accès aux cases et à la partie associée au plateau. |
| `MyChessSquare` | Représentation d’une case et calcul des cases voisines. |
| `MyPiece` | Comportement commun aux pièces, notamment le déplacement. |
| `MyPawn` | Déplacements, attaques et prise en passant des pions. |
| `MyPawnTests` | Tests unitaires ajoutés pour vérifier les comportements des pions. |

## 3. Compréhension des coordonnées

La méthode `MyChessSquare >> + aPoint` permet de chercher une case voisine en ajoutant un déplacement à ses coordonnées.

Exemples :

- `square + (0 @ 1)` : une case vers le haut ;
- `square + (-1 @ 0)` : une case vers la gauche ;
- `square + (1 @ 1)` : une case en diagonale.

Si les coordonnées dépassent les limites du plateau, la méthode renvoie `nil`. Les méthodes des pions vérifient donc qu’une case existe avant de l’utiliser.

## 4. Correction des déplacements des pions

La méthode `MyPawn >> targetSquaresLegal:` a été modifiée pour construire les destinations possibles selon la couleur du pion et l’occupation des cases.

Les règles prises en compte sont les suivantes :

- un pion avance d’une case si celle-ci est vide ;
- un pion peut avancer de deux cases depuis sa rangée de départ : rangée 2 pour les blancs et rangée 7 pour les noirs ;
- le déplacement de deux cases exige que les deux cases devant le pion soient vides ;
- un pion ne capture pas une pièce située directement devant lui ;
- une capture ordinaire se fait en diagonale sur une pièce adverse ;
- les déplacements hors du plateau sont exclus.

La direction utilisée est `1` pour un pion blanc et `-1` pour un pion noir.

## 5. Séparation entre déplacements et attaques

La méthode `MyPawn >> attackingSquares` a été ajoutée.

Elle renvoie les deux diagonales devant le pion, dans la limite du plateau, même si ces cases sont vides. Cette distinction est nécessaire : un pion avance tout droit, mais attaque en diagonale.

Cette méthode ne renvoie donc pas simplement les destinations de déplacement du pion.

## 6. Ajout de la prise en passant

### Mémorisation du dernier déplacement

Trois variables d’instance ont été ajoutées dans `MyChessGame` :

| Variable | Information conservée |
| --- | --- |
| `lastMovedPiece` | La dernière pièce déplacée. |
| `lastMoveFrom` | Sa case de départ. |
| `lastMoveTo` | Sa case d’arrivée. |

La méthode `move:to:` a été adaptée pour mémoriser ces informations après un déplacement effectivement réalisé. Si la pièce reste sur sa case d’origine, le coup n’est pas enregistré.

Un accesseur `board` a également été ajouté pour accéder au plateau, notamment depuis les tests.

### Détection de la prise en passant

La méthode `MyChessGame >> enPassantTargetFor:` détermine si un pion peut effectuer une prise en passant.

Elle vérifie notamment que :

- la dernière pièce déplacée est un pion adverse ;
- ce pion vient d’avancer de deux cases depuis sa rangée de départ, sur la même colonne ;
- il se trouve sur une colonne voisine et sur la même rangée que le pion qui capture ;
- il occupe toujours sa case d’arrivée ;
- la case de destination de la capture existe et est vide.

Comme seule la dernière action est mémorisée, cette possibilité expire après un autre déplacement.

### Exécution de la capture

La méthode `MyPawn >> moveTo:` a été ajoutée pour compléter le déplacement hérité de `MyPiece`.

Lors d’une prise en passant, le pion se déplace vers la case cible vide, puis le pion adverse est retiré de sa propre case. La suppression intervient après la réussite du déplacement.

Exemple testé : un pion blanc en `e5` peut capturer en `d6` immédiatement après le déplacement d’un pion noir de `d7` vers `d5`. Le pion noir est alors retiré de `d5`.

## 7. Tests unitaires

Une classe `MyPawnTests`, sous-classe de `TestCase`, a été ajoutée dans le package `Myg-Chess-Tests`.

Les scénarios suivants ont été vérifiés :

| Scénario | Résultat attendu |
| --- | --- |
| Pièce adverse directement devant un pion blanc | La capture en ligne droite est interdite. |
| Case libre devant un pion blanc | L’avance d’une case est possible. |
| Pièce adverse en diagonale | La capture est possible. |
| Pion blanc sur sa rangée de départ | L’avance de deux cases est possible si le chemin est libre. |
| Obstacle devant le pion | Le pion ne peut pas franchir cet obstacle. |
| Cases d’attaque d’un pion blanc | Seules les diagonales vers l’avant sont renvoyées. |
| Cases d’attaque d’un pion noir | Les diagonales sont calculées dans le sens opposé. |
| Prise en passant par un pion blanc | Le pion arrive sur la case cible et le pion noir est retiré. |
| Prise en passant par un pion noir | Le pion arrive sur la case cible et le pion blanc est retiré. |
| Autre déplacement après l’avance de deux cases | La prise en passant n’est plus disponible. |

**Résultat observé : les tests des pions exécutés dans Pharo sont verts.**

Ce résultat porte sur les scénarios testés. Il ne constitue pas une validation complète de toutes les règles du jeu d’échecs.

Pour relancer ces tests, ouvrir le Test Runner de Pharo, sélectionner `MyPawnTests`, puis exécuter les tests de cette classe.

## 8. Lancement du jeu

Une fois le projet chargé dans Pharo, le jeu peut être ouvert depuis un Playground avec :

```smalltalk
| board space |
board := MyChessGame freshGame.
board size: 800 @ 600.
space := BlSpace new.
space root addChild: board.
space pulse.
space resizable: true.
space show.
```

Le bouton « Play! » déclenche le jeu du joueur courant, puis le changement de joueur.

## 9. Enregistrement et publication

Les modifications ont été enregistrées avec Iceberg dans le commit :

```text
50fffb4 — Corriger les déplacements des pions et ajouter la prise en passant
```

Des avertissements de qualité de code ont été affichés lors du commit, notamment sur le nombre de variables, la longueur d’une méthode et le nom de la classe de tests. Le commit a été effectué.

Une erreur est ensuite apparue dans la fenêtre de saisie des informations SSH d’Iceberg :

```text
#hostDescription was sent to nil
```

L’envoi a été réalisé depuis PowerShell après vérification du dernier commit et de l’adresse du dépôt distant :

```powershell
git log -1 --oneline
git remote -v
git push -u origin main
```

**Le push a réussi : le commit `50fffb4` est publié sur la branche `main` du dépôt personnel.**

## 10. Limites et suites possibles

Les modifications réalisées couvrent les déplacements des pions, leurs attaques et la prise en passant dans les scénarios testés.

Les points suivants restent à traiter ou à vérifier :

- la promotion des pions ;
- la validation complète des coups pour empêcher de laisser son propre roi en échec, y compris lors d’une prise en passant ;
- l’exécution de l’ensemble des tests du projet pour rechercher d’éventuelles régressions ;
- la vérification de la prise en passant dans une partie jouée via l’interface ;
- l’amélioration du code signalé par les avertissements d’Iceberg.

Un essai d’initialisation d’une position réduite avec une chaîne FEN a également rencontré une erreur de lecture. Les tests de prise en passant ont été construits à partir de `freshGame`, puis en préparant le plateau. Le problème de lecture FEN n’a pas été corrigé dans ce travail.

## 11. Bilan

Ce travail a permis de pratiquer la programmation objet en Smalltalk, l’héritage, les collections et les tests unitaires. Il a aussi permis d’utiliser Iceberg et Git pour conserver les modifications et les publier sur GitHub.

La principale contribution est la correction du comportement des pions et l’ajout de la prise en passant, accompagnés de tests unitaires.

