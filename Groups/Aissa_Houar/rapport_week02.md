# Rapport -- Création d'un DSL pour les dés en Pharo

## 1. Objectif de l'exercice

L'objectif de cet exercice était de créer un petit DSL (_Domain Specific
Language_) permettant de manipuler des dés en Pharo avec une syntaxe
simple et expressive.

J'ai commencé par créer la classe `Die`, qui représente un dé, puis la
classe `DieHandle`, qui permet de manipuler plusieurs dés et de calculer
leurs résultats.

## 2. Réalisation

J'ai créé la classe `Die` avec un attribut `faces` pour définir le
nombre de faces du dé.

Ensuite, j'ai ajouté les méthodes nécessaires pour créer des dés et
simuler un lancer.

J'ai également créé la classe `DieHandle` pour gérer plusieurs dés,
notamment en les ajoutant et en calculant le nombre total de dés.

Pour rendre le DSL plus facile à utiliser, j'ai ajouté des méthodes
d'extension à la classe `Integer`, notamment :

```smalltalk
D: anInteger
    | handle |
    handle := DieHandle new.
    1 to: self do: [ :each |
        handle addDie: (Die withFaces: anInteger) ].
    ^ handle
```

Cela permet de créer plusieurs dés avec une syntaxe comme :

```smalltalk
2 D: 6
```

J'ai également ajouté des raccourcis comme `D4`, `D6`, `D10` et `D20`
pour faciliter la création des dés.

## 3. Difficultés rencontrées

J'ai rencontré quelques difficultés lors de l'implémentation, notamment
avec l'initialisation des dés et la définition de certaines méthodes.

J'ai aussi dû comprendre comment fonctionnent les extensions de classes
et comment utiliser les messages pour rendre la syntaxe plus naturelle.

J'ai résolu ces problèmes en testant progressivement les méthodes dans
Pharo et en corrigeant les erreurs rencontrées.

## 4. Ce que j'ai appris

Cet exercice m'a permis de mieux comprendre la programmation orientée
objet en Pharo, notamment l'envoi de messages, les extensions de classes
et la réutilisation du code.

J'ai également compris qu'un DSL permet de créer une syntaxe adaptée à
un domaine particulier, tout en utilisant les mécanismes existants du
langage.
