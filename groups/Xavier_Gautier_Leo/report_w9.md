# Week 9 report

# Sommaire
- [Léo Defossez](#léo-defossez)
- [Gautier Louvier](#Gautier-Louvier)
- [Xavier Moyon](#Xavier-Moyon)

## Léo Defossez
> ### Exercice sur le composite et le visiteur (Module 8 de Miage-C3P)
> Lors du cours sur le composite et le visiteur, j'ai réalisé l'exercice de l'implémentation d'un system de fichier.  
> Cette implémentation est disponible sur ce dépot dans le paquet `MyFileSystem` : https://github.com/LeoDefossez/C3P_projects.  
> Je ne pense pas avoir besoin d'expliquer le design suivit, car celui-ci suis simplement un composite et un visiteur comme il est attendu (Une description rapide de l'exercice est présente dans le readme de C3P_projects).  
> 
> Un simple exemple de comment on peut créer nos fichiers :  
> ```smalltalk
> directory := (FSDirectory named: #directory).
> directory addChild: 
>               ((FSFile named: #file)
>		        contents: #ImAFile;
>		        yourself).
> ```
> 
> Comment retrouver le fichier avec le contenu `#ImAFile` dans `directory` :
> ```smalltalk
> FSSearchByContents search: #ImAFile in: directory
> ```
> 
> ### Cours sur le mutation testing
> Le mutation testing consiste à créer des mutations dans le code, par exemple transformer une condition en true, ou remplacer un + par un -.  
> L’objectif est de vérifier qu’un test échoue suite à cette modification. Si un test casse, cela signifie que le programme réagit correctement au bug introduit.  
> En revanche, si aucun test n’échoue, cela indique qu’il existe une faille dans la suite de tests. 
> 
> ### SameGame
> Le travail est présent [ici](./SameGame.md).  

## Gautier Louvier
> TODO
>
> 

## Xavier Moyon
> TODO
> 
> 