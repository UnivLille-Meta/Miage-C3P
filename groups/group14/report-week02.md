# Olivia

## Exercice
## Exercice
### Boolean methods
J'ai testé les différentes implémentations des méthodes booléennes.
```
true | false.       >> renvoie True
false | false.      >> renvoie False
true | true.        >> renvoie True
```
**|** s'agit de l'opérateur OU (|) binaire.
```
1 | 2.              >> renvoie 3
```
Il semble additionner les nombres car il va effectuer l'opération OU en binaire (il convertit les nombres en binaire):
```
1 = 01
2 = 10
01 OU 10 = 11
``` 
**or:** s'agit de l'opération OU booléen. 
```
false or: true.     >> renvoie True
false or: false.    >> renvoie False
true or: true.      >> renvoie True
```
Cependant, **1 or: 2.** génère une erreur car 1 est un Integer et non un booléen, de même pour 2.
```
( 1>6 ) or: ( 5<7 ).    >> comprend que ( 1>6 ) est faux et ( 5<7 ) est vrai, et donc faux OU vrai vaut vrai
                        >> renvoie True
```

Pour le conditionnel, on utilise ifTrue et ifFalse : 
```
(condition)
    ifTrue : [...] 
    ifFalse : [...]

ex : 
((12>5) or: (3>9))
	ifTrue: [ ^true ]
	ifFalse: [ ^ false ]

> cela va retourner true

((12<5) or: (3>9))
	ifTrue: [ ^true ]
	ifFalse: [ ^ false ]
> cela va retourner false
```

### Block closures
Cela s'écrit avec **[ expression ]**, exemple : 
```
[ 2+3 ]
[ 5 + 9 * 2 ]
```
Quand on fait "inspecter", cela ne va pas effectuer les opérations dans les expressions. Quand on fait "print", cela va juste afficher le bloc.
Pour effectuer les opérations internes à l'expression, il faut utiliser **value** :
```
[ 5 + 9 * 2 ] value         >> renvoie 28
[ 2+3 ] value               >> renvoie 5
```
Avec les blocs, on peut écrire des expressions lambda, par exemple : 
```
[ :x | x*2 ]
```
Et pour affecter une valeur de départ à x, on utilise **value:** : 
```
[ :x | x*2 ] value:5       >> x = 5, donc 5*2 = 10
                           >> renvoie 10
```
On peut également faire une expression lambda avec n arguments : 
```
[ :x :y | x*2+y ] value:5value:10   >> x=5, y=10
                                    >> donc 5*2+10
                                    >> renvoie 20
```
### self == super
On ne peut pas comparer un avec avec **super** car super n'est pas un objet mais une référence pour la recherche des méthodes

### Dispatch
J'ai créé une classe mère "Game" qui contient 2 méthodes : 
```
Game >> startPhrase
    ^'This is '

Game >> giveType
    ^'a game'
```
J'ai créé deux sous-classes de Game qui sont "VideoGame" et "BoardGame" avec les mêmes méthodes mais qui renvoient des messages différents :
```
VideoGame >> startPhrase
    ^super startPhrase

VideoGame >> giveType
    ^'a video game'

BoardGame >> startPhrase
    ^super startPhrase

BoardGame >> giveType
    ^super giveType
```

Dans le playground, je lance les lignes suivantes : 
```
aGame := Game new.
aVGame := VideoGame new.
aBGame := BoardGame new.

aVGame startPhrase , aVGame giveType .
aGame startPhrase , aGame giveType .
aBGame startPhrase , aBGame giveType.
```

Voici l'évolution de aVGame : 
1. Recherche de sa classe : VideoGame
2. Il existe une méthode **startPhrase** dans cette classe
3. La méthode **startPhrase** est exécutée
4. **super startPhrase** fait référence à la méthode startPhrase de sa classe supérieure, on va donc chercher dans la classe Game
5. Il existe une méthode **startPhrase** dans cette classe qui renvoie 'This is ' vers **super startPhrase**
6. **super startPhrase** va renvoyer le message 'This is '
7. On concatène ce message avec le message suivant.
8. Recherche de la classe de qVGame : VideoGame
9. La méthode **giveType** est exécutée
10. Le message renvoyé est 'a video game'

aVGame va donc renvoyer 'This is a video game'
aGame va renvoyer 'This is a game'
aBGame va renvoyer également 'This is a game'

### Exercice Flags
[Lien github Flags](https://github.com/olivia-lang/Flags_Miage)

### Modules vus
Module 1 : M1-2 (PDF), M1-3 (PDF)
Reverse engineering (le concept est encore abstrait, je n'ai pas du tout compris)

### Reverse Engineering
Définition : analyser un système pour identifier ses composants pour recréer le système sous une différente forme. Le but étant de comprendre comment fonctionne un système / un programme.
