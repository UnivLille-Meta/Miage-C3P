# Rapport Week 4 Anas

---

## What I did

* **Lecture et Révisions"** : J'ai lu les cours de la semaine et révisé les concepts des modules précédents. J'ai eu un véritable "aha effect" concernant le Double Dispatch.
* **Exercice Chess Refactoring avec Null Object** : J'ai poussé l'intégration du pattern Null Object (`MyEmptyPiece`). J'ai nettoyé le code en remplaçant les vérifications `isNil` / `ifNotNil:` par un polymorphe propre (`isEmpty`, `isPiece`).
* **Mise à jour des classes clés** : J'ai refactoré plusieurs méthodes pour exploiter ce polymorphisme, notamment `MyKing >> opponentPieces`, `MyPlayer >> pieces`, ainsi que la gestion des clics dans `MySelectedState` et `MyUnselectedState`.

## What I did not

* **Gestion des cases Out of bounds** : Je n'ai **pas** touché aux vérifications `nil` qui concernent les limites du plateau. J'ai compris qu'il y a une différence fondamentale entre "l'absence d'une pièce" et "l'absence d'une case". Je garde ce deuxième problème pour un refactoring séparé (potentiellement un autre Null Object comme `MyOffBoardSquare`) afin de ne pas mélanger les responsabilités.

## Difficulties & Solutions

* **Distinguer les différents types de `nil**` : La plus grande difficulté a été d'inspecter les nombreuses classes du projet pour déterminer quelles vérifications `nil` je devais remplacer et lesquelles je devais ignorer. C'était confusant un peu de faire la différence entre les méthodes qui cherchaient une pièce et celles qui vérifiaient si une case était hors limites.
* **Solution** : J'ai dû analyser sémantiquement chaque bloc de code. Si la question sous-jacente était "Y a-t-il une pièce ici ?", je remplaçais par (`isPiece`). Si la question était "Cette coordonnée existe-t-elle sur le plateau ?", je laissais le `nil` intact.