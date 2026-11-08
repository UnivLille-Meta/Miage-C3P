# Rapport – Semaine 6

Cette semaine, j'ai révisé l'ensemble du module pour préparer l'examen. Pour chaque cours, j'ai relu les slides et revu les vidéos du MOOC, puis j'ai fait beaucoup d'exercices sur les différentes notions.

- **Syntaxe Pharo** : messages et précédence, blocs, boucles et itérateurs. J'ai écrit de petites méthodes sur les entiers et les collections.
- **Héritage et lookup** : j'ai suivi le lookup à la main sur des hiérarchies de classes, pour bien distinguer `self`, qui part de la classe du receveur, et `super`, qui part de la superclasse de la classe où la méthode est écrite.
- **Dispatch et polymorphisme** : j'ai réimplémenté les booléens sans condition, et remplacé des conditions sur un type par des sous-classes.
- **Hooks et Template Method** : j'ai factorisé du code dupliqué dans une superclasse, avec des hooks redéfinis dans les sous-classes.
- **Double dispatch** : j'ai fait des exercices où le résultat dépend de deux objets, sans aucune condition.
- **Null Object** : j'ai remplacé des tests sur `nil` par un objet qui ne fait rien.
- **Composite et Visitor** : j'ai implémenté une structure en arbre avec le Composite, puis sorti ses opérations dans des visiteurs.
- **Couplage et loi de Demeter** : j'ai refactoré du code qui la violait, en rapprochant le comportement des données. J'ai aussi revu le passage d'une variable globale à un paramètre, et le Singleton.
- **Délégation vs. héritage** : j'ai comparé les deux designs sur plusieurs exemples, et utilisé le pattern Strategy.
## Projet Chess

J'ai continué les katas sur mon fork https://github.com/skanderBCA14/Chess, toujours en TDD et par petites étapes, avec un commit à chaque étape et les tests relancés à chaque modification.

### Kata 2 : Refactor piece rendering (terminé)

J'ai fini le kata, une seule méthode `renderPieceOn:` dans `MyPiece`, et j'ai supprimé les six anciennes méthodes `renderKnight:`, `renderQueen:`… avec leurs `if` imbriqués. Les tests de caractérisation de la semaine dernière sont restés verts tout du long.

Ensuite, sur votre remarque en commentaire lors du dernier pull request, j'ai remplacé mes tables de couleurs par un **double dispatch**. J'ai créé deux classes, `ColorWhite` et `ColorBlack`, sous-classes de `Color` pour que le reste du jeu continue de marcher. La pièce demande sa lettre à sa couleur, qui rappelle `whiteLetter` ou `blackLetter`, et la case demande à sa couleur d'écrire la lettre. Les trois tables ont disparu, remplacées par six méthodes d'une ligne.

La semaine dernière, j'avais écrit qu'un double dispatch demanderait une vingtaine de méthodes, j'avais tord. Grâce aux hooks `whiteLetter` et `blackLetter`, deux classes de couleur et trois petites méthodes chacune suffisent. C'est plus simple et plus objet que les tables.

### Kata 3 : Remove nil checks (terminé)

**Les cases vides :** Une case vide contenait `nil`, ce qui obligeait à tester `nil` partout (affichage, sélection, joueurs, roi). J'ai d'abord écrit des tests de caractérisation, puis créé `MyNoPiece`, un **Null Object**, une pièce vide qui répond aux mêmes messages qu'une pièce, sans coups possibles et avec la lettre d'une case vide. Chaque `ifNil:` est devenu un simple envoi de message. J'ai avancé par toutes petites étapes, en adaptant d'abord les tests et la sélection pour qu'ils ne dépendent plus de `nil`.

**Le bord de l'échiquier :** Sortir de l'échiquier renvoyait aussi `nil`, d'où des chaînes de `ifNotNil:` dans le cavalier et le roi. Pour varier par rapport au Null Object, j'ai ajouté `squaresAt:`, qui renvoie une collection c'est à dire une case, ou rien en dehors de l'échiquier. Les déplacements sont maintenant décrits par des `Point` (les sauts du cavalier, les pas du roi, les directions de la tour, du fou et de la dame), et une collection vide disparaît toute seule. Toutes les pièces ont été passées une par une, puis j'ai supprimé l'ancien code (une vingtaine de méthodes de `MyPiece`).

