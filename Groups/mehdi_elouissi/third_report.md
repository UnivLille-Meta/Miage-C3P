# Rapport d'apprentissage – Semaine 3 : Double dispatch et design patterns

## Introduction

Cette semaine a été un peu différente des précédentes. J'ai moins codé que d'habitude et j'ai passé plus de temps à lire les slides du cours sur les concepts de conception : le double dispatch, le TDD, Hooks and Template, le Singleton et le Decorator. Côté pratique, j'ai quand même terminé l'exercice Stone Paper Scissors avec ses tests, et j'ai commencé à travailler sur le chess game.

## Stone Paper Scissors et le double dispatch

Comme je l'avais dit la semaine dernière, je suis revenu sur les exercices que j'avais sautés, et j'ai commencé par Stone Paper Scissors. Ma première idée était de comparer les classes avec des conditions (`if` la classe est Stone alors...), mais le but de l'exercice est justement de ne pas utiliser de conditions du tout.

Le principe du double dispatch, c'est d'envoyer un premier message à un objet, qui renvoie ensuite un deuxième message à l'autre objet en précisant qui il est. Par exemple :

    Stone >> vs: anElement
        ^ anElement playAgainstStone

    Paper >> playAgainstStone
        ^ #paper

Donc quand j'écris `Stone new vs: Paper new`, la pierre dit à la feuille "tu joues contre une pierre", et c'est la feuille qui connaît la réponse. Il n'y a aucun test de type, c'est la recherche de méthode de Pharo qui fait tout le travail. J'ai trouvé ça assez élégant une fois compris, même si au début j'avais du mal à suivre qui envoie quoi à qui.

J'ai aussi écrit les tests avec SUnit pour vérifier tous les cas, par exemple :

    testPaperBeatsStone
        self assert: (Stone new vs: Paper new) equals: #paper

Tous les tests passent, donc je considère l'exercice comme terminé.

## TDD et Xtreme TDD

J'avais déjà entendu parler du TDD : on écrit le test d'abord, il échoue, puis on écrit juste assez de code pour qu'il passe, et ensuite on refactore. Ce qui est nouveau pour moi, c'est l'Xtreme TDD version Pharo. On écrit le test, on le lance, et quand une méthode n'existe pas encore, le débogueur s'ouvre. Directement depuis le débogueur on peut créer la méthode manquante, l'écrire, et continuer l'exécution sans tout relancer. Au final on code presque entièrement dans le débogueur, ce qui est très différent de ce que je fais d'habitude en Java.

## Hooks and Template

Ce principe m'a permis de comprendre un truc que j'utilisais déjà sans le savoir. Une méthode "template" définit les étapes générales d'un comportement dans la superclasse, et elle appelle des méthodes "hook" que les sous-classes peuvent redéfinir. L'exemple le plus simple est `printString`, qui appelle `printOn:`. Si je veux changer l'affichage d'un de mes objets, je redéfinis seulement `printOn:` dans ma classe, et `printString` continue à marcher sans que j'y touche.

## Singleton

Le Singleton sert à garantir qu'une classe n'a qu'une seule instance disponible **at the any time** . En Pharo, on le fait avec une variable côté classe et une méthode qui crée l'instance seulement si elle n'existe pas encore :

    MyConfig class >> default
        ^ uniqueInstance ifNil: [ uniqueInstance := self basiqueNew initialize ]

Par contre, j'ai retenu qu'il ne faut pas en abuser, parce que ça revient un peu à créer une variable globale, et ça rend les tests plus compliqués.

## Decorator

C'est le pattern qui m'a le plus intéressé. Pour l'expliquer simplement, j'ai pris l'exemple d'une boisson. Si j'ai une classe `Coffee` et que je veux ajouter du lait ou du sucre, avec l'héritage seulement je devrais créer `CoffeeWithMilk`, `CoffeeWithSugar`, `CoffeeWithMilkAndSugar`... et le nombre de classes explose très vite.

Avec le Decorator, on crée un décorateur qui contient une boisson et qui ajoute son comportement par-dessus :

    Coffee >> cost
        ^ 2

    WithMilk >> cost
        ^ beverage cost + 0.5

    WithSugar >> cost
        ^ beverage cost + 0.2

Et on peut les combiner comme on veut au moment de l'exécution :

    (WithSugar on: (WithMilk on: Coffee new)) cost   "donne 2.7"

Ce que j'ai compris, c'est que le Decorator ne remplace pas l'héritage, il l'utilise autrement. `Coffee` et les décorateurs héritent tous de la même classe abstraite `Beverage`, donc un café décoré reste une boisson et on peut l'utiliser partout où on attend une boisson. L'héritage sert à garder la même interface, et la composition sert à ajouter des comportements.

## Début du chess game

J'ai aussi commencé à travailler sur le chess game. Pour l'instant, j'ai surtout lu le code existant pour comprendre comment les classes sont organisées et comment elles communiquent entre elles. Je n'ai pas encore beaucoup avancé dessus, mais cette fois je me sens mieux préparé qu'avant, grâce aux exercices et aux notions de conception que j'ai vues cette semaine.

## Difficultés rencontrées

Le double dispatch m'a demandé un peu de temps, surtout pour suivre l'ordre des messages entre les deux objets. J'ai aussi fait quelques erreurs dans le System Browser en mettant des méthodes côté classe au lieu du côté instance, ce qui m'a fait perdre du temps avant de comprendre d'où venait le problème. Enfin, lire beaucoup de théorie sans coder en parallèle, c'est parfois difficile à retenir. Je pense qu'il faudra que j'applique ces patterns dans du vrai code pour vraiment les maîtriser.

## Conclusion

Cette semaine m'a permis de prendre un peu de recul sur la façon de concevoir du code orienté objet, et pas seulement sur la syntaxe de Pharo. Le double dispatch et le Decorator sont les deux notions qui m'ont le plus marqué, parce qu'ils montrent qu'on peut éviter beaucoup de conditions et de duplication en utilisant bien les objets. La semaine prochaine, je compte avancer sur le chess game en essayant d'appliquer ce que j'ai appris.

Mon dépôt est toujours disponible ici : [pharo-tries](https://github.com/mehdi-elouissi/pharo-tries)