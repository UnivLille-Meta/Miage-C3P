# Semaine 2

Loisel Noé

Cette semaine, j'ai terminé de regarder toutes les vidéos du MOOC sur les modules 0, 1 et 3 (hors bonus du module 0) et j'ai réalisé l'exercice sur le DSL (les dés). Je comprends maintenant bien mieux la structure de Pharo et cela me permettra de me concentrer pleinement sur les concepts de design patterns. J'ai également commencé à jeter un œil au projet.

Dans mes manipulations, j'ai continué à utiliser le débugger pour valider mes méthodes et j'ai bien intégré le réflexe de compiler chaque modification avant de poursuivre.

En étudiant les mécanismes de messages, j'ai compris que le dispatch correspond à la façon dont Pharo choisit dynamiquement quelle méthode exécuter au moment où on envoie un message (comme dit dans le cours, la méthode à exécuter est choisie par la classe du récepteur).

Au début, je m'attendais à ce que l'appel d'une méthode utilise directement le code écrit dans la classe parente. En réalité, grâce au mécanisme de recherche (lookup), c'est le récepteur à l'exécution qui prime : si une sous-classe a redéfini la méthode appelée via self, c'est sa version à elle qui s'exécute automatiquement. J'ai pu corriger cette vision en testant directement le code et en le suivant pas à pas dans le Debugger et l'Inspector de Pharo, ce qui m'a permis de comprendre comment le système résout les appels sans avoir à multiplier les gros if/else.