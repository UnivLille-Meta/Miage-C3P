# Weekly Report 01

## Glauriel

---

### Finish the exercises of the preparation

Link to the MyCounter repository : 

#### What I learnt through the exercice
The difference between super and self in oriented object programming, and how works lookup in both cases.
La syntaxe basique de pharo , creation des classes, des messages, des methodes de classes et d'instance.

#### Difficulties (resolved or not)

Les principales difficultées rencontrées etaient la prise en main du logiciel et de la syntaxe de base de Pharo. A cela peut s'ajouter la liaison entre mon depot github pour les exercices et mon dossier local. 
---

## Tien

### 1. Write small code examples challenging your knowledge about dispatch.

Essence of dispatch in Pharo is `self` and `super`.

#### Example of `self` :

- Class definition:
```
A >> foo
    ^ 10

A >> bar
    ^ self foo

B subclassOf: A
B >> foo
    ^ 50
```
- Execution:
```
aB := B new.
aB bar.
    ^ 50
```

#### Example of `super` :

- Class definition:
```
A >> foo
    ^ 10

B subclassOf: A
B >> foo
    ^ super foo

C subclassOf: B
C >> foo
    ^ super foo
```
- Execution:
```
aC := C new.
aC foo.
    ^ 10
```

---

### 2. Did the examples work as expected?

- Example 1: No, at first I thought `aB bar` would return `10`.
- Example 2: Yes, `aC foo` returns `10`.

---

### 3. What was different between expectation and reality?
- Expectation: I thought when we call `self` method, we will run the method in the class we are currently in: when `self foo` is in class A, it would call `foo` in class A so it would return `10` instead of `50`.
- Reality: `self` always represents the receiver of the message, and method lookup starts dynamically in the class of the receiver so `50`.

---

### 4. Correcting assumptions and how the information was found

#### Corrected Assumptions:
- `self` dispatch is dynamic: `self` always represents the receiver of the message, and method lookup starts dynamically in the class of the receiver.
- Sending a message is a two-step process:
    1. Look up the method matching the message
    2. Execute this method on the receiver

#### How this information was found:
All fundemental information about `self` in Pharo *Inheritance and Lookup: Self- (`M1-4-Essence-04-Self.pdf`) covers dynamic lookup starting at the receiver's class.


### Finish the exercises of the preparation

Finish the exercises that you should have done for the lecture preparation: See the ModulePreparation-01 folder

Link to the MyCounter repository : https://github.com/nttt1400/MyCounter

### Conclusion

#### What I learnt through the exercice

- how to create a class, add slots, write methods, instantiate objects, and write class comments.
- how to create a test class inheriting from TestCase, compile unit test methods, and verify results directly in the browser using SUnit.
- how each method is categozided
- why unit tests always belong on the instance side (for test isolation and inheriting assertions from TestCase).
- how to use Iceberg to track packages locally in Git, manage commits, and push source code to GitHub.
#### Difficulties (resolved or not)

- new syntax, new UI >> get used to Pharo 13 better by searching Internet, reading the documentation and exploring the environment.
- method categorization >> deciding the most appropriate protocol for each method
- Instance side vs. Class side: Distinguishing when behavior belongs to an instance (ex: increment) versus the class itself (ex: startingAt:) (still difficult).
- pushing code to GitHub: Resolved authentication issues by generating a GitHub Personal Access Token (classic with repo scope) instead of using an account password.



