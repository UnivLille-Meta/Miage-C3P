# Rapport du TP Chess

## Introduction

L’objectif de ce TP était de travailler sur un projet existant en Pharo à travers plusieurs katas portant sur les tests, le débogage, le refactoring, le polymorphisme et les design patterns.

J’ai commencé par le kata **Fix pawn moves**, car il permettait de comprendre le fonctionnement du jeu avec une première correction simple. J’ai suivi la démarche **TDD** (*Test-Driven Development*) :

1. écrire un test qui montre le problème ;
2. modifier le code ;
3. relancer le test pour vérifier la correction.

## Lien vers mon projet Chess

Le code source et l'historique de mes commits
sont disponibles dans mon fork GitHub :

https://github.com/chalahlaeticia/Chess

Ce dépôt contient les modifications réalisées
pour les différents katas du TP.


---

## Kata 1 — Fix pawn moves

### Objectif

Le premier objectif était de corriger le déplacement initial du pion. Un pion peut avancer de deux cases uniquement lorsqu’il se trouve sur son rang de départ et lorsque les deux cases devant lui sont libres.

- Le pion blanc commence sur le rang `2` et monte.
- Le pion noir commence sur le rang `7` et descend.

### Commit 1 — Correction du déplacement initial de deux cases

**Commit :** `ddc551b`

J’ai d’abord ajouté un test qui place un pion blanc en `e2` et vérifie que les cases `e3` et `e4` sont proposées comme déplacements possibles.

J’ai ensuite modifié la méthode `MyPawn >> targetSquaresLegal , :`

j’ai utilisé deux variables :

- `first` représente la première case devant le pion ;
- `second` représente la deuxième case devant le pion.
pour :

- calculer la première et la deuxième case devant le pion ;
- prendre en compte sa couleur et sa direction ;
- vérifier qu’il se trouve sur son rang initial ;
- vérifier que les deux cases sont libres.

### Lien avec le cours

Ce commit m’a permis d’appliquer :

- la démarche **TDD** ;
- les tests unitaires ;
- les blocs conditionnels ;
- les collections Pharo ;
- le débogage progressif.

### Résultat

Le pion peut maintenant avancer d’une ou de deux cases depuis sa position initiale lorsque le chemin est libre.

### Commit 2 — Ajout des tests de restriction du déplacement

**Commit :** `347d49d`

Après avoir ajouté le déplacement initial de deux cases, j’ai complété les tests pour vérifier les restrictions de ce déplacement.

Deux situations sont maintenant testées :

- un pion blanc placé en `e2` peut avancer vers `e3` et `e4` si le chemin est libre ;
- si la case `e4` est occupée, elle ne doit pas apparaître dans les déplacements possibles.

J’ai également regroupé ces tests dans la classe `MyPawnTest` afin de garder une seule classe de test pour le pion.


### Commit 3 — Correction de la capture diagonale du pion

**Commit :** `1901ea1`

Le pion ne se déplace pas de la même manière lorsqu’il avance et lorsqu’il capture une pièce. Il avance verticalement, mais capture uniquement en diagonale.

J’ai ajouté la méthode `captureSquares` pour séparer le calcul des captures du déplacement normal.

Cette méthode calcule les deux cases diagonales selon la couleur :

- `up left` et `up right` pour un pion blanc ;
- `down left` et `down right` pour un pion noir.

Une case diagonale est retenue uniquement si :

- elle existe sur le plateau ;
- elle contient une pièce ;
- cette pièce possède une couleur différente.

Les cases trouvées par `captureSquares` sont ensuite ajoutées aux déplacements possibles du pion.

### Test ajouté

J’ai placé un pion blanc en `e4` et un pion noir en `f5`. Le test vérifie que `f5` appartient aux cases accessibles par le pion blanc.


### Résultat

Le pion peut maintenant capturer une pièce adverse située sur une case diagonale.

### Commit 4 — Correction de la capture du pion au bord de l’échiquier

**Commit :** `e3ac03d`

Après avoir ajouté la capture diagonale, j’ai remarqué un problème quand le pion se trouvait au bord du plateau.

