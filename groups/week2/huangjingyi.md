

(1) Extension sur Integer : dés de jeu 


Code 

Integer >> D: aInteger
    | handle |
    handle := DieHandle new.
    1 to: self do: [ :i | handle addDie: (Die withFaces: aInteger) ].
    ^ handle

Integer >> D20
    ^ self D: 20

Prévision 
2 D20 devrait créer un handle contenant deux dés à 20 faces.


Résultat 
Effectivement, 2 D20 diceNumber retourne 2。



(2) Somme de handles 

Code 

DieHandleTest >> testSumming
    | handle |
    handle := 2 D20 + 3 D10.
    self assert: handle diceNumber equals: 5.

Prévision 
Le handle doit contenir 5 dés au total.


Résultat 
Le test passe, donc le résultat est correct.



(3) self et super 

Code 
Object subclass: #A
A >> hello
    ^ 'Hello from A'.

A subclass: #B
B >> hello
    ^ 'Hello from B'.

B >> callSuper
    ^ super hello.

Prévision 

(B new) hello → "Hello from B".

(B new) callSuper → "Hello from A".


Résultat 
C’est bien ce qui se passe.



(4) Identité d’objets 

Code 

a := Object new.
b := a.
c := Object new.

a == b. "true"
a == c. "false"

Prévision 
Seuls deux noms qui pointent sur le même objet donnent true.


Résultat 
Le test confirme cette idée.


(5) Dice handle avec D: — résultat inattendu 

Code 

Integer >> D: aInteger
    | handle |
    handle := DieHandle new.
    1 to: self do: [ :i | handle addDie: (Die withFaces: aInteger) ].
    ^ handle

test:

DieHandleTest >> testD1
    | handle |
    handle := 1 D: 6.
    self assert: handle diceNumber equals: 1.

Prévision 

Je pensais que 1 D: 6 allait retourner un handle avec un seul dé à 6 faces.

Résultat 
MessageNotUnderstood: SmallInteger>>D:。
En réalité, j’ai eu une erreur : MessageNotUnderstood: SmallInteger>>D:.

Pourquoi ? 

Parce que j’avais défini la méthode D: dans la classe DieHandle au lieu de l’extension de Integer, donc 1 D: 6 ne trouvait pas la méthode.

Réflexion 



Cette erreur m’a appris que :

Pour que la syntaxe 2 D20 marche, la méthode doit être sur Integer.

Elle doit être placée dans le protocole *Dice pour être sauvegardée correctement.


Comment ai-je appris ces notions ?

En expérimentant dans le Playground et en consultant la documentation des classes,et pour compléter le travail, j’ai aussi cherché des explications et des exemples sur Internet, ce qui m’a aidé à confirmer mes résultats et à corriger mes erreurs de compréhension.


