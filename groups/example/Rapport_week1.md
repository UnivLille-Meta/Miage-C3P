# Rapport d'Apprentissage Pharo - Semaine 1

## Partie - Ilyas Ait Ali

### 1. Collections en Pharo et leurs itérateurs

**Qu'est-ce qu'une collection et à quoi sert-elle ?**

Une collection en Pharo est un objet qui permet de stocker et manipuler un groupe d'éléments. Elle sert à organiser des données de manière structurée pour faciliter leur traitement et leur accès.

**Types de collections dans la bibliothèque standard**

Pharo offre une variété de collections dans sa bibliothèque standard :

- **Array** : Collection statique de taille fixe avec accès indexé
- **OrderedCollection** : Collection dynamique permettant l'insertion/suppression facile
- **Set** : Collection d'éléments uniques sans ordre particulier
- **Dictionary** : Collection de paires clé-valeur avec clés uniques
- **SortedCollection** : Collection triée automatiquement

**Itérateurs disponibles pour parcourir les collections :**

- `do:` : Exécute un bloc pour chaque élément
- `collect:` : Transforme chaque élément et retourne une nouvelle collection
- `select:` : Filtre les éléments selon un critère
- `reject:` : Exclut les éléments selon un critère
- `detect:` : Trouve le premier élément satisfaisant une condition





### 2. Les conditionnelles en Pharo

Les conditionnelles en Pharo s'écrivent comme des messages envoyés aux objets booléens :



### 3. Création de Classes et Méthodes

J'ai créé une classe `MyCounter` pour comprendre le processus de création :

**Création de la classe :**



**Méthodes ajoutées :**


**Utilisation :**

```smalltalk
| counter |
counter := MyCounter new.
counter increment.
counter value "Retourne 1"
```

**Difficultés rencontrées**

- Adaptation à l'environnement
- Apprentissage des outils spécifiques (browser de classes, inspecteur, playground)
- Compréhension du système de packages

---

### 4. Style de Codage en Pharo

Les conventions incluent :

- **Noms significatifs** : Choix de noms simples et explicites
- **Variables privées** : En minuscules camelCase
- **Variables partagées** : En majuscules
- **Éviter les underscores** : Préférer camelCase pour les identifiants
- **Commentaires pertinents** : Pour expliquer le code complexe ou inhabituel
- **Alignement cohérent** : Indentation régulière

**Outils de détection des violations**

Pharo inclut des outils d'analyse statique comme :

- **RBScanner** : Détecte les violations de style
- **Lint** : Identifie les problèmes de qualité de code
- **Critics** : Signale les mauvaises pratiques

**Exemples de violations de règles**

_Mauvais style :_

```smalltalk
"Variable avec underscore et nom peu clair"
my_special_variable

"Trop de parenthèses inutiles"
^(self calculateTotal * (1 + (tax rate)))

"Méthode trop longue faisant plusieurs choses"
processData
    "20 lignes de code avec plusieurs responsabilités"
```






# REPORT  Partie Alli Rayane  
## Qu'est-ce qu'une collection et à quoi sert-elle ? Quels types de collections la bibliothèque standard de Pharo fournit-elle ? Comment itère-t-on sur les collections et quelles sont les différences entre elles ? Comment avez-vous trouvé ces informations ?

