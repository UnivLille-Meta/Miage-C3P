# Rapport Week 1 

# Section - Mathéo Castre

## ModulePreparation

### Ce que j'ai fait
  
J'ai regardé les vidéos de la playlist https://www.youtube.com/watch?v=I6cwhWyarDk&list=PL2okA_2qDJ-k83Kxu_d8EPzMXtvCrReRn
jusqu'a la vidéo : "Essence du Dispatch: un exercice"
  
J'ai fait l'exercice du counter ou j'ai pu créer mon premier package, la classe Counter ainsi que sa classe de tests.  
  
J'ai vu comment créer des tests et les méthodes correspondantes (en utilisant le debugger comme vu en classe "TDD extrême").
  
J'ai pu utiliser l'outil Iceberg pour faire du gestion de versions et push mon projet sur un repo Gitlab (https://gitlab.com/mc_m1/c3p/counter)

J'ai fait le DSL grâce à ça j'ai pu voir le principe "don't ask tell" (différentes API peuvent reçvoir le même message pour différents objets)


### Ce que je n'ai pas fait
  
Je n'ai pas fait "profStef" car j'ai déjà fait du Pharo en L3 et je trouve que les vidéos sont assez claires.

Et, je n'ai pas fait l'exercice "Flag" par manque de temps.

### Les difficultés rencontrées
  
J'ai eu des difficultés à push sur mon repo gitlab car j'ai voulu utiliser directement le SSH au lieu de HTTPS mais les vidéo sur la playlist montrent uniquement la partie HTTPS.  
   
J'ai dû fouiller un peu dans les parmètres de Iceberg pour bien mettre tout en place pour SSH (les paramètres Metacello et les credentials)  
  
## Lect01-OOP (Fait en binome)
  
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
  
#### Did the examples work as expected?  
  
Le code a fonctionné comme prévu, les différentes opérations sont directement définies dans les classes True et False.  
  
#### What was different between what you expected and what you saw in reality?  

Je connaissais déjà le principe du dispatch grâce au cours de Meta, donc je m'attendais à ce que le comportement soit déterminé par le type de l'objet receveur.  
   
Cependant, le dispatch est utile pour éviter de faire des conditionelle sur les types des objets. On envoie le message à l'objet qui sait comment l'interpréter. (principe de "Don't ask, tell")  
   
Je trouve que le dispatch est un mécanisme très intéressant.  

# Section - Ilyas MOKHTARI

## Module préparation

### ce que j'ai fait

J'ai réalisé l'exercice Counter. J'ai vu comment créer un package avec des classes et comment réaliser une classe test.

J'ai réalisé l'exercice Dice dans lequel j'ai pu comprendre la différence entre méthodes de classe et méthodes d'instance. Par exemple, withFaces: permet de créer un dé avec un nombre de faces donné en paramètre. Une méthode d'instance est appelée sur une instance de la classe, alors qu'une méthode de classe est appelée sur la classe elle-même.

### ce que je n'ai pas fait

J'ai eu un problème de git, pharo ne reconnaissait pas mon dépot git donc j'ai perdu pas mal de temps et je n'ai pas pu réaliser l'exercice FlagTutorial.

Pour régler le problème, j'ai supprimé le dossier Miage-C3P du dossier Iceberg, j'ai recréé un repository et j'ai utilisé l'outil repair repository et ça a fonctionné.

## Lect01-OOP (Fait en binome)

Fait en binôme avec Mathéo

### Ce que j'ai fait

J'ai vu les vidéos : 
"Essence du Dispatch : un exercice (W2S11-FR)"
"Essence de sélection de méthodes 1/2 (W3S1-FR)"
"Essence de sélection de méthodes 2/2 (W3S1-FR)"

J'ai refait l'exemple de True et False pour le dispatch

```
    True >>not
    ^ false

    True >> | aBoolean
    ^ self

    False >>not
    ^ true

    False >> | aBoolean
    ^ aBoolean
```
#### Did the examples work as expected? 

Oui, les exemples ont fonctionné comme je m'y attendais. Je m'attendais à ce résultat car le dispatch permet de choisir quelle méthode va être exécutée selon la classe de l'objet.

#### What was different between what you expected and what you saw in reality?

Il n'y avait pas de différence entre ce que j'attendais et le résultat obtenu.

#### How can you correct your assumptions and how did you find this information?

Je n'ai pas eu à corriger mes suppositions.

## Difficultés

Ce que j'ai trouvé difficile c'est la charge de travail car on devait à la fois faire le travail de préparation et le OOP, ce qui est assez conséquent.