Le code calculait directement les diagonales avec `square up left` ou `square down right`. Si la première case calculée était en dehors du plateau, le résultat était `nil` et Pharo essayait ensuite de lui envoyer le message `left` ou `right`.

### Approche suivie

J’ai séparé le calcul en deux étapes :

- calculer d’abord la case devant le pion ;
- calculer ensuite les diagonales seulement si cette case existe.

Pour cela, j’ai utilisé `ifNotNil:` avant d’envoyer les messages `left` et `right`.

### Test ajouté

Aucun nouveau test n’a été ajouté dans ce commit. Le test du cas limite a été ajouté dans le commit suivant pour vérifier que le problème ne revient pas.

### Commit 5 — Ajout d’un test pour le pion au bord de l’échiquier

**Commit :** `fa64ad0`

Après avoir corrigé le problème de capture au bord du plateau, j’ai ajouté un test pour protéger cette correction.

---

## Kata 2 — Refactor piece rendering

### Objectif

Après avoir corrigé le déplacement du pion, j’ai choisi le kata **Refactor piece rendering** car il correspond directement aux notions de **double dispatch** et de **table dispatch** vues en cours.

Le rendu d’une pièce dépend de deux objets :

- la couleur de la pièce ;
- la couleur de la case.

Avant de modifier le code, j’ai commencé par écrire un test pour protéger le comportement actuel.

### Commit 1 — Ajout du test de rendu du fou

**Commit :** `63a4f5b`

J’ai créé la classe `MyChessRenderingTest` et commencé avec le fou, car toutes les pièces utilisent presque la même logique de rendu.

### Approche suivie

Le test crée :

- un fou blanc ;
- un fou noir ;
- une case blanche ;
- une case noire.

Il vérifie ensuite les quatre combinaisons possibles :

| Pièce | Case | Résultat |
|---|---|---|
| Fou blanc | Case blanche | `B` |
| Fou blanc | Case noire | `b` |
| Fou noir | Case blanche | `V` |
| Fou noir | Case noire | `v` |

### Test ajouté

Le test `testBishopRendering` vérifie que le rendu du fou reste identique avant et après le refactoring.

L’appel commence par :

```smalltalk
whiteBishop renderPieceOn: whiteSquare
```

### Commit 2 — Simplification du rendu du fou avec table dispatch

**Commit :** `3e05137`

La méthode `renderBishop:` contenait plusieurs `ifTrue:` et `ifFalse:` imbriqués pour choisir la lettre du fou. Comme les quatre résultats étaient déjà protégés par le test précédent, j’ai pu simplifier cette méthode.

### Approche suivie

J’ai créé la méthode générale `renderPiece:withLetters:`. Elle utilise un dictionnaire pour associer la couleur de la pièce et la couleur de la case à un index.

Pour le fou, les lettres sont données dans cet ordre :

| Pièce | Case | Index | Lettre |
|---|---|---:|---|
| Blanche | Blanche | 1 | `B` |
| Blanche | Noire | 2 | `b` |
| Noire | Blanche | 3 | `V` |
| Noire | Noire | 4 | `v` |

La méthode `renderBishop:` devient donc un simple appel avec les quatre lettres du fou.

### Test utilisé

J’ai relancé `testBishopRendering` pour vérifier que les quatre combinaisons donnaient toujours les mêmes résultats après le refactoring.

Le double dispatch choisit la méthode adaptée au type de pièce, puis le table dispatch choisit la lettre selon les deux couleurs.

### Résultat

Le rendu du fou reste identique, mais la méthode contient moins de conditions et la logique peut être réutilisée pour les autres pièces.

### Commit 3 — Simplification du rendu de toutes les pièces

**Commit :** `1c58cde`

Après avoir testé le table dispatch sur le fou, j’ai appliqué la même solution aux autres pièces :

- le roi ;
- le cavalier ;
- le pion ;
- la dame ;
- la tour.

Chaque méthode de rendu appelle maintenant `renderPiece:withLetters:` avec les quatre lettres correspondant à la pièce.

