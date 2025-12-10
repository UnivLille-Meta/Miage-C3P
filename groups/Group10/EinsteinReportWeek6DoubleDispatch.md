# Rapport - Module 6 : Double Dispatch (fait par Einstein)

## Objectif du module 
Ce module vise à comprendre et a mettre en pratique le `doublee dispatch`, un mécanisme clé du `Visitor Pattern` et du `Polymorphisme avancé` en programmation orientée objet.

Les exercices consistent a :
- Implémenter le double dispatch sur l'exemple `Die / DieHandl`
- Reproduire ce principe avec le jeu ` Rock-Paper-Scissors `
- 
## 1. Compréhension du double dispatch
L'idée fondamentale est : ` "Let the receiver decide" `
- Envoyer un message permettant a l'objet receveur de décider du comportement.
- Le client n'a plus besoin d'utiliser de conditions (`if`, `case`).
- Le code devient déclaratif : on donne des ordres, sans controler le flux
- Différents receveurs peuvent être substitués dynamiquement

Aisi, en évitant les conditionnels, on délègue la logique de décision aux objets
Ce qui rend le système modulaire, extensible et flexible. 

## 2. Principe du Double Dispatch
Le double dispatch permet a deux objets de participer a la décision du comportements éxécuté.

Exemple : 

```
aBlock drawnOn: aCanvas view: self
```
- `aBlock` (le modele) sait se dessiner sur `aCanvas` .
- `aCanvas ` (la vue) sait comment afficher le type concret du bloc.
 On élimine les "too  many ifs ..." et on les remplace par des interactions polymorphes:
```
Wall >> drawnOn: aCanvas view: aView
  aView drawWall : aCanvas
```
chaque object sait quoi faire et a qui déléguer la suite du message

## 3. Exemples appliqués
- `Die/DieHandle` : chaque dé envoie un message spécifique au gestionnaire pour définir le résultat du lancer.
- Rock-Paper-Scissors :

```
Rock >> play: aShape
  ^aShape playRock
```
Chaque type d'objet réagit selon la combinaison rencontrée, sans condition.

## 4. Bénéfices 
## Criteres                         Résultat

- Lisibilité                       Code sans `if`,   plus et déclaratif
- Réutilisabilité                  Coportements isolés et indépeendants
- Extensibilité                    Support naturel pour de nouveaux cas
- Modularité                       Nouvelles classes ajoutées sans casser les existantes

## 5. Concepts clés vus dans les vidéos
- Avoid Conditionals : utiliser des objets et des messages plutot que des `if`
- Sending messages is powerful : la puissance vient du polymorphisme dynamique
- Double dispatch = variation point : crée une extension sans modifier le coeur du code
- Modular design : chaque responsabilité est clairement localisée
- Can be asymmetrical : les deux objets impliqués n'ont pas besoin d'etre de même type.

## 6. Conclusion 
Le double dispatch est une maniere élégante de remplacer les décisions conditionnelles par du polymorphisme explicite. 
Il favorise un code plus modulaire, ouvert a l'extension et facile a maintenir.

Cette approche prépare a la compréhension du `Visitor Patternn`, qui repose sur le meme principe de délégation dynamique.

## resources :
- `https://www.youtube.com/watch?v=3j5uQTztRPA`
- `https://advanced-design-mooc.pharo.org/#module6`
