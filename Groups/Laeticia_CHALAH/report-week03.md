# Rapport de la semaine 3 – C3P :

## Compte rendu des vidéos sur le double dispatch (20/09/2026):
J’ai regardé deux vidéos sur le double dispatch et étudié leurs exemples en Pharo.
  - Dans la première vidéo, j’ai travaillé sur l’exercice Pierre-Papier-Ciseaux.
  - J’ai suivi les deux envois de messages, vs: puis playAgainstStone, pour comprendre comment Pharo choisit le gagnant selon les deux objets.
  - Dans la deuxième vidéo, j’ai étudié l’affichage des blocs d’un jeu. 
  - J’ai vu comment un bloc, comme Wall ou Player, indique à la vue ce qu’elle doit dessiner.
  - J’ai comparé les deux exemples : Pierre-Papier-Ciseaux utilise une seule famille de classes, tandis que l’exemple du jeu fait intervenir les blocs et les vues.
J’ai compris que le double dispatch permet de choisir un comportement selon deux objets, en utilisant deux messages successifs sans multiplier les tests de type.

## 21/09/2026 :
- J’ai ensuite repris les bases de la syntaxe Pharo : les trois formes de messages, le receveur et ses arguments, self, super, :=, ^ et les blocs [ ... ].
Cela m’a aidée à lire les méthodes des vidéos plus facilement.
- J’ai commencé le TP Myg Chess Game sur Pharo
- J’ai étudié le double dispatch dans le projet Chess : la case envoie un message à la pièce, puis la pièce renvoie un message à la case pour choisir son affichage.
- J’ai repéré les conditions répétées dans les méthodes de rendu des six pièces.
- J’ai créé la méthode commune renderPiece:withLetters: pour choisir le caractère selon la couleur de la pièce et de la case.
- J’ai adapté les méthodes du fou, du cavalier, du roi, du pion, de la reine et de la tour pour utiliser cette méthode.
- J’ai lancé les tests du projet et ouvert l’échiquier pour vérifier que les pièces s’affichent.
