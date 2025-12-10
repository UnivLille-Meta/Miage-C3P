# Week 3 report

# Sommaire
- [Léo Defossez](#léo-defossez)
- [Gautier Louvier](#Gautier-Louvier)
- [Xavier Moyon](#Xavier-Moyon)


## Travail en commun (kata rover)

> ### Point de départ
> 
> Nous avons repris le dépôt git de la séance de kata que nous avons réalisé en cours le vendredi 19 septembre.  
> Le travail que nous avons réalisé est présent [ici](https://github.com/LeoDefossez/Roover).  
> 
> ### Comment avons-nous travaillé ?
> 
> Nous avons travaillé de la même forme que lorsque nous étions en cours. C'est-à-dire, nous alternions tous les 3 par séance de 10 minutes, sur lesquelles nous essayons d'améliorer le code existant, ou d'ajouter les nouvelles fonctionnalités demandées dans kata2.md.
> En premier lieu, nous avions décidé d'améliorer l'implémentation existante. Pour cela, nous avons essayé de réaliser nos modifications sous la procédure du TDD.  
> 
> 1) Lorsque nous voulions modifier un comportement, nous avons d'abord modifié les tests et ensuite corriger le code.
> 2) Lorsque nous voulions faire un refactor du code existant, nous avons vérifié qu'un test était présent, si cela n'était pas le cas, nous l'ajoutions pour ensuite réaliser notre refactor.
> 3) Avant chaque ajout d'une nouvelle feature, nous écrivions un test pour ensuite l'implémenter.
> 
> ### Ce que nous avons fait
> 
> #### Les refactors
> 
> 1) Nous n'utilisons plus d'instance de directions (nord, ouest, etc...), mais seulement les classes. Car pour nous la possibilité d'avoir deux instances différentes du nord dans notre contexte ne faisait pas de sens.
> 
> 2) Nous avons créé des classes de tests pour chacune des sous classes de direction, pour réorganiser les tests.
> 
> 3) Nous avons renommé une grande partie des tests et méthodes pour une compréhension plus simple de l'implémentation.
> 
> 4) Nous avons rendu les interpréteurs resistant aux espaces supplémentaires et aux tabulations.
> 
> 5) Nous avons réduit le nombre de conditionnelles dans les méthodes Direction class >> fromChar et Roover >> interpretDirection: en utilisant des dictionnaires. Ci-dessous l'exemple d'interpretDirection:. (Une optimisation possible serait de modifier le code pour que ce dictionnaire ne soit instantié qu'une seule fois, et non à chaque appel d'interpretDirection:)
>    
>    ```
>    interpretDirection: aString
>    
>    | choice |
>    choice := Dictionary new
>                  at: $R put: [ self turnRight ];
>                  at: $L put: [ self turnLeft ];
>                  at: $M put: [ self move ];
>                  at: $B put: [self moveBack];
>                  yourself.
>    
>    aString do: [ :car | choice at: car ifPresent: #value ]
>    ```
>    
>    #### Les ajouts
>    
>    Nous avons :
> 
> 6) Changé le point de départ du rover de (0,0) à (1,1), et modifier la taille de la grille en conséquent.
> 
> 7) Empêcher le rover de sortir de la grille (par les 4 bord).
> 
> 8) Ajouter la possibilité au rover de reculer.
> 
> 9) Enregistrer le chemin réalisé par le rover.

## Léo Defossez

> ### Kata
> 
> 1) Nous nous sommes forcé à utiliser une approche TDD, ce qui m'a permis de me forcer à prendre ce bon reflexe, que je dois avouer ne pas encore m'être automatique.  
> 2) Nous avions souvent l'envie d'écrire trop rapidement des fonctionnalités qui n'étaient pas encore testées, travailler à 3 nous a permis de remarquer facilement lorsque nous allions le faire, pour l'éviter un maximum.  
> 3) Je me suis entrainé à réfléchir à réduire au maximum le nombre de conditionnels, ce qui nous à donc pousser à utiliser un dictionnaire à la place.
> 
> ### Advanced Mooc (Module 3: Hooks)
> 
> Ce que j'ai appris :
> 
> 1) Sensibilisation à l'écriture de self sends pour maximiser la réutilisation et simplifier les tests.
> 2) Sensibilisation à quelles méthodes utilisées pour éviter les créations d'objets superflus.  
>    L'utilisation de `aStream nextPutAll: 1 aString` plutôt que `aStream print: 1` pour réduire le nombre d'instances, est une chose à laquelle je ne faisais malheureusement pas encore attention.
>    
>    



