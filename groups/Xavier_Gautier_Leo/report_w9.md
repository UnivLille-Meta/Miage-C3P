# Week 9 report

# Sommaire

- [Léo Defossez](#léo-defossez)
- [Gautier Louvier](#Gautier-Louvier)
- [Xavier Moyon](#Xavier-Moyon)

## Léo Defossez

> ### Exercice sur le composite et le visiteur (Module 8 de Miage-C3P)
> 
> Lors du cours sur le composite et le visiteur, j'ai réalisé l'exercice de l'implémentation d'un system de fichier.  
> Cette implémentation est disponible sur ce dépot dans le paquet `MyFileSystem` : https://github.com/LeoDefossez/C3P_projects.  
> Je ne pense pas avoir besoin d'expliquer le design suivit, car celui-ci suis simplement un composite et un visiteur comme il est attendu (Une description rapide de l'exercice est présente dans le readme de C3P_projects).  
> 
> Un simple exemple de comment on peut créer nos fichiers :  
> 
> ```smalltalk
> directory := (FSDirectory named: #directory).
> directory addChild: 
>               ((FSFile named: #file)
>                contents: #ImAFile;
>                yourself).
> ```
> 
> Comment retrouver le fichier avec le contenu `#ImAFile` dans `directory` :
> 
> ```smalltalk
> FSSearchByContents search: #ImAFile in: directory
> ```
> 
> ### Cours sur le mutation testing
> 
> Le mutation testing consiste à créer des mutations dans le code, par exemple transformer une condition en true, ou remplacer un + par un -.  
> L’objectif est de vérifier qu’un test échoue suite à cette modification. Si un test casse, cela signifie que le programme réagit correctement au bug introduit.  
> En revanche, si aucun test n’échoue, cela indique qu’il existe une faille dans la suite de tests. 
> 
> ### SameGame
> Le travail est présent [ici](./SameGame.md).
>  
> ### Display the number of tiles killed
> https://github.com/LeoDefossez/Myg/pull/11  
> Une explication détaillée est disponible sur la pull request.  
> Celle-ci fait suite à l'ajout de [Score for game](#Score-for-game), dans lequel je ne pensais pas pouvoir modifier le nombre de box tués sur le dernier coup.  
> Sur cette pull request, j'écris que je me suis rendu compte qu'il existait une interdépendence entre SGGame et SGBoard.  
> J'ai alors profité de celle-ci pour afficher le nombre de box tués au dernier coup.  
>
> #### Richer parametrisation of same game
> https://github.com/LeoDefossez/Myg/pull/13  
> Ici je refactor simplement la classe principale du jeu `SameGame`.  
> Je déplace une grande partie de la logique du côté instance, pour offrir une meilleure paramétrisation, et ajouter plus facilement nos features.  
> 
> #### Add a registry for states
> https://github.com/LeoDefossez/Myg/pull/12  
> Ici, je crée une classe `SGStateRegistry`, qui permet simplement de récupérer tous les différents states existant.  
> J'utilise uniquement la méthode `subclasses` lors de l'initialisation de l'objet, ce qui réduit le nombre de querry sur le système.  
> J'en ai aussi profité pour rendre les stratégies d'initialisation de SGBox, plus simple et modulaire à l'aide de cet objet. 


## Gautier Louvier

> ### Côté cours :

> Cette semaine pour ce qui est du cours , j'ai lu le diapo et essayer de comprendre ce qu'est le mutation Analysis voici ce que j'en ai retenu pour le plus important : 
> 
> 
> On rappel rapidement les 3 étapes d'un bon test :
> 
> 1-Context => Set what is need to be in the action's condition.
> 
> 2-Stimuli => When the action happens.
> 
> 3-Check => Assertion to compare to the expectation.
> 
> 
> Pourquoi un test est bon ?
> 
> Un test est bon s'il échou quand des bugs sont présent ou introduit artificiellement.
> 
> 
> 
> Comment faire pour introduire des bugs de maniere artificiel ?
> 
> Par exemple : 
> 
> - Introduction de mutation "logic" => transformer des + en -
> 
> - Changer des true en false 
> 
> - Changer des types ou des classes.
> 
> 
> 
> Si des mutants qui devait casser les tests à coup sûr passe, il faut impérativement améliorer les tests car il ne couvre absolument pas leur cas de testing.
> 
> Pour savoir si le coverage après le passage de mutation testing est bon on utilise un score par mutation sur la base de : KILLED / MUTANTS ce qui nous donne rapidement une vision du résultat.
> 
> 
> 
> Le probleme que cela est gourmand pour le testing le runTime va être fortement influencer par le nombre de tests et de mutants.
> 
> Pour cela on peut influer de plusieurs manieres :
> 
> - Soit en testant les mutants qui sont couvert par les tests , ou alors ne faire modifier que le code qui est testé.
> 
> - On peut aussi tester tout le code de maniere random
> 
> - On peut guider le random sur des endroits spécifique : classe, méthode et prendre un échantillon puis un seul membre de cet échantillon.
>   
>   
>   
> 
> Pour garder des scores correct et utilisable il faut savoir équilibrer le nombre de mutation sur les tests. Pas assez ce n'est pas réaliste et trop ce sera trop couteux.
> 
> Pour cela on peut s'aider de la Mutation Matrix et la HeatMap.
> 
> ### Projet SameGame :
> 
> Réalisation des 2 de partern strategy :
> 
>     Build strategy : Todo
> 
>     ScoreStrategyCalculator : Todo

## Xavier Moyon

> ### SAME GAME :)
> Cette semaine j'ai pu travailler sur le SameGame dans le but de rajouter un  > convertisseur de partie. L'objectif est de pouvoir utiliser un objet permettant > de facilement passer d'une chaîne de caractère au format ci-dessous à un SGGame et inversement. Ce convertisseur pourrait notamment nous permettre à court terme de faciliter la création de test et à plus long terme nous permettre d'implémenter un mécanisme de sauvegarde :) !
> ```
> | N | Bo | Y |
>| N | Bo | Y |
>| N | Bo | Y |
>```
> Pour l'instant seul le convertisseur vers le type String est implémenté. 
> Pour implémenter ce premier convertisseur, j'ai créer un visiteur `SGConvertGameToString` qui a une méthode d'entrée convert et implémente différente méthode spécifique à chaque objets du jeu : 
> 
> - visitState : retourne la/les lettre(s) associée(s) au State (R pour rouge Bo pour une bombe)
> - visitBlock retourne la/les lettre(s) associée(s) au State entouré par des espaces
> - visitBoard retourne l'ensemble des lettres du tableau séparé par des | et avec des retours à la ligne pour chaque ligne du tableau.
> - visitGame (Encore a faire) doit retourner la stratégie de jeu ainsi que le tableau. 
> 
> Pour être honnête, je n'avais pas pensé à utiliser un visiteur pour cette fonctionnalité car j'avais toujours vu ce design associé à un composite mais c'est Leo Defossez qui m'a proposé cela. Et je trouve que c'était une bonne idée, si je veux changer le visiteur cela impactera qu'une faible partie du code et je pourrais aussi très facilement en rajouter un autre.
>
> Pour cette semaine ou pour le début de la semaine prochaine j'aimerai avoir terminé les deux convertisseurs, pour le deuxième ma difficultés va surtout être de réussir à convertir des caractère en objet (SGBox ou Mode de jeux) en évitant au plus possible de faire des if.
> Ce que je veux absolument éviter c'est le cas suivant car on duplique de l'information.
> ```smalltalk
> myBlockString = ' R ' ifTrue[^SGBlock red].
> myBlockString = ' Y ' ifTrue[^SGBlock yellow].
> ...
> myBlockString = ' N ' ifTrue[^SGNullState].
>```  
> L'objectif serait de pouvoir réutiliser la méthode  `literal` des states pour savoir lequel correspond
> 
>
> ### Visiteur
> 
> Un visiteur est un objet qui va permettre contenir une opération/logique en dehors  de son objet. Cela permet de facilement rajouter de nouvelle opérations sans impacter les autres classes et ça c'est la classe.
>
> ### Tests 
>  
> Un test c'est avant tout trois POINTS : 
> - Un context (Je dois acheter trois pommes pour un total de 1.5€ pour faire une tarte aux pommes pour ma maman 🥧🤱)
> - Un Stimuli (Je n'ai que 1.20€ sur mon compte, c'est la fin du mois)
> - Une réponse (Erreur paiement impossible : Pas de paiement pas de pommes, pas de pomme pas de tarte aux pommes, pas de tarte aux pommes pas de tarte aux pommes)
>
> Pour savoir si un tests traite bien une erreur il faut introduire des défaillance dans le code original et voir si le tests la detecte.
> Exemple pour notre tarte aux pommes : 
> - Sans défaillances : 
> ```smalltalk
>appleCart >> pay: aBankAccount
>  self priceForAll > aBankAccount availableMoney ifTrue:[ self error: 'NoMoneyError: you don"t have enough money to buy apple...Sorry get out of my shop Walter White.' ]
> ...    
> ```
> - Avec une défaillance (Je vous laisse la trouver 😉)
> ```smalltalk
>appleCart >> pay: aBankAccount
>  self priceForAll < aBankAccount availableMoney ifTrue:[ self error: 'NoMoneyError: you don"t have enough money to buy apple...Sorry get out of my shop Walter White.' ]
>...
> ```
> Chaques défaillances doit-être testé indépendemment.
> #### Un problème sur les mutations 🫢
>
> Un des problème avec l'insertion de défaillance est que cela augmente la durée des tests. Les tests sont lancé autant de fois qu'il y a de mutations de code. Il est donc crucial de bien jauger l'utilisation des mutants.
> Pour éviter ce problème il y a plusieurs solutions : 
> - Ne lancer que les tests qui couvrent ces mutants
> - Ne faire des mutations que sur le code qui est couvert
> 
> Si cependant il reste toujours un grand nombre de mutants alors on peut les lancer aléatoirement 25% d'entre eux tout en conservant un bon score tout en réduisant considérablement le temps d'éxécution.
> Il existe plusieurs stratégies pour cela, on peut choisir un pourcentage de mutants par classe ou méthode ou par package (la je suppose, mais ce serai la suite logique)
> Pour optimiser les mutants on peut utiliser des matrices ou des heatMap pour detecter des mutants redondant (`self priceForAll > aBankAccount availableMoney ifTrue:[ self error:` et `self priceForAll <= aBankAccount availableMoney ifFalse:[ self error:`)