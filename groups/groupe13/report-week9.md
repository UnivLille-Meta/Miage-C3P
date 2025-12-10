## Gautam Demeulemeester

Cette semaine nous avons commencé à découvrir notre nouveau projet SOKOBAN en le chargeant sur nos machine. Nous avons créé un fork du projet qui sera notre répertoire de travail : https://github.com/K-Boo/Myg

J'ai également lu les PDF des modules 7 et 8. Le module 7 aborde les différents modèles et techniques de création d’objets, notamment la création différée (lazy initialization), la délégation de comportements, et le patron de conception Builder pour construire des objets complexes. Le module 8 traite des méthodes de partage d’objets et de ressources, comme les variables partagées, le Flyweight et le Type Object, afin d’optimiser la mémoire et la réutilisation des données entre instances.

## HEDDI Abdelkader

Cette semaine, en plus des modules à travailler, j'ai commencé à me renseigner sur le nouveau projet de groupe **Myg: Sokoban Challenges**.

J'ai identifié pour mon groupe plusieurs fonctionnalités intéressantes à implémenter :

- **Teleport tiles** : système de téléportation permettant au joueur de se déplacer instantanément entre deux tuiles de téléportation
- **Counting moves and push** : affichage du nombre de mouvements et de poussées effectuées par le joueur
- **Numbered Target** : système de cibles numérotées où les boîtes doivent être placées dans un ordre spécifique
- **Paired Target/Box** : mécanisme de paires cible/boîte où chaque boîte ne peut être placée que sur sa cible associée, avec possibilité de mélanger des boîtes appariées et non appariées

J'ai également commencé à réfléchir à l'architecture du code et à la manière dont ces fonctionnalités pourraient s'intégrer dans la structure existante. Cette phase de recherche va nous permettre de mieux planifier l'implémentation et d'identifier les défis techniques potentiels avant de commencer le développement.

Je n'ai pas de questions pour cette semaine.

## Khalil BOUCHAMA

Cette semaine, j'ai essayé de comprendre la structure du jeu **SOKOBAN**. J'ai essayé de reverse le code pour mieux le comprendre pour, par la suite, implémenter les fonctionnalités demandées. 
La classe **Sokoban** semble être le point d'entrée et gère l'interface (menus, navigation). 
**MygSkGameManager** orchestre la logique : gestion des niveaux stockés en chaînes ASCII, comptage des mouvements, lancement des parties. 
**MygSkBoard** représente le plateau comme une grille 2D.

La code est structuré de la manière suivante : **MygSkObject** (base) → **MygSkMovable** → **MygSkPlayer** et **MygSkBox**. Les éléments statiques incluent **MygSkWall**, **MygSkGround** et **MygSkTarget**. Chaque objet mobile possède un `background` représentant le sol sous-jacent, permettant la superposition visuelle.

Le déplacement utilise un double dispatch via `moveIn:` et `bringIn:`. Le joueur demande à sa destination d'accepter le mouvement. Si c'est une boîte, elle tente de se déplacer dans la direction suivante. **MygSkBoard** met à jour les positions en gérant les swaps entre éléments mobiles et leurs backgrounds.

L'affichage utilise Bloc (BlElement) avec **MygSkBoardElement** gérant deux couches (background/foreground). Les niveaux sont organisés en packs accessibles via un menu déroulant.
