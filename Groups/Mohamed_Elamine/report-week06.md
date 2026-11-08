# Rapport - Semaine 6

## Introduction

Pour cette derniere semaine, j'ai suivi votre conseil monsieur sur mon rapport precedent : faire un kata qui se concentre sur la proprete du code plutot que sur les regles des echecs(faire experimenter des trucs plus meta).

J'ai donc choisi le kata "Implement more bot gaming strategies", pour travailler sur la delegation et le polymorphisme.

## Ce que j'ai fait

Avant, la methode `MyPlayer >> play` contenait directement toute la logique pour choisir un mouvement aleatoire. Le joueur avait donc deux responsabilites : representer un joueur et decider comment jouer.

J'ai fait un refactoring en utilisant le pattern **Strategy** :

- J'ai cree `MyRandomMoveStrategy` qui reprend la logique aleatoire existante.
- J'ai cree `MyCaptureMoveStrategy` qui donne la priorite aux captures, et utilise la strategie aleatoire si aucune capture n'est possible.
- J'ai simplifie `MyPlayer >> play` qui fait maintenant juste `self moveStrategy playFor: self`.
- J'ai ajoute des tests pour verifier le choix et le changement des strategies, ainsi que leur comportement.

J'ai aussi utilise les critiques de Pharo pour mieux organiser les methodes dans des protocoles et ajouter des commentaires aux classes. Tous les tests sont verts.

## Ce que j'ai appris

Ce kata m'a permis de mieux comprendre la **delegation** : au lieu de tout faire lui-meme, `MyPlayer` confie le choix du mouvement a un autre objet.

J'ai aussi mieux compris le polymorphisme : les deux strategies comprennent le meme message `chooseMoveFor:`, mais elles ne font pas la meme chose.

Un point interessant est que `MyCaptureMoveStrategy` herite de `MyRandomMoveStrategy` pour reutiliser son comportement. Mais je me demande si la composition ne serait pas mieux ici, car une strategie de capture n'est pas vraiment une sorte de strategie aleatoire.

## Difficultes et conclusion

La principale difficulte etait de comprendre comment separer la logique sans casser le fonctionnement existant. Les tests m'ont aide a verifier que le refactoring fonctionnait.

Ce que je retiens de ce dernier kata, c'est qu'un code qui fonctionne n'est pas forcement un code bien concu. Avant je cherchais surtout a corriger les bugs du jeu, maintenant je commence a me poser plus de questions sur les responsabilites des objets et leurs relations.

## Petite remarque sur le module

Ce module etait parfois tres frustrant et meme decourageant, surtout au debut. Mais au final, on se rend compte qu'il y a des concepts vraiment interessants qu'on aurait probablement jamais decouvert sans ce cours. Et quand on commence enfin a les comprendre, on se dit juste "Woaaah, that's kinda cool !".

## Repo

https://github.com/amiineee863/PharoStuff
