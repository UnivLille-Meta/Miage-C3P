### Semaine 2

### Exercice de préparation et révision de cours

Cette semaine, j'ai commencé par lire les cours sur `self` et `super` pour mieux comprendre comment cela marché vraiment et ne pas resté sur mes "fausse" connaissance que j'avais jusqu'à maintenant (
par exemple je penser jusqu'à maintenant que super designé la classe mère de notre object actuel ce qui est en faites faux).
Pour expliqué un peu ce que j'en ai compris :

- `self` est le receveur du message (ce sera toujours le cas)
- `super` est lui aussi le receveur du message

La seul difference notable entre ces deux là, c'est que `self` commence la recherche dans la classe du receveur alors que `super` commence la recherche dans la superclasse du receveur.


J'en ai également profité pour réalisé l'exercice DSL


### Poursuite de Chess

Puis que j'avais déja réalisé l'exercice sur la pratique du dispatch, j'ai donc décidé de continué la réalisation du projet Chess chez moi sur mon pc personnel. Mais c'est à ce moment que j'ai remarque que je ne savait pas comment commit push et clone un projet via Pharo,
j'ai donc décidé d'apprendre cela sur le tas (c'est en pratiquant que l'on apprendre apres tout). Après avoir vu et compris comment on pouvaia faire ça, j'ai donc cloner mon fork de Chess mais j'ai remarqué que j'avait un probleme concernant les classes du projet quand load les differents packages, elle n'apparaisse par tout (nottamment `mychesgame` et `mychessboard` present dans `myg-chess-core`)
Après quelques heures (beaucoup même je dirai) de recherche et d'essaie, j'ai remarqué que c'etait en fait un probleme de dependance, j'aivait en faites oublié de de recupérer et de charge les dependances decrite dans `baselineofmygchess` avec metacello (j'ai compris à quoi ça servait plus tard).


J'ai pour l'instant implementé les tests qui vérifie qu'un pion peut bien se deplacer sur case suivant tout droit mais également faire un saut de deux cases en debut de partie.

commit : https://github.com/azd-billal/Chess/commit/9f14e823a65947e3c5256a736305725db2a44446


J'ai donc implementé par la suite la methode qui verifie qu'un saut de deux cases est autorisé pour les pions en debut de partie

commit : https://github.com/azd-billal/Chess/commit/ea182f426b751d0fe394b56041bcbd02af820c9d


Actuellement, j'essaie de m'occuper d'implementé le fait qu'un pion puisse manger une pièce adverse si celle-ci se trouve sur une case diagonale et que la case directement devant le pion est libre.