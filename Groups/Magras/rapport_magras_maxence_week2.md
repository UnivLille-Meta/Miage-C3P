# Rapport Week 1

### Examples

Comme j'avais déjà donné un exemple de dispatch la semaine dernière, j'ai décidé d'aller plus loin avec le double dispatch vu en L3 en utilisant l'exemple du jeu Pierre Feuille Ciseaux : 

```smalltalk
Rock >> vs: anOpponent
    ^ anOpponent playAgainstRock: self.

Paper >> vs: anOpponent
    ^ anOpponent playAgainstPaper: self.

Scissors >> vs: anOpponent
	^ anOpponent playAgainstScissors: self.

Rock >> playAgainstRock: aRock
    ^ #draw.

Rock >> playAgainstPaper: aPaper
    ^ #rockLoses.

Rock >> playAgainstScissors: aScissors
    ^ #rockWins.

Paper >> playAgainstRock: aRock
    ^ #paperWins.

Paper >> playAgainstPaper: aPaper
    ^ #draw.

Paper >> playAgainstScissors: aScissors
    ^ #paperLoses.

Scissors >> playAgainstRock: aRock
    ^ #scissorsLoses.

Scissors >> playAgainstPaper: aPaper
    ^ #scissorsWins.

Scissors >> playAgainstScissors: aScissors
    ^ #draw.
```

### Did the examples work as expected ?

Oui, le message se transmet premièrement à l'objet en paramètre (premier dispatch) sur lequel on envoie le message correspondant à une partie contre l'objet qui l'a envoyé (deuxième dispatch).

### What was different between what you expected and what you saw in reality?

Ce n'était pas différent de ce que j'attendais car je l'avais déjà fait l'année dernière.

### Exercices

J'ai fait l'exercice sur les Flags et la carte du monde en entier et j'ai commencé l'exercice sur les échecs
