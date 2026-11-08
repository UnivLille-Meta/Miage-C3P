# Ce que j’ai appris

- L’héritage permet de créer des sous-classes qui ont des comportements différents. Cependant, dès que l’on ajoute plusieurs fonctionnalités, le nombre de classes augmente rapidement : c’est l’**explosion combinatoire**. De plus, il est difficile de modifier le comportement d’un objet pendant l’exécution.

- La **délégation** consiste à confier une tâche à un autre objet. Par exemple, un `TextEditor` délègue le formatage à un `Formatter`. On peut ainsi remplacer facilement le formatter sans modifier le `TextEditor`.

La délégation apporte donc une meilleure modularité et une plus grande flexibilité à l’exécution.


- **Couplage** : éviter qu’une classe dépende trop de plusieurs autres classes.
- **Encapsulation** : cacher les détails internes d’un objet.
- **Loi de Déméter** : un objet doit principalement communiquer avec ses objets proches (ne pas sauter les intermédiaires).
- **Move Behavior Close to Data** : placer le comportement dans la classe qui possède les données concernées.

La Loi de Déméter est une heuristique : il ne faut pas l’appliquer de manière aveugle.

# Partie TP

Dans le cadre du TP, j’ai travaillé sur :

- **Remove nil checks** : j’ai remplacé les cases vides et les cases hors plateau par des objets qui savent se comporter correctement tout seuls, afin d’éviter de vérifier `nil` avant chaque action.
- **Implement more bot gaming strategies** : j’ai séparé la façon de choisir un coup de la façon de jouer un coup, pour pouvoir brancher facilement différentes stratégies dans le jeu.


Lien GitHub : [Lien vers TP](https://github.com/AbdellaouiHajar1/tp_chess/tree/main)
