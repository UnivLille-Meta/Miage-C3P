# DEVINCK Thomas

Le premier travail effectué cette semaine est l'exercice effectuer en cours, le but était de faire du reverse engineering sur la classe `LRUCache` afin de comprendre son fonctionnement. De ce que j'ai compris le LRUCache est une structure qui stocke des paires de clé - valeur en supprimant les éléments les moins récemment utilisés lorsque la capacité est atteinte. Sa fonction principale est `at:ifAbsentPut:` qui permet de lire ou créer une valeur manquante. Cette exploration m'a permis de comprendre le but du reverse engineering en se concentrant sur l'essentiel sans se perdre dans les détails.

J'ai également regarder les vidéos M6-1 et M6-2 par rapport au double dispatch.

Dans la vidéo M6-1 l'exemple du jeu Pierre papier ciseaux démontre l'utilisation du double dispatch. Il montre comment deux objets peuvent collaborer pour déterminer un résultat sans utiliser de conditons.Chaque classe connait seulement ses propres comportements et délègue la décision finale à l'autre objet grâce à l'envoi de masse, cela permet de rendre le code plus adaptable et plus clair. Pour comprendre j'ai effectuer l'exemple de mon côté. Voici le repo : https://github.com/thomasdvck/C3P-DoubleDispatch

Dans la vidéo M6-2 on apercoit que le double dispatch est vraiment intéressant pour remplacer les structures conditionnelles complexes, avec le double dispatch chaque objet peut réagir différemment selon son contexte. Dans ce contexte on aperçoit bien qu'on est passé d'une solution comportant beaucoup de if imbriquées difficiles à maintenir à une solution extensible et modulaire, chaque objet sait comment agir ou se dessiner sans que la logique soit directement dans la vue.

J'ai également relu et revu les notions vues lors du report_week2 avec le dispatch, self et super. J'avais déjà réalisé un exercice pratique avec les classes Equipe, LOSC et PSG, cela m'avais permis de confirmer les notions de self et super.

Enfin avec baptiste nous avons commencé à explorer le projet Chess afin de préparer notre kata sur le "Remove Nil Checks". Nous avons commencer par un travail de reverse engineering pour comprendre la structure et la logique générale du code. Nous avons commencé à identifier les zones critiques ou des nil checks sont présent et avons remarqué que les nil checks compléxifie le code existant.Pour les prochaines étapes, nous prévoyons d’écrire des tests unitaires pour mieux comprendre le comportement existant et proposer des refactorings afin de remplacer les nil checks

# DELISLE Baptiste

super permet d’appeler une méthode de la superclasse, mais dans le même contexte que self. Cela signifie que l’objet reste le même, seul le lookup change

	
Object subclass: #Animal
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'MonPackage'.

Animal >> parler
    ^ 'Je suis un animal.'

Animal subclass: #Chien
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'MonPackage'.

Chien >> parler

Chien new parler. "=> 'Je suis un animal. Et je suis un chien.'"

Super appelle parler dans Animal, puis ajoute du texte dans Chien.

Object subclass: #Vehicule
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'MonPackage'.

Vehicule >> description
    ^ 'Ceci est un véhicule.'

Vehicule subclass: #Voiture
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'MonPackage'.

Voiture >> description
    ^ super description , ' C’est une voiture.'

Voiture subclass: #VoitureDeSport
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'MonPackage'.

VoitureDeSport >> description
    ^ super description , ' Et elle est sportive.'


VoitureDeSport new description.
"=> 'Ceci est un véhicule. C’est une voiture. Et elle est sportive.'"

Chaque appel à super remonte d’un niveau dans la hiérarchie, mais garde le même objet (self).

Concernant les vidéos à regarder :

M6-1 “A double dispatch starter: Stone Paper Scissors”
Ce document introduit le principe du double dispatch via le jeu Pierre-Feuille-Ciseaux. On demande d’implémenter Stone new vs: Paper new pour donner #paper sans utiliser de conditions explicites. L’idée est de déléguer à l’argument un message (playAgainstStone) pour choisir la bonne interaction. Le patch montre comment éviter les if/else, en utilisant le polymorphisme à deux étapes.

M6-2 “Double dispatch: Does not have to be symmetrical”
Ce document montre que le double dispatch ne nécessite pas que l’opération soit symétrique (c’est-à-dire que l’ordre des arguments n’ait pas toujours le même rôle). Il explore comment structurer les appels pour des cas non symétriques tout en conservant la modularité. Cela permet de mieux adapter le double dispatch à des domaines où l’interaction entre objets n’est pas “équivalente” dans les deux sens.