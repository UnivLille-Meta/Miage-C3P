# Rapport semaine 3

## partie cours

Premièrement, nous avons étudié la double distributivité. Je connaissais déjà avec java, mais j'ai mis du temps à faire le rapprochement car je ne connaissais pas le nom, et la syntaxe de pharo encore nébuleuse pour moi n'a pas aidé.

L'intêret de la double distributivité, c'est d'éviter d'utiliser des ifs à répétition, et avoir un code plus maintenable et agréable à lire (même si c'est moins facile à comprendre quand on ne connait pas la notion).

## projet echec

Après avoir travaillé sur les déplacements des pions, je veux maintenant pouvoir gérer le cas où un roi est mis en echec. Dans le cas d'un echec, le roi doit s'enfuir sur une case où il ne sera pas mis en echec.

Je commence par un test simple :

https://github.com/erdark/Chess/commit/9164f89113fbd1a85de4976c177715de425ed7eb

Le test échoue pour le moment, car le roi peut aller en E5. Je pensais au départ que le problème venait des déplacements du roi, mais ceci est en réalité causé par les déplacements possible de la tour. Comme le roi se situe entre la position de la tour et E5, alors la tour ne contrôle pas la case E5, ce qui fait que le roi peut s'y rendre. Une solution très simple est déffacer le roi de sa case lors de la vérification des cases attaquées par une pièce adverse, dans la fonction targetSquaresLegal de la classe MyKing :

https://github.com/erdark/Chess/commit/1f89781c767dd752fc7bf96ddffd21fddb9924ef

Même si la solution est très courte, j'ai passé trop de temps à chercher des solutions bien plus complexe, qui n'ont mené à rien

Une fois cela fait, je me suis rendu compte qu'il y avait un bug sur le déplacement des pions, ils peuvent se déplacer de 2 cases en permanence, alors que c'est sensé être le cas que lors du premier déplacement.
Il s'agit simplement d'un simple appel au setter de l'attribut isMove lors du déplacement de la pièce.

https://github.com/erdark/Chess/commit/2e2939fb226519841ddbe4a5ffa4bafc617126fe

## Conclusion

Je suis plutôt content de ce que j'ai réussi à faire. Je commence à mieux appréhender l'interface de Pharo, et même si j'ai encore du mal avec la syntaxe et que j'avance assez lentement, je sens de l'amélioration.