# Rapport d'apprentissage – Découverte de Pharo

## Introduction

Dans le cadre du cours, j'ai commencé à découvrir le langage Pharo. Comme c'est un langage assez différent de ce qu'on a vu jusqu'à maintenant, j'ai voulu prendre le temps de comprendre les bases avant d'aller plus loin. Ce rapport résume ce que j'ai appris pendant cette première semaine de découverte.

## Prise en main de l'environnement

La première chose qui m'a surpris avec Pharo, c'est qu'on ne travaille pas avec des fichiers comme d'habitude, mais avec une "image" qui garde tout en mémoire, y compris l'état du programme. J'ai utilisé le **Playground** pour écrire et exécuter des petits bouts de code directement, ce qui est très pratique pour tester des choses rapidement sans avoir besoin de créer une classe entière à chaque fois.

## La syntaxe de base

Ce qui m'a pris le plus de temps à comprendre, c'est la syntaxe des messages. En Pharo, presque tout fonctionne en envoyant des messages à des objets, et il y a trois types de messages :

- les **messages unaires**, comme `3 factorial` ou `'bonjour' size`, qui n'ont pas d'argument ;
- les **messages binaires**, comme `3 + 4` ou `2 * 5`, pour les opérations classiques ;
- les **messages avec mot-clé (keyword messages)**, comme `3 max: 7`, qui prennent un ou plusieurs arguments avec des mots-clés.

J'ai aussi appris qu'il n'y a pas vraiment de "types" comme en Java, tout est un objet, même les nombres. Et pour afficher un résultat dans le Playground, j'ai utilisé `Transcript show:` ou simplement `printNl` pour voir la valeur d'une expression.

## Difficultés rencontrées

Le plus difficile pour moi a été de changer ma façon de penser : en Pharo, il faut toujours se demander "à quel objet j'envoie quel message ?" plutôt que "quelle fonction j'appelle avec quels paramètres ?". Au début, j'ai fait quelques erreurs de syntaxe, surtout en oubliant le point à la fin des instructions ou en confondant les trois types de messages.

## Conclusion

Cette première découverte de Pharo m'a permis de comprendre les bases de la syntaxe et de la philosophie du langage, qui est très orienté objet, même plus que ce que j'avais vu avant. Je compte continuer à m'entraîner, notamment en créant mes propres classes et méthodes, pour aller plus loin dans les prochaines semaines.
