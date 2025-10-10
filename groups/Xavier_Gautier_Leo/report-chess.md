# Rapport d'activité sur Chess

## Kata remove nil check
### Lien
https://github.com/LeoDefossez/Chess/tree/feat/remove-nil-check

### Organisation
> Jusqu'au 9 octobre le travail a été fait en commun, donc la personne qui commit n'était pas forcément la personne ayant écrit le code/commit.
> Après le 9 octobre, seul Leo à continuer à travailler sur cette branche.  

### Ce qu'on a fait
> NB : tous les refactor ne sont pas sur les nils checks, certains permettait simplement de comprendre comment agissait le code, et à le nettoyer.

> Par inattention, nous avons refactor les nil checks sur les squares et non les pièces, ce qui était en fait réellement demandé.  
> Cependant, le nil checks sur les squares était nettement plus difficile à réaliser  
> J'ai quand même continuer sur la suppression des nils checks sur les pièces par la suite.

> On a décidé d'ajouter un object MyNilChessSquare, qui sera rendu à la place des nils, ayant une API neutre/identité.  
> En premier lieu, on a ajouté à celui-ci la même API et comportement que nil (ifNil:, isNil, notNil etc...) pour conserver le bon fonctionnement du jeu.
> Ce qui a été fait est donc une itération sur chacun des points/méthodes où sont utilisé des nil checks, pour refactor et utiliser du dispatch.

> 

## kata fix pawn move
### Organisation
>Fait par Xavier et Gautier.