## Rapport Week 1 Anas

## Ce que j'ai fait :

J'ai suivi le tutoriel interactif ProfStef go, me familiarisant avec la syntaxe de base de Pharo et l'utilisation du System Browser.

J'ai réalisé l'exercice "The Counter", ce qui m'a permis de créer une classe, d'implémenter des méthodes d'instance et de classe, ainsi que des tests unitaires.

J'ai utilisé Iceberg pour versionner mon code sur un dépôt distant.

J'ai utilisé une approche d'apprentissage guidé avec Gemini pour mieux appréhender la syntaxe et le concept de dispatch. Étant donné que j'assimile beaucoup plus rapidement les notions à travers des exemples concrets et en ciblant les concepts de manière interactive, j'ai notamment pu refaire les exemples de dispatch avec cet outil, ce qui m'a permis de comprendre comment la résolution des méthodes fonctionne.

## Ce que je n'ai pas fait :

Je n'ai pas eu le temps de réaliser les deux derniers exercices DSL et Country flag, faute de temps et en raison du temps d'adaptation initial nécessaire pour assimiler le paradigme du langage.

## Difficultés et comment je les ai surmontées :

Au début, j'ai été ralenti par les différences entre les anciennes syntaxes présentées dans le PDF et les nouvelles normes du langage. Je me suis appuyé sur l'apprentissage guidé pour faire le pont vers la syntaxe moderne.

# Rapport Week 1 Hajar

## What I did
- **ProfStef** : suivi du tutoriel interactif dans le Playground pour prendre en main la syntaxe et les messages.
- **Counter** : création de la classe `Counter` en TDD (méthodes `increment`, `decrement`, tests unitaires associés).
- **Dice (DSL)** : 
  - création des classes `Die` et `DieHandle` avec leurs tests (`roll`, `+`, `printOn:`).
  - extension de la classe `Integer` pour avoir la syntaxe `2 D20 + 3 D10`.
  - tous les tests sont au vert.

## What I did not
- **Country Flags** : pas encore fait, c'est la prochaine étape.

## Difficulties & Solutions
- **Gestion des extensions de classe** : l'UI de Pharo ne me laissait pas taper l'étoile `*Dice`. J'ai compris qu'il fallait utiliser le dossier `extensions` de Pharo pour rattacher les méthodes d'`Integer` au bon package.
- **Iceberg / Git** : un peu de confusion au départ entre le nom du repo local, `origin` et comment ajouter un deuxième package (`Dice`) dans le même dépôt, résolu via l'interface d'Iceberg.
