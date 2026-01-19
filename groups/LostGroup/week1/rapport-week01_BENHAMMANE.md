Mon rapport sur Pharo : collections et programmation orientée objet

En travaillant sur Pharo, j’ai découvert que les collections sont vraiment au cœur du langage. Pour moi, une collection, c’est juste un objet qui contient plusieurs éléments et qui permet de les manipuler facilement : on peut ajouter, supprimer, chercher ou transformer les éléments. J’ai trouvé ça super pratique, surtout pour organiser les données et les parcourir.

-- Les différents types de collections :

Array : taille fixe, accès rapide par index.

ArrayedCollection : taille dynamique, très pratique.

String : pour les chaînes de caractères.

Set : ensemble sans doublons.

Bag : accepte les doublons et compte les occurrences.

Dictionary : stocke des paires clé/valeur.

Exemple :

Set new add: 'a'; add: 'a'. "→ un seul 'a'"
Bag new add: 'a'; add: 'a'. "→ deux 'a'"
dict := Dictionary new.
dict at: 'nom' put: 'Amine'.
dict at: 'ville' put: 'Villeneuve-d’Ascq'.

-- Manipuler les collections :

Pharo utilise des messages pour travailler avec les collections :

do : exécute une action sur chaque élément.

collect : transforme les éléments et crée une nouvelle collection.

select : garde les éléments qui respectent une condition.

reject : supprime les éléments qui respectent une condition.

Exemple :

(1 to: 5) collect: [:n | n * 2] "→ #(2 4 6 8 10)"

-- Les conditionnelles :

En Pharo, les conditions sont des messages envoyés à des booléens :

ifTrue: → fait quelque chose si c’est vrai

ifFalse: → fait quelque chose si c’est faux

ifTrue:ifFalse: → choisit entre deux actions

Créer une classe

Créer une classe est simple :

Object subclass: #Dog
instanceVariableNames: 'name breed'
classVariableNames: ''
package: 'Animals'.

Exemple de méthodes :

name: aString
name := aString.

breed: aString
breed := aString.

-- Bonnes pratiques

Méthodes courtes.

Noms clairs pour les variables et méthodes.

CamelCase et méthodes en minuscule.

Éviter la duplication.

Commentaires seulement si nécessaire.
