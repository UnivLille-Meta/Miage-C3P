Rapport de Travaux Pratiques en Pharo : CATHY KENGLE

    TP 1 – Jeu de dés

        Création de la classe Die (hérite de Object) avec :

        initialize (faces par défaut = 6)

        faces, faces:, roll (utilise atRandom de Number).

        Classe DieHandle avec :

        initialize (stocke les dés dans un OrderedCollection).

        addDie:, diceNumber, roll, et surcharge de l’opérateur +.

        Extensions d’Integer pour écrire un DSL (D6, D20, D:).

        Tests unitaires (TestCase) pour valider Die et DieHandle.

      Utilisation de : OrderedCollection, atRandom, opérateurs comme messages (+), et TDD avec TestCase.

    TP 2 – Affichage de drapeaux

        Classe EarthCountryBrowser (hérite de SpPresenterWithModel) avec :

        initializePresenters, defaultLayout, connectPresenters.

        Presenters utilisés : SpDropListPresenter, SpTextInputPresenter, SpImagePresenter.

        Fonction flagForCountryCode: :

        Téléchargement via ZnClient (get:).

        Conversion PNG → Form avec ImageReadWriter formFromStream:.

        Fallback avec (BorderedMorph new extent: 80@50) asForm.

        Méthode onCountrySelected: : met à jour le drapeau (flagPresenter image:) et la forme SVG (RSCanvas, asRSShape).

     Utilisation de : Spec2 (UI), Zinc HTTP Components (ZnClient), Roassal (RSCanvas) et ImageReadWriter.

        Conclusion

        Ces TPs m’ont permis de manipuler :

        Collections, opérateurs et extensions de classes (DSL avec Integer).

        Spec2 pour construire une interface (DropList, Image, Layouts).

        Zinc pour les requêtes HTTP.

        Roassal pour afficher les formes SVG.

        ImageReadWriter pour transformer des octets PNG en Form.

    👉 Codes disponibles :

    Drapeaux : https://github.com/PierretteKengle/TPFlagCathy/tree/master/FlagCathy 

    Jeu de dés : https://github.com/PierretteKengle/DIcePharo 

## Kanto Rasoanaivo

## DISPATCH
Le dispatch désigne la manière dont un objet décide de quelle méthode exécuter en réponse à un message reçu. 

Exemple basique avec une méthode `introduce` :

```smalltalk
describeAge: age
    ^ 'Je suis âgé de ', age asString, ' ans'.
```

Appel :

```smalltalk
| personne |
personne := Humain new.
personne describeAge: 20.
```

**Résultat :**
```
Je suis âgé de 20 ans
```

---

## INHERITANCE
L'héritage est un mécanisme de réutilisation et d'extension du code, permettant aux sous-classes d'ajouter ou de spécialiser des comportements et des états.  
Pharo prend en charge l'héritage simple, où :
- la recherche de comportement est **dynamique**,
- l'héritage d'état est **statique**.  

Cela garantit des conceptions modulaires et flexibles.

```smalltalk
Animal >> initializeWithName: aName
    name := aName.

Animal >> speak
    ^ 'An animal makes a sound.'

Animal >> description
    ^ 'I am ', name.
```

### Subclass: Dog
```smalltalk
Animal subclass: #Dog
    instanceVariableNames: ''

Dog >> speak
    ^ 'Woof!'
```

### Subclass: Cat
```smalltalk
Animal subclass: #Cat
    instanceVariableNames: ''

Cat >> speak
    ^ 'Meow!'
```

### Usage
```smalltalk
dog := Dog new initializeWithName: 'Buddy'.
cat := Cat new initializeWithName: 'Minou'.

dog description.  "→ 'I am Buddy.'"
dog speak.        "→ 'Woof!'"

cat description.  "→ 'I am Minou.'"
cat speak.        "→ 'Meow!'"
```

---

## SELF
Le mot-clé **self** représente le destinataire du message actuel.  
Lors de l'exécution d'une méthode, `self` garantit que la recherche démarre dans la **classe du destinataire**, même si la méthode provient d'une superclasse.  
La recherche parcourt dynamiquement la hiérarchie des classes jusqu'à trouver la méthode.

```smalltalk
A >> foo
    ^ 10

A >> bar
    ^ self foo

B >> foo
    ^ 50
```

### Usage
```smalltalk
aA := A new.
aB := B new.

aA bar.  "→ 10"
aB bar.  "→ 50"
```

---

## Note perso
À la dernière séance, j’ai fait l’exercice sur le **dice**.  
🔗 Le lien : https://github.com/rasoanaivokanto-prog/MyCounter-C3P/tree/main/src/Dice
