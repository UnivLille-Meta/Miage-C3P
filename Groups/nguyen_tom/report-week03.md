# Rapport hebdomadaire semaine 3

### Ce que j'ai fait
Cette semaine je me suis familiarisé avec le language Pharo et l'interface de l'IDE en regardant beaucoup de vidéos dessus et en interrogeant des IA. J'ai fini par m'entraîner en faisant l'exercice d'implémentation de Not avec les classes Boolean, True, False. 

### Ce que j'ai appris
- Je comprends mieux l'interface, je vois maintenant comment s'organise le code avec le browser, je sais créer des classes et des méthodes.
- J'ai compris le principe des messages, les différents types de messages, dans quel ordre ça s'exécute par défaut.
- J'ai appris quels étaient les différents types, la différence entre string et symbole (en gros un symbole c'est unique alors qu'une chaine de caractère non).
- J'ai compris le cascade operator ";" qui sert à envoyer plusieurs messages à un même objet.
- J'ai appris les spécificités du Pharo comme par exemple le fait que  les attributs des objets soient protégés et que les méthodes soient publiques.
- J'ai appris que super servait à envoyer des messages à la superclasse, mais sans créer de nouvel objet, ce qui explique que self == super donne true. self et super sont les mêmes objets, mais super utilise les implémentations de méthodes de la superclasse.
- Si j'ai bien compris un hook est une méthode que l'on écrit en prévoyant une implémentation par défaut mais qui est faite pour être modifiée, redéfinie par ses sous-classes. Je viens de voir sur une slide que ce qui définirait un hook ça serait envoyer un message à self dans une classe, ce qui permet aux sous classes d'injecter des variations.
- Il y a trois messages différents pour manipuler les objets et les travailler en string : asString qui convertit un objet en chaîne de caractères, printString qui print une représentation de l'objet en string (ce qui se rapproche le plus de toString en Java selon moi) et printOn qui s'utilise dans un flux déjà existant, ce qui permet d'éviter de créer plein de strings et de les concaténer.
- Emmental-oriented programming.
- Eviter les singletons, les objets globaux car ils rendent le code moins modulaire et moins testable.
- Le design pattern Composite sert à composer des objets en structure d'arbres pour représenter des hiérarchies.
- Le but du double dispatch est de faire dépendre une opération de deux types d'objets.
- Le design pattern Visitor utilise le double dispatch pour séparer les opérations des objets visités. Ce qui permet d'utiliser les mêmes opérations sur plusieurs types d'objets différents en ayant des implémentations différentes pour chaque type d'objet.
- Il vaut mieux utiliser le design pattern Visitor lorsque le domaine n'est pas susceptible de changer parce que sinon lorsque le domaine change, il faut mettre à jour tous les visitors.
