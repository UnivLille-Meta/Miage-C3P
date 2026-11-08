AISSATOU BILLY DIALLO 

PREMIERE SEMAINE :

REALISATIONS:

Ayant déja fait Pharo en Licence3  , cette semaine a consisté à une révision génrale :
- Une réinstallation de Pharo sur ma machine
- Créer un compte github que j'ai rélié avec mon compte Pharo (Pour faciliter le commit directement via Pharo )
- Reviser mon cahier de Pharo de l'année passée sur la synthaxe générale de pharo, la creation de classe(la notion d'heritage ) ,de classe de test et de package , reviser les notions de (this, de self et de super),
le TDD , le dispatch et le double dispatch 


2eme SEMAINE:

j'ai vu le cours sur self et super, fait l'exo sur le simple dispatch et fait le TP sur flag/Pays

3em SEMAINE: 

J'ai travillé sur le tp ChessGame : 
  j'ai fait shift+entrer pour rechercher les classes impliqué, j'ai analysé le code .
  j'ai fait des recherches sur le jeu d'echec, car j'y ai jamais joué , pour comprendre la logique.
  j'ai  remarqué que dans les different camp : les couleur sont mélangées dés le depart, on a du bleu et de l'orange 
dans les deux cotés , égalemeent que les differents camps n'attendent pas son tour pour jouer , ils peuvent chacun jouer
à leur guise sans attendre que l'autre termine ( Et j'ai pensé à Delay pour potentiellement gérer ça) .

Difficultés rencontrés: 
- j'ai eu du mal pour la compréhension des classes et je cherche encore les autres défaillances du code au fure et à mesure 
que je vais comprendre la logique du jeu 

4em SEMAINE: 

  j'ai formé mon groupe, continuer l'etude des classes, pour retrouver ce qui cloche :
  On a notamment remarquer qu'on pouvait manger nos alliés(à corriger)
  Aussi qu'on pouvait manger le ROI et que la partie continue meme apres ça .

5eme SEMAINE : 

**Premier Probleme: Pawn Moves** 

Le premier problème code identifié concerne la méthode TargetLegal de la classe Pawn. 
Celle-ci vérifiait la couleur du pion (noir ou blanc) pour déterminer s’il devait monter ou descendre, 
ce qui nécessitait de tester explicitement chaque cas. Cette approche ne respectait pas le principe OCP (Open/Closed Principle).
Pour y remédier, j’ai séparé le comportement dans deux classes distinctes : BlackPawn et WhitePawn, 
chacune définissant sa propre méthode TargetLegal. Ainsi, grâce à self TargetLegal, le comportement est directement déterminé 
par l’objet receveur, qui exécute la méthode correspondant à sa classe, sans avoir besoin de vérifier sa couleur explicitement.

Rectification de mqa premiere proposition: Lors de la refactorisation, je me suis rendu compte que le problème ne concernait pas uniquement les pions,
mais l’ensemble des pièces du jeu d’échecs, qui peuvent être noires ou blanches. Pour éviter de répéter la gestion 
des couleurs dans chaque classe, j’ai choisi de créer deux classes, Black et White, qui héritent de la classe Piece.
Chaque classe regroupe ensuite les différentes pièces de sa couleur, comme MyPawnBlack, MyKingBlack, MyPawnWhite et MyKingWhite etc.... 
Cette organisation centralise la gestion des couleurs, limite la duplication du code et facilite l’évolution du jeu.

Après analyse, je me suis rendu compte que mes propositions précédentes, bien qu’elles permettent de supprimer certaines conditions liées à la couleur, risqueraient d’augmenter considérablement le nombre de classes et d’entraîner une duplication importante du code.
En effet, les principales différences entre les pièces noires et blanches concernent notamment leur sens de déplacement. Pour le reste, les règles de déplacement, d’attaque et de capture propres à chaque type de pièce restent globalement similaires, quelle que soit sa couleur.
Créer des classes distinctes pour chaque combinaison de pièce et de couleur ne semble donc pas être la solution la plus adaptée. Je propose plutôt de conserver une architecture commune aux pièces et de traiter les différences de comportement liées à la couleur sans multiplier inutilement les classes.
Je souhaite donc commencer par corriger les problèmes identifiés dans le fonctionnement des pions, avant d’examiner plus largement les mécanismes de déplacement et de capture des autres pièces.

* D'abord regler le probleme d'avancement de deux cases possible au depart du jeu. Pour se faire on va tester si le piont est sur sa ligne initial ( ligne defini en fonction de la couleur du pion.)
s'il l'est on pourra ajouter la position up up a la liste des postions accessible pour ce pion. ( à condition que la case ne soit pas occupée).

* Ensuite on va verifier que le pion ne peut pas se mouvoir sur une case en diagonale si celle ci est vide. Car c'est interdit par les regles du jeu.

* Enfin on verifiera que le pion est capable d'effectuer une capture en diagonale que ce soit par la droite ou par la gauche. Ici il faudrait si la case en diagonale de notre case possede un pion et si oui on le prend.

* Si apres mes changements je constate q'un refactoring est possible je le ferais dans la mesure du possible.


