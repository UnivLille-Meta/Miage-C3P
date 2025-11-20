# Week 4 report

# Sommaire
- [Léo Defossez](#léo-defossez)
- [Gautier Louvier](#Gautier-Louvier)
- [Xavier Moyon](#Xavier-Moyon)


## Travail en commun sur UnivLille-Meta/Chess
> Notre travail est disponible sur ce [dépot](https://github.com/LeoDefossez/Chess).
>
> Nous avons essayé de comprendre les importances de chacune des classes et nous avons familiarisé avec le code, notre analyse (peu développée) est disponible.
> 
> ### Comment avons-nous agi ? 
> Nous avons en premier lieu étudier la sortie globale du projet, c'est-à-dire le jeu en lui-même en utilisant la chaine d'instruction suivante :
>```
> board := MyChessGame freshGame.
> board size: 800@600.
> space := BlSpace new.
> space root addChild: board.
> space pulse.
> space resizable: true.
> space show
> ```  
> 
> Par la suite, nous avons procédé à une analyse statique du code afin de mieux comprendre son fonctionnement, ainsi que les interactions entre les différentes classes. Nous avons ensuite poursuivi avec une étude du design, en examinant notamment les design patterns utilisés, la couverture de tests, et d'autres aspects liés à la qualité du code. 
> Cette étude est présente dans notre [rapport](https://github.com/LeoDefossez/Chess/blob/main/report.md) présent sur le dépot Chess.  
> Cette étude n'est pas très développée, car nous avions l'intention de commencer à refactor certaines parties du code pour mieux le comprendre.  
> 
> Hors avant de commencer la phase de refactoring, nous avons décidé d'écrire tous les problèmes que nous avons pu apercevoir. C'est pourquoi nous avons travaillé sur github, où nous avons ouvert et organisé les issues correspondantes.  
> Nous avons également exploré différents kata existants. Certains d’entre eux traitaient de problématiques similaires à celles que nous avions relevées dans nos issues, nous avons alors choisi de créer des tags pour organiser les issues.
> 
> Nous n'avons malheureusement pas encore eu le temps de modifier le code.
>

## Léo Defossez

> Durant notre travail en commun, j'ai pu comprendre et utilisé ce que j'ai appris durant ma lecture sur le document du reverse engineering.
> 
> J'ai aussi appris une meilleure utilisation des issues de github, par l'utilisation de tag et la création d'un projet au sein du dépot github pour organiser notre travail en groupe.


## Gautier Louvier

>J'ai bien compris que le reverse engineering est quelque chose d'important surtout sur une grosse base de code ou d'appli , on a vite fait de se perdre dans les détails et de ne pas saisir les informations les plus importantes tout simplement.
>
>Ce week-end avec mon groupe je trouve qu'intuitivement, nous avons réalisé du reverse engineering. En-tout-cas certain de ses principes. Et c’est très efficace pour comprendre les relations rapidement entre les différentes parties de l'application en regardant l'architecture et les dépendances.
>
>Nous n'avons pas encore pu passer à l'étape du refactoring sur le chess, mais en tout cas on a pu déjà identifier ce qui ne se comporte pas comme on le voudrait et repérer du code qui pourrait être amélioré/ corrigé voir même supprimer directement.

## Xavier Moyon 

>Le reverse ingineering est très important pour comprendre et travailler sur un projet. Cependant c'est quelque chose que je trouve assez compliqué.
>
>De ce que j'ai compris, pour pouvoir réussir un refactoring, on peut : 
>  
> - On peut en se basant sur les éléments principaux (classes) du projet, on peut essayer d'imaginer la hierarchie du projet puis la comparer avec le réel et adapter notre modélisation au réel. Cela devrait permettre de mieux comprendre le projet.
> - On ensuite faire du refactoring (et lancer les tests ensuite évidement).Cele permet de comprendre plus facilement le fonctionnement du projet.
> - Et on peut aussi utiliser les tests (s'il y en a).
>
> Il faut faire attention durant ces étapes à ne pas trop perdre de temps sur les détails.
>
> Le week-end dernier, nous avons commencé à regarder le projet Chess, j'ai trouvé assez compliqué de comprendre le fonctionnement du projet, je ne savais pas vraiment ou trouver les informations que je cherchais.