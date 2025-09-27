# Obede
The Template Method with Hooks is an important object-oriented design pattern widely used in Pharo
Definition:
	•	Template Method: defines the overall structure of a process.
	•	Hook: customizable points in the template, implemented in subclasses.
Advantages:
	•	Code reuse
	•	Consistent structure
	•	Flexibility to customize specific steps
  
1. Exercise 1: Sandwich (Recette)
Goal:
Create sandwiches with a common structure but different fillings.

```smalltalk
Object subclass: #Sandwich
    instanceVariableNames: ''.

Sandwich >> make
	"Template Methode : Définit la structure"
	self prendrePain.
	self ajouterGarniture. "Hook : dépend de la sous-classe"
	self fermerPain

Sandwich >> prendrePain
    Transcript show: 'Prendre du pain'; cr.

Sandwich >> FermerPain
    Transcript show: 'Fermer du pain'; cr.

Sandwich >> ajouterGarniture
    self subclassResponsibility.  "Hook à reféfinir"
```
Subclasses

```smalltalk
Sandwich subclass: #SandwichJambon
    instanceVariableNames: ''.
SandwichJambon >> ajouterGarniture
    Transcript show: 'On met du Jambon'; cr.

Sandwich subclass: #SandwichOmelette
    instanceVariableNames: ''.
SandwichOmelette >> ajouterGarniture
    Transcript show: 'On met une omelette'; cr.
```
Testing in playground
```smalltalk
(SandwichJambon new) make.
"Result:
On prend du pain
On met du jambon
On ferme avec du pain
"
(SandwichOmelette new) make.
"Result:
On prend du pain
On met une omelette
On ferme avec du pain
"
```
Explanation:
	•	make is the template
	•	ajouterGarniture is the hook
	•	The overall structure remains the same; each subclass customizes the filling.

2. Exercise 2 : Collection Processing with Subclasses

Goal:
Process a collection with a fixed template but allow different filtering and display behaviors through subclasses.

```smalltalk
Object subclass: #CollectionProcessor
    instanceVariableNames: ''.

CollectionProcessor >> process: aCollection
    | filtered |
    filtered := self filter: aCollection.  "Hook: filter"
    self display: filtered.                "Hook: display"

CollectionProcessor >> filter: aCollection
    self subclassResponsibility.           "Hook à redéfinir"

CollectionProcessor >> display: aCollection
    self subclassResponsibility.           "Hook à redéfinir"

```
Subclasses

Even numbers processor
```smalltalk
CollectionProcessor subclass: #EvenNumbersProcessor
    instanceVariableNames: ''.

EvenNumbersProcessor >> filter: aCollection
    ^ aCollection select: [:each | each even].

EvenNumbersProcessor >> display: aCollection
    Transcript show: 'Nombres pairs: ', aCollection printString; cr.
```

Odd numbers processor
```smalltalk
CollectionProcessor subclass: #OddNumbersProcessor
    instanceVariableNames: ''.

OddNumbersProcessor >> filter: aCollection
    ^ aCollection select: [:each | each odd].

OddNumbersProcessor >> display: aCollection
    Transcript show: 'Nombres impairs: ', aCollection printString; cr.
```

Testing in playground

```smalltalk
| numbers |
numbers := #(1 2 3 4 5 6 7 8 9 10).

(EvenNumbersProcessor new) process: numbers.
(OddNumbersProcessor new) process: numbers.
```

Transcript Output:
```smalltalk
Nombres pairs: #(2 4 6 8 10)
Nombres impairs: #(1 3 5 7 9)
```

Explanation:
	•	process: is the template
	•	filter: and display: are hooks implemented in subclasses
	•	Each subclass defines its own behavior while keeping the template structure intact.

## Conclusion

The Hook & Template pattern allows:
	•	Reusing a common structure
	•	Customizing specific steps (hooks)
	•	Reducing code duplication




