# Rapport Semaine 6

## Ce que j'ai fait

En plus d'avoir retiré (presque) tous les ifNotNil dans le projet, j'ai décidé de faire un autre kata sur le rendu des pions car j'aimais tout simplement bien l'idée de faire une lookup table.

## La suppression des nil

(Commit)[https://github.com/bapoDev/Chess/commit/3ba11e19bf7c42cc50f0e89f273f589d2676aace]
Dans cette première étape, j'ai créé deux nouvelles classes `MyNullSquare` et `MyNullPiece` qui représentent, sans surprise, l'état nil d'une case ou d'un pion.

### MyNullPiece

MyNullPiece est donc une classe qui hérite de Object. N'ayant pas de données à retourner, elle retourne tout simplement nil ou des valeurs vides (comme pour id, une chaine vide). `MyNullPiece` est donc utilisée dans les initailisations de `MyChessSquare` dans `contents`, remplaçant nil. De ce fait, l'attribut `contents` est toujours un objet. Pour tester si un pion est présent ou non, le message `isPiece` dans `MyNullPiece` renvoie false, comme ça, on peut tester `hasPiece` dans un `MyChessSquare`.

### MyNullSquare

Comme `MyNullPiece`, `MyNullSquare` ne contient pas d'attributs et renvoie des valeurs par défaut, comme par exemple dans `contents`, l'objet renvoie toujours une instance de `MyNullPiece`. Elle contient également une méthode isSquare qui renvoie false qui nous permet de tester si il s'agit d'un Square ou d'un NullSquare. Cela change donc la majorité des méthodes qui vérifient ifNotNil, notamment pour les mouvements des différentes pièces. Ces changements ont demandé de déplacer le comportement des classes MySelectedState et MyUnselectedState pour que le comportement ne génère pas d'erreurs si la piece ou le square est une des deux nouvelles classes.

Ces changements n'ont généré aucune régression dans les tests.

## Le refactoring du rendu des pièces

(Commit)[https://github.com/bapoDev/Chess/commit/9b9b3e7aefdfc015869693fd4f66bc1a85dd1dae]

Ce refactoring était plus simple que prévu, les indications sur le Readme.md du Git m'ont mené à faire une lookup table pour éviter les conditions qui sont PARTOUT dans la logique de rendu des pièces. Il a fallu créer un dictionnaire de données où chaque pièce différente correspond à une lettre différente selon son sa couleur et la couleur de sa case. Le dictionnaire est donc une variable de classe et non d'instance. Il suffisait donc de créer les méthodes de classe `renderingTable` et `buildRenderingTable`, l'une étant un simple getter et l'autre un initialiseur. Le getter est de même un initialiseur paresseux qui appelle buildRenderingTable. J'ai aussi créé une méthode resetRenderingTable, au cas où je voulais faire un système de theming plus tard où il faudrait changer les lettres pour certaines pièces, ce serait un moyen d'avoir une thème avec sa propre lookup table et de la changer en cours de jeu.

Ce changement a supprimé 69 `if` dans le projet ce qui équivaut à 69 chatons kawaii épargnés de leur triste sort.