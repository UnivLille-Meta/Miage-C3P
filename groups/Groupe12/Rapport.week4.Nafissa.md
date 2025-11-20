## Module 2 – Introduction aux Design Patterns

### Qu’est-ce qu’un Design Pattern ?

J’ai appris que les *design patterns* (ou patrons de conception) sont des **solutions réutilisables** à des problèmes de conception récurrents en programmation orientée objet.  
Ils ne fournissent pas du code tout fait, mais plutôt une **structure de réflexion** pour mieux organiser et maintenir son code.  
L’objectif est d’écrire un code **plus clair, flexible et modulaire**.

---

### Exemple d’un problème courant : `printString` et `printOn:`

J’ai commencé par comprendre la différence entre deux méthodes souvent confondues en Pharo :

- `printString` : retourne une **chaîne de caractères** représentant l’objet.  
- `printOn:` : écrit directement la représentation de l’objet **dans un flux existant**, ce qui évite de créer des objets intermédiaires inutiles.

#### Exemple :
```smalltalk
"Exemple avec printString"
Date today printString.   "→ '20 October 2025'"

"Exemple avec printOn:"
| stream |
stream := WriteStream on: String new.
Date today printOn: stream.
stream contents.          "→ '20 October 2025'"
```
---
### Global to Parameter – Éviter les variables globales
Transcript est une variable globale utilisée pour afficher des messages.
Exemple :
```smalltalk
Transcript show: 'Starting process'; cr.
```
---
### Problèmes rencontrés :

Le code devient dépendant de Transcript.

Les tests sont difficiles à écrire.

On ne peut pas avoir plusieurs logs différents.

Solution :

Remplacer la variable globale par une variable d’instance :
```
logStream := WriteStream on: (String new: 1000).
logStream << 'Process started'; cr.
```

On peut ensuite injecter un autre flux (par exemple Transcript) :
```
myObject logStream: Transcript.
```

Le code devient plus flexible, testable et indépendant.
---

### De “monolithique” à “paramétrable”

Éviter de coder des valeurs en dur (comme des couleurs ou chemins de fichiers).

Préférer des paramètres configurables :
```
textArea backgroundColor: defaultBackgroundColor.
```

Ajouter une méthode pour personnaliser :
```
setBackgroundColor: aColor
    defaultBackgroundColor := aColor
```

Chaque instance peut avoir sa propre configuration.
---
## Difficultés rencontrées

Distinguer clairement printString et printOn: au début.

Comprendre pourquoi l’usage des variables globales pose problème.

Trouver des cas pratiques concrets pour appliquer la paramétrisatio
---
### Références

Cours : Advanced Object-Oriented Design – S. Ducasse, L. Fabresse, G. Polito, P. Tesone

Documentation officielle : pharo.org
