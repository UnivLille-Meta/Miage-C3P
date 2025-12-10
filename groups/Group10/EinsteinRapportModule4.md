# Rapport – Module 4 : Reverse Engineering (ou ingénierie inverse)

## 1. Objectif du module
Ce module apprend à analyser et comprendre du code existant avant d’y apporter des modifications.
L’objectif est de se mettre dans la peau d’un développeur qui découvre un projet :

`comprendre le “pourquoi” du code avant de toucher au “comment”.`

Jai aussi revu les notions de méthodes de `classe` et de `super`, indispensables pour bien interpréter le comportement d’un programme en Pharo.

## 2. Principes du reverse engineering
- Observer avant de modifier : commencer par la structure générale, les dépendances et les usages.
- Savoir filtrer : se concentrer sur les éléments importants et ignorer les détails secondaires.
- Utiliser les bons outils :
   - System Browser pour explorer les classes,
   - Senders / Implementors pour suivre les appels,
   - Inspector / Debugger pour voir ce qui se passe à l’exécution,
   - DrTests pour vérifier le comportement par les tests.


 ## 3. Étude de cas : LRUCache
 ### 3.1 Compréhension du concept
Un LRU Cache (Least Recently Used) stocke des paires `clé/valeur` et supprime automatiquement l’élément le moins récemment utilisé quand il atteint sa capacité maximale.

Exemple :
```
primeFactorsCache := LRUCache new.
50 timesRepeat: [
	| n |
	n := 100 atRandom.
	primeFactorsCache at: n ifAbsentPut: [ n primeFactors ] ].
```
Ici, la méthode `at:ifAbsentPut:` ne calcule la valeur que si elle n’existe pas déjà dans le cache.

### 3.2 Analyse du code
Méthode principale :
```
LRUCache >> at: key ifAbsentPut: block
	self critical: [ | association |
		association := keyIndex
			associationAt: key
			ifAbsent: [ | value |
				value := block cull: key.
				keyIndex
					associationAt: key
					ifAbsent: [
						association := self newAssociationKey: key value: value.
						^ self handleMiss: association ] ].
		^ self handleHit: association ].
```

#### Lecture simplifiée :
- critical: sécurise l’accès concurrent.
- Si la clé existe ----> handleHit:.
- Sinon -----> handleMiss: crée la nouvelle entrée.
- Si la capacité est atteinte, handleMiss: appelle evict pour supprimer un ancien élément.

### 3.3 Ce que j’ai retenu
- LRUCache agit comme un dictionnaire amélioré.
- Il a une politique de remplacement LRU, une taille maximale, et une API simple `(at:ifAbsentPut:)`.
- Les détails internes comme la gestion de poids ou les statistiques peuvent être étudiés plus tard.

### 4. Rappel : méthodes de classe et super
### Méthodes de classe
Les classes étant aussi des objets, elles peuvent avoir leurs propres méthodes.
Elles servent souvent à créer ou configurer des instances.

Exemple :
```
Counter class >> withValue: anInteger
	^ self new
		value: anInteger;
		yourself.
```
Ici, `self` désigne la classe `Counter`.

### Comprendre super
super ne change pas le receveur, mais indique à Pharo de chercher la méthode dans la superclasse.

Exemple :
```
Die class >> new
	| inst |
	inst := super new.
	inst initialize.
	^ inst
```
`super new` appelle la méthode `new` de la superclasse,
mais le receveur reste `Die`.

## 5. Méthode de travail retenue
1. Commencer par lire les commentaires et les exemples.
2. Rechercher les méthodes clés (senders, implementors).
3. Observer le comportement avec l’inspecteur.
4. Relier le tout à la hiérarchie des classes et aux méthodes héritées.

## En résumé :
` Le reverse engineering, c’est “remonter” du code source vers la compréhension du design.
C’est l’étape qui précède toute modification sérieuse d’un logiciel :
on observe, analyse et comprend avant d’agir.`

## 6. Conclusion

Ce module montre qu’analyser du code, c’est :
- comprendre les intentions du concepteur,
- identifier les liens entre les classes,
- utiliser les outils Pharo pour naviguer efficacement.


`“Bien lire du code, c’est déjà bien programmer. C’est l’étape qui précède toute modification sérieuse d’un logiciel :
on observe, analyse et comprend avant d’agir.”`

