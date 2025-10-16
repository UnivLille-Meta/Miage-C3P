## Gautam Demeulemeester

## HEDDI Abdelkader

Cette semaine, j’ai poursuivi le kata “Fix pawn moves” en travaillant d’abord sur l’organisation et les tests. J’ai clarifié précisément le périmètre fonctionnel des pions (différence entre cases attaquées et cases jouables, sens blanc/noir, rangs de départ/arrivée, règles d’occupation et limites hors-plateau) et j’ai structuré un plan d’action détaillé dans le fichier **README-PAWN-TODO-HEDDI.md**, avec des critères d’acceptation et une checklist simple à suivre. Ensuite, j’ai adopté une démarche TDD en écrivant les premiers tests unitaires “de base” pour les pions: le pas simple (e2→e3 côté blanc et e7→e6 côté noir), le cas bloqué quand la case juste devant est occupée, et les captures diagonales autorisées uniquement sur une pièce adverse pour les deux couleurs. Chaque test est documenté par “context”, “trigger” et “assert-check” pour être lisible et pour que ca soit similaire à ce qu'on a fait en classe en pair programming avec le kata de rover sur mars. Conformément à l’approche “tests d’abord”, j’ai volontairement laissé au rouge les tests révélant les comportements à corriger afin d’implémenter ensuite la logique minimale qui fera passer ces tests au vert. La prochaine étape consiste à écrire les tests du double pas initial et de ses blocages (pour blanc et noir, avec l’interdiction hors rang de départ), puis seulement après, à implémenter les règles correspondantes pour valider toute la Phase 1.

Vous pouvez retrouvez tout ça sur le lien suivant :

- https://github.com/K-Boo/Chess
  dans la branche **fix-pawn-moves**
