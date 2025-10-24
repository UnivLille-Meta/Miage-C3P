# Week 6 report


# Sommaire
- [Léo Defossez](#léo-defossez)
- [Gautier Louvier](#Gautier-Louvier)
- [Xavier Moyon](#Xavier-Moyon)

## Travail commun
> Celui-ci est maintenant décrit dans [report-chess.md](./report-chess.md)

## Léo Defossez
 ### Semaine cours (9-10 oct)
> Durant cette semaine, j'ai surtout réalisé le kata nil checks (disponible sur le lien dans [report-chess.md](./report-chess.md)).  
> Kata que j'ai fortement sous-estimé, je pensais que chaque nil check aurait pu être réglé par une simple dispatch. Mais dans beaucoup de cas, il faut repenser plus profondément le design.  
> De plus, j'ai ressenti un manque d'organisation de ma part, j'ai souvent (très souvent) été distrait par des problèmes qui n'étaient en aucun cas liés au nil check, ce qui m'a fait perdre beaucoup de temps.
> J'ai tout de même réussi à finir le kata nil checks durant cette semaine.

### Semaine sans cours (16-17 oct)
> Cette semaine, j'ai réalisé le kata Refactor Pieces Rendering.  
> J'ai décidé de réaliser ce kata plutôt rapidement après avoir fini le nil check, car après avoir fait rétrospective sur mes actions durant le nil checks, et je me suis rendu compte que je n'étais pas assez rigoureux sur ma démarche.
> - Je n'ajoutais pas toujours des tests lorsque je rencontrais un problème
> - Je me laissais distraire pas des changements, qui n'était pas ceux requis
> 
> C'est pourquoi, j'ai voulu refaire un kata en étant plus rigoureux sur ma façon d'agir.
> 
> Comme il est inutile de dupliquer les informations, celles-ci sont disponible dans la catégorie "Kata Refactor Piece Rendering" de [report-chess.md](./report-chess.md)
> 


## Gautier Louvier
 ### Semaine cours (9-10 oct) 
> Cette semaine, on a réalisé le kata du nil checks ensemble. 
> J'ai plus particulièrement appuyer sur le fait qu'on ne devait pas prendre tout le code autour des choses qu'on pouvait améliorer, mais qui n'était pas nécessaire à la réalisation du KATA.
> Et aussi nous avons fait un roulement chacun à notre tour de prendre le clavier et essayer en réfléchissant à "comment faire". J'ai eu un peu de mal à trouver quoi modifier, mais mes camarades ont trouvé plus rapidement des idées de design et des solutions. J'ai donc essayé de poser les bonnes questions pour comprendre et validées à trois nos théories.
 ### Semaine sans cours (16-17 oct) 
> Nous avons jugé que Léo avait vite de bonnes idées de design et beaucoup d'expérience avec Pharo donc nous nous sommes séparer sur 2 kata différents pour apprendre mieux et pratiquer plus. J'ai donc travaillé avec Xavier en itération le plus possible pour que nous puissions réaliser le kata FixPawnMove que l'on peut retrouver dans [report-chess.md](./report-chess.md)
> Il est à présent fonctionnel, mais nous allons voir si nous pouvons améliorer du code et si tout nous semble bon, nous irons peut-être en réaliser un autre par la suite.
> Par ailleurs nous n'avons pas encore totalement fini d'écrire la partie du report dans le report chess, mais nous le ferons bientôt après toutes les vérifications.


## Xavier Moyon
> ### Semaine cours (9-10 oct) 
> La semaine dernière nous avons travaillé sur le Kata  `Fix Pawn Moves` dans ce contexte nous avons d'abord essayé d'identifier les méthodes avec lesquelles nous allions surement devoir intéragir. C'était assez intéressant de voir que nos première modification n'impactait finalement qu'une seule méthode. 
> Un point sur lequel je suis cependant encore perplex et sur la gestion des faux mouvements. Pour détaillé un peu plus, nous nous sommes rendu compte que lorsqu'un mouvement n'est pas réalisé (car non légal) cela déclenchait quand même un appel à move:to: incrémentant donc notre compteur de mouvements et par la même occasion empêche un pion lors de son premier vrai mouvement d'avancer de deux cases. Après quelques échanges nous avons décidé que cela était hors du contexte du Kata mais j'ai cependant quelques doutes maintenant. 
> ### Semaine sans cours (16-17 oct) 
> Cette semaine nous avons surtout travaillé sur le Kata chess dans l'objectif de corriger le mouvement des pions en y intégrant les mouvements en diagonal.
Pour cela nous avons décidé de faire une nouvelle méthode template pour récupérer les colonnes en diagonale en fonction de la couleur des pions. Ainsi la méthode vérifie la appelle une méthode 'nextMoveAhead' qui est défini dans ces classes enfant(Blackpawn, White Pawn) et retourne les deux cases à droite et gauche de la prochaine case devant eux. 

> Pour voir l'application du double dispatch j'ai corrigé mon projet DieHandle, c'était assez intérressant de voir comment il était assez simple de rajouter des l'addition de dés et de dieHandle.

> En parallèle, sur un projet en entreprise j'ai tenté d'appliquer un dispatch pour faciliter la gestion des erreurs. Actuellement chaque cas d'erreur est traitée de manière unique, ce qui entraîne de la duplication de code et dons moins de maintenabilite. Je souhaitais donc trouver une façons d'utiliser le "template method design" pour définir une logique commune pour toutes les erreurs (ajout d' un log et retoir d'un message d'erreur). Il me fallait donc que chaque erreur puisse me me retourner l'interface avec laquelle je voulais interagir (ErrorType avec des sous classes pour chaque grand type d'erreur (400,404,500,...))ainsi j'aurais voulu ajouter une méthode Dispacth dans Exception permettant de faire cela. (Exception > errorType 
      SubClassResponsability
) Malheureusement cela ne semble pas possible en Java. 
