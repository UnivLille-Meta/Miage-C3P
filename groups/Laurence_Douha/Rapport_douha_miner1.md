# Rapport Douha : Myg-Miner 
## Semaine 1 
Cette semaine, j’ai commencé par comprendre le fonctionnement du jeu, en réalisant une phase de reverse engineering : j’ai exploré les classes existantes, leurs méthodes et leurs rôles respectifs afin de comprendre l’architecture générale. J’ai également exécuté les tests pour vérifier le comportement du projet.

Ensuite, j’ai débuté par l’implémentation du premier objectif : **Count the number of selection**.
Pour mieux comprendre le déroulement du programme et les méthodes appelées à chaque fois, j’ai placé plusieurs points d’arrêt.
J’ai ensuite modifié la classe **MBoard** en ajoutant :
    - une variable **Counter** pour stocker le nombre de clics.
    - une variable **counterText** qui sera la chaîne affichant ce nombre à l’utilisateur.
La variable Counter est initialisée dans la méthode **initialize**, afin qu’elle soit remise à zéro au début de chaque partie.
Dans les classes **MMineBox** et **MSafeBox**, j’ai ajouté dans la méthode **clic** l'incrémentation de la valeur du Counter à chaque fois que l'utilisateur clique sur une case et en mettant la chaîne counterText à jour.
Enfin, dans la méthode **game** de la classe **MBoardElement**, j’ai ajouté l’affichage du nombre total de clics pour le joueur.

#### Réalisation : 
J'ai réussi à réaliser cet objectif, j'ai bien la valeur du nombre de clics instantanée qui s'affiche sur l'interface du jeu, sauf que j'ai un problème au niveau de l'affichage, la première colonne de la grille du jeu est décalée par rapport aux autres après avoir afficher le nombre de clics. 