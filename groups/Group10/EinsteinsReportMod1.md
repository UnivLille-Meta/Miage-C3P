# Rapport de cours – Module 1 : Understanding Messages


## Objectifs du module

Ce module a pour but de comprendre comment Pharo gère :

-  L’envoi de messages entre objets.
-  Le fonctionnement de self et super.
-  Les mécanismes d’héritage et de recherche de méthode (lookup).
- Le rôle du dispatch dynamique et du polymorphisme.

## Concepts essentiels
Envoi de message (Dispatch)
En Pharo, tout est message :
Quand on écrit :
```smalltalk
6-2
```
Pharo envoie le message -2 à l’objet 6 (Binary message). self représente le receveur du message.
L’envoi de message détermine quelle méthode sera exécutée en fonction de la classe du receveur.


# Héritage (Inheritance)
L’héritage permet à une classe fille de réutiliser ou de redéfinir les comportements d’une classe mère.
Exemple :
```smalltalk
Object subclass: #Animal
	slots: { #name }.

Animal >> speak
	^ 'Animal Sound'.

Animal subclass: #Cat.
Cat >> speak
	^ 'Wooooof!'.
```

Cat hérite de Animal. Cat redéfinit la méthode speak.

# Self
self représente l’objet courant c'est a dire le receveur du message. Il permet d’appeler d’autres méthodes sur le même objet.
Exemple :
```smalltalk
A >> bar
	^ self foo

A >> foo
	^ 20
```

Si aA := A new, alors aA bar renvoie 20. self est dynamique : il dépend de l’objet qui reçoit le message.

# Super
super ne représente pas la superclasse mais change le point de départ de la recherche de méthode.
Le message est toujours envoyé au même objet, mais la recherche commence dans la superclasse.

Exemple :
```smalltalk
A >> foo
	^ 10

B >> foo
	^ super foo + 5
```
Si B hérite de A, alors B new foo renvoie 15.

# Polymorphisme
Le polymorphisme permet à différents objets de répondre à un même message selon leur propre logique.

Exemple :
```smalltalk
Animal >> speak
	^ 'Anima; sound'.
  
Cat >> speak
	^ 'Meow!'.
  
Dog >> speak
	^ 'Woof!'.
```
Quand on envoie speak à un objet, le résultat dépend de sa classe.

# Exemple : Template Method
```smalltalk
Animal >> speak
	self makeSound.   "Algorithme fixe, mais les étapes sont  variable"

Cat >> makeSound
	Transcript show: 'Meow!'.

Dog >> makeSound
	Transcript show: 'Woof!'.

```
Le modèle (template) est défini dans Animal, les sous-classes (Dog, Cat) implémentent leur comportement spécifique.
Cela illustre le pattern Template Method.

# Conclusion
Le module 1 enseigne que :

- En Pharo, tout est message.
- self et super définissent le comportement du lookup dynamique.
- L’héritage et le polymorphisme rendent le code extensible et réutilisable.
- Le Template Method illustre comment fixer une structure d’algorithme tout en laissant les sous-classes définir les étapes spécifiques.


