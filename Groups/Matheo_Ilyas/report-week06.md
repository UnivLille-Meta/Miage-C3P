# Rapport Week 6
  
# - Mathéo Castre - Ilyas Mokhtari  
  
## Ce qu'on a fait

On a révisé pour l'évaluation en regardant les vidéos ainsi que les diapos (Visitor, Composite, Static Versus Dynamic, Subclassing and subTyping).
On s'est aussi auto-évalué en se posant mutuellement des questions pour réellement savoir si on avait compris les notions.
Ensuite, on s'est entrainé à implémenté un Visitor qui réalise des opérations (plus, moins) sur des Nombres et Expressions afin de mieux comprendre le concepte du design pattern.
  
### Pour le projet Chess

On a réussi à enlever tous les Nil checks.

On a réussi à faire en sorte que lorsqu'on mange avec un enPassant, le pion mangé disparaisse.

On a ajouté un booléen sur moveTo pour savoir si la superclasse avait réussi à exécuter la méthode.
Cette modification a permis de régler deux problèmes :
 - Si on cliquait sur une case qui n'était pas valide, la méthode moveTo du pawn était quand meme appelée ce qui changeait la stratégie firstMove alors qu'il n'avait pas bougé.
 - Si la case n'était pas valide, le jeu enregistrait quand même le déplacement dans l'historique des coups.

On a aussi fix certains tests.

On a essayé de travailler sur la promotion du pion mais à chaque fois qu'on essayait de rajouter un panel dans l'UI du jeu, pharo crashait.

On a aussi réécrit attackingSquare dans nos classes pawn pour que quand le roi vérifie les cases menacées, on ne regarde que les cases où les pawns peuvent attaquer.

### Lien du gitHub

https://github.com/IlyasMokhtari/Chess

(Tout le projet a été réalisé en pair programming, que ce soit pendant les heures de TP ou bien chez nous via Discord)
