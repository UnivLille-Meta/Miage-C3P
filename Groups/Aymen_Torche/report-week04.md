Cours 
Encapsulation & Couplage : 

C’était une notion que j’avais très mal compris, et j’ai pas vraiment cherché à comprendre, ça me faisait un peu peur. 

Je pensais que tout couplage était mauvais.  

Maintenant, je comprends la notion d’Encapsulation, de Couplage et surtout le lien entre les 2. 

De ce que j’ai compris : 

L’encapsulation est un principe de conception qui sépare la logique métier d’un objet de ses fonctionnalités publiques. 
Le détail des mécanismes de l’objet n’est pas présenté, il sert aux méthodes publiques de l’objet. 


Le couplage c’est la dépendance d’un objet vers un autre. 


Le couplage est mauvais si la dépendance est faite par le biais de méthode proche des détails d'implémentation / de la structure interne. 

Le couplage est inévitable mais du bon couplage arrive quand des objets dépendent de méthodes haut niveau.  

Singleton : 

J’avais bien compris le principe de singleton, par contre, sur la question de la pertinence de son utilisation, j’avais une lacune.
“L'intérêt d’un singleton c’est de garantir l’unicité dans le temps . Pas de faciliter l’accès global.“
Cette phrase résume bien la réflexion derrière le choix du pattern Singleton. 

Variable Globales & Paramètres 

Explication avec mes mots :  on peut se contenter de dire que les variables globales en faite c'est pas ouf parce que tout le monde peut y accéder et donc :
soit quelqu'un d'autre peut modifier
soit c'est une sorte de append et donc ça devient vite énorme
soit c'est traité et destiné à autre chose donc pas gardé
Dans ces 3 cas c’est danger (il y'a peut être d'autres cas) 
 
Pratique

Fin du kata sur les pawn : 
j'ai enfin réussi à terminer le kata sur les pawn après m'être battu avec le code. 

Commit lié : https://github.com/UnivLille-Meta/Chess/commit/bf7ee511ba0233895fdcd85fce55ad791648afd7 

https://github.com/UnivLille-Meta/Chess/commit/c7fa5626bfbff34acb239030bc5d54752308d956

Maintenant que je suis plus à l'aise avec les outils, je ferais des commits plus explicites et plus petit. 