### Approche suivie

J’ai d’abord ajouté un test pour chaque type de pièce. Chaque test vérifie les quatre combinaisons possibles entre la couleur de la pièce et celle de la case.

J’ai ensuite remplacé les conditions imbriquées dans les méthodes `renderKing:`, `renderKnight:`, `renderPawn:`, `renderQueen:` et `renderRook:` par des appels à la méthode générale.

### Difficulté rencontrée

J’avais déjà réalisé une partie de ce travail, mais je ne l’avais pas correctement enregistrée dans Pharo. J’ai passé beaucoup de temps à essayer de récupérer mes modifications avant de devoir les refaire.

Je voulais demander de l’aide à l’enseignant ou à Faouzi, mais les blocages à l’université ne m’ont pas permis de les rencontrer à ce moment-là. Cette partie m’a donc pris plus de temps que prévu.

### Tests ajoutés

J’ai ajouté des tests de rendu pour toutes les pièces. Ils vérifient que le résultat reste correct après le refactoring.

Ce commit applique :

- le **double dispatch** ;
- le **table dispatch** ;
- le refactoring ;
- la suppression des conditions répétées ;
- les tests de non-régression ;
- la réutilisation d’une méthode commune.

### Résultat

Toutes les pièces utilisent maintenant la même logique de table dispatch. Le code est plus court, moins répétitif et les différents rendus sont protégés par des tests.

---

## Kata 3 — Remove nil checks

### Objectif

J’ai ensuite choisi le kata **Remove nil checks**, car il permet de travailler le polymorphisme et le pattern **Null Object** vus en cours.

Dans le code initial, `nil` était utilisé pour représenter :

- une case vide ;
- une position située en dehors du plateau.

Cela obligeait plusieurs méthodes à utiliser `isNil`, `notNil`, `ifNil:` ou `ifNotNil:`. L’objectif était de remplacer progressivement ces vérifications par de vrais objets.

### Commit 1 — Ajout du test des déplacements au bord du plateau

**Commit :** `c2d96a7`

Avant de remplacer `nil`, j’ai ajouté un test pour protéger le comportement de la tour lorsqu’elle se trouve dans un coin du plateau.

### Approche suivie

Le test place une tour blanche en `a1` et calcule ses déplacements possibles.

Depuis cette position, elle doit pouvoir atteindre :

- les sept cases de `a2` à `a8` ;
- les sept cases de `b1` à `h1`.

Le test vérifie donc que la tour possède exactement 14 déplacements et qu’ils sont tous situés à l’intérieur du plateau.

J’ai aussi corrigé le test de l’obstacle de même couleur pour utiliser une pièce blanche, car il doit vérifier qu’une tour blanche ne peut ni traverser ni capturer une pièce de sa propre couleur.

### Test ajouté

Le test `testMovesFromCornerStayInsideBoard` protège le comportement actuel avant le refactoring.
---

## Kata 3 — Remove nil checks

### Objectif

J’ai ensuite choisi le kata **Remove nil checks**, car il permet de travailler le polymorphisme et le pattern **Null Object** vus en cours.

Dans le code initial, `nil` était utilisé pour représenter :

- une case vide ;
- une position située en dehors du plateau.

Cela obligeait plusieurs méthodes à utiliser `isNil`, `notNil`, `ifNil:` ou `ifNotNil:`. L’objectif était de remplacer progressivement ces vérifications par de vrais objets.

### Commit 1 — Ajout du test des déplacements au bord du plateau

**Commit :** `c2d96a7`

Avant de remplacer `nil`, j’ai ajouté un test pour protéger le comportement de la tour lorsqu’elle se trouve dans un coin du plateau.

### Approche suivie

Le test place une tour blanche en `a1` et calcule ses déplacements possibles.

Depuis cette position, elle doit pouvoir atteindre :

- les sept cases de `a2` à `a8` ;
- les sept cases de `b1` à `h1`.

Le test vérifie donc que la tour possède exactement 14 déplacements et qu’ils sont tous situés à l’intérieur du plateau.

