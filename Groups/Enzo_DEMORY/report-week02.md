# Rapport
> DEMORY Enzo - groupe 2 M1 MIAGE

## Semaine 2 :

### Description générale :

Cette semaine, j'ai fini les exercices FlagCountry et DSL du module de préparation, j'ai également regardé les vidéos 1, 
2, 3 et 4 du module 3, ainsi que les vidéos sur self et super. Je me suis également entraîné sur le dispatch de message.
Je n'ai en revanche pas eu beaucoup de temps pour commencer Chess, j'ai juste commencé à essayer de comprendre le code 
existant.


### Ce que j'ai appris :

Grâce aux exercices du module de préparation, j'ai appris à mieux me servir de l'environnement de Pharo. À force de 
pratiquer, je suis aussi beaucoup plus à l'aise avec la syntaxe.


#### Exercice FlagCountry

L'exercice FlagCountry était un bon exercice pour commencer, car il montre une partie de ce qu'il est possible de faire 
avec Pharo. Je n'avais encore jamais manipulé de fichier XML, j'ai appris à le parser, puis à afficher les pays grâce à 
Roassal. J'ai ensuite amélioré l'inspecteur pour visualiser directement la liste des pays avec leur forme, ce qui était 
vraiment satisfaisant à voir.
Pour finir, j'ai également récupéré les drapeaux des pays et construit une petite interface (avec Spec) permettant de 
sélectionner un pays dans une liste déroulante pour afficher son drapeau.


#### Exercice DSL

J'ai beaucoup aimé faire cet exercice, il permet de créer un DSL (Domain-Specific Language) pour manipuler des dés. 
Cela passe par plusieurs classes, qui manipulent soit un dé à la fois (`Die`), soit une main de dés (`DieHandle`). J'ai 
travaillé en TDD, ce qui peut paraître un peu fastidieux au début, car il faut sans arrêt écrire des tests, mais qui 
devient très utile et satisfaisant une fois qu'on implémente la solution et qu'on voit tous les tests passer au vert. 
J'ai aussi appris à écrire des méthodes de classe, avec `withFaces:`, très utiles pour les constructeurs. Et j'ai 
découvert les extensions de classe, vraiment pratiques quand on veut ajouter une méthode à une classe déjà existante 
(ici `Integer`) tout en la sauvegardant dans un autre package pour qu'elle disparaisse automatiquement si ce package est
retiré, plutôt que d'encombrer `Integer` inutilement.


### Difficultés :

Je ne me suis pas confronté à de grosses difficultés. Seulement quelques petites choses auxquelles je n'étais pas 
habitué et qu'il fallait que j'apprenne, comme la méthode de classe `withFaces:`, où je ne comprenais pas comment passer 
du "côté instance" au "côté classe" pour la définir, j'essayais de la définir côté instance par erreur. Ou encore 
l'utilisation du protocole `*NameOfYourPackage` (donc ici `*Dice`), qui s'est finalement résolue en cherchant un peu 
dans les outils du logiciel.