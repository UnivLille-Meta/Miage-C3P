# report-week04.md

repo pour voir le code : https://github.com/amiineee863/PharoStuff

# intro

Cette semaine le cours portait sur Composite et Visitor, donc j'ai regarde les
videos du module 5 (Composite) et du module 6 (Visitor) avant le cours

# révision du cours

Composite : si j'ai bien compris, l'idee c'est de traiter un objet seul (une feuille,
genre un fichier) et une collection d'objets (un dossier) de la meme facon, via une
interface commune, pour eviter de faire des `isDirectory ifTrue: [...] ifFalse: [...]`
partout.

Visitor : ca permet d'ajouter une nouvelle operation sur une structure d'objets sans
toucher aux classes existantes, le mecanisme cest le double dispatch : `accept:`
appelle en retour `visitX:` sur le visiteur, donc le bon code s'excute selon le type
du noeud ET le type du visiteur. Je crois avoir compris le principe mais je ne suis
pas sur a 100% de pourquoi c'est mieux que juste mettre les méthodes directement
dans les classes du modèle ,j'ai l'impression que ça devient utile surtout quand on
a beaucoup d'operations differenes a ajouter plus tard

# CONTINUE WITH OUR CHESS GAME

J'ai commence le kata "Refactor piece rendering". Le code actuel a une methode par
type de piece (`renderKnight:`, `renderBishop:`, etc.) sur `MyChessSquare`, et chacune
repeete la même structure de conditions imbriques (`isWhite` / `color isBlack`) avec
juste 4 lettres differentes a chaque fois

L'idee c'est de remplacer ces conditions par une table : chaque classe de piece
fournit juste un tableau 2x2 de lettres, et une seule methode générique fait la
recherche dedans au lieu de repeter la meme logique 6 fois :

    glyphOnSquareColor: squareIsBlack
        | row col |
        row := self isWhite ifTrue: [ 1 ] ifFalse: [ 2 ].
        col := squareIsBlack ifTrue: [ 2 ] ifFalse: [ 1 ].
        ^ (self class glyphTable at: row) at: col

C'est un exemple de "table dispatch" (une des deux approches proposes dans
l'enonce, l'autre etant le double dispatch qu'on voit justement ce cours-ci).

Pas encore fini : je suis en train de reecrire les méthodes sur chaque classe de
piece et sur `MyChessSquare`, je n'ai pas encore lancé les tests pour verifier que
le rendu est identique a avant
