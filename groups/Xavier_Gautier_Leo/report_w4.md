# Week 4 report

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