**Ce que j'ai découvert en chemin :** En relisant le roi, j'ai trouvé un bug du code d'origine, le roi ne peut jamais prendre une pièce adverse. Pour aller sur une case, le code demande qu'elle ne soit pas attaquée par l'adversaire, mais si elle contient une pièce adverse, il demande aussi qu'elle soit attaquée. Les deux ne peuvent pas être vrais en même temps. Comme je faisais un refactoring, je n'ai pas changé ce comportement et je l'ai gardé à faire pour plus tard.

### Kata 4 : Implement more bot gaming strategies (terminé)

`MyPlayer >> play` mélangeait trois choses : quels coups sont possibles, comment choisir, et jouer le coup, avec un choix au hasard codé en dur. J'ai appliqué le pattern **Strategy** :
- `MyMove` représente un coup (une pièce et sa case d'arrivée) et sait dire si c'est une prise 
- `MyRandomStrategy` joue au hasard, et `MyCaptureFirstStrategy` prend une pièce dès qu'elle peut 
- le joueur liste ses coups possibles et délègue le choix à sa stratégie, au hasard par défaut.

`play` est découpé en petites méthodes, et le choix des pièces qui peuvent bouger se fait avec un `select:` au lieu d'un `ifTrue:ifFalse:`. J'ai gardé une seule condition, quand aucun coup n'est possible. Les stratégies sont testées sur des listes de coups. Dans le jeu, j'ai vérifié qu'un joueur avec `MyCaptureFirstStrategy` prend toujours la pièce offerte, alors qu'un joueur au hasard la laisse le plus souvent. Ajouter une nouvelle stratégie ne demande plus de toucher à `MyPlayer`.

## Prise de recul

Ce que je retiens surtout, c'est l'importance des tests avant de refactoriser, grâce aux tests de caractérisation, j'ai pu changer beaucoup de code sans casser le jeu. J'ai aussi compris qu'il n'y a pas un seul bon pattern. Pour un même problème (`nil`), j'ai utilisé un Null Object pour les cases vides et une collection vide pour le bord de l'échiquier. Pour les couleurs, je suis passé d'une table à un double dispatch quand ce dernier s'est révélé plus simple.

## Conclusion

Au total, j'ai terminé quatre katas sur le projet Chess :
- **Fix pawn moves!** : les déplacements du pion (avance d'une ou deux cases, prise en diagonale, prise en passant avec un Null Object, promotion), faites en TDD.
- **Refactor piece rendering** : l'affichage des pièces sans `if`, d'abord avec des tables, puis avec un double dispatch grâce à `ColorWhite` et `ColorBlack`.
- **Remove nil checks** : plus aucun test sur `nil`, avec `MyNoPiece` pour les cases vides et `squaresAt:` pour le bord de l'échiquier.
- **Implement more bot gaming strategies** : le choix du coup sorti dans des stratégies (pattern Strategy), avec `MyMove`, `MyRandomStrategy` et `MyCaptureFirstStrategy`.

Maintenant que je suis bien dedans, malgré que ce soit le rendu final, j'essaierai de continuer le projet de mon côté quand j'aurai du temps, surtout en faisant du refactoring, pour continuer à m'exercer sur la programmation orientée objet. Par exemple :
- corriger en TDD le bug du roi qui ne peut jamais capturer
- faire un Composite des déplacements des pièces (un pas, une glissade, un groupe de déplacements), puisque les pièces décrivent déjà leurs déplacements avec des `Point` 
- **Add pawn promotion** : la promotion au choix fonctionne déjà et mes tests sont verts, il ne manque que l'affichage. Il faudrait proposer le choix de la pièce dans l'interface, et laisser un bot choisir tout seul
- chercher d'autres refactorings intéressants à faire dans le code.

Ces katas m'ont vraiment permis de bien comprendre les concepts du cours, en les appliquant sur un vrai code et m'ont aussi servi d'exercices de révision pour l'examen.
