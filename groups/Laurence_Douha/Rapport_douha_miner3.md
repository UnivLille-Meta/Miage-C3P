# Rapport Douha : Myg-Miner 
## Semaine 3
J’ai réussi à faire fonctionner le nouvel algorithme de placement des mines sur le plateau.
La méthode **MBoard class >> countAdjacentMines: matrix atColumn: col atRow: row** comptabilise le nombre de mines présentes dans les 8 cases adjacentes à une case donnée.
Ensuite, **MBoard class >> updateSafeCasesNumbers: matrix** met à jour, pour chaque case sûre, le nombre de mines voisines.
Enfin, **MBox >> adjacentMinesCount: aNumber** permet de définir le nombre de mines adjacentes à une case.

#### Réalisation : 
J'ai réussi à mettre en place le nouvel algorithme de placement de mines sur le plateau, je commencerai à travailler sur le dernier objectif.
