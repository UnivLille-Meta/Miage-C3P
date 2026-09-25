
J’ai révisé plusieurs notions importantes de Pharo..

## 1. Les méthodes de classe et les métaclasses

- Une classe est aussi un objet.
- Chaque classe a sa propre classe et on l’appelle métaclasse.
- Les méthodes de classe et les méthodes d’instance utilisent le même système de recherche de méthode.
- Quand on envoie un message à une classe pharo cherche la méthode dans la métaclasse.

## 2. Le mot-clé `super`

- `self` et `super` pointent vers le même objet.
- La différence se trouve dans la recherche de la méthode :
  - Avec `self`, Pharo commence à chercher dans la classe de l’objet.
  - Avec `super`, pharo commence à chercher dans la superclasse de la classe où se trouve le code.

donc pour la question importante vue en cours :
A >> foo
    ^ super class == self class cela done true car self et super sont le même objet, donc self class et super class renvoient la même classe.


## 3. Le Double Dispatch

- Au lieu de faire beaucoup de `if` pour savoir de quel type d’objet il s’agit, on envoie un message à l’objet.
- L’objet décide ensuite quel message renvoyer.
- on fait un appel comme : objetA faireQlqChose: objetB  (faireQlqChose: ex : vs: de lexo de stone paper scissors)

Pharo regarde principalement la classe de objetA pour savoir quelle méthode appeler. et avec le double dispatch, on va faire un deuxième envoi de message à objetB. c'est ce deuxième appel qui permet de prendre en compte les deux objets.

- Avec le double dispatsh, on va faire un deuxième envoi de message à objetB. C'est ce deuxième appel qui permet de prendre en compte les deux objets.
---

## 4. Début du TP Chess

- je vais commencer le tp sur le jeu d’échecs. J’ai installé le projet , j’ai lancé le jeu pour voir l’échiquier..
---
