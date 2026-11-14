# Rapport Semaine 5

## Ce que j'ai fait

J'ai implémenté le premier mouvement d'un pion en utilisant un pattern Strategy, au départ je voulais trouver un moyen d'avoir un attribut qui servait de méthode un peu comme un pointeur de fonction, mais après avoir trouvé comment faire, j'ai décidé de créer des nouvelles classes tout de même, premièrement pour séparer le comportement mais aussi pour pouvoir plus simplement étendre ce comportement au cas où un prochain développeur voudrait ajouter des comportements aux pions dans des règles alternatives des échecs comme les échecs Berolina où les mouvements du pion sont inversés (déplacement en diagonale et attaque frontale). De plus cela évite la multiplication du nombre de méthodes dans la classe pion au cas où on voudrait ajouter **beaucoup** de nouvelles règles. En regardant le code :

On utilise une méthode nextStrategy pour changer de stratégie après un mouvement :
```
nextStrategy 
	^ MyPawnRegularMoveStrategy new
```

De manière propre on change juste l'objet qui se trouve dans l'attribut moveStrategy dans MyPawn et le pion ne peut désormais que se déplacer d'une case.

Cette implémentation permet de m'éviter de nombreux `if` et donc, par extension de ne pas tuer de petits chats kawaii.

J'ai ensuite ajouté des tests et corrigé un test qui ne fonctionnait pas, dorénavent tous mes tests passent.

Ensuite, je vais travailler sur la suppression des ifNil: qui se trouvent un peu partout dans la codebase en m'appuyant sur le cours que nous avons eu à ce sujet.