## Module 1 – Comprendre l’envoi de messages
### Booléens

J’ai commencé avec les Booléens et appris à implémenter la méthode not dans les classes True et False.
J’ai également compris que true et false sont des instances de leurs classes respectives.
```smalltalk
True >> not
    ^ false

False >> not
    ^ true
```
Méthode OU (|)

Dans False, la méthode retourne toujours l’argument :
```smalltalk
false | anything   "→ anything"
```

Dans True, la méthode retourne toujours le receveur :
```smalltalk
true | anything    "→ true"
```

L’envoi de message dépend de la classe qui définit la méthode, ce qui évite les conditions if explicites.
La hiérarchie des classes permet le dispatch automatique : si un objet ne possède pas la méthode, elle est cherchée dans la superclasse.
L’envoi de message est extensible : on peut créer de nouvelles classes avec leurs propres réponses au même message sans modifier l’ancien code.

### Héritage

J’ai appris que l’héritage permet de réutiliser le code des superclasses sans le réécrire et de ne modifier que ce qui change (le “delta”).

Exemple : Dog hérite de Animal.
Pour changer le comportement de Dog, on ne redéfinit que les méthodes spécifiques, sans toucher à Animal.
```
Light >> turnOn
    ^ 'La lumière est allumée'
```
```
RedLight >> turnOn
    ^ 'La lumière rouge est allumée'
```
```
GreenLight >> turnOn
    ^ 'La lumière verte est allumée'
```

Quand on envoie le message turnOn à une instance, l’objet décide lui-même quelle méthode exécuter, sans avoir besoin de vérifier le type avec if.

Héritage des variables et du comportement

Variables d’instance : héritées lors de la définition de la sous-classe.
Exemple :
```
Rectangle → variables width, height

RedRectangle → hérite de Rectangle et ajoute color
→ RedRectangle possède donc width, height et color.
```
Comportement (méthodes) : hérité à l’exécution.
Si une méthode n’existe pas dans la sous-classe, Pharo la cherche dans la superclasse.

### Héritage et Lookup : self

En Pharo, l’envoi de messages se fait en deux étapes :

Lookup : Pharo cherche la méthode correspondant au message dans la classe de l’objet.
Si elle n’existe pas, la recherche remonte dans les superclasses.

Execution : La méthode trouvée est exécutée sur l’objet récepteur.

L’objet décide lui-même quelle méthode exécuter — principe du “Do not ask, tell”.

### Exemple avec Light
```
Object subclass: #Light
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Demo'
```
```
Light >> turnOn
    ^ 'La lumière est allumée'
```
```
Light subclass: #RedLight
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Demo'
```
```
RedLight >> turnOn
    ^ 'La lumière rouge est allumée'
```
```
Light subclass: #GreenLight
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Demo'
```
```
GreenLight >> turnOn
    ^ 'La lumière verte est allumée'
```

Test dans Playground :
```

| red green generic |

red := RedLight new.
green := GreenLight new.
generic := Light new.

red turnOn.      "→ 'La lumière rouge est allumée'"
green turnOn.    "→ 'La lumière verte est allumée'"
generic turnOn.  "→ 'La lumière est allumée'"
```
## Comprendre self en Pharo
### Que représente self ?

self est une référence à l’objet courant qui reçoit le message.
En Java, self correspond à this.

### Comment une méthode est-elle recherchée lorsqu’un message est envoyé à self ?

Pharo cherche d’abord dans la classe de l’objet courant.

Si elle n’est pas trouvée, la recherche remonte la hiérarchie jusqu’à Object.

Une fois trouvée, la méthode s’exécute avec self qui fait toujours référence à l’objet initial.

Exemple pratique
```
Object subclass: #A [
    A >> foo
        ^ 10

    A >> bar
        ^ self foo
]

A subclass: #B [
    B >> foo
        ^ 50
]
```

Test dans Playground :
```
aB := B new.
aB bar.   "→ 50, car bar envoie le message foo à self (instance B)."
```
###
Dans ce module, j’ai regardé toutes les vidéos et étudié le fonctionnement de self et super en Pharo.
J’ai compris que l’envoi de message dépend entièrement du receveur et j’ai distingué l’héritage statique et dynamique.
Le cas d’étude sur Pillar m’a aidée à voir comment rendre un code plus modulaire et extensible.