J’ai aussi corrigé le test de l’obstacle de même couleur pour utiliser une pièce blanche, car il doit vérifier qu’une tour blanche ne peut ni traverser ni capturer une pièce de sa propre couleur.

### Test ajouté

Le test `testMovesFromCornerStayInsideBoard` protège le comportement actuel avant le refactoring.

### Résultat

Les déplacements de la tour depuis un coin sont protégés par un test. Je pouvais ensuite remplacer le `nil` utilisé hors du plateau sans modifier ce comportement.

### Commit 2 — Remplacement du `nil` hors plateau par un objet

**Commit :** `066f356`

Avant cette modification, la méthode `MyChessSquare >> +` retournait `nil` lorsqu’un déplacement sortait du plateau. Il fallait donc vérifier régulièrement `notNil` avant d’utiliser une case.

J’ai remplacé ce `nil` par un objet `MyOutOfBoardSquare`.

### Approche suivie

J’ai créé `MyOutOfBoardSquare` comme sous-classe de `MyChessSquare`. Cet objet représente une position située en dehors de l’échiquier.

Il répond directement aux messages utilisés pendant le calcul des déplacements :

- `isInsideBoard` retourne `false` ;
- `containsOpponentOfColor:` retourne `false` ;
- `+` retourne le même objet ;
- `hasPiece` retourne `true` pour arrêter la recherche dans cette direction.

Une case normale retourne `true` à `isInsideBoard`.

J’ai ensuite remplacé les vérifications avec `notNil` dans `MyPiece` par des messages comme `isInsideBoard` et `containsOpponentOfColor:`.

### Test ajouté

J’ai ajouté `testMovingOutsideBoardReturnsOutOfBoardSquare`.

Le test part de la case `h4`, se déplace vers la droite et vérifie que le résultat est reconnu comme une position hors du plateau.

Ce commit applique :

- le pattern **Null Object** ;
- le polymorphisme ;
- la suppression progressive des vérifications de `nil` ;
- le remplacement des conditions par des envois de messages ;
- les tests avant et après un refactoring.

Au lieu de demander si une case est `nil`, chaque objet répond lui-même selon son comportement.

### Résultat

Les déplacements hors du plateau retournent maintenant un objet `MyOutOfBoardSquare`. Le calcul des déplacements utilise moins de vérifications avec `nil` et reste protégé par les tests.


### Commit 3 — Remplacement du `nil` des cases vides

**Commit :** `c1fe7d0`

Après avoir remplacé le `nil` utilisé hors du plateau, j’ai travaillé sur le deuxième cas : les cases vides.

Avant, une case sans pièce avait `nil` comme contenu. La méthode `contents:` devait donc utiliser `ifNil:` et `ifNotNil:` pour choisir son affichage.

### Approche suivie

J’ai créé la classe `MyEmptyPiece` pour représenter l’absence de pièce.

Cet objet répond aux messages suivants :

- `isPiece` retourne `false` ;
- `renderPieceOn:` demande à la case d’exécuter `renderEmpty`.

Dans `MyChessSquare`, la méthode `hasPiece` utilise maintenant `contents isPiece` au lieu de vérifier si le contenu est `nil`.

La méthode `emptyContents` place un `MyEmptyPiece` dans la case. J’ai aussi modifié `initializeSquares` pour que toutes les cases vides soient initialisées avec cet objet.

Pour le rendu, `MyChessSquare >> renderEmpty` retourne le caractère correspondant à la couleur de la case.

### Test ajouté

J’ai ajouté `testEmptySquareUsesAnObject`.

Le test vérifie qu’une case vide :

- ne contient pas une vraie pièce ;
- possède quand même un objet comme contenu ;
- n’utilise donc plus `nil`.

### Lien avec le cours

Ce commit applique :

- le pattern **Null Object** ;
- le polymorphisme ;
- le double dispatch pour le rendu d’une case vide ;
- la suppression de `ifNil:` et `ifNotNil:` ;
- le remplacement des conditions par des envois de messages.

### Difficulté rencontrée

