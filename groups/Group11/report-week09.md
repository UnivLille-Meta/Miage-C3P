# Obede

Cette semaine, j’ai révisé plusieurs notions essentielles en conception orientée objet avec Pharo :
la composition vs héritage, le pattern Composite, le pattern Visitor, la loi de Déméter et les règles de typage et polymorphisme.

⸻

✔️ Héritage vs Composition

"Exemple héritage"
Object subclass: #Dog
    instanceVariableNames: ''.

"Exemple composition"
Car >> initialize
    engine := Engine new.


⸻

✔️ Pattern Composite

Entry subclass: #File
    instanceVariableNames: 'size'.

Entry subclass: #Directory
    instanceVariableNames: 'children'.

Directory >> size
    ^ children sum: [ :c | c size ].


⸻

✔️ Pattern Visitor

Visitor >> visitFile: aFile.
Visitor >> visitDirectory: aDir.

File >> accept: v
    v visitFile: self.

Directory >> accept: v
    v visitDirectory: self.


⸻

✔️ Loi de Déméter

"❌ Mauvais : trop de navigation"
customer wallet money.

"✔️ Correct : on délègue"
customer pay: 10.



⸻

✔️ Typage & Polymorphisme

animal := Dog new.  "type dynamique"
animal makeSound.   "liaison dynamique"

# Adil 

J'ai essayé d'avancer sur le projet mais je bloque enormément sur la partie UI (Kata samegame display selection and killedboxestotal). Mes labels et la grille du jeu se superposent, s'affiche mal quasi 90% du jeu est blanc donc je vais devoir revoir ça en espérant pouvoir résoudre cela malgré tout le temps passé. 

J'ai et je révise pour le DS :

## 1. Beaucoup de design patterns

J’ai vu plusieurs design patterns de manière générique, sans forcément beaucoup les exercer.

## 2. Pattern Composite

* Structure en arbre
* Un composite contient d’autres éléments
* Une feuille ne contient rien

## 3. Pattern Visitor

* Ajout d’opérations sans modifier les classes
* Usage de `accept:` / `visitX:`

## 4. Loi de Déméter

* Ne pas chaîner les appels
* Envoyer des messages uniquement à ses objets directs

## 5. Typage et polymorphisme

* Typage dynamique en Pharo Souclassage / Soutypage
* Polymorphisme par envoi de message
* Méthode choisie à l’exécution selon l’objet réel

## 7. Héritage vs Composition 
* **Héritage** : un objet hérite du comportement et des variables d’instance de sa superclasse.
* **Composition** : un objet contient un autre objet pour réutiliser son comportement sans hériter.
