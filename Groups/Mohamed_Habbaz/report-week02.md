# Semaine 2 — Pharo


Cette semaine porte sur deux thèmes principaux :

* **Module 1 : Understanding Messages** — messages, dispatch, héritage, `self` et `super`.
* **Module 2 : Tests** — tests automatisés, TDD, XTDD et tests paramétrés.

---

# Module 1 — Understanding Messages

## M1-1 — Essence of Dispatch

En Pharo, les objets communiquent principalement en s'envoyant des messages. Le comportement dépend de la classe du récepteur.

```smalltalk
10 negated
```

Le message `negated` est envoyé à l'objet `10`, qui détermine le comportement à exécuter.

---

## M1-2 — Let the Receiver Decide

Le même message peut produire un comportement différent selon l'objet qui le reçoit.

```smalltalk
'Pharo' size
```

Ici, `size` est envoyé à une chaîne de caractères. Le récepteur détermine quelle méthode doit être exécutée.

**Idée principale :** le récepteur joue un rôle central dans le choix du comportement.

---

## M1-3 — Inheritance Basics

L'héritage permet à une classe de récupérer les comportements d'une autre classe.

```smalltalk
Object subclass: #Person
    instanceVariableNames: 'name'
    classVariableNames: ''
    package: 'Semaine2'.
```

Une sous-classe peut ensuite spécialiser ce comportement.

```smalltalk
Person subclass: #Student
    instanceVariableNames: 'level'
    classVariableNames: ''
    package: 'Semaine2'.
```

---

## M1-4 — Inheritance and Lookup

Lorsqu'un message est envoyé, Pharo cherche la méthode correspondante dans la classe du récepteur puis dans ses superclasses.

```smalltalk
student printString
```

La recherche commence dans la classe de `student` et remonte dans la hiérarchie si nécessaire.

`self` représente le récepteur courant :

```smalltalk
Person >> introduce
    ^ self name
```

---

## M1-5 — About `super`

`super` permet de réutiliser le comportement défini dans une superclasse.

```smalltalk
Person >> description
    ^ 'Person'

Student >> description
    ^ super description , ' - Student'
```

Ainsi, `Student` peut compléter le comportement hérité de `Person`.

---

## M1-6 — Reification and Delegation

La réification consiste à transformer un comportement ou un concept en objet manipulable.

La délégation permet quant à elle de confier une responsabilité à un autre objet.

```text
Objet principal
      |
      +--> Objet spécialisé
```

Cette approche permet d'éviter les classes trop complexes et facilite l'évolution du programme.

---

# Module 2 — Tests

## M2-1 — Test 101

Un test vérifie automatiquement qu'un comportement produit le résultat attendu.

Exemple :

```smalltalk
testAddition
    self assert: 3 + 5 equals: 8
```

Le test réussit si le résultat est bien `8`.

---

## M2-2 — Importance des tests

Les tests permettent de :

* détecter les erreurs ;
* vérifier les comportements ;
* éviter les régressions ;
* faciliter les modifications du code.

Un bon test doit être simple, clair et reproductible.

---

## M2-3 — Test-Driven Development

Le **TDD** consiste à développer en suivant le cycle :

```text
RED → GREEN → REFACTOR
```

1. Écrire un test qui échoue.
2. Écrire le code nécessaire pour le faire réussir.
3. Améliorer le code sans modifier son comportement.

Exemple :

```smalltalk
testMultiply
    self assert: 4 * 6 equals: 24
```

---

## M2-4 — Xtreme Test-Driven Development

L'**XTDD** utilise fortement les outils interactifs de Pharo.

Le développeur peut :

* lancer rapidement les tests ;
* utiliser le debugger ;
* inspecter les objets ;
* corriger directement le code ;
* relancer les tests.

Le debugger devient ainsi un outil d'exploration et de développement.

---

## M2-5 — Parameterized Tests

Les tests paramétrés permettent de tester plusieurs valeurs sans réécrire le même test.

Exemple :

```text
2 × 3 = 6
4 × 5 = 20
6 × 7 = 42
```

Le même scénario de test peut être réutilisé avec plusieurs paramètres.

---

# Bilan

Cette semaine m'a permis de mieux comprendre :

* l'envoi de messages ;
* le dispatch dynamique ;
* `self` et `super` ;
* l'héritage et la recherche de méthodes ;
* la délégation ;
* les tests automatisés ;
* le TDD et le XTDD ;
* les tests paramétrés.