Cette modification touche plusieurs parties du jeu, car certaines méthodes supposaient encore qu’une case vide contenait `nil`.

Après le changement, un ancien test du roi ne fonctionnait plus, car son code envoyait directement le message `color` au contenu des cases. Cette partie doit encore être adaptée pour utiliser le polymorphisme avec `MyEmptyPiece`.

### Résultat

Les cases vides contiennent maintenant un objet `MyEmptyPiece` au lieu de `nil`. Le rendu et la détection d’une pièce fonctionnent sans utiliser `ifNil:` dans `MyChessSquare`.

---

## Kata 4 — Implement more bot gaming strategies

### Objectif

J’ai choisi ce kata car il correspond au pattern **Strategy** vu en cours.

Dans le code initial, la méthode `MyPlayer >> play` utilisait directement `atRandom` pour choisir une pièce et un déplacement. La stratégie du bot était donc mélangée avec le fonctionnement du joueur.

L’objectif était de séparer ce choix pour pouvoir changer facilement le comportement du bot.

### Commit 1 — Ajout de stratégies interchangeables pour le bot

**Commit :** `4aff7c0`

J’ai créé deux premières stratégies :

- `MyRandomStrategy`, qui choisit un élément avec `atRandom` ;
- `MyFirstStrategy`, qui choisit toujours le premier élément.

### Approche suivie

J’ai ajouté une variable `strategy` dans `MyPlayer`.

Par défaut, un nouveau joueur utilise `MyRandomStrategy`. Dans la méthode `play`, les choix sont maintenant délégués à la stratégie avec `chooseFrom:`.

Le joueur ne décide donc plus lui-même comment choisir une pièce ou une case. Il demande simplement à sa stratégie de le faire.

J’ai aussi ajouté les méthodes `strategy` et `strategy:` pour pouvoir consulter ou remplacer la stratégie pendant l’exécution.

Enfin, j’ai adapté `MyPlayer >> pieces` au kata précédent. La méthode utilise maintenant `isPiece` au lieu de `notNil`, car les cases vides contiennent des objets `MyEmptyPiece`.


### Tests ajoutés

J’ai créé `MyPlayerTest` avec plusieurs tests :

- vérifier que la stratégie aléatoire choisit un élément de la collection ;
- vérifier que `MyFirstStrategy` choisit le premier élément ;
- vérifier que la stratégie par défaut est `MyRandomStrategy` ;
- vérifier qu’un joueur peut changer de stratégie ;
- vérifier qu’un joueur blanc possède bien 16 pièces au début de la partie.

### Résultat

Le comportement du bot est maintenant interchangeable. On peut changer sa stratégie sans modifier la méthode `play`.

### Commit 2 — Ajout d’une stratégie de capture

**Commit :** `487bdf0`

Après avoir rendu les stratégies interchangeables, j’ai ajouté une stratégie avec un comportement plus utile : `MyCaptureStrategy`.

Cette stratégie privilégie une case occupée afin de capturer une pièce. Si aucune capture n’est disponible, elle choisit un élément au hasard.

### Approche suivie

La méthode `chooseFrom:` parcourt la collection avec `detect:ifNone:` :

- elle choisit le premier élément qui répond vrai à `isCaptureTarget` ;
- si elle n’en trouve aucun, elle utilise `atRandom`.

J’ai ajouté le message `isCaptureTarget` dans les objets concernés :

- une case retourne le résultat de `hasPiece` ;
- une pièce retourne `false`.

Cela permet d’utiliser le polymorphisme sans vérifier directement le type des objets.

### Résultat

Le bot possède maintenant une stratégie qui privilégie une capture lorsqu’elle est disponible et effectue un choix aléatoire dans le cas contraire.

## Conclusion

Ce TP m’a permis de travailler progressivement sur un projet existant en Pharo.

## Notions appliquées

- TDD et tests de non-régression ;
- débogage ;
- refactoring ;
- polymorphisme ;
- double dispatch ;
- table dispatch ;
- pattern Null Object ;
- pattern Strategy ;
- collections et blocs Pharo.
