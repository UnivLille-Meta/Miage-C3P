
# Olivia

## Collection

Une collection est une structure de données qui peut contenir des objets. Il peut s'agir d'une liste (Array), d'une dictionnaire (Dictionary),  d'un ensemble (Set) ou d'une collection ordonnée (OrderedCollection) dont le premier élément est à l'indice 1. Il existe plusieurs méthodes afin d'effectuer les opérations de base (créer, ajouter, tester, accéder, ...)

Pour itérer sur une collection, on peut utiliser **collect:[unBloc]** 

```
#(11 38 3 -2 10) collect: [ :each | each odd ].
```
Dans cet exemple, on a :each qui est un argument du bloc et qui va prendre en valeur la valeur courante de la collection.  Pour cette valeur on va vérifier si la valeur est impaire. Le résultat sera donc :
```
(true, false, true, false, false)
```

> _Lecture des diapos : An Overview of Essential Collections, Introduction to Blocks_

## Conditionnel
Pour tester des valeurs, on peut utiliser le conditionnel qui se formule :
```
(condition)
    ifTrue : [...] 
    ifFalse : [...]

ex : 
(12>5)
	ifTrue: [ ^1 ]
	ifFalse: [ ^0 ]

> cela va retourner 1
```
Il est différent des autres langages qui utilisent souvent **if-else, if-then-else, if-else if...**

Avec ce conditionnel, il n'y a que deux alternatives : soit la condition est vraie, soit elle est fausse.

> _Vu avec le tutoriel ProfStef_

## Classes et méthodes 
Pour créer une classe, il faut d'abord créer un package. Dans une classe, on peut déclarer une méthode **initialize** qui sert de "constructeur" avec un super et possiblement une initialisation des variables :
```
initialize
    super.
    count := 0
```
On peut également créer des accesseurs. Pour retourner la valeur d'une variable, on utilise le "^"
```
count 
	^count
```
Pour modifier la valeur d'une variable
```
count: anInteger
	count := anInteger
```

> _Vu avec l'exercice Compteur_

NB : je n'ai pas réussi à mettre sur Github l'exercice.

## Pharo coding style 
- Utiliser le camelCase pour les noms de variable et méthode, seuls les noms de classe commencent par une majuscule
- Utiliser des noms explicites : par exemple une méthode de test commence par "test-"
- Il n'y a pas forcément de caractère ";" à la fin de chaque ligne, le code en Pharo est linéraire. Le caractère ";" est utilisé pour les cascades.

## Extras

Les cascades sont définies par le caractère ';'. Celui-ci est utilisé pour enchaîner les commandes afin d'éviter la répétition de codes. Par exemple, au lieu d'écrire : 
```
ProfStef next.
ProfStef next.
```
On va écrire : 
```
ProfStef
    next ;
    next ;
``` 
Ainsi la classe ProfStef n'est pas répétée.

## Ce que je n'ai pas compris

