# Rapport d'apprentissage – Semaine 2 : Pharo

## Introduction

Cette semaine, j'ai continué à approfondir Pharo en abordant des notions plus avancées : les messages `super`, l'héritage, le pseudo-variable `yourself`, et la création de classes. J'en ai aussi profité pour mettre en pratique tout ça avec l'exercice du Counter, avant de me lancer un peu trop vite dans les corrections du chess game. Petite note avant de commencer : **la semaine dernière j'avais oublié de faire une Pull Request pour mon rapport, donc je le signale ici pour que ce soit clair, et j'ai maintenant un dépôt dédié que je mets à jour à chaque fois (lien à la fin du rapport).**

## Les classes et l'héritage

Après avoir compris la syntaxe de base des messages la semaine dernière, je me suis attaqué à la création de classes. J'ai appris comment définir une classe avec ses variables d'instance et ses méthodes, et surtout comment fonctionne l'héritage en Pharo. Une classe hérite des méthodes et du comportement de sa superclasse, ce qui permet de réutiliser du code sans avoir à tout réécrire.

C'est dans ce contexte que j'ai découvert le mot-clé `super`, et j'ai d'abord mal compris sa définition. En réalité, `super` représente le récepteur du message, exactement comme `self` — ce n'est pas un objet différent. Ce qui change, c'est uniquement l'endroit où commence la recherche de méthode (le "lookup") : avec `self`, la recherche commence dans la classe réelle de l'objet receveur, ce qui rend `self` dynamique (le comportement peut changer si on ajoute une sous-classe qui redéfinit la méthode). Avec `super`, la recherche commence dans la superclasse de la classe où se trouve le code contenant l'expression `super` — donc c'est statique, déterminé à la compilation, et pas dans la superclasse de la classe du récepteur comme j'aurais pu le croire au départ.

## Le pseudo-variable yourself

Une autre chose qui m'a pris du temps à assimiler, c'est `yourself`. Je l'ai croisé surtout dans les cascades de messages. Quand on veut que le résultat final de l'expression soit l'objet lui-même et pas le résultat du dernier message envoyé, on utilise `yourself` à la fin de la cascade. Ça m'a semblé un peu bizarre au début, mais avec quelques exemples concrets ça a fini par faire sens.

## Mise en pratique : l'exercice du Counter

J'ai fait l'exercice du Counter, qui consiste à créer une petite classe avec un compteur interne, des méthodes pour l'incrémenter, le décrémenter et le réinitialiser. Ça m'a permis de mettre en application directement ce que je venais d'apprendre sur les classes et les méthodes, et cette fois-ci je l'ai terminé sans trop de difficultés.

## Difficultés rencontrées

Après avoir fini le Counter, je suis parti directement corriger le chess game, en sautant les autres exercices intermédiaires. Avec le recul, je pense que c'était une erreur : le chess game est beaucoup plus complexe et fait intervenir plusieurs classes en interaction, donc j'étais un peu perdu par moments faute d'avoir suffisamment pratiqué sur des cas plus simples avant. Je pense que la semaine prochaine je vais reprendre les exercices que j'ai sautés pour consolider les bases avant de retourner sur des exercices plus poussés.

## Conclusion

Cette semaine m'a permis de mieux comprendre la logique de l'héritage en Pharo, ainsi que des notions plus subtiles comme `super` et `yourself`. L'exercice du Counter m'a confirmé que j'assimile bien les bases, mais mon passage un peu précipité vers le chess game m'a montré qu'il vaut mieux avancer progressivement. Je vais donc revenir sur les exercices intermédiaires avant de continuer.

Mon dépôt avec mes différents essais est disponible ici et sera mis à jour au fur et à mesure : [pharo-tries](https://github.com/mehdi-elouissi/pharo-tries)