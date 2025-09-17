# Olivia

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

### Exercice Dice 
[Lien github Flags](https://github.com/olivia-lang/Dice_Miage)

### Modules vus
Module 1 : M1-2 (PDF), M1-3 (PDF)
Reverse engineering (le concept est encore abstrait, je n'ai pas du tout compris)

### Reverse Engineering
Définition : analyser un système pour identifier ses composants pour recréer le système sous une différente forme. Le but étant de comprendre comment fonctionne un système / un programme.

# Julien

## Exercice 

### Boolean methods : 

### Implementation de l'opérateur **|** 

Test : 
```
true | true => true
true | false => true
false | true => true
false | false => false
```
Pour l'implémentation on peut imaginer ceci : 

Quand on envoie un message a True(Le receveur)

```
Dans la classe True
| aBool
	^true
Dans la classe False
| aBool
	^aBool
```

On peut aussi écrire 
```
5 | 6 => 7 (Calcul de bit surement)
```
### Implementation de l'opérateur **or:** 

Test : 
```
6 or: [ 2 ]. => Must be boolean 
true or: [ false ] => true.
true or: [ true ]. => true.
true or: [ 2 ]. => true.
false or: [ 2 ]. => 2.
false or: [ true ]. => true.
false or: [ false ]. => false.
```

On ne peut donc pas écrire autre chose que des boolean pour l'opérateur **or:**

On peut donc imaginer la même implémentation que |

```
Dans la classe True
or: aBool
	^true 
Dans la classe False
or: aBool
	^aBool value 
```
### Implementation de l'opérateur **ifTrue:ifFalse:** 

Test : 
```
false ifTrue: [ 'oui' ] ifFalse: [ 'non' ]. => Renvoie non
true ifTrue: [55] ifFalse: [22]. => Renvoie 55
```
On peut donc imaginer la même implémentation que ifTrue:ifFalse: 

```
Dans la classe True
ifTrue: block ifFalse: block2
	^block value
Dans la classe False
ifTrue: block ifFalse: block2
	^block2 value
```

Pour informations on doit mettre value car sinon on renvoie le block donc par exemple au lieu de récuperer 55 on aura [55] 

### LookUp : 

J'ai bien refait les exercices sur lookup dans les vidéos/diaporama avec notamment super et self.

M1-4 et M1-5

## self==super

## Exercice 
Flags :  https://github.com/Frontaz1/Country (A partir de la Page 14 je n'arrive pas à le faire fonctionner)

Dice : https://github.com/Frontaz1/Dice (Jusqu'a 1.10, 1.11 en cours)

## Message dispatch

lien github : https://github.com/Frontaz1/TestMessageDispatch

Pour tester les messages dispatch j'ai créer une classe mère Vehicule avec deux classes filles Voiture et Moto.

Classe vehicule : 
```
Vehicule >> foo
	^50
vehicule >> type
	^ 'Je suis la classe Vehicule'
vehicule >> powerVehicule 
	^self power
vehicule >> bar
	^self type
```

Classe Moto : 
```
Moto >> foo
	^10
Moto >> type
	^ 'Je suis une Moto',super type.
Moto >> power
	^60
```

Classe Voiture :
```
Voiture >> type
	^ 'Je suis une voiture'.
```

Avec ceci j'ai pu faire plusieurs test dans le playground :

```
Moto new foo
```
Ceci renvoie 10, les étapes : 
- On cherche la classe Moto
- On cherche la méthode foo, elle existe
- On l'execute
- Renvoie 10

```
Voiture new foo
```
Ceci va renvoyer 50, en effet en envoyant le message foo au receveur de la classe Voiture, l'héritage fonctionne et va faire appel a la méthode dans la classe mère.

Les étapes pour l'appel de la méthode sont les suivantes : 
- On cherche la classe voiture
- On cherche la méthode foo, ici elle n'existe pas
- On fait un lookup dans Vehicule, on trouve foo
- foo est éxecuté
- Renvoie 50

```
Voiture new bar
```
J'aurais cru qu'il renverrai  'Je suis une voiture'. mais cela renvoie **a Voiture** => Le type d'objet

Dernier test pour le report
```
Moto new type
```
Le résultat est bien :  Je suis une Moto Je suis la classe Vehicule
Les étapes : 
- On cherche la classe Moto
- On cherche la méthode type, on la trouve
- Elle l'execute on renvoie Je suis une voiture, super type
- On fait donc un lookup dans la classe Vehicule, on cherche la méthode type
- On execute et renvoie le résultat Je suis la classe Vehicule dans la méthode type de Moto
- Renvoie  Je suis une Moto Je suis la classe Vehicule

# Lan
## Boolean
- Using **|**
```
true|true -> true
true|false -> true
false|false -> false
```
=> Like **|** in Java, **|** in Pharo is a Bitwise OR. It returns "true" if at least one operand is true; otherwise, it is "false".
- Using **or:**
```
true or: false -> true
true or: false -> true
false or: false -> false
true or: [ 5 > 10] -> true
```
=> Nonevaluating disjunction. If the receiver is false, answer the value of the argument, alternativeBlock; otherwise answer true without evaluating the argument.
- Using **ifTrue:ifFalse:**
```
"(true ifTrue: [ '123' ] ifFalse: [ '345' ]) >>> '123'"
"(false ifTrue: [ '678' ] ifFalse: [ '890' ])  >>> '678'"
```
=> If the receiver is true (i.e., the condition is true), then answer the value of the argument trueAlternativeBlock. If the receiver is false, answer the result of evaluating the argument falseAlternativeBlock. If the receiver is a nonBoolean then create an error notification. Execution does not actually reach here because the expression is compiled in-line.
## self == super
- Self: the receiver of the current message.
- Super the receiver but for accessing overridden methods. Super only affects method lookup, not the identity of the receiver.
=> When we execute self == super, it returns true because these two are refer to one receiver.
## Dispatch
**Dispatch + super vs self**

**Define the classes**



**``**

Object subclass: #Animal

&nbsp;   instanceVariableNames: ''

&nbsp;   classVariableNames: ''

&nbsp;   package: 'DispatchDemo'.



Animal >> speak

&nbsp;   ^ 'generic sound'.



Animal >> introduce

&nbsp;   ^ 'I am an animal'.



"Subclass Dog"

Animal subclass: #Dog

&nbsp;   instanceVariableNames: ''

&nbsp;   classVariableNames: ''

&nbsp;   package: 'DispatchDemo'.



Dog >> speak

&nbsp;   ^ 'woof'.



Dog >> introduce

&nbsp;   ^ super introduce , ' but actually a dog'.



"Subclass Cat"

Animal subclass: #Cat

&nbsp;   instanceVariableNames: ''

&nbsp;   classVariableNames: ''

&nbsp;   package: 'DispatchDemo'.



Cat >> speak

&nbsp;   ^ 'meow'.

``



**Tests in Playground**



``

a := Animal new.

d := Dog new.

c := Cat new.



a speak.         "-> 'speak'"

d speak.         "-> 'woof'"

c speak.         "-> 'meow'"



a introduce.     "-> 'I am an animal'"

d introduce.     "-> 'I am an animal but actually a dog'"

``

**Dispatch reasoning**



* d speak



&nbsp;	lookup in Dog → finds speak → returns 'woof'.



* d introduce



&nbsp;	lookup in Dog → finds introduce.



&nbsp;	Executes: super introduce , ' but actually a dog'.



&nbsp;	super changes lookup start point to superclass Animal.



&nbsp;	In Animal, finds introduce → 'I am an animal'.



&nbsp;	Concatenate → 'I am an animal but actually a dog'.



* c speak → 'meow' (normal override).



* a introduce → 'I am an animal'.



**What it shows**



* Override + super: You can reuse parent method’s behavior and extend it.



* Dispatch is always dynamic: self is always the real receiver (Dog), but super tells the system to start the lookup in the superclass.


## Dice program
Link github: https://github.com/LaCoir/Dice
## Source:
- Lecture slides
- https://files.pharo.org/media/pharoCheatSheet.pdf
- https://books.pharo.org/booklet-WithStyle/pdf/WithStyle.pdf
- https://books.pharo.org/updated-pharo-by-example/pdf/2018-09-29-UpdatedPharoByExample.pdf?utm_source=chatgpt.com
