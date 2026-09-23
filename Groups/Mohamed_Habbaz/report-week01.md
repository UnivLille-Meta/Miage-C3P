# Rapport d'activité — Semaine 01

**Étudiant :** Mohamed Habbaz  
**Cours :** C3P (Conception et Programmation Orientée Objet Avancée)  
**Environnement :** Windows | Pharo 13 (Stable)  

---

## 1. Installation et Prise en Main de l'Environnement

* **Installation de Pharo Launcher** sur mon poste de travail sous Linux Aurora.
* **Création et lancement** d'une image **Pharo 13 stable**.
* **Exploration de l'interface graphique** :
  * Prise en main du **System Browser** pour la navigation dans les packages, classes, protocoles et méthodes.
  * Utilisation du **Playground** pour l'exécution directe de snippets de code (`Do it`, `Print it`, `Inspect`).

---

## 2. Étude du Module de Préparation (ModulePreparation-01)

Suivi des vidéos théoriques sur la chaîne YouTube officielle Pharo et expérimentation simultanée dans l'environnement Pharo 13.

### Core Elements (Les fondamentaux du langage)
* **M0-1 — Pharo Object Model in a Nutshell** : Compréhension du modèle "tout est objet" et de l'exécution basée uniquement sur l'envoi de messages.
* **M0-2 — Pharo Syntax in a Nutshell** : Apprentissage de la syntaxe minimale de Pharo (absence de mots-clés réservés pour le contrôle de flux).
* **M0-3 — Class and Method Definitions** : Création de classes, de variables d'instance et de méthodes au sein du System Browser.
* **M0-4 — Understanding Messages** : Différenciation des trois types de messages (unaires, binaires, à mots-clés).
* **M0-5 — Messages for Java Programmers** : Analogie et comparaison entre la syntaxe Pharo et la syntaxe Java.
* **M0-6 — Messages: Composition and Precedence** : Règle de priorité des messages (Unaire > Binaire > Mots-clés) et évaluation stricte de gauche à droite à priorité égale.
* **M0-7 — Understanding Messages: Sequence and Cascade** : Utilisation du point (`.`) pour la séquence d'instructions et du point-virgule (`;`) pour la cascade vers un même récepteur.
* **M0-8 — Introduction to Blocks** : Manipulation des blocs anonymes `[...]` et exécution différée via le message `value`.

### Extras (Concepts avancés et idiomes)
* **M0-9 — Loops** : Implémentation des structures répétitives (`timesRepeat:`, `whileTrue:`) transmises sous forme de messages à des objets ou des blocs.
* **M0-10 — Yourself** : Utilisation de l'idiome `yourself` à la fin d'une cascade de messages pour retourner l'objet initial.
* **M0-11 — Class methods** : Définition et rôle des méthodes de classe (côté métaclasse).
* **M0-12 — Parenthesis Vs Square Brackets** : Distinction clé entre les parenthèses `(...)` pour la priorité d'évaluation et les crochets `[...]` pour la création de fermetures (closures).
* **M0-12 — Iterators** : Utilisation des itérateurs standards sur collections (`do:`, `collect:`, `select:`, `reject:`).

---

## 3. Synthèse des Acquis

* Pratique active de la syntaxe Pharo directement dans l'image.
* Assimilation des règles de priorité des messages et de la manipulation des blocs d'instructions.
* Capacité à créer et naviguer dans les packages via le System Browser.