Rapport de Atrari Issam :


**Semaine 1 :**

Pour cette première semaine, j'ai commencé par la prise en main du langage Pharo et de son environnement. J'ai suivi l'intégralité du tutoriel interactif ProfStef pour un peu comprendre l'interface, la création de classes, etc...

En parallèle, j'ai regardé plusieurs vidéos et PDF du module de préparation pour bien comprendre les principes de base avant de me lancer dans les exercices.

J'ai ensuite réalisé l'exercice du Counter. Pour commencer à pratiquer avec l'ajouts des méthodes et des tests unitaires.

Et pour finir, j'ai essayé de commencer l'exercice sur les drapeaux (FlagCountry), mais je l'ai trouvé encore trop compliquée à ce stade.



**Semaine 2 :**

Cette semaine, j'ai terminé l'exercice du DSL et continué à regarder les vidéos du MOOC pour rattraper mon retard, notamment celles des modules 1 et 3. Le module 1 m'a permis de bien comprendre le mécanisme du dispatch et du lookup, et le module 3 m'a introduit aux design patterns, en particulier les hooks et templates. J'ai aussi jeté un œil rapide au projet de groupe pour savoir à quoi m'attendre pour la suite. Côté configuration, j'ai mis en place une clé SSH pour pouvoir push sur GitHub sans avoir à ressaisir un token à chaque fois, mais pour l'instant, il est uniquement sur mon pc personnel.



J'ai repris l'exercice du FlagCountry, mais je suis resté bloqué sur le chargement du parseur XML avec Metacello, qui n'aboutissait pas. Je n'ai pas encore trouvé d'où venait le problème, je compte reprendre ça la semaine prochaine.



**Difficulté rencontré :**

Au début, je pensais que le mécanisme super remontait directement depuis l'objet lui-même. En creusant, j'ai compris qu'il remonte en fait depuis la classe où le super est écrit dans le code, ce qui n'était pas intuitif au premier abord. Le concept de hook m'a aussi demandé plusieurs essais avant de bien comprendre, en testant des petits exemples pour visualiser concrètement à quoi ça sert.

