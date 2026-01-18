 # Rapport - Ait Ali Ilyas

Cette semaine, je me suis principalement concentré sur l'implémentation des tests  et le débogage pour le projet Chess, notamment pour la fonctionnalité de prise en passant.

## Apprentissages

Cette semaine m'a permis d'approfondir mes connaissances sur les tests et notamment sur le débogage dans Pharo. Travailler sur un projet aussi complet que celui-ci m'a permis de mieux comprendre l'architecture et les interactions entre les différentes classes.

## Difficultés 

- **Problèmes de synchronisation** : Difficultés pour les commits et push entre Pharo et GitHub avec mon PC personel

- **Débogage des tests** : Parfois du mal à identifier précisément la cause des erreurs dans les tests


## Conclusion

Cette semaine a été très formatrice grâce au projet Chess et m'a permis de mieux comprendre l'importance du TDD notamment. Les compétences et expériences acquises sur ce projet seront directement applicables pour d'autres projets en essayant d'être beaucoup plus efficace et rapide.

# Alli Rayane 

Pour le debut de ce projet CHESS j'ai tous d'abord analysé en refacto le projets ainsi que les classes que je compté modifié. J’ai corrigé et structuré les mouvements de base des pions. J’ai d’abord audité le code existant et isolé la génération des coups en méthodes dédiées pour la clarté: forwardMoveSquares pour l’avancée (1 case, 2 cases depuis la rangée initiale, avec blocages), et diagonalCaptureSquares pour les captures diagonales (uniquement si une pièce adverse est présente). J’ai veillé à respecter l’orientation des pions (blancs vers le haut, noirs vers le bas) et à bloquer correctement les chemins (impossibilité de sauter une pièce lors du double pas). Côté tests, j’ai écrit des scénarios basés sur MyChessGame pour valider: avancée simple, double pas initial pour blanc et noir, impossibilité d’avancer si une pièce bloque, et impossibilité de “sauter” pour atteindre la deuxième case. Ces tests servent de garde-fous pour éviter les régressions et documentent le comportement attendu. En résultat, l’UI affiche désormais correctement les cibles légales pour les pions selon ces règles, et les captures diagonales “classiques” fonctionnent en jeu.
