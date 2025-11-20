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
> 
> Le travail est présent [ici](./SameGame.md).  

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

> TODO