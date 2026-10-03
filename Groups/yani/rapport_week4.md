
# Lecture + exercice sur sur le compossite et visitor pattern

# Composite Design Pattern

Composer des objets dans une structure arborescente.

## Les 4 types de rôles dans le pattern Composite

- Le client (c'est l'utilisateur, je crois).
- Le Component (l'interface).
- La feuille (Leaf) : en général, plusieurs.
- Le Composite : il est composé de plusieurs Components.

### Fonctionnement

                images/invisible sur github

La récursivité se met dans la classe Composite. Elle veut dire qu'un Composite peut avoir plusieurs Components.

La méthode `draw` dans Graphic peut être soit abstraite, soit avoir une implémentation par défaut.

## Implémentation sans interface commune

Mais en réalité, les Leaf et le Composite n'ont pas vraiment besoin d'implémenter une interface commune ! Ce qui fait que c'est un Composite, c'est surtout que les Leaf et le Composite implémentent la même API (c'est la méthode `draw`, en l'occurrence, je crois).

Voici l'implémentation d'une telle chose :

                                images/invisible sur github

**Pas d'interface ici !**

Tant qu'ils ont une API commune (opération), c'est suffisant pour avoir le pattern Composite.

Si je veux une Leaf, j'instancie la Leaf. Si je veux le Composite, je l'instancie et je peux avoir dedans des Leaf et d'autres Composites (grâce à la récursivité sur lui-même !).

**Défaut de cette implémentation :** on ne peut pas partager de code entre les Leaf et les Composites.

---

## Troisième implémentation : Composite seul
                
                                images/invisible sur github

Il y a une troisième implémentation avec seulement le Composite tout seul, mais apparemment, ce n'est pas très intéressant.

---

# Visitor Design Pattern

Le Visitor (Visiteur) est un patron de conception qui permet d'ajouter de nouvelles opérations à des classes existantes, sans modifier leur code.

Le visiteur représente une opération.

Dans le cours, on nous dit que le Visitor et le Composite font un très beau couple !

**Domain = Composite**

Le but ici, de ce que je comprends, c'est qu'on puisse avoir plusieurs opérations sur une hiérarchie de classes (dans le cas composite), mais sans toucher à ces classes individuellement ! À la place, on crée une seule classe qui représente cette opération et elle devient applicable sur toutes les classes !

## Exemple : Expressions

                images/invisible sur github
                
### Playground

1. `aExpression := Expression new`
2. `aEvaluator := Evaluator new`
3. `aEvaluator evaluate: aExpression`

Expression, genre, elle possède une expression du genre : `1 + 2` ou :

`Plus (Left: Number value 1 Right: Number value 2)`

Remarque que ce n'est pas dénué de sens, car oui, si on n'a que Evaluator, on pourrait se dire : dans ma fonction `evaluate`, je n'ai qu'à mettre `anExpression acceptExpression: self`, puis j'aurai dans chaque classe le code défini dans chacune des méthodes `visitNumber`, `visitPlus`, etc.

Cela nous ferait moins d'allers-retours (parce que là, on démarre de Evaluator, puis on va dans une des classes de Expression, puis on revient dans une des fonctions de Evaluator (`visitNumber`, `visitPlus`, etc.)).

Mais le truc, c'est que si demain on veut un nouveau comportement, ex Printer, on devra définir dans chaque sous-classe de Expression une méthode qui fait le job.

Mais je te rappelle que nous, on ne veut pas Toucher aux classes !!!!!!

Avec le pattern Visitor, on n'aura qu'à créer une nouvelle classe et on met dedans le comportement `visit...` que l'on veut pour chaque classe ! Et le tour est joué !

---

# Exercice récurrent dans un test ?

## Composite : File System

```smalltalk
Object subclass << FSEntry

Slots { #nom }

Package {}
```

```smalltalk
FSEntry subclass << FSFile

Slots {}

Package {}
```

### Recherche par nom

```smalltalk
FSFile >> searchByName: aName

name = aName ifTrue: [ ^ self ].
```

```smalltalk
FSEntry subclass << FSDirectory

Slots { #aFSEntry }

Package {}
```

### Ajout d'une entrée

```smalltalk
FSDirectory << addEntry: aEntry

aFSEntry := aFSEntry add: aEntry
```

### Recherche récursive

```smalltalk
FSDirectory >> searchByName: aName

nom = aName ifTrue: [ ^ self ]

aFSEntry do: [ :en |
    | result |

    ^ en searchByName: aString.
].
```

Si le nom correspond, on le retourne. Sinon, on explore récursivement les sous-classes.

**Réponse à la question :** on retourne le premier résultat trouvé.

## Recherche par contenu

### FSFile

```smalltalk
FSFile >> searchByContents: aString

(contents includesSubstring: aString) ifTrue: [ ^ self ].
```

### FSDirectory

```smalltalk
FSDirectory >> searchByContents: aString

aFSEntry do: [ :en |
    | result |

    ^ en searchByContents: aString.
].
```

---

# Réimplémentation avec le patron Visitor

Dans FSFile :

```smalltalk
FSFile >> accept: aVisitor

    ^ aVisitor visitFSFile: self
```

Dans FSDirectory :

```smalltalk
FSDirectory >> accept: aVisitor

    ^ aVisitor visitFSDirectory: self
```

---

# Le Visitor

```smalltalk
Object << #FSVisitor
    slots: {};
    package: 'FileSystem'.
```

## Exemple : FSSearchByNameVisitor

```smalltalk
FSVisitor subclass << #FSSearchByNameVisitor

    slots: { #searchedName . #result };

    package: 'FileSystem'.
```

### Accesseurs

```smalltalk
FSSearchByNameVisitor >> searchedName: aString

    searchedName := aString
```

```smalltalk
FSSearchByNameVisitor >> result

    ^ result
```

### Les méthodes de visite

Dans FSFile :

```smalltalk
FSSearchByNameVisitor >> visitFSFile: aFile

    aFile name = searchedName ifTrue: [ ^ aFile ].
```

Dans FSDirectory :

```smalltalk
FSSearchByNameVisitor >> visitFSDirectory: aDirectory

    aDirectory name = searchedName ifTrue: [ ^ aDirectory ].

    aDirectory children do: [ :child |
        | result |

        result := child accept: self.

        result ifNotNil: [ ^ result ].
    ].
```
