# Week 10 report

# Sommaire

- [Léo Defossez](#léo-defossez)
- [Gautier Louvier](#Gautier-Louvier)
- [Xavier Moyon](#Xavier-Moyon)

## Léo Defossez

> ### SameGame
> 
> J'ai ajouté un état multicolor dans le jeu :  
> https://github.com/LeoDefossez/Myg/pull/20
> 
> ### Mutation testing
> 
> J'ai réalisé l'exercice proposé en cours pour comprendre comment l'appliquer sur un cas réel.

## Gautier Louvier

> ## SameGame :
> 
> Ajout de 2 nouveaux états pour le jeu, un qui casse toute une ligne et l'autre toute une colonne.
> 
> Voici où l'on peut retrouver les 2 ajouts : 
> 
> [ColumnKillerState](https://github.com/LeoDefossez/Myg/pull/21)
> 
> [LineKillerState](https://github.com/LeoDefossez/Myg/pull/17)
>
> Après discussion avec léo et la détection d'un grand morceau de code dupliqué j'ai corrigé ça en répondant à l'issue, en fait nous avons remarqué que bomb, columnKiller,rowKiller (anciennement LineKiller) pouvait tous partir d'un rectangle et donc que nous pouvions factoriser le code de leur méthode de destruction de case.
> [MethodeRectanglePR] (https://github.com/LeoDefossez/Myg/pull/26)

## Xavier Moyon

> TODO