### Semaine 3


### Poursuite du chess


Cette semaine, j'ai poursuivi la réalisation du projet Chess avec ma version de ce jeu. Précédemment, j'avais donc décidé de remplacer les pièces `MyPawn` en début de partie par `MyInitPawn` pour pouvoir avoir la possibilité d'effectuer en début de partie un ou deux sauts de cases (au choix).
Cependant, en faisant cela, on rencontre vite un souci qui était que les pions pouvaient toujours avancer de deux cases.
J'ai donc cette semaine implémenté le fait que quand on bouge notre pion `MyInitPawn`, celui-ci est remplacé par l'objet de base `MyPawn`.

Pour réaliser cela, j'ai donc utilisé la méthode `becomeForward:` comme on peut le voir ici :

```bash
moveTo: aSquare
    | newPawn |
   
    super moveTo: aSquare.
    newPawn := MyPawn new.
    newPawn square: aSquare.
    newPawn color: self color. 
    
    self becomeForward: newPawn.
```

Cette méthode redirige tous les pointeurs ciblant l'objet A vers un objet B choisi (si j'ai bien compris la chose).
Le problème avec cette méthode est sa consommation de ressources CPU. On pourrait donc essayer de trouver une alternative à cela, bien qu'on ne va pas utiliser cette méthode beaucoup de fois (seulement pour nos pions qui avanceront en début de partie).


### Révision du cours

J'ai également décidé de réviser le cours sur le double dispatch en refaisant le jeu du pierre-feuille-ciseaux de mon côté et en ajoutant comme extension `Lizzard` et `Spock`.

Enfin, je suis pour l'instant en train de lire le cours sur le Reverse Engineering qui m'a beaucoup intéressé après avoir vu comment monsieur Ducasse avait réussi assez rapidement à débugger le code du projet Chess sans avoir de connaissance au préalable dessus.