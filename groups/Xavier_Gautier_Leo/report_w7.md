# Week 7 report

# Sommaire
- [Léo Defossez](#léo-defossez)
- [Gautier Louvier](#Gautier-Louvier)
- [Xavier Moyon](#Xavier-Moyon)

## Léo Defossez
> ### Practice message dispatch
> Code disponible [ici](https://github.com/LeoDefossez/C3P_projects/tree/main/src/MyAnimals)
> #### Super vs self
> ##### First example
> ```
> Object << #MyAnimal
> MyAnimal << #MyCat
> MyAnimal << #MyDog
> 
> MyAnimal >> genericDescription
>	^ 'I am an animal'
>
> MyCat >> description
>	^ self genericDescription , ' (a Cat)'
> 
> MyDog >> description
>	^ super genericDescription , ' (a Dog)'
> ```
> MyAnimal new genericDescription `'I am an animal'`  
> MyCat new genericDescription `'I am an animal'`  
> MyDog new genericDescription  `'I am an animal'`  
> MyCat new description `'I am an animal (a Dog)'`  
> MyDog new description `'I am an animal (a Cat)'`  
> 
> Ici comme ni MyCat ni MyDog vont redéfinir la méthode genericDescription, MyCat new description et MyDog new description appellent tous deux la méthode genericDescription de MyAnimal.
> 
> ##### Second example
>  ```
> Object << #MyAnimal
> MyAnimal << #MyCat
> MyCat << #MyMaineCoon
> MyMaineCoon << #TheVeryBigMaineCoon
> 
> MyAnimal >> genericDescription
>	^ 'I am an animal'
>
> MyCat >> description
>	^ self genericDescription , ' (a Cat)'
> 
> MyMaineCoon >> description
>  ^ super genericDescription
> 
> MyMaineCoon >> genericDescription
>  ^ 'I am the biggest of my species'
> 
> TheVeryBigMaineCoon >> description
> ^ self genericDescription
> ```
> 
> MyMaineCoon new description `'I am an animal'`  
> TheVeryBigMaineCoon new description `'TheVeryBigMaineCoon'`  
> 
> Ici malgré le fait que l'ont redéfini genericDescription dans MyMaineCoon, il n'est pas utilisé. Car MyMaineCoon new description, utilise genericDescription de son parent, étant donc MyAnimal >> genericDescription.
> 
> Cependant, lorsque l'on appelle TheVeryBigMaineCoon new description, on utilise la méthode MyMaineCoon >> genericDescription
> 
> #### Hook
> 
>```
> MyAnimal >> food
>  ^ 'I eat ', self alimentation
>
> MyCat >>alimentation
> ^ 'fish'
>
> MyDog >> alimentation
> ^ 'everything my owner gives'
>```
>
> MyAnimal new food `message not understood error`  
> MyCat new food. `'I eat fish'`  
> MyDog new food. `'I eat everything my owner gives'`
  
## Gautier Louvier
> Aucune activité à rapporter pour cette semaine en raison d'une absence pour motif médical couvrant l'intégralité de la période.
> Les justificatifs nécessaires ont été transmis au secrétariat pédagogique.

## Xavier Moyon
> Lors d'un Refactoring, pour lorsque qu'un  bout de code est dupliqué, on va pour faire nos modifications sans casser les tests, extraire sans une sous méthode la partie dupliquée afin de la changer partout.
Ensuite lorsque l'on doit traiter le cas d'une suite de conditions ou d'un switch il ne faut pas tout retirer, mais retirer les conditions les unes après les autres.
> Le design pattern composite permet de représenter des architecture / arborescence, avec on peut faire effectuer une même action à toutes l'arborescence sans aucunes verification de types.
> Le state design pattern consiste à créer des objet pour chaque état d'un élément, chaque statut, contient la/les méthodes accessibles dans cet état, ainsi pas besoin de faire de vérifications sur l'état.
> Le command pattern consiste au lieu de faire un switch case sur un champ pour déterminer quelle commande doit être exécutée, consiste a créer un objet pour chaque commandes avec une méthode d'exécution ayant un nom commun. Ainsi dans notre méthode on peut récupérer l'objet de commande via un équivalent de "fabrique" et puis appeller la méthode d'exécution commune à toutes les commandes. Un des problèmes se ce design est qu'il peut entraîner la création de beaucoup de classes
 