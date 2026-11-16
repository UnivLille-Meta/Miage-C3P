## Suite après le 21/09/2026

- J’ai continué le TP **Myg Chess Game** en travaillant sur une autre façon d’organiser le rendu des pièces : le **table dispatch**.
- J’ai comparé le **double dispatch** et le **table dispatch** afin de comprendre dans quels cas utiliser l’un ou l’autre.
- J’ai continué à étudier le fonctionnement des déplacements des pièces dans le projet Chess.
- J’ai travaillé sur les **déplacements du pion**, notamment le déplacement d’une case et le déplacement initial de deux cases.
- J’ai vérifié à l’aide de tests que le pion pouvait avancer correctement depuis sa position initiale, mais qu’il ne pouvait plus avancer de deux cases après avoir quitté sa case de départ.
- J’ai travaillé sur les **cases cibles légales** des pièces et sur la façon dont elles sont calculées.
- J’ai aussi rencontré et corrigé des problèmes dans les directions de déplacement, notamment autour des méthodes `up`, `down`, `left` et `right`.
- J’ai ajouté ou vérifié plusieurs **tests positifs et négatifs** pour m’assurer que les déplacements autorisés et interdits étaient correctement gérés.
- J’ai commencé à travailler sur des notions de conception liées au TP, notamment le fait de remplacer certaines conditions par du **polymorphisme**.
- J’ai également commencé à voir les patterns **Composite** et **Visitor**, ainsi que la problématique des tests sur `nil`.
- J’ai abordé l’idée du **Null Object** pour éviter de multiplier les vérifications de `nil` dans le code.
- J’ai enfin commencé à réfléchir à la qualité des tests et au refactoring du code : éviter les duplications, garder des méthodes simples et vérifier que les modifications ne cassent pas le comportement existant.
  
