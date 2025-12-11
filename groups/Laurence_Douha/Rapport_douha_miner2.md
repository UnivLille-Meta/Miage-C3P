# Rapport Douha : Myg-Miner 
## Semaine 2
J'ai commencé d'abord par régler le problème d'affichage que j'avais.
Ensuite, je suis passée à l’objectif suivant : **Introduce different algorithm for placing mines**. Grâce aux méthodes **Mbox >>randomCase** et **MBoard >>matrixTest5x5**, j’ai compris que le placement des mines et les cases sûres se fait de manière aléatoire sur le plateau.
Après avoir fait des recherches sur le jeu, j’ai constaté que le principe consiste à ce que les chiffres indiquent le nombre de mines adjacentes. Je me suis donc basée sur cette idée en procédant ainsi :
    - Garder la méthode randomCase pour placer les mines et les cases sûres.
    - Remplacer chaque case sûre par un nombre correspondant au nombre de mines situées autour d’elle.

#### Réalisation : 
J'ai réussi à résoudre le problème d'affichage que j'avais la semaine précedente. Concernant le nouveau objectif, je suis encore entrain de travailler dessus.
