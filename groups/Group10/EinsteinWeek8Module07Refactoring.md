# Rapport de la semaine 8- Refactoring -- Einstein
## 1. Qu’est-ce que le refactoring ?
Le refactoring consiste à améliorer la structure interne du code sans changer son comportement.
En Pharo, cela signifie rendre le code plus clair, plus simple et plus cohérent, tout en gardant la même fonctionnalité.

## 2. Pourquoi le faire ?
- Pour simplifier un code devenu compliqué.
- Pour supprimer la duplication.
- Pour rendre le système plus facile à tester et à faire évoluer.
- Pour respecter les principes OO (responsabilités, encapsulation, polymorphisme).

## 3. Comment le faire dans Pharo ?
Pharo facilite le refactoring grace à :
- le browser pour renommer, déplacer et extraire des méthodes,
- l’inspecteur pour comprendre le comportement en direct,
- les tests unitaires pour valider chaque changement,
- l’outil de refactoring intégré (rename, extract method ...).
Le refactoring se fait par petites étapes, toujours en vérifiant que le système continue de fonctionner.

## 4. Exemple simple
Avant Refactoring 
```smalltalk
order totalWithTax
    ^ (self subtotal + self shippingCost) * 1.15
```
Ce que fait ce code
- Il calcule le total d’une commande (order) en ajoutant :
  - le prix des articles (subtotal)
  - le prix de livraison (shippingCost)
- Puis il applique une taxe de 15 % (1.15).
- Le résultat est le total final à payer.

Après Refactoring  :
```smalltalk
  order totalWithTax
      ^ (self totalBeforeTax) * taxRate
  
  order totalBeforeTax
      ^ self subtotal + self shippingCost
  
  order taxRate
      ^ 1.15
```

Ce que fait le code maintenant
- `totalBeforeTax` calcule le total avant taxe :
 ` subtotal + shippingCost`
- `taxRate` renvoie la taxe (15 % = 1.15)
- `totalWithTax` combine les deux :
  `(totalBeforeTax) * taxRate`


## En résumé
- Le code fait exactement la même chose qu’avant, mais en étant :
- plus clair,
- plus lisible,
- plus facile à tester,
- plus facile à modifier (ex : changer la taxe).
