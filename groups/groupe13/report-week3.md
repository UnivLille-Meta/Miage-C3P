## Gautam Demeulemeester 
Cette semaine j'ai terminé le kata sur le Rover. Mon Rover est capable de recuperer une suite d'instruction et d'effectuer les mouvements demandés. 
Voici un exemple d'utilisation de super reprenant le tp sur les dés, supposons DieHandle sous-classe de Die:
```
Die >> roll
    ^ faces atRandom.

DieHandle >> roll
    ^ super roll * 3
```
Lors de l'appel à roll sur un DieHandle, la méthode va chercher le roll de Die grace au super et faire x3 sur le lancé au hasard
J'ai également lu les PDFs et je n'ai pas de questions.
