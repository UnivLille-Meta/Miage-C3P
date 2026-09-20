### Rapport - Semaine 2

## Exercice Dice :

L’objectif de cet exercice était de créer un petit DSL (Domain-Specific Language) pour manipuler des dés dans Pharo.
J’ai d’abord découvert la notion de classe et d’instance. Une classe définit le comportement et les caractéristiques des objets qui seront créés à partir d’elle. J’ai ensuite créé une classe représentant un dé, avec un nombre de faces et la possibilité de le lancer.
J’ai ensuite découvert la notion de composition avec DieHandle. Cette classe permet de regrouper plusieurs dés et de les manipuler comme un seul objet. Cela permet notamment de lancer plusieurs dés et d’obtenir leur somme.
L’exercice m’a également permis de comprendre le polymorphisme : plusieurs objets différents peuvent répondre au même message, comme roll, tout en ayant leur propre comportement.
J’ai aussi découvert l’utilisation de l’opérateur ‘+’ pour combiner plusieurs ensembles de dés, ainsi que l’extension de classes existantes comme Integer afin de créer une syntaxe plus proche du langage du domaine.

Ce que j’ai retenu : 
- Cet exercice m’a surtout permis de mieux comprendre :
- les classes et les instances 
- la composition entre objets 
- le polymorphisme 
- le principe « Don't Ask, Tell » 
- l’extension des classes existantes 

La difficulté rencontrée était la création de l’extension de Integer dans le package Dice pour les méthodes D20, D6…. 



## Exercice Flag and country : 

Dans cet exercice, j’ai appris à utiliser plusieurs outils de Pharo pour créer une représentation interactive de pays à partir d’un fichier SVG.
J’ai d’abord découvert Roassal, un moteur de visualisation permettant de créer et de manipuler des formes graphiques. J’ai appris à créer des formes simples puis à utiliser des chemins SVG pour représenter la forme d’un pays.
J’ai ensuite découvert le format SVG et la manière dont les informations graphiques d’un pays peuvent être récupérées à partir de son chemin SVG.
L’exercice m’a également permis de découvrir un parseur XML, utilisé pour lire et explorer la structure du fichier world.svg. J’ai appris à naviguer dans un arbre XML afin de récupérer les différents éléments correspondant aux pays.
Pour mieux manipuler ces données, j’ai créé une classe représentant un pays. Chaque pays possède notamment une forme SVG, un nom et un identifiant international. Cela m’a permis de transformer des données XML en objets Pharo.
J’ai ensuite appris à utiliser OrderedCollection pour regrouper plusieurs pays et à parcourir les éléments du fichier afin de construire une collection d’objets.
L’exercice m’a aussi montré comment améliorer l’Inspector de Pharo. Il est possible d’ajouter une représentation graphique personnalisée et de modifier l’affichage textuel des objets afin de rendre les informations plus compréhensibles.
Enfin, j’ai commencé la partie consacrée à l’organisation des pays avec la notion de World. À ce stade, je suis arrivée jusqu’à la question 12.

Ce que j’ai retenu : 
- la visualisation avec Roassal 
- l’utilisation des chemins SVG 
- la lecture de données avec un parseur XML 
- la transformation de données en objets Pharo 
- l’utilisation des collections 
- la personnalisation de l’Inspector 
- l’utilisation de printOn: pour améliorer l’affichage des objets 
- la séparation entre les données d’un objet et leur représentation graphique.
