### Semaine 6

### Révision du cours

J'ai poursuivi cette semaine les révisions de toutes les notions lors des différents cours en prévision
de l'examen que nous devions normalement avoir vendredi.


### Poursuite de chess

Pour ce qui concerne le chess, j'ai cette semaine décidé de m'occuper de la présence de la condition
isWhite présente dans le code et qui rendait le code moins lisible et modulable en plus de ne pas être très beau.

J'ai donc pour cela décidé de partir sur l'utilisation du pattern Strategy pour séparer la logique liée aux couleurs dans une
autre classe indépendante. Mais au cours de réflexion et de l'implémentation de cela, je me suis dit que vu que la couleur
influençait les pas des pièces ainsi que les directions qu'elles pouvaient prendre, je pourrais pourquoi pas faire en sorte
de relier cela aux couleurs et donc d'externaliser cette fois-ci les pas des pièces dans une classe qui serait un Strategy non pas de
pièces mais du Strategy Color (Que j'ai appelée MyColor).

Pour ce faire j'ai donc ma classe MyDirection qui implémente les pas qui sont pareils pour tout le monde mais qui laisse en abstrait
les pas vers l'avant et l'arrière (car en fonction de la couleur on fait un up ou un down pour avancer et reculer et inversement).

voici le commit correspondant : https://github.com/azd-billal/Chess/commit/cf671c7202dedbfb6df81db5d7baa35de1b0d039

Maintenant que cela a été fait, nous pouvons utiliser cette Strategy dans la classe MyColor qui représente la Strategy qui représente les couleurs.
Dans cette classe on fait donc la même chose en ayant cette fois-ci MyBlackColor et MyWhiteColor.

le commit en question : https://github.com/azd-billal/Chess/commit/b6f927e5974869b52bb1f014cda5c340f94b4173

Maintenant que cela a été fait, nous pouvons utiliser la Strategy MyColor pour les différentes pièces.

commit de cela : https://github.com/azd-billal/Chess/commit/720ac4f4d1a5420214bddbbe8352bea983a510eb

La Strategy MyDirection de MyColor peut aussi être utilisée maintenant (pour simplifier cela je l'ai juste mise dans une variable direction).

commit de cela: https://github.com/azd-billal/Chess/commit/5915d01e5e5fa2f66c20ee6b7aac20d450c05a29

Enfin, puisque le rendu des pièces sur le plateau était différent en fonction de si c'était une pièce de couleur blanche ou non (isWhite), on peut donc laisser
la Strategy MyColor gérer cela.

commit de cela : https://github.com/azd-billal/Chess/commit/c074ac2959b97055b526ec30b9a796d4d877385d

Cette modification m'a pris du temps car je devais toucher à plusieurs classes différentes. J'ai également au cours de l'implémentation de cela remarqué
que, en faisant ces modifications, j'ai dû implémenter un nombre important de méthodes pour le rendu des pièces, ce qui peut donc encore être amélioré.
J'ai remarqué que mon code peut toujours s'améliorer et que faire certaines améliorations peut être au détriment de certaines choses et que
donc parfois il faut faire certains choix.