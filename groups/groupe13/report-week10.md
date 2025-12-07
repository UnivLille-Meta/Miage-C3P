## Gautam Demeulemeester
Cette semaine j'ai exploré le code/test de notre nouveau projet Sokoban. J'ai un peu de mal à tout comprendre notemment pour ce qui est de l'affichage. Je pense dans un premiere temps m'interesser à l'ajout de fonctionnalités suivant :

- Counting moves and push. Introduce the display of moves.

- Paired Target/Box. Introduce pairs of target/box where each box can only go on a target. A version can mix paired and unpaired boxes.
You can decide for another features.

Je vais commencer par implementer des tests la semaine prochaine bien que j'ai remarqué qu'il existe déja un test testMoveCount qui verifie le nombre de mouvement, je suppose que pour cette première fonctionnalité nous devront uniquement gérer l'affichage de la variable currentMoveCount.

## HEDDI Abdelkader

Cette semaine, j’ai défini l’idée du projet que je souhaite réaliser dans le cadre du module C3P : la mise en place d’un système complet d’historique des actions pour Myg: Sokoban, combinant journal visuel et navigation dans les états du jeu.

L’objectif est de créer un historique affiché à l’écran, alimenté par des objets décrivant chaque action du joueur (par exemple : « Vous poussez la caisse vers l’est »). Cet historique serait interactif : en cliquant sur une entrée, le joueur pourrait revenir directement à l’état du plateau correspondant.

Pour y parvenir, je prévois de structurer un enregistrement propre des états successifs du jeu, afin de pouvoir naviguer dans la partie comme dans une timeline. Ce mécanisme servira de base à une fonctionnalité robuste et cohérente de restauration d’état.

Cette idée constitue le cœur du projet que je compte développer, et qui apportera, je pense une valeur ajoutée au projet Myg tout en me permettant de travailler sur un sujet qui utilise ce que j'ai appris dans cette matiere tout au long du semestre.

Je n’ai pas de questions pour cette semaine.

## Khalil BOUCHAMA

J'ai commencé à implémenter le code pour le projet Sokoban. Je compte implémenter le décompte des actions du personnage avec l'affichage du nombre de poussées de caisses et du nombre de mouvement. 

**Fonctionnalité en cours :** j'ai préparé l’affichage du compteur de mouvements dans la vue (MygSkBoardElement). L’objectif immédiat est que l’UI affiche le label « Moves: 0 » dès l’ouverture d’un niveau, ce qui couvre la première facette du compteur (affichage initial).

**Avancement :** j’ai structuré la démarche TDD pour ce cas. J’ai défini la classe de test MygSkBoardElementTest avec setUp/tearDown pour garantir un espace propre entre chaque test, puis j’ai écrit testInitialMoveCountDisplay (phase RED) qui vérifie que le label existe et contient « Moves: 0 », et je prévois maintenant l’implémentation minimale dans MygSkBoardElement (ajout de la variable d’instance, des accesseurs et du label) pour faire passer ce test (phase GREEN).
Prochaines étapes : terminer le code de initializeMoveCountLabel pour que le test passe avant de continuer avec la mise à jour dynamique du compteur (tests suivants).
