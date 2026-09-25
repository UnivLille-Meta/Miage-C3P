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



**Semaine 3 :**

Cette semaine, j'ai mis en place l'environnement pour bosser sur le projet Chess en binôme avec Noé (https://github.com/Noeloisel22/Chess) : installation de Pharo, chargement du projet via Metacello depuis son repo, puis configuration d'Iceberg pour pouvoir push depuis mon PC personnel. J'ai passé quand même un petit peu de temps dans la configuration notamment des clé SSH, le fichier .pub etc...



Ensuite côté code, j'ai fait le kata "Refactor piece rendering" du README. Au départ : MyChessSquare contenait six méthodes (une par type de pièce) avec des ifTrue:ifFalse: imbriqués pour choisir la lettre à afficher selon la couleur de la pièce et celle de la case. J'ai remplacé cette logique par une table de correspondance (dispatch par table) ce qui fait que chaque sous-classe de MyPiece définit maintenant sa propre glyphTable, un dictionnaire qui associe chaque combinaison de couleurs à la bonne lettre. Et c'est une seule méthode sur MyPiece qui va faire le lookup, sans aucun if. Au début, j'ai commencé par écrire des tests de caractérisation avant de toucher au code existant, pour être sûr de ne rien casser en supprimant l'ancienne logique.



La principale difficulté a été de bien comprendre le mécanisme derrière, je trouve c'était le bon moment pour le faire, car on avait justement vu en classe le double dispatch, donc c'était le meilleur moment pour "appliquer" ça. Et ça m'a aidé aussi à mieux saisir pourquoi ce genre de mécanisme évite les tests en cascade et rend le code plus facile à étendre.



J'ai aussi lu les 3 PDF demandés pour lect04 (Composite, Visitor, et les discussions sur Visitor).



Pour l'instant je n'ai fait qu'avancer sur ce point précis, mais en y prenant mon temps j'ai pu bien comprendre la "leçon" derrière ce kata.

