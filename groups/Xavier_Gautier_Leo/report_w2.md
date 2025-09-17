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
>
### Question
> J'ai essayé d'ajouter le svg au presenter EarthCountryBrowser, en ajoutant de la même façon que l'image, mais en utilisant un presenter instantié par self newRoassal.  
> Voici les 4 méthodes impactées par ce changement. 
> ```
> EarthCountryBrowser << defaultLayout
>
>	^ SpBoxLayout newTopToBottom
>		  add: (SpBoxLayout newLeftToRight
>				   add: countryList expand: true;
>				   add: countryCode width: 40)
>		  height: self class toolbarHeight;
>		  add: countryFlag height: 350;
>		  add: countrySvg height: 350;
>		  yourself
> ```
> ```
> EarthCountryBrowser << initializePresenters
> ...
> countryFlag := self newImage.
> countrySvg := self newRoassal
> ```
> ```
> EarthCountryBrowser << onCountrySelected: countryItem
>
>	countryCode text: ' ' , countryItem code.
>
>	countryFlag image: (self flagForCountryCode: countryItem code).
>	countrySvg canvas: (self canvaForSvg: countryItem svgPath)
> ```
> ```
> EarthCountryBrowser << canvaForSvg: aSvgPath
>	| c svg |
>	c := RSCanvas new.
>	svg := RSSVGPath new
>		       color: Color blue;
>		       svgPath: aSvgPath.
>	c add: svg.
>	c @ RSCanvasController.
>	^ c   
>```
> En suivant le debugger, j'ai pu comprendre que la génération du canvas et du SpRoassalPresenter ne présentais pas de problèmes.  
> Cependant après plus d'une heure à essayer de comprendre quel était le problème sans trouver de solutions, j'ai décidé d'abandonner et poser la question suivante :
> Pourquoi le SpRoassalPresenter n'affiche rien alors que le RSCanvas semble correctement généré ?
