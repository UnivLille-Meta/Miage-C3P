# Obede
The Template Method with Hooks is an important object-oriented design pattern widely used in Pharo
- Definition:
	-	Template Method: defines the overall structure of a process.
	-	Hook: customizable points in the template, implemented in subclasses.
- Advantages:
	-	Code reuse
	-	Consistent structure
	-	Flexibility to customize specific steps
  
1. Exercise 1: Sandwich (Recette)
Goal:
Create sandwiches with a common structure but different fillings.

```smalltalk
Object subclass: #Sandwich
    instanceVariableNames: ''.

Sandwich >> make
	"Template Method : Définit la structure"
	self prendrePain.
	self ajouterGarniture. "Hook : dépend de la sous-classe"
	self fermerPain

Sandwich >> prendrePain
    Transcript show: 'Prendre du pain'; cr.

Sandwich >> fermerPain
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
"
On prend du pain
On met du jambon
On ferme avec du pain
"
(SandwichOmelette new) make.
"
On prend du pain
On met une omelette
On ferme avec du pain
"
```
Explanation:
	-	make is the template
	-	ajouterGarniture is the hook
	-	The overall structure remains the same; each subclass customizes the filling.

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

- Explanation:
	-	process: is the template		
	-	filter: and display: are hooks implemented in subclasses
	-	Each subclass defines its own behavior while keeping the template structure intact.

### Conclusion

- The Hook & Template pattern allows:
	-	Reusing a common structure
	-	Customizing specific steps (hooks)
	-	Reducing code duplication



# Adil

## Definition and Work Done
I watched the videos on reverse engineering and read the provided PDFs.

- Template Method: A behavioral design pattern that defines the skeleton of an algorithm in a method, deferring some steps to subclasses
- Hook: A method declared in the base class, meant to be overridden by subclasses to customize behavior

---

## Example 1: Ice Cream Preparation

### Base Class: IceCream
```smalltalk
Object subclass: #IceCream
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'TemplateMethod-IceCream'

IceCream >> prepare
    "Template Method"
    self prepareBase.
    self addTopping.  "Hook"
    self finalize.

IceCream >> prepareBase
    Transcript show: 'Prepare vanilla or chocolate base'; cr.

IceCream >> finalize
    Transcript show: 'Add cherry and serve!'; cr.

IceCream >> addTopping
    self subclassResponsibility.
```

### Subclasses: FruitIceCream & NutIceCream
```smalltalk
IceCream subclass: #FruitIceCream
    instanceVariableNames: ''

FruitIceCream >> addTopping
    Transcript show: 'Add strawberry and raspberry pieces'; cr.

---

IceCream subclass: #NutIceCream
    instanceVariableNames: ''

NutIceCream >> addTopping
    Transcript show: 'Add hazelnut and almond pieces'; cr.
```

### Playground Test
```smalltalk
(FruitIceCream new) prepare.
(NutIceCream new) prepare.
```

**Output:**
```
Prepare vanilla or chocolate base
Add strawberry and raspberry pieces
Add cherry and serve!

Prepare vanilla or chocolate base
Add hazelnut and almond pieces
Add cherry and serve!
```

---

## Example 2: Document Processing

### Base Class: DocumentProcessor
```smalltalk
Object subclass: #DocumentProcessor
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'TemplateMethod-Document'

DocumentProcessor >> process: aDocument
    "Template Method"
    self validate: aDocument.
    self transform: aDocument.  "Hook"
    self save: aDocument.

DocumentProcessor >> validate: aDocument
    Transcript show: 'Validating document structure...'; cr.

DocumentProcessor >> save: aDocument
    Transcript show: 'Saving processed document.'; cr.

DocumentProcessor >> transform: aDocument
    self subclassResponsibility.
```

### Subclasses: PDFProcessor & TXTProcessor
```smalltalk
DocumentProcessor subclass: #PDFProcessor
    instanceVariableNames: ''

PDFProcessor >> transform: aDocument
    Transcript show: 'Converting document to PDF format'; cr.

---

DocumentProcessor subclass: #TXTProcessor
    instanceVariableNames: ''

TXTProcessor >> transform: aDocument
    Transcript show: 'Extracting plain text from document'; cr.
```

### Playground Test
```smalltalk
(PDFProcessor new) process: 'sample'.
(TXTProcessor new) process: 'sample'.
```

**Output:**
```
Validating document structure...
Converting document to PDF format
Saving processed document.

Validating document structure...
Extracting plain text from document
Saving processed document.
```

---

## Benefits 

The Template Method pattern offers flexibility by allowing subclasses to customize only specific steps through hooks This approach reduces code duplication and makes the system easier to maintain and extend 

---




