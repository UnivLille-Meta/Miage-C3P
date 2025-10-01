## Gautam Demeulemeester
La semaine dernière j'ai avancé sur la partie 2 du Rover en pair-programming en ajoutant la fonctionnalité de reculer. Nous avons aussi ajouter le fait de pouvoir renseigner les dimensions du plateaux. Tout cela était accompagné de tests que nous avons su faire passer.

Pour cette semaine je me suis intéréssé au design-patter Template Method que j'avais déja utilisé en Java. Template Method permet de redefinir des methodes d'une classe en utilisant l'héritage. On imagine une première classe :
```
Object << #AbstractClass
	slots: {};
	sharedVariables: {};
	package: 'TMExemple'

AbstractClass >> templateMethode
    self first.
    self second.
    self third.

AbstractClass >> first
    Transcript show: '1'; cr.

AbstractClass >> second
    self subclassResponsibility.

AbstractClass >> third
    Transcript show: '3'; cr.
```
Et une deuxième classe qui hérite de AbstractClass :
```
Object << #ConcreteClass
	slots: {};
	sharedVariables: {};
	package: 'TMExemple'

AbstractClass >> second
    Transcript show: '2'; cr.
```
Ainsi un appel à templateMethode faudra :
```
ConcreteClass new templateMethode.
```
