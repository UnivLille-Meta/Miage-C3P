# Rapport de la semaine 8- Composite -- Einstein

## 1. Définition
Le pattern `Composite` permet de représenter une structure en arbre (partie–tout).
Il permet de traiter de la même façon :
- un objet simple (Leaf)
- un ensemble d’objets (Composite)

Grâce au Composite, le client n’a pas besoin de faire des `if` pour savoir si l’objet est simple ou composé.
Tous répondent aux mêmes messages.

## 2. Pourquoi l’utiliser ?
Utile quand on a une structure comme :
- fichiers ---->> dossier
- document ---->> sections ---->> sous-sections

On veut appeler la même méthode sur tous les éléments (ex : draw),
sans vérifier le type.

## 3. Structure
- Component : définit l’API commune (`draw`, `add:…`).
- Leaf : objet simple, pas d’enfants.
- Composite : contient une collection d’enfants et leur envoie les messages.

## 4. Fonctionnement

Exemple :
```smalltalk
shape draw.
```

`shape` peut être :
- un cercle (Leaf)
- un groupe de formes (Composite)

Le client n’a pas besoin de savoir lequel.
Le Composite envoie `draw` à tous ses enfants.


## 5. Avantages
- API uniforme
- Pas de if / case
- Code simple et extensible
- Ajout d’un nouveau type sans modifier l’ancien code

## 6. Résumé final
Composite permet de gérer des objets individuels et des groupes d’objets avec la même interface,
grâce au polymorphisme.
Il simplifie le code, enlève les conditions inutiles et rend le système plus clair.


