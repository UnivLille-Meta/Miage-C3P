# Rapport C3P semaine ?
## Ce que j'ai fait  
 
 Dans le projet Chess :
J'ai refactorisé les méthodes d'affichage du projet en créant des classes de couleurs : (PieceColor, BlackPiece, WhitePiece).
(https://github.com/AxelDumon/Chess/commit/fe92478a4c9f8ecf3f6c364db25460993924e9e8)

Une instance de la classe BPiece ou WPiece est stockée dans chacune des pièces de jeu. Ces classes permettent de : 
- renvoyer la direction vers laquelle le piont se dirige sans condition. 
- return l'affichage voulu pour une pièce à l'aide d'un double dispatch (la pièce demande à sa couleur de l'appeler elle même sur sa méthode renderWhite/renderBlack) permettant de retirer une première condition.
  
## Ce que je n'ai pas fait  

- La création de deux couleurs pour les tuiles et retirer les conditions dans les méthodes d'affichage
- Les katas restant

## Les difficultés rencontrés

J'ai longtemps douté sur l'approche que j'allais choisir pour appréhender le problème de refactor des couleurs. Ces classes de couleurs n'héritent pas de la classe Couleur. C'est grâce au strategy design pattern que nous avons vu en cours que j'ai trouvé cette solution : je possède un attribut couleur dans la classe PieceColor et le getter color des pièces renvoe directement sur cet attribut pour ne pas avoir à trop modifier le code.
Ma première approche était donc de faire hériter mes classes de couleur mais je n'arrivais pas à faire fonctionner cette approche, ça faisait d'ailleurs crash Pharo.
