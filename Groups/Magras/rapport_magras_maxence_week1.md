# Rapport Week 1

## Module Preparation

### Ce que j'ai fait

J'ai revu rapidement les cours et j'ai fait l'exercice DSL, j'ai ensuite regardé les premières vidéos de cours.
Tout ça n'était que de la révision des cours de Meta de L3 pour moi.

### Ce que je n'ai pas fait

Le counter, simplement car je voulais passer directement au DSL car j'avais déjà les bases des cours de Meta.

## Lect01-OOP

### Examples

```  
True >> | aBoolean 
     ^ true 
  
True >> not 
     ^ false 
  
False >> | aBoolean 
     ^ aBoolean 
  
False >> not 
     ^ true 
```

J'ai effectué l'exemple des booléens et un exemple d'aires géométriques :

```
Rectangle >> width: aWidth height: aHeight
	width := aWidth.
	height := aHeight

Rectangle >> area
	^ width * height

Square >> side: aSide
	side := aSide

Square >> area
	^ side * side

Circle >> radius: aRadius
	radius := aRadius

Circle >> area
	^ Float pi * (radius squared)
  
```

### Did the examples work as expected ?

Oui.

### What was different between what you expected and what you saw in reality?

Rien car c'est un cours que j'ai déjà eu l'année dernière, c'était donc des révisions pour ma part.
