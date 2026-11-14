Lecture : coupling and encapsulation + Singleton + Kata « Fix pawn moves »
 

coupling and encapsulation 

la loi de demeter : nous dis qu’on ne doit pas communiquer avec les objets lointains, mais uniquement avec ce qui nous est directement accessible :
on a le droit d’envoyer des message uniquement a :
-	un argument qui nous est passé 
-	variable d’instance (attribut)
-	un objet que je cree 
-	self, super, et ma classe 


<img width="734" height="498" alt="image" src="https://github.com/user-attachments/assets/78d07402-f546-4027-a217-f91183514e8a" />



Ici par exemple, au début ca touchait un objet lointain de type carburator, dans la step 1 on a déplacer ce comportement a engine puis dans la step 2 on a laissé ce comportement a la classe elle-même, de cette manière si on veut changer le comportement par exemple transformer le booléen en entier, on touchera uniquement a la classe carburetor et non aux autres.

Remarque : la loi de demeter est une heuristique : donc elle n'est pas applicable dans toutes les situations 


----------------------------------------------------------------------------------------------------

Lecture Singleton :
On a besoin d’une classe avec une instance unique 
Solution --->   a chaque fois qu’on aura besoin de l’instance on retournera la premiere instance au lieu de créer une nouvelle 

--------------------------------------------------------------------------------------------

Kata « Fix pawn moves »
Au départ, le pion ne pouvait avancer que d'une case. Il pouvait manger tout droit et ne mangeait pas en diagonale. J'ai donc refait sa logique dans MyPawn.

J'ai ajouté une méthode forwardOf:, qui donne la case juste devant le pion : vers le haut s'il est blanc, vers le bas s'il est noir. Elle est utilisée par forwardSquares et diagonalSquares.

forwardSquares calcule les cases ou le pion peut avancer 

diagonalSquares, elle donne les deux cases en diagonale devant le pion. Elle est utilisée par captureSquares qui garde seulement les diagonales où il y a une pièce adverse à manger

et targetSquaresLegal: réunit les deux : les cases pour avancer (forwardSquares) et les cases pour manger (captureSquares).

Pour les tests, j'ai créé MyPawnTest avec 5 tests. Ils vérifient que le pion avance de deux cases au départ, puis d'une seule ensuite, que le pion noir descend bien, qu'il est bloqué par une pièce devant lui et qu'il peut manger en diagonale 

Remarque : pour le commit malgré mes essai et ceux de faouzi nous n’avons pas pu commit depuis pharo, j’ai donc copier le code sur vs code et fait mon commit depuis le terminal, ce n’est pas très élégant mais c’est la seule façons que j’ai trouver de faire, ce commit regroupe donc tous mes travaux fait jusque-là.

Lien : https://github.com/UnivLille-Meta/Chess/commit/3f7b338708ef5af42b5d0f0a931a62ef9185e486 
