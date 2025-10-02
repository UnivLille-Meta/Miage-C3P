# REPORT WEEK 3

## Toky Sandratra 

### What I've done this week :
> - Diving into `Hook` and `Template` by practicing with some examples
>
------
### 1- Diving into Hook and Template
> Creating a Class `HotBeverage` with `template method` and `hook`
```
Object << #HotBeverage
	slots: {};
	package: 'TemplateExample'

prepare
	"Here is the template method, the core of the algorithm"
	self boilWater.
	self brew.
	self pourInCup.
	self addCondiments.

pourInCup
	Transcript show: 'Verser dans une tasse';cr

brew
	"Hook : a redefinir dans les sous-classes"
	self subclassResponsibility 

boilWater
	Transcript show: 'Faire bouillir l''eau';cr

addCondiments
	"Hook : par defaut rien mais peut etre redefini"
	Transcript show:'Pas de condiments ajoutes';cr.
```
> Now we define the subclasses Tea and Coffee
- Tea subclass with it methods ( Hook )
```
HotBeverage << #Tea
	slots: {};
	package: 'TemplateExample'

addCondiments 
	Transcript  show: 'Ajouter du citron'; cr.

brew 
	Transcript  show: 'Infuser le the'; cr.
```
- Coffee subclass with it methods ( Hook )
```
HotBeverage << #Coffee
	slots: {};
	package: 'TemplateExample'

addCondiments 
	Transcript  show: 'Ajouter du sucre et du lait'; cr.

brew 
	Transcript  show: 'Infuser le cafe'; cr.
```
---
## Summary :
I red the lectures on `module` `3` and practicing `Hook` , `Template`.
    
  
  
