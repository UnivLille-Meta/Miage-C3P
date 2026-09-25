# Practice Message Dispatch

## 1. Message dispatch

J’ai essayé de comprendre le fonctionnement du *message dispatch* avec des exemples simples.

Par exemple :

true not


ici, on envoie le message `not` à l’objet `true`. `true` est une instance de `True`, donc Pharo cherche la méthode `not` dans cette classe.

True >> not
    ^ false


ensuite j'ai vu aussi les autres exemples qu'il y avait dans le pdf (or ...etc), le principe reste le meme !

Le dispatch fonctionne en deux étapes :

1. **Lookup** : chercher la bonne méthode dans la classe du receveur puis ses classes supérieures.
2. **Exécution** : exécuter la méthode trouvée.

## 2. `self` et `super`

J’ai aussi testé la différence entre `self` et `super`.

`self` représente toujours le **receveur du message**. Le lookup commence dans sa classe.

`super` représente également le même receveur, mais le lookup commence directement dans sa **classe supérieure**.

self bar
super bar


La différence c'est juste **l’endroit où commence le lookup**.

## 3. Ce que j’ai compris

Au début, je pensais surtout en termes de fonctions comme en java, En pharo, il faut plutot penser :

> **On envoie un message a un objet, et pharo cherche la méthode correspondante**

Les exemples m’ont permis de mieux comprendre le rele du receveur, du lookup, de `self` et de `super`, en particulier avec les implementation du cours ...


