# Rapport - Pattern Visitor

## 1. Qu’est-ce que le Visitor ?
Le design pattern Visitor permet d’ajouter des opérations sur une structure d’objets sans modifier les classes du domaine.
L’idée centrale est simple :
- Les objets du modèle acceptent un visiteur via acceptVisitor:
- Le visiteur contient la logique et décide quoi faire selon le type de l’objet.
- Le mécanisme utilise le double dispatch, expliqué dans le cours :
l’objet appelle une méthode du visiteur, et le visiteur exécute le bon comportement `sans if`, `sans test de type`.

En résumé :
Le Visitor sépare complètement le `"quoi faire"` (visiteur) du `"à quoi cela s’applique"` (domaine).

## 2. Pourquoi l’utiliser ?
Visitor est utile quand :
- on a une structure d’objets hiérarchique --->>> typiquement un Composite (arbre, expression, document, fichier, ... ).
- on doit effectuer plusieurs opérations différentes sur cette structure, par exemple :
  - évaluer une expression
  - imprimer
  - générer du code
  - calculer une taille

Sans Visitor, le domaine explose : beaucoup de méthodes, mélange de logique, duplication. 

Avec Visitor :
- chaque opération devient une classe séparée (Evaluator, Printer…)
- on peut ajouter de nouveaux visiteurs sans toucher au domaine
- le code est plus modulaire et maintenable.

## 3. Comment cela fonctionne ?
D’après le cours, il y a trois étapes clés :

- 1 Instrumenter le domaine
- 2 Définir le visiteur : Un visiteur est une classe qui implémente les méthodes 
- 3 Double dispatch

## Exemple
## 1. Domaine (les objets visitables)
Classe Message
```smalltalk
Message >> acceptVisitor: aVisitor
    ^ aVisitor visitMessage: self

```
Classe Image
```smalltalk
Image >> acceptVisitor: aVisitor
    ^ aVisitor visitImage: self
```
Aucune logique ici seulement l’envoi du bon message au visiteur.

## 2. Visiteur 1 : générer un résumé
```smalltalk
SummaryVisitor >> visitMessage: msg
    ^ 'Message: ', msg text

SummaryVisitor >> visitImage: img
    ^ 'Image ', img width asString, 'px'
```
## 3. Visiteur 2 : calculer la taille
```smalltalk
SizeVisitor >> visitMessage: msg
    ^ msg text size

SizeVisitor >> visitImage: img
    ^ img width

```
## 4. Utilisation du Visitor
```smalltalk
objects := {
    Message text: 'Hello'.
    Image width: 400 }.

summary := objects collect: [:o | o acceptVisitor: SummaryVisitor new ].
sizes := objects collect: [:o | o acceptVisitor: SizeVisitor new ].

```
## Résultat

```
  Message: Hello
  Image 400px
``` 
`sizes` devient :
  ```
    5
    400
  ```

## Pourquoi cet exemple est parfait ?
- Il montre le double dispatch simplement.
- Les classes du domaine restent simples.
- Les comportements sont ajoutés dans des visiteurs séparés.
- Il est très court et entièrement compréhensible même par un débutant.

## Résumé court du rapport
- Le Visitor sépare les opérations du modèle.
- Il utilise le double dispatch pour exécuter la bonne méthode sans condition.
- Il fonctionne parfaitement avec les structures en Composite.
- Il rend l’ajout de nouveaux comportements simple et propre.
- Il améliore fortement la modularité et la maintenabilité.