## Gautier Louvier

> ### Kata
> 
> - J'ai vraiment aimé ce type d'exercice, ça nous force à travailler avec des approches différentes de celle que j'utilise un raisonnement différent de mes camarades. J'ai trouvé ça très enrichissant.
> - J'ai remarqué que nous sommes arrivés à un consensus commun, celui de prendre du temps sur certaines itérations à réfléchir sur notre implémentation en pensant le pour et le contre de chacune de nos idées en essayant de les implémenter avec le test de celui qui a le clavier en main.
> - Je trouve que faire ce Kata avec mon groupe de projet à renforcer notre cohésion et notre motivation. Et aussi de nous permettre de découvrir comment chacun code et réfléchi sur l'implémentation d'une spec.
> - Pour finir sur le Kata rover et Kata 2 j'ai été surpris de voir que dans Pharo, on pense à une idée et on l'essaye et "ho bah ça existe, alors utilisons le" j'ai eu cette réaction en proposant la création d'un rectangle de point ou le rover pouvait évoluer. En regardant le code existant nous avons donc pu utiliser directement les méthodes fournies.
> - Pour finir, j'ai trouvé très utile l'ajout des dictionnaires de la part de Léo et j'ai remarqué que cela s'intégrait très bien avec la logique "Tell dont ask".
> 
> ### Module 3: Hooks ce qui m'a paru le plus important :
> 
> - Les self send rende le code plus lisible, laisse l'essentiel visible, mais déplace les actions dans une petite méthode, ça permet aussi de mieux tester leur action, et de permettre une personnalisation des paramètres des objets et avoir moins de hardcode.
> - Les hook permette de modifier pour chaque objet instanciés, ses valeurs sans influer sur ces voisins.
> - Les designs patern ne doivent pas être tous utilisés en même temps ça ne va pas créer un code parfait, au contraire chacun de ces designs à des bénéfices et des désavantages.
> - L'utilisation des variables globals doit être réduit le plus possible, car cela rend le testing trop complexe ainsi qu'une rigidité dans le code, ce qui est le contraire du concept de POO.
> - Enfin sur les streams on apprend qu'il y a des moyens d'éviter les objets dit "superflus" en décomposant les problèmes, on remarque que ça relève juste du bon sens. Si on a déjà un objet qui peut stocker pourquoi ne pas directement utiliser une méthode appropriée pour y accéder.

## Xavier Moyon

> ### Kata
>
> -  L'exercice sur le Kata était vraiment très sympa a faire. C'etait très intéressant d'échanger avec les Gautier et Leo afin de réfléchir à une solutions nous paraissant optimale.
> - Le fait de confronter nos idées permets de découvrir de nouvelles façons de penser et de voir un problème. 
> - Par exemple, l'utilisation d'un dictionnaire pour l'interpretation des commandes ne me serait pas venu à l'idée.
> ### Module 3: Hooks :
>  - Les templates sont des méthodes de classe abstraites appelant des Hooks.
>  - Les Hooks sont des méthodes déjà implémenté ou pas qui sont appelé par les Hooks 
> Durant mon alternance j'ai eu l'ocassion de travailler avec des templates et des hooks dans le but de définir des comportements génériques en permettant d'y intégrer de la spécifité.
>  - Il vaut mieux ne pas utiliser des variables globales afin de gagner en maintenabilité
>  - Le design pattern Stratégie consiste en la définition d'une interface permettant avec des classe implémentant l'interface de proposer différentes façons de procéder et facilement interchangeable.
