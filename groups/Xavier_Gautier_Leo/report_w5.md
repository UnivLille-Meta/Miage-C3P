# Week 5 report

## Travail commun
> Nous avons commencé ensemble le kata "Remove nil check" sur le jeu d'échec
> Dû à beaucoup d'erreur d'incompréhension de notre part, nous n'avons pas réussi à faire beaucoup de choses.
> 
> Nous avons ajouté quelques tests pour s'assurer que nous comprenions les méthodes clés qui créent les nil.
> Par la suite, nous avons remplacé ce nil, par un objet MyNilChessSquare, qui aura la même API que square, mais celles-ci auront un effet identité sur le programme, c'est-à-dire aucun impact.
> Cette stratégie est basée sur le null design pattern.
> 
> En premier lieu, nous avons ajouté l'API des nils checks (ifNil:, isNil, notNil etc...) sur MyNilChessSquare, celle-ci agissant comme nil le ferait.
> Ceci dans le but de pouvoir conserver une application fonctionnelle entre chacune des itérations.
> Nous serons capable de dire que nous avons fini ce kata à partir du moment où le programme sera fonctionnel à la suppression de ces méthodes.

## Léo Defossez
> ### Travail sur LRUCache
> Travailler sur LRUCache m'a permis de comprendre encore plus l'importance des commentaires de classes indiquant les points d'entrées et les méthodes importants d'une classe
> LRUCache possède un commentaire de classe permettant de comprendre facilement par où commencer à analyser l'existant
> 
> ### Module 6 advanced mooc
> J'ai réalisé l'exercice rock paper scissors sur le dépot suivant : https://github.com/LeoDefossez/C3P_projects
> Comme que le double dispatch est quelque chose que je me force à réaliser depuis plusieurs mois maintenant, je l'ai fait en regardant seulement le début de la video et le diagramme final.
> J'ai surtout utilisé ce pretext pour me forcer à faire du TDD une nouvelle fois.
> 
> J'ai aussi ajouté la possibilité de faire la somme entre un dé et une main de dé dans le projet Dices aussi disponible sur ce dépôt : https://github.com/LeoDefossez/C3P_projects
> 
> J'ai ajouté un result handler sur mon travail de rock paper scissors, pour permettre plus de modularité sur les résultats en cas de besoin (Video M6-6 advanced-design-mooc). 
> 
> ### Kata Chess
> Durant cette semaine, je découvre l'application du nil pattern.
> J'ai pu réfléchir et trouver des moyens permettant de garder le programme fonctionnel entre chaque itération du refactoring malgré le breaking change qu'implique la suppression de la dépendance à nil.
> J'ai aussi pu réfléchir à quels sont les différents points d'entrées sur lesquels nous pouvons commencer un reverse engeneering.
> 
> L'utilisation du nil check pattern en est un très simple, car par cette application, nous pouvons comprendre une grande partie du code en itérant les refactoring.