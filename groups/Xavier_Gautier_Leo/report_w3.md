# Week 3 report

## Travail en commun (kata rover)
> ### Point de départ
> Nous avons repris le dépôt git de la séance de kata que nous avons réalisé en cours le vendredi 19 septembre.  
> Le travail que nous avons réalisé est présent [ici](https://github.com/LeoDefossez/Roover).  
> 
> ### Comment avons-nous travaillé ?
> Nous avons travaillé de la même forme que lorsque nous étions en cours. C'est-à-dire, nous alternions tous les 3 par séance de 10 minutes, sur lesquelles nous essayons d'améliorer le code existant, ou d'ajouter les nouvelles fonctionnalités demandées dans kata2.md.
> En premier lieu, nous avions décidé d'améliorer l'implémentation existante. Pour cela, nous avons essayé de réaliser nos modifications sous la procédure du TDD.  
> 1) Lorsque nous voulions modifier un comportement, nous avons d'abord modifié les tests et ensuite corriger le code.
> 2) Lorsque nous voulions faire un refactor du code existant, nous avons vérifié qu'un test était présent, si cela n'était pas le cas, nous l'ajoutions pour ensuite réaliser notre refactor.
> 3) Avant chaque ajout d'une nouvelle feature, nous écrivions un test pour ensuite l'implémenter.
> 
> ### Ce que nous avons fait
> #### Les refactors
> 1) Nous n'utilisons plus d'instance de directions (nord, ouest, etc...), mais seulement les classes. Car pour nous la possibilité d'avoir deux instances différentes du nord dans notre contexte ne faisait pas de sens.
> 2) Nous avons créé des classes de tests pour chacune des sous classes de direction, pour réorganiser les tests.
> 3) Nous avons renommé une grande partie des tests et méthodes pour une compréhension plus simple de l'implémentation.
> 4) Nous avons rendu les interpréteurs resistant aux espaces supplémentaires et aux tabulations.
> 5) Nous avons réduit le nombre de conditionnelles dans les méthodes Direction class >> fromChar et Roover >> interpretDirection: en utilisant des dictionnaires. Ci-dessous l'exemple d'interpretDirection:. (Une optimisation possible serait de modifier le code pour que ce dictionnaire ne soit instantié qu'une seule fois, et non à chaque appel d'interpretDirection:)
> ```
> interpretDirection: aString
>
>	| choice |
>	choice := Dictionary new
>		          at: $R put: [ self turnRight ];
>		          at: $L put: [ self turnLeft ];
>		          at: $M put: [ self move ];
>				  at: $B put: [self moveBack];
>		          yourself.
>
>	aString do: [ :car | choice at: car ifPresent: #value ]
> ```
> #### Les ajouts
> Nous avons :
> 1) Changé le point de départ du rover de (0,0) à (1,1), et modifier la taille de la grille en conséquent.
> 2) Empêcher le rover de sortir de la grille (par les 4 bord).
> 3) Ajouter la possibilité au rover de reculer.
> 4) Enregistrer le chemin réalisé par le rover.
 
## Léo Defossez
> ### Kata
> 1) Nous nous sommes forcé à utiliser une approche TDD, ce qui m'a permis de me forcer à prendre ce bon reflexe, que je dois avouer ne pas encore m'être automatique.  
> 2) Nous avions souvent l'envie d'écrire trop rapidement des fonctionnalités qui n'étaient pas encore testées, travailler à 3 nous a permis de remarquer facilement lorsque nous allions le faire, pour l'éviter un maximum.  
> 3) Je me suis entrainé à réfléchir à réduire au maximum le nombre de conditionnels, ce qui nous à donc pousser à utiliser un dictionnaire à la place.
> 
> ### Advanced Mooc (Module 3: Hooks)
> Ce que j'ai appris :
> 1) Sensibilisation à l'écriture de self sends pour maximiser la réutilisation et simplifier les tests.
> 2) Sensibilisation à quelles méthodes utilisées pour éviter les créations d'objets superflus.  
> L'utilisation de `aStream nextPutAll: 1 aString` plutôt que `aStream print: 1` pour réduire le nombre d'instances, est une chose à laquelle je ne faisais malheureusement pas encore attention.