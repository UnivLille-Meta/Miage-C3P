- KENGLE NKOUAMEN Pierrette Cahty
        Les collections en Pharo et leurs itérateurs

            Une collection en Pharo est un objet qui regroupe d’autres objets. Elle sert à stocker, organiser et manipuler des ensembles de données.

            Types de collections fournies par la bibliothèque standard :

                OrderedCollection : liste dynamique (ajout/suppression flexible).
                Array : taille fixe, accès rapide par index.
                Set : ensemble sans doublons.
                Dictionary : associations clé → valeur.
                SortedCollection : collection triée automatiquement selon un critère.

            En Pharo, l’itération se fait par envoi de messages.
            
                Différence principale :

                do: exécute une action (effet de bord).
                collect: transforme la collection.
                select: filtre selon une condition.

        Les conditionnels en Pharo

            Pharo n’a pas de mot-clé if comme en Java ou Python. Ce sont les booléens eux-mêmes qui reçoivent les messages ifTrue: ou ifTrue:ifFalse:.        

            Différence avec d’autres langages :

            Ici, le booléen est un objet qui sait quoi faire quand on lui envoie ifTrue:.
            On n’évalue pas une “structure de contrôle” mais on envoie un message.

            Avantages :
                - Plus orienté objet.
                - Plus flexible (on peut redéfinir des comportements).

            Inconvénients :
                - Déconcertant pour les débutants.
                - Peut sembler verbeux par rapport à if ... else.

        Création de classes et méthodes

            Classe Simple:
                Object subclass: Person
                instanceVariableNames: 'name age'
                classVariableNames: ''
                package: 'MyApp'.
            
            Méthodes :
                Person >> name
                ^ name

                Person >> name: aName
                name := aName

                Person >> age
                ^ age

                Person >> age: anAge
                age := anAge
        

            Exemple de programme simple

                p := Person new.
                p name: 'Alice'; age: 25.
                Transcript show: p name , ' a ' , p age printString , ' ans.'; cr.
        

            Problèmes rencontrés :

            Au début, j’avais du mal à comprendre que la définition des classes se fait via l’IDE (System Browser) et non dans un fichier source classique.
            J’ai dû m’habituer à la navigation dans l'IDE.

        Style de code Pharo

            Règles courantes :
                Méthodes courtes (une dizaine de lignes maximum).
                Noms de méthodes clairs, souvent verbe + complément (addPerson:, findByName:).
                Classes regroupées en packages bien nommés.
                Eviter les variables temporaires inutiles.

            Outils de style :
                Pharo fournit un Critic Browser qui signale les violations des règles de style.

        Extras – Cascades et Block Closures

            Cascades (;)
                Permettent d’envoyer plusieurs messages au même objet sans répéter son nom :
                Exemple:
                    p := Person new
                    name: 'Alice';
                    age: 25;
                    yourself.

            Block closures ([ ])
                Ce sont des fonctions anonymes. Utilisées pour :
                    - Itérations (do:, collect:, …)
                    - Conditionnels (ifTrue: [ ... ])
                Exemple:
                    factorial := [ :n | 
                    n = 0 ifTrue: [ 1 ] ifFalse: [ n  (factorial value: n - 1) ] ].

                    Transcript show: (factorial value: 5) printString; cr.
    



# Kanto Rasoanaivo
# Learn about collections in Pharo and their iterators

Une **collection** est une **classe abstraite** utilisée pour gérer des objets.  
Elles permettent d'effectuer des opérations comme **ajouter**, **supprimer** ou **accéder** aux éléments.  

**Note :** Toutes les itérations commencent à **l’index 1**.

## Types de collections utilisées

- **Array** : taille **fixe**, accès direct à un élément avec  
  `at:` ou `at:put:` (pour remplacer).  
  Création : `Array new:`  
- **OrderedCollection** *(ordonné)* : peut **croître ou diminuer** en taille, tout en **maintenant l'ordre d'insertion**.  
- **Set** *(non ordonné)* : peut croître en taille.  
- **Dictionary** : structure **clé-valeur**.

## Itérations

### `do:`
Exécute un bloc de code pour chaque élément d'une collection, en passant chaque élément comme argument au bloc.

```smalltalk
#(1 2 3 4 5) do: [ :each | Transcript show: each; cr ].
```

---

### `collect:`
Applique un bloc de code à chaque élément et renvoie une **nouvelle collection** avec les résultats.

```smalltalk
| result |
result := #(1 2 3 4 5) collect: [ :each | each * 2 ].
"Prints #(2 4 6 8 10)"
```

---

### `select:`
Filtre les éléments d'une collection en fonction d’un bloc de code, et renvoie une **nouvelle collection** contenant uniquement ceux pour lesquels le bloc retourne `true`.

```smalltalk
| result |
result := #(1 2 3 4 5) select: [ :each | each even ].
"Prints #(2 4)"
```

> Les informations viennent du **MOOC** (vidéo).

---

# ⚙️ Learn about conditionals in Pharo

### Exemple :

```smalltalk
self = 0 ifTrue: [ ^1 ].
self > 0 ifTrue: [ ^self * (self - 1) factorial ].
self error: 'Not valid'.
```

Pharo **n’utilise pas** de structures `if` / `else` classiques comme dans d’autres langages,  
mais les remplace par des **blocs**.

**Avantages :** facile à retenir, court et flexible.

---

# Learn how to create classes and methods

Dans l’**IDE**, on peut créer des **packages** et directement les **classes** à l'intérieur.

### Étapes :
1. Créer ou sélectionner un package.  
2. Ouvrir le **System Browser**.  
3. Choisir un package existant ou cliquer sur **New Package** pour en créer un nouveau.  
4. Créer une **nouvelle classe** :  
   - Cliquer sur **New Class**.  
   - Donner un **nom** à la classe.  
   - Définir la **superclasse** (par défaut : `Object`).  
   - Définir les **variables d’instance**.  
   - Ajouter des **méthodes** à la classe.  

🔗 [Lien vers le projet GitHub : MyCounter-C3P] https://github.com/rasoanaivokanto-prog/MyCounter-C3P/tree/main/src/MyFirstPackage

---

# Learn about the basic Pharo coding style

- Les **méthodes** : en *lowercase*  
- Les **classes** : en *Uppercase*

---

## Cascades

Permet d’**éviter la répétition** de l’objet cible :

```smalltalk
| c | 
c := OrderedCollection new. 
c add: 1. 
c add: 2.
```

Équivaut à :

```smalltalk
| c | 
OrderedCollection new 
    add: 1; 
    add: 2.
```

> Utiliser le point-virgule `;` pour **enchaîner plusieurs messages** au même objet.

