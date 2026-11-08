# Rapport Week 5
  
# - Mathéo Castre - Ilyas Mokhtari  
  
## Ce qu'on a fait  
  
On a regardé les vidéos et les diapos de :
- M9-1 Lecture About coupling and encapsulation
- M4-5 Lecture Singleton: a Highly Misunderstood Pattern
  
Ilyas a revu toutes les vidéos, puis nous avons revu ensemble les patterns Visitor et Composite.
  
  
### Pour le projet Chess
  
  
Nous sommes repartis sur une nouvelle branche pour réessayer, avec les explications du professeur, d'implémenter des classes "white" et "black" pour chaque pièce, afin d’éviter les conditionnels sur les couleurs.
  
Pour les mouvements des pions, nous avons implémenté une stratégie, une instance de pion contient une référence à la méthode “firstMove” à l'initialisation.
Après son premier déplacement, nous passons à ”defaultMove”. (pour cela, nous avons surchargé la méthode move:to: dans "Pawn"  pour pouvoir changer de stratégie).
  
Nous avons aussi créé des tests pour vérifier le fonctionnement des mouvements et des attaques. 
Nous avons appeler la méthode “attackSquare” dans targetSquaresLegal:
  
Nous avons essayé d'ajouter le mouvement "en passant" mais nous n'avons pas trouvé de bonnes solutions pour supprimer le pion adverse après s'être déplacé sur la case. 
  
Nous avons aussi commencé à travailler sur la suppression des ifNil. Pour cela, nous avons créé une nouvelle classe "MyEmptyPiece" qui représente l'absence d'un pion (Utilisation du Null Object).
Grâce à cette nouvelle classe, nous pouvons créer des squares avec "MyEmptyPiece" par défaut.fonctionnementfonctionnement.