l existe deux grandes catégories de collections : les collections littérales (définies statiquement) et les collections dynamiques (modifiables à l'exécution). Une collection est un regroupement d'éléments, qui peuvent être de n'importe quel type d'objet.
Les index des collections commencent toujours à 1.

Les principaux types de collections sont :

OrderedCollection : Collection dynamique qui s'agrandit automatiquement lors de l'ajout d'éléments.
Array : Collection de taille fixe ; on accède aux éléments par leur indice.
Set : Collection sans doublons, non ordonnée.
Dictionary : Collection associative stockant des paires clé-valeur.

Les collections en Pharo partagent une API commune en 7 parties disctintes  :

Accès aux propriétés (ex : taille) / Tester (ex : savoir si la collection est vide ou non)/ Création des collections/Conversion/  Ajout d'éléments/Retrait d'éléments/ Énumération  

les informations proviennent de cette video : https://www.youtube.com/watch?v=RCEizZ5h6Dg


 ## Comment écrit-on des conditionnelles en Pharo ? Qu'est-ce qui est différent des autres langages de programmation ? Pouvez-vous réfléchir aux avantages et aux inconvénients de cette approche ? Comment avez-vous trouvé ces informations ?
En Pharo, les conditionnelles sont des messages envoyés à des objets booléens (true ou false). La syntaxe utilise des blocs de code (délimités par [ ]).
voila la definition d'une conditionnelle en pharo.

```
condition
  ifTrue: [ "code exécuté si condition est true" ]
  ifFalse: [ "code exécuté si condition est false" ].
```
les differences sont diverses avec les autres langages: 
1. Pas de mot-clé if : En Pharo, ifTrue: est un message envoyé à un booléen, non une structure de contrôle built-in.

2. Les booléens sont des objets : true et false sont des instances de True et False, qui implémentent ifTrue:ifFalse: différemment.

Évaluation paresseuse : Les blocs sont utilisés pour retarder l'exécution du code.

les infos proviennent du lien : https://pharo.org/documentation 

## Comment écrire un petit programme avec des classes et des méthodes dans Pharo ? Pharo est en effet très orienté IDE et il faut s'habituer à ses outils. Comment avez-vous trouvé cette information ?

J'ai dans un premier temps exploré les différentes catégories du browser avant de découvrir comment créer ma propre classe après celle de mon package. Après plusieurs échecs d'initialisation, j'ai enfin réussi à enregistrer ma classe en m'adaptant à la rigueur syntaxique (# et MAJUSCULE pour le nom de la classe, création des variables dans le slots, etc.). Une fois ma classe créée, j'ai pu expérimenter la création d'une instance en initialisant en premier lieu ma variable counter créée au préalable.

lien du TP Counter : 

## Les méthodes en Pharo sont généralement petites et lisibles. Quelles sont les règles communes à suivre ? Existe-t-il des outils qui montrent les violations de ces règles ?
Les methodes necessites notamment: 
1) d'etre des méthodes courtes 

2) Noms explicites pour les méthodes et variables

3) debut des methodes de test par "test....."

4) Responsabilité unique par méthode

Pharo intègre des outils d'analyse statique de code très puissants, dont le principal est le Critiqueur de Code. Son fonctionnement est simple il analyse un package, une classe ou une méthode, puis génère un rapport détaillant leur code smells et les violations de règles. Il propose souvent des refactorings automatiques pour les corriger directement depuis l'interface.

voila quelle que exemple de methodes ne respectant pas les regles: 
```

" Que fait 'x' ? Que signifie 'd' ? nommage imprecis"
x: aNumber d: anotherNumber
    ^ aNumber * anotherNumber * 3.14

```

```
" il s'agit ici de la duplication de code , a evitée au maximum"
addEmployee: aPerson
    (aPerson age < 18) ifTrue: [ self error: 'Trop jeune' ].
    (self employees includes: aPerson) ifTrue: [ self error: 'Déjà employé' ].
    ^ employees add: aPerson

addManager: aPerson
    (aPerson age < 18) ifTrue: [ self error: 'Trop jeune' ].
    (self managers includes: aPerson) ifTrue: [ self error: 'Déjà manager' ].
    ^ managers add: aPerson


```
## extras 
UN bloc de code anonyme s'apparente a une fonction lambda dans un autres langages, assez pratique quand on veut faire une fonction a une inconnu.
```
"Créer un bloc qui additionne deux nombres"
monBloc := [ :a :b | a + b ].
"L'exécuter"
resultat := monBloc value: 5 value: 3. " resultat = 8 "

```
Les cascades ou encore ';' permettent d envoyer plusieurs message au meme objet sans le repeter de maniere iteratifs.
```"Plus concis et lisible"
Transcript
    show: 'Hello';
    cr;
    show: 'World'.

```

Pour finir je n'ai pas eu besoin de posé des questions sur le channels car j'ai pu me renseigné un maximum via internet et mes camarades.
voici le lien de mon tp decouverte par ailleurs : https://github.com/MWB21223/Counter 
