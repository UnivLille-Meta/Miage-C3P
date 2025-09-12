# Week 2 report

## Léo Defossez

### Think about how to implement the boolean methods `|`, `or:`, `ifTrue:ifFalse:`.

> Les trois méthodes sont basées sur le dispatch.  
> Ces implémentations suivent le principe OOP suivant : **Tell, Don't-Ask**. Ce principe utilise la liaison tardive pour réduire le nombre de conditionnels.
> #### `|`
> ```
> Boolean << | aBoolean
>   self subClassResponsibility
> 
> 
> True << | aBoolean
>   ^ self
> 
> 
> False << | aBoolean
>   ^ aBoolean
> ```
> 
>  #### `or:`
> ```
> Boolean << or: aBlock
>   self subClassResponsibility
> 
> 
> True << or: aBlock
>   ^ self
> 
> 
> False << or: aBlock
>   ^ aBlock value
> ```
> 
> #### `ifTrue:ifFalse:`
> ```
> Boolean << ifTrue: aBlock ifFalse: anotherBlock
>   self subClassResponsibility
> 
> 
> True << ifTrue: aBlock ifFalse: anotherBlock
>   ^ aBlock value
> 
> 
> False << ifTrue: aBlock ifFalse: anotherBlock
>   ^ anotherBlock value
> ```

### Lookup exercice

> Les deux définitions suivantes résument `super`, en comprenant celles-ci, il est simple de comprendre les exercices 
> - super refers to the receiver of the message (just like self)
> - The method lookup starts in the superclass of the class containing the super
expression

### `self == super` 
> Cette instruction sera toujours évaluée à true car super fait référence au receveur du message, comme le fait self

### Exercices
> Les deux exercices (DSL et Flags.pdf) sont présents sur ce dépot github : https://github.com/LeoDefossez/C3P_projects