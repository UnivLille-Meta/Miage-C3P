# Rapport – Module 2 :Tests et qualité du Code (Einstein)


L’objectif est de comprendre pourquoi et comment tester efficacement, à travers plusieurs approches :
- les tests unitaires,
- le développement piloté par les tests (TDD),
- et les tests paramétrés.

Avant tout, il est important de rappeler la philosophie du kata en programmation :
Un kata est un petit exercice de codage répété pour s’améliorer, affiner sa technique 
et automatiser les bons réflexes de conception orientée objet.

### 1. Test 101- Les bases
##### Objectif : 
Comprendre ce qu’est un test unitaire et son role.

##### Principes essentiels :
Les tests sont une assurance vie du système ce qui veut dire qu'ils garantissent que les changements n’introduisent pas de régressions.
Un test unitaire automatise la vérification d’un comportement précis d’une classe.

Un bon test suit trois étapes :
- Contexte (setup) : création de l’état initial.
- Stimulus (action) : exécution d’une méthode.
- Vérification (assertion) : comparaison du résultat attendu et obtenu.
### Exemple :
```
TestCase subclass: #SetTest.

SetTest >> testAdd
	| empty |
	empty := Set new.
	empty add: 7.
	empty add: 7.
	self assert: empty size equals: 1.
  ```
Ce test vérifie que l’ajout d’un élément dupliqué dans un `Set`  ne modifie pas sa taille.

## 2. Pourquoi tester ?
### Raisons principales :
- Les tests augmentent la confiance dans le système.
- Ils facilitent les changements sans crainte de casser le code.
- Ils servent de documentation exécutable, etre toujours à jour.
- Ils aident à comprendre le code sans en connaître les détails internes.

### Bonnes pratiques :
- Un test doit être automatisé, déterministe, simple et isolé.
- Il faut écrire à la fois des tests qui fonctionnement normalement et ceux en cas d’erreur.
- Toujours écrire un test avant de corriger un bug.

##3. Test-Driven Development (TDD)
Principe du TDD : “Écris le test avant le code.”

Le cycle TDD suit la règle des trois étapes :

  1. Red : écrire un test qui échoue.

  2. Green : écrire le code minimal pour le faire passer.

  3. Refactor : améliorer le code sans casser le test.

Exemple :
```
CounterTest >> testCount
	| c |
	c := Counter new.
	c count: 10.
	self assert: c count equals: 10.
```
Le test échoue parce que la méthode `count`: n’existe pas.
Ensuite, on la crée dans `Counter` :
```
Counter >> count: aNumber
	count := aNumber.
```
Puis le test devient vert (réussi).

## 4. Xtreme Test-Driven Development (XTDD)

### Concept :
Le XTDD est une version “accélérée” du TDD. Il consiste à coder directement dans le débogueur :
Quand un test échoue, Pharo ouvre le debugger,l e développeur définit la méthode manquante à la volée,
puis relance le test jusqu’à ce qu’il soit vert.

### Avantages :
- Flux de travail fluide, sans quitter le contexte du test.
- Meilleure compréhension de l’état de l’objet au moment de l’erreur.
- Productivité accrue.

### Exemple de scénario :
  1. Exécution du test `CounterTest >> testIncrement`.
  2. Pharo signale une méthode manquante, on la crée depuis le debugger :
```
Counter >> increment
    count := count + 1.
```
  3. Reprise du test ----> vert ----> commit.
  XTDD = “Coder, tester et corriger sans jamais sortir du flux.”

## 5. Tests paramétrés
### Problème :Comment éviter de dupliquer la logique de test pour différents jeux de valeurs ?

### Solution:Utiliser les tests paramétrés avec ParametrizedTestCase.

### Exemple :
```
ParametrizedTestCase subclass: #MyDullTest
	slots: { #numberTest1 . #numberTest2 . #resultTest }.

MyDullTest >> testSumTest
	self assert: numberTest1 + numberTest2 equals: resultTest.
```

Déclaration des paramètres :
```
MyDullTest class >> testParameters
	^ ParametrizedTestMatrix new
		addCase: { #numberTest1 -> 2. #numberTest2 -> 1. #resultTest -> 3 };
		addCase: { #numberTest1 -> (2/3). #numberTest2 -> (1/3). #resultTest -> 1 };
		yourself.
```
### Résultat :
Le même test est exécuté plusieurs fois avec différentes valeurs. Cela améliore la couverture sans dupliquer le code.

## 6. Conclusion
Les tests constituent le cœur de la qualité logicielle dans Pharo :
- Ils servent de garantie contre les régressions.
- Ils facilitent la compréhension, la maintenance et la refactorisation.
- Le TDD et XTDD favorisent un développement guidé par le comportement attendu.
- Les tests paramétrés permettent de maximiser la couverture tout en évitant la redondance.

### “Les tests ne garantissent pas qu’un système ne cassera jamais,
### mais ils montrent immédiatement ce qui a cassé.” — Stéphane Ducasse