Les loops (avec to-do), les points, comment fonctionne le super avec look up (est-ce le même principe qu'en java ?) et self

## Modules vus

Module 0 : M0-1 (video + PDF), M0-2 (video + PDF), M0-3 (PDF), M0-4 (video), M0-7 (video), M0-8 (video), M0-9 (PDF), M0-12 (PDF)

Module 1 : M1-1 (PDF), M1-4 (PDF), M1-5 (PDF)



# Julien

## Learn about collections in Pharo and their iterators

Une collection est un objet qui va stocker des éléments sur lesquels ont pourra itérer dessus,récuperer les valeurs,vérifier des conditions...

### Exemple de collection
```
#(1 2 3)
#('hello' 'World')
Array with: (2+3) with: (6*6)

Dictionary new
    at: #a put: 'Alpha';
	at: #b put: 'Beta';
    yourself.
```

### Types de collections en Pharo
- Array
- Set
- Dictionnary
- LinkedList
- OrderedCollection
- ...

### Iteration sur les collections

Il existe plusieurs moyens pour itérer sur les collections : 
- **Do:** Pour itérer sur une liste
- **Collect:** Pour itérer sur une liste et récuperer le résultat
- **select:** sélectionner les élements correspondant à la condition
- **rejet:** rejeter les élements correspondant à la condition
- **detect:** Récupérer le premier élements dans la liste qui correspond à la condition
- ...

```
#(11 38 3 -2 10) collect: [ :each | each abs ]
> Retourne  #(11 38 3 2 10)

 #(11 38 3 -2 10) select: [ :each | each > 10 ].
> Retorne #(11 38)

#(11 38 3 -2 10) do: [ :each | each traceCr ].
> Sur chaque éléments de la liste on l'affiche avec traceCr
```
> _Vu avec MO-12(Iterators) et ProfStef_

## Learn about conditionals in Pharo

Pour écrire des conditions en Pharo il faut écrire une expression booleene(condition) qui va renvoyer un objet **true** ou **false**.
Cet objet on peut lui envoyer un "message"(des méthodes?) ifFalse,ifTrue qui ont chacun un bloc de code qui va être éxecuté en cas de réussite.

```
1 < 2 
	ifFalse: [ 42 ]
	ifTrue: [ 100 ]
```
1 < 2 Renvoie un objet true donc il vérifie la condition ifTrue et renvoie un objet 100.

Comparer aux autres langage comme Java par exemple on a pas de "if,else, else if"  on a juste comme dit-précédemment les méthodes ifTrue et ifFalse.

Dans l'ensemble en Pharo l'avantage de cette écriture de condition est la lisibilité.

Par contre dans le cas où plusieurs conditions s'enchaineent, cela risque d'être beaucoup moins lisible.

Pour information j'ai aussi trouvé qu'il existait **whileTrue**

> _Vu avec ProfStef, M0-2 _

## Learn how to create classes and methods

Pour créer un programme avec des classes et des méthodes, il faut d'abord créer un package dans lequel on stockera nos classes et méthodes.
### Création d'une classe
```
Object << #MyClass
	layout: FixedLayout;
	traits: {};
	slots: {count};
	sharedVariables: {};
	sharedPools: {};
	tag: '' ;
	package: 'MyCounter'
```
- #MyClass -> correspond au nom de ma classe
- slots -> correspond aux variables d'instances (Ici count)

### Création de méthode 
Cliquer sur votre classe, un onglet "Inst. side meth" sera visible. Dans celui-ci vous pouvez ajouter votre méthode
Par exemple un getter de count : 
```
count 
	^ count
```
Lien vers projet Counter : https://github.com/Frontaz1/MyCounter
> _Vu Exercice du Compteur _

## Learn about the basic Pharo coding style.
Il y'a plusieurs conventions en Pharo : 
- Ecrire les méthodes et variables en camelCase
- Ecrire les classes en PascalCase
- Eviter les underscore dans les méthodes,variables etc
- Choisir des noms qui ont un sens et descriptif pour les methodes et les classes

Exemple : 
```
good => editMenu
not good =>  eMenu ou edit_menu

good => Counter
not good => COUNTER
```

> _Vu avec 'Pharo with Style' free book _

## Extra

### Cascade
";" est l'operateur de cascade qui permet d'enchainer l'envoie de message pour le même receveur. C'est à dire qu'on aura pas besoin de répéter le nom de la cible sur laquelle nous effectuons une action 

Exemple avec cascade : 
```
result := 1
    + 1;
    + 1.

La value de result est 3
```
Sans cascasde on aurait du creer une variable intermédiaire 
```
var1 := 1 + 1.
result := step1 + 1.
```

### Blocks

Les blocs sont des fonctions anonymes, ils sont délimités par les caractères : [].

```
[ :x | x + 2 ] value: 5
> Cela va utiliser la valeur 5 pour la variable x et donc renvoyer 7
```

On peut avoir plusieurs arguments
```
[ :x :y | x + y] value: 2 value: 1
> 3
```

Un bloc peut être assigné une variable ce qui peut être pratique pour le réutiliser.
```
| b |
b := [ :x | x + 2 ].
b value: 12.
```
> _Vu with ProfStef _


## Ce que je n'ai pas compris / Questions

- Les méthodes dans class side sont elles des méthodes équivalentes à des constructeur en Java?
- Je ne comprends pas trop l'écriture : (0@0 corner: 100@200)

## Document consulté (Supplémentaires) 

https://files.pharo.org/media/pharoCheatSheet.pdf

# Lan 
## Learn about collections in Pharo and their iterators
- Collections are containers that hold multiple elements and provide powerful ways to iterate, query, transform, and manipulate them.
- Pharo standard library provides:
Sequenceable collections:
### SequenceableCollection: 
```
('hello' at: 1) = $h
```
=> This is a String collection (belongs to ArrayedCollection) to check if the word "hello" starts with "h". The result is true.
### Hashed Collections:
```
s := Set new.
s add: 4/2; add: 4; add: 2.
s size
```
=> This is a Set collection. We add 3 elements here. However, a set does not allow duplicates; there are two elements "2" here and the Set only allow 1 element.
The result is 2 (return size and there are 2 elements)
### Bag: A Bag is much like a Set except that it does allow duplicates.
```
{ Color black. Color white. (Color red + Color blue + Color green) }
asBag size.
```
=> This is a Bag collection. The result is 3. Two elements are "black" and "white". The other is "white" (white = red + blue + green).
- Some ways to iterate over collection:
+ **do:** (iterate)
+ **collect:** (iterate and collect results)
+ **select:** (select matching elements)
+ **reject:** (reject matching elements)
+ **detect:** (get first element matching)
+ **detect:ifNone:** (get first element matching or a default
value)
+ **includes:** (test inclusion)
- Source:
+ https://pharoweekly.wordpress.com/wp-content/uploads/2021/07/collections.pdf
+ https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC/Week3/C019-W3S09-Iterators.pdf
+ https://book.gtoolkit.com/working-with-collections-in-pharo-w9fc31ubksh9va7i1516z5mt
+ https://files.pharo.org/books-pdfs/pharo-by-example/2009-PharoByExample-2009-EN.pdf

## Learn about conditionals in Pharo
### Conditionals are expressed by sending one of the messages ifTrue:, ifFalse: or ifTrue:ifFalse: to the result of a boolean expression.
```
(17 * 13 > 220)
ifTrue: ['bigger']
ifFalse: [ 'smaller' ] 
```
=> The result is "bigger". 
### Comparison to other language (Java):
  + In Pharon, Boolean is an object, and ifTrue:, ifFalse: are messages sent to it.
  + In Java, Boolean is a data type, alrealy stores T/F values.
### Benefits and drawbacks:
  + Benefits: The conditional is just a message sent to a Boolean object, so we can send whatever we had defined, not limited to 2 values T/F.
  + Drawbacks: Not like the Boolean in Java, the Boolean object in Pharon is harder to use and understand (:(((), and with simple cases when we just want to check yes/no, a data type which stores only two answers seems easier to call.
 - Sources:
+ https://files.pharo.org/books-pdfs/pharo-by-example/2009-PharoByExample-2009-EN.pdf
+ https://viblo.asia/p/cau-lenh-dieu-kien-trong-java-phan-1-vlZL9oPb4QK (yeah it is easier for me to understand in my language)
+ https://www.w3schools.com/java/java_booleans.asp (There is a lot of controversy about this site but I used it to learn code all through my uni and felt ok)

## Learn how to create classes and methods

I have finished creating classes and methods, creating test classes or using playgrounds to run tests. These are the docs that I had read:
- https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC/Week1/Exo-Counter.pdf
- https://files.pharo.org/media/pharoCheatSheet.pdf
- https://github.com/LaCoir/MyCounter

## Learn about the basic Pharo coding style.
- There are some rules that we have to follow when coding by Pharo:
  + Use descriptive names: Choose a clear name, no abbreviations ("timeOfDay" is ok, but not "tod" or "ToD")
  + Method selectors start with lowercase (it's not obligatory in other language but in Pharo. "getMethods" is ok but "GetMethods" is not)
  + Shared variables start with uppercase; Private variables start with lowercase

## What I don't know:
- Pharo coding convention is difficult for people who are familiar with other languages.
