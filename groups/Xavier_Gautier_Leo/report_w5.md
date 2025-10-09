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

## Xavier Moyon 

> ### LRUCache : 
>
> Pour le LRUCache, j'ai commencé comme sur le TP par regarder la page wikipédia sur le LRUCache. C'était je penses une des étapes qui m'a le plus faciliter la compréhension du code, j'ai d'abord éssayer de comprendre de quoi il s'agissait théoriquement avant de l'appliquer, cela permet de mieux comprendre le fonctionnement des méthodes.
>
> Un des point sur lequel j'ai passé du temps durant le tp a été de comprendre à quoi servait l'élément factory. Après avoir chercher un petit j'ai trouvé qu'il permettait de définir  le calcul de la valeur stocké en cas de valeur non présente. 
>
> ### Projet Chess
> Cette semaine nous avons travaillé sur le kata nil object. J'ai eu le sentiment au départ de comprendre de moins en moins le fonctionnement du code.
> Nous avons commencé a réfléchir à l'application du nil object et je trouve assez intéressant de voir comment cela fonctionne. La méthode appellée dans l'objet initial est remplacé dans le nil object par une méthode n'effectuant rien.
> Cependant, l'application de ce design sembe impacter plusieurs partie du code.
> ### Module 6
>
> De ce que j'ai compris du module 6, le double dispatch est un design qui permet plus de modularité, je peux facilement rajouter une fonctionnalité avec. Si je reprends l'exemple du jeu des boites, si je souhaite rajouter un nouveau type de vue, on peut le faire facilement. Pour cela il suffirait de créer une nouvelle vue avec les trois méthodes suivantes : drawWall, drawBlock, drawEmpty, comme pour le pierre feuille ciseaux, si on souhaitais rajouter le puit, on devrait simplement rajouter des méthodes againstPuit pour toutes les classes et les trois autres méthodes against au puit. Lien vers le pierre pappier ciseaux : ![Pierre Pappier Ciseaux]()
> 
>Le design pattern visiteur se base sur le double dispatch, le visiteur demande au domaine quel méthode il doit utiliser et c'est le domaine qui lui répond. Par exemple pour les calculs, le visiteur doit avoir une méthode `visitElementName` par éléments du domaine (Number,Plus,Time,Divide,... ) qui s'occupera d'effectuer les calculs. Et côté domaine les méthodes canVisit indiquerons quelle méthode du visiteur appeller (visit sur Divide appellera visitDivide sur le visiteur).
>
> Le visiteur ne doit cependant pas être utilisé si le domaine n'est pas très stable

## Gautier Louvier

### Module 6 :

> Pour le module de cette semaine (Mod.6), j'ai vu à quel point doubleDispatch peut être puissant en termes de modularité. De plus ça suit dans la continuité le principe du "Tell dont ask".
> 
> Avec ma petite réalisation de mon côté du jeu rock paper scissors. J'en suis arrivé à la conclusion que : un simple dispatch fonctionne quand deux classes ont besoin de connaître le résultat attendu avec une interaction entre elles.
> 
> Par contre dès qu'on a une troisième classe qui intervient sur la même méthode, on se retrouve coincé, car le Dispatch n'est pas assez modulaire pour renvoyer le bon résultat. Donc nous avons besoin à ce moment du DoubleDispatch pour repousser la responsabilité.
> 
> Vu qu'on ne peut pas définir à l'avance l'objet en paramètre on lui dit de répondre le résultat de son comportement quand il est appelé dans cette classe même avec une méthode associée. 
> Vous pouvez retrouver mon petit travail dans mon package "MyRockPaperScissors". Sur ce repository : [GitHub - fgogow/ExercicePharoM1Miage](https://github.com/fgogow/ExercicePharoM1Miage).
> 
> Pour finir avec l'exemple du cours sur les dices on voit bien que quelle que soit la méthode le double dispatch fait en sorte de prendre la **bonne methode** en se basant sur le **receveur** et sur **l'argument**.
> 
> Pour le visiteur j'ai compris que ce partern repose sur le double dispatch car on évite les conditionnels, on ne modifie pas l'essence même du code on donne des points d'entrées pour les méthodes et le code où l'on veut recevoir une "extension" de celui-ci. Il est donc très modulaire sur une structure forte et qui ne bouge pas.
> 
> ### Chess :
> 
> Pour ce qui est du chess, je suis content, j'arrive à comprendre l'essentielle des méthodes sur lesquelles nous tombons. Par contre j'ai dû mal en ce moment à trouver des points d'entrer pour le nilPatern donc nous y réfléchissons à plusieur et j'essaye de comprendre la logique de mes camarades. Mais maintenant je pense être capable de me lancer dans le Kata du fix the pawn. Seul ou peut être avec un de mes 2 camarades. Je pense que nous serons plus efficaces de cette manière. En-tout-cas, j'ai essayé le plus possible de me tenir au principe du Reverse Engineering. Car on a vite fait de se faire ralentir par du refactor qui n'est pas la tache principale ou de vouloir réparer quelque chose qui n'est pas la priorité.