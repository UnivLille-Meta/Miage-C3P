# Rapport
> DEMORY Enzo - groupe 2 M1 MIAGE
>
> Dépot Chess : https://github.com/EnzoDemory/Chess


## Semaine 6 :

### Description générale :

Cette semaine, j'ai surtout révisé en vue de l'examen et fait le kata "Refactor piece rendering" sur Chess.


### Révisions pour l'examen

J'ai revu les vidéos du cours et je me suis entraîné avec la feuille d'autoévaluation du début du cours, pour voir ce
que je maîtrisais et ce qu'il me restait à retravailler.


### [Chess](https://github.com/EnzoDemory/Chess)

#### Le kata "Refactor piece rendering"

Pour afficher une pièce, `MyChessSquare` avait six méthodes presque identiques (`renderBishop:`, `renderKing:`, etc), qui
choisissaient une lettre avec des `ifTrue:ifFalse:` imbriqués selon la couleur de la pièce et la couleur de la case. J'ai
remplacé tout ça par du double dispatch.

Pour y arriver, j'ai d'abord dû transformer la couleur d'une pièce en objet. J'ai créé `MyPieceColor` (abstraite) et ses
deux sous-classes `MyWhiteColor` et `MyBlackColor`, qui remplacent le `Color` de Pharo pour les pièces et les joueurs (mais les
cases gardent leur `Color`). Seuls `=`, `isBlack` et `negated` étaient utilisés sur ces couleurs, donc je n'avais pas
besoin d'hériter de `Color`. Ces classes ont aussi permis de supprimer les derniers tests de couleur dans `MyPawn`, avec
`direction` et `pawnStartFile`.

Ensuite, pour chaque pièce, `renderPieceOn:` demande à sa couleur, et la couleur demande à la case de choisir entre deux
lettres avec `ifWhiteSquare:ifBlackSquare:`. Il n'y a plus qu'une seule méthode dans `MyChessSquare` et chaque couleur
connaît ses lettres. J'ai aussi créé `MyNilColor` pour `MyNilPiece`, ce qui me permet de donner une couleur à la pièce
vide sans `nil`. Le défaut est qu'elle hérite de méthodes qu'elle ne sait pas implémenter (`direction`, `pawnStartFile`,
etc), que j'ai volontairement laissées en erreur car elles ne sont jamais utilisées. Je ne sais pas si c'est une bonne
manière de faire ou si j'aurais dû la faire hériter d'`Object`.

#### Conclusion sur Chess

J'ai terminé trois katas sur Chess.

- **Fix pawn moves!** : j'ai corrigé tous les mouvements du pion (avance d'une ou deux cases, captures en diagonale, capture de
  face interdite) puis ajouté la prise en passant, en mémorisant le dernier coup dans le plateau (`lastMovement`) et en
  retirant le pion capturé avec un hook dans `moveTo:`.

- **Remove nil checks** : j'ai remplacé les deux sortes de `nil` du jeu (la case vide et la case hors plateau) par des
  Null Objects, `MyNilPiece` et `MyNilSquare`, ce qui a supprimé les `ifNil:`, `ifNotNil:` et `notNil` dans les pièces,
  les états de sélection et le plateau.

- **Refactor piece rendering** : j'ai transformé la couleur d'une pièce en objet (`MyPieceColor`) pour remplacer les six
  méthodes `render...:` de `MyChessSquare`, pleines de `ifTrue:ifFalse:`, par un double dispatch (pièce, couleur, case).

Ces katas m'ont beaucoup appris, surtout à lire du code existant, à refactorer à petits pas en gardant les tests verts, et à
remplacer des conditions par du polymorphisme.