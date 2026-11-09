# Rapport hebdomadaire semaine 6

### Ce que j'ai fait
J'ai regardé les slides et les vidéos de Lect06 : M5-4 (Delegation vs. Inheritance), M4-2 (Objects vs. Data, étude de la classe Point) et M5-5 (Turning Procedures to Objects). J'ai aussi révisé les cours précédents (Visitor, Composite, double dispatch, hooks) en vue de l'examen, en refaisant la feuille d'autoévaluation distribuée au début du cours. Sur le projet Chess, j'ai fait le kata "Refactor piece rendering" pour remplacer les `ifTrue:ifFalse:` imbriqués par du polymorphisme (chaque pièce connaît sa lettre).

### Ce que j'ai appris
- L'héritage est un lien statique : on choisit le comportement à la compilation, et on ne peut pas le changer pendant que le programme tourne. La délégation est dynamique : un objet confie une partie de son travail à un autre objet, qu'on peut remplacer à l'exécution (pattern Strategy, par exemple).
- On hérite pour spécialiser un comportement ("est un"), pas seulement pour réutiliser du code. Si on veut juste réutiliser, la composition/délégation est souvent mieux et couple moins les classes.
- M4-2 (Point) : un objet n'est pas une structure de données. Il faut lui demander de faire des choses (messages) plutôt que lire ses champs pour décider à sa place. Ça rejoint la loi de Déméter et le "Don't ask, tell" de la semaine dernière.
- M5-5 : transformer une procédure (un gros bloc de conditions) en objets, où chaque cas devient une classe, de façon à remplacer les conditionnels par du polymorphisme.
- Kata "Refactor piece rendering" : la case avait six méthodes `render...:` presque identiques, avec deux `ifTrue:ifFalse:` imbriqués (couleur de la pièce puis de la case). Maintenant chaque pièce donne sa lettre (`id` pour blanc, `blackLetter` pour noir), une seule méthode `renderPieceOn:` dans `MyPiece` et la case met la lettre en minuscule si elle est noire. On passe de 12 conditions à 2. La question du kata : le double dispatch (la pièce se présente à la case, qui doit connaître toutes les pièces) ou le dispatch par table (la pièce fournit une donnée, la case ne connaît aucune pièce). J'ai choisi la table car c'est juste une lettre à fournir, et ajouter une pièce ne demande plus de modifier la case.
- Avant de refactorer, j'ai écrit des tests qui vérifient la lettre affichée selon la pièce, sa couleur et la couleur de la case. Ils passaient avant le refactoring (ils figent le comportement) et ils sont restés verts après.
- Pour l'examen : je dois pouvoir expliquer la différence entre `self` et `super`, le fonctionnement du double dispatch et du Visitor, et savoir quand utiliser un hook ou un template method.

### Difficultés
- Savoir où faire s'arrêter l'héritage : par exemple, faire hériter une classe d'une autre juste pour réutiliser une méthode donne une relation qui n'est pas vraiment "est un".
- Faire le lien entre les trois notions (double dispatch, délégation, polymorphisme) et ne pas les confondre.

### Lien vers mon fork du projet Chess
https://github.com/tom2824/pharo_chess
