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
