# Semaine 1
Loisel Noé

Lors de ce premier contact avec Pharo, j'ai pris conscience que l'objectif n'était pas d'apprendre un énième langage, mais d'assimiler les principes fondamentaux de la POO et des Design Patterns applicables à tous les langages. Après avoir parcouru le tutoriel interactif ProfStef, j'ai décidé de faire l'exercice du Counter puis de le refaire chez moi (incrémentation et décrémentation) de zéro.

Je n'ai pas abordé l'exercice sur le DSL. J'ai préféré me concentrer sur l'assimilation des bases de la navigation dans l'interface de Pharo ainsi que me familiariser avec le langage.

Je me suis efforcé d'utiliser le debugger afin de réaliser mes méthodes pour prendre l'habitude d'utiliser plus l'outil. J'ai fait face aux problèmes suivants :
J'ai passé la plupart de mes premiers essais à chercher la cause de mes erreurs de syntaxe, qui étaient dues à un énième oubli du point pour séparer mes lignes.
J'ai compris l'importance de compiler chacune de mes modifications dans l'outil. Sans cela, le débugger ne prenait pas en compte le nouveau code et me refusait le bouton "proceed". J'ai ensuite réalisé le TP Country Flag en suivant le PDF.



# Semaine 2

Cette semaine, j'ai terminé de regarder toutes les vidéos du MOOC sur les modules 0, 1 et 3 (hors bonus du module 0) et j'ai réalisé l'exercice sur le DSL (les dés). Je comprends maintenant bien mieux la structure de Pharo et cela me permettra de me concentrer pleinement sur les concepts de design patterns. J'ai également commencé à jeter un œil au projet.

Dans mes manipulations, j'ai continué à utiliser le débugger pour valider mes méthodes et j'ai bien intégré le réflexe de compiler chaque modification avant de poursuivre.

En étudiant les mécanismes de messages, j'ai compris que le dispatch correspond à la façon dont Pharo choisit dynamiquement quelle méthode exécuter au moment où on envoie un message (comme dit dans le cours, la méthode à exécuter est choisie par la classe du récepteur).

Au début, je m'attendais à ce que l'appel d'une méthode utilise directement le code écrit dans la classe parente. En réalité, grâce au mécanisme de recherche (lookup), c'est le récepteur à l'exécution qui prime : si une sous-classe a redéfini la méthode appelée via self, c'est sa version à elle qui s'exécute automatiquement. J'ai pu corriger cette vision en testant directement le code et en le suivant pas à pas dans le Debugger et l'Inspector de Pharo, ce qui m'a permis de comprendre comment le système résout les appels sans avoir à multiplier les gros if/else.




# Semaine 3

Cette semaine, j'ai regardé les cours sur le Double Dispatch ainsi que sur les raisons d'éviter les nil (Null Object Pattern). 
J'ai ensuite installé et initialisé le projet Chess dans mon image puis exploré son fonctionnement. Le plateau s'affiche bien et les pièces bougent, mais j'ai rapidement relevé plusieurs problèmes : 

- le jeu ne gère pas le tour par tour, les pions ne peuvent pas capturer en diagonale et ils peuvent écraser une pièce située directement devant eux.Avant d'entamer les corrections, j'ai suivi une approche TDD en écrivant d'abord une suite de tests unitaires couvrant les règles de base du pion (MyPawnTest). Cela m'a permis d'obtenir une direction claire pour le refactoring grâce aux tests en échec.   

J'ai créé deux sous-classes, MyWhitePawn et MyBlackPawn, héritant de MyPawn afin d'y déléguer les variations de direction et de rangée initiale (forwardSquareFrom:, initialFile, etc.).   

L'exécution des tests a d'abord échoué avec une erreur MessageNotUnderstood: #forwardSquareFrom: sur une instance directe de MyPawn. Ne maîtrisant pas encore la distinction entre le côté instance et le côté classe dans Pharo, j'ai eu recours à l'IA pour m'aider à analyser la trace d'exécution du débogueur. Cela m'a permis de comprendre que l'appel MyPawn black héritait de la méthode générique de MyPiece class >> black et instanciat la classe parente au lieu de ma sous-classe. J'ai ainsi découvert la différence concrète entre l'Instance side (comportement d'une pièce) et le Class side (méthode de fabrique pour créer la bonne sous-classe), ce qui m'a permis de corriger le problème et de faire passer l'ensemble de mes tests au vert.   