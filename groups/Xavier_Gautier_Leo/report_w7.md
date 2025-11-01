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
> TODO
>
> 

## Xavier Moyon
> TODO
> 
> 