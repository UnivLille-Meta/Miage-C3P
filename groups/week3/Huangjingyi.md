Rapport

1. Exercices sur la distribution de messages

Exemple 1

5 factorial.    
'abc' reversed. 
(10@20) y.

Attentes

5 factorial → 120.

'abc' reversed → je pensais que les chaînes n’avaient pas cette méthode, donc peut-être une erreur.

(10@20) y → 20.


Résultats

5 factorial = 120, correct.

'abc' reversed = 'cba' → surprise pour moi, ça marche directement.

(10@20) y = 20, conforme à l’attente.

Exemple 2

100 even.       
'Pharo' at: 3.  
(2@3) * 2.

Attentes

100 even → true.

'Pharo' at: 3 → 'a'.

(2@3) * 2 → je pensais que cela provoquerait une erreur, car multiplier un point par un entier ne me semblait pas logique.


Résultats

100 even = true, rien d’étonnant.

'Pharo' at: 3 → 'a', comme prévu.

(2@3) * 2 = (4@6) → je ne m’y attendais pas. En fait, le point est multiplié coordonnée par coordonnée, ce qui sert comme opération d’échelle.

Exemple 3

true ifTrue: [ 'yes' ] ifFalse: [ 'no' ].
false ifTrue: [ 1 ] ifFalse: [ 0 ].

Attentes

Le premier → 'yes'.

Le deuxième → 0.


Résultats

Exactement comme prévu.

Mais j’ai compris quelque chose : en Pharo, ifTrue:/ifFalse: ne sont pas des mots-clés, mais des messages envoyés aux objets booléens. C’est différent de ce que je croyais au départ.


2. Réflexion

Différences
Certaines opérations étaient plus riches que ce que j’imaginais : l’inversion de chaîne fonctionne, la multiplication d’un point aussi. J’attendais des erreurs mais j’ai obtenu des résultats cohérents.

Ce que j’ai appris
Ne pas se fier uniquement à l’intuition : il vaut mieux tester et explorer les méthodes dans le navigateur de classes.