**Deuxieme Probleme: Refactor piece rendering**

- Double Dispatch

Une solution consiste à séparer les pièces selon leur couleur. On crée une hiérarchie dans laquelle Piece possède deux sous-classes, WhitePiece et BlackPiece. Chaque type de pièce (Pawn, Knight, etc.) aura alors une version blanche et une version noire.
Depuis la classe ChessSquare, on délègue le rendu à la pièce avec le message renderSquare: self. Chaque classe concrète de pièce implémente ensuite sa propre méthode renderSquare: et délègue le rendu au carré en lui envoyant un message spécifique, comme renderKnight: ou renderPawn:.

Le double dispatch permet ainsi de sélectionner le comportement en fonction du type concret de la pièce, puis du type de message envoyé au carré. On peut alors adapter le rendu à la pièce concernée sans devoir tester explicitement son type avec des conditions.


- Table Dispatch


Une autre solution consiste à utiliser une table de correspondance directement dans ChessSquare, afin de remplacer les conditions imbriquées par une recherche dans un dictionnaire.

On définit un dictionnaire contenant les caractères à afficher pour chaque combinaison de couleurs. La couleur de la pièce et celle du carré servent de clés pour retrouver le caractère correspondant.

Par exemple, pour un cavalier, la table associe les combinaisons suivantes à leur caractère:

Couleur de la pièce	Couleur du carré	Caractère
Blanc	Blanc	N
Blanc	Noir	n
Noir	Blanc	M
Noir	Noir	m


Le rendu peut alors être implémenté de la manière suivante :

ChessSquare >> renderKnight: aPiece
    ^ (renderingTable at: aPiece color)
        at: color
La table est initialisée avec un dictionnaire par couleur de pièce, chacun contenant les caractères correspondant aux deux couleurs possibles du carré.

Cette approche permet de supprimer les conditions imbriquées du rendu. Au lieu de déterminer le caractère à afficher à l'aide de plusieurs tests, le programme effectue directement une recherche dans la table à partir des couleurs de la pièce et du carré.
Il faudrait pour cette approche definir une methode color dans les pieces qui renverrai la couleur des pieces ( white et black).

Comparaison entre le double dispatch et le table dispatch

Double dispatch

Le principal avantage du double dispatch est qu'il utilise le polymorphisme pour sélectionner le comportement de rendu approprié. Chaque pièce délègue le rendu au carré, qui choisit le comportement correspondant au message reçu.
Cette approche permet d'éviter les conditions explicites et de répartir la logique de rendu entre les objets concernés.

Cependant, séparer les pièces selon leur couleur entraîne la création de classes et de méthodes supplémentaires. Par exemple, créer des classes distinctes pour les cavaliers blancs et noirs ainsi que pour les pions blancs et noirs complexifie la hiérarchie.
Cela peut être disproportionné pour une opération de rendu qui consiste simplement à retourner un caractère. L'ajout de nouveaux types de pièces ou de nouvelles couleurs peut également nécessiter de nouvelles classes et méthodes.

Table dispatch

Le principal avantage du table dispatch est sa simplicité. Les règles de rendu sont centralisées dans un dictionnaire qui associe les combinaisons de couleurs de la pièce et du carré aux caractères correspondants.
Cette approche supprime les conditions imbriquées et rend les correspondances explicites. Pour modifier une règle de rendu, il suffit de mettre à jour l'entrée correspondante dans la table.

Cependant, la table doit être maintenue lorsque les règles évoluent. Si le nombre de types de pièces, de couleurs ou de critères de rendu augmente, le nombre d'entrées peut devenir important. De plus, les règles sont représentées sous forme de données plutôt que réparties dans des méthodes polymorphes, ce qui peut être moins adapté lorsque les comportements de rendu deviennent très différents selon les pièces.

Conclusion

Dans ce scénario, le table dispatch semble plus approprié, car la logique de rendu consiste essentiellement à associer un petit nombre de combinaisons à des caractères.
Cette approche évite de multiplier inutilement les classes et conserve une implémentation simple.

Le double dispatch serait plus intéressant si le comportement de rendu était plus complexe et variait significativement selon les types des objets impliqués.
Le choix dépend donc de la complexité des règles de rendu et de leur évolution potentielle.


Problème rencontré

Lors de la mise en place des tests pour le refactoring du rendu des pièces, j'ai rencontré une difficulté concernant l'initialisation de la couleur des cases.

En effet, le rendu dépend à la fois de la couleur de la pièce et de celle de la case. Cependant, je n'ai pas réussi à initialiser correctement la couleur d'une case dans les tests, ce qui m'a empêché de vérifier le comportement attendu pour chaque combinaison.

J'ai donc rencontré des difficultés pour valider expérimentalement le fonctionnement de la table de correspondance. Sans tests fiables couvrant les différentes combinaisons de couleurs, je ne pouvais pas m'assurer que le refactoring conservait le comportement initial.

Par conséquent, je n'ai pas pu mener cette expérimentation jusqu'à sa validation complète.

Voici le lien de mon depot pour le projet : https://github.com/aissatou-Billy/ChessGame





