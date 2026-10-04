# Rapport Semaine 4 

## Hammed ABASS


## Julie LIM

Pour cette 4ème semaine, j'ai commencé par essayer de comprendre le fonctionnement du projet Chess avant de modifier le code

J'ai parcouru plusieurs classes comme MyChessGame, MyPlayer, MySelectedState et MyUnselectedState afin de comprendre comment les déplacements et les changements de joueur étaient gérés

En testant le jeu manuellement, j'ai remarqué qu'il était possible de jouer plusieurs fois avec le même joueur
J'ai donc essayé de suivre le chemin du code lors d'un clic sur une pièce et d'un déplacement

J'ai corrigé ce problème en ajoutant une vérification de la couleur de la pièce par rapport au joueur courant puis en ajoutant le changement de joueur après un déplacement manuel

J'ai également commencé à regarder d'autres comportements incorrects, notamment certains clics qui peuvent être interprétés comme des déplacements alors que la pièce n'a pas réellement bougé

Pour le moment, je n'ai corrigé qu'un bug et il reste encore plusieurs problèmes dans le jeu que je dois analyser et corriger
