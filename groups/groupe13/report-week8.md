## Gautam Demeulemeester

Cette semaine j'ai terminé le kata du projet Chess remove nil check :[Lien du kata](https://github.com/K-Boo/Chess/tree/remove-nil-check)

## HEDDI Abdelkader

Cette semaine, j’ai finalisé le projet “Fix pawn moves”, en suivant le plan d’action du document **README-PAWN-TODO-HEDDI.md**. Après avoir défini les tests de base les semaines précédentes, j’ai implémenté l’ensemble des règles de déplacement et de capture des pions, y compris les cas avancés comme la prise en passant et la promotion.

La Phase 1 a permis de consolider les règles fondamentales : pas simple, double pas initial (avec vérification du chemin libre), captures diagonales uniquement sur pièce adverse, et interdiction stricte de capturer tout droit. Ces comportements ont été validés par des tests unitaires exhaustifs pour les deux couleurs.

J’ai ensuite ajouté la prise en passant, avec une gestion complète de l’état enPassantTargetSquare (création, utilisation, suppression). La promotion a aussi été intégrée, avec une détection automatique de la dernière rangée et une logique extensible pour l’interface et le bot.

Sur le plan méthodologique, j’ai poursuivi une approche TDD stricte que m'avait conséillé Guille m'avait conseillé, en écrivant les tests avant chaque implémentation. Un refactoring a permis d’unifier la logique entre pions blancs et noirs grâce à un système d’offsets et de prédicats communs, rendant le code plus clair et plus robuste.

Le projet chess est désormais fonctionnel et conforme au cahier des charges initial. Les tests couvrent tous les cas d’usage définis dans le plan, et la logique de mouvement des pions est complète, claire et extensible pour les évolutions futures.

Lien du projet :
🔗 https://github.com/K-Boo/Chess/tree/fix-pawn-moves

## Khalil BOUCHAMA

Cette semaine, j'ai réaliser mon Kata "Change Render Pieces". J'ai changé la mnière dont les pièces sont affiché en refactorisant le code. J'ai appliqué un double dispatch afin de limiter le nombre de
condition dans la méthode Render[Piece] dans la classe MyChessSquare. La méthode reposer sur une double condition if. Avec le double dispatch, on simplifie le code et on ne garde plus qu'une seul condition
grâce à l'envoi de messages. 
