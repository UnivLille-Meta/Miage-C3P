### Semaine 1

### Prise en main de pharo

J'ai commencé cette première semaine par l'installation et la prise en main de Pharo. Pour cela, j'ai d'abord réalisé l'exercice Counter présent sur le Git du cours. J'ai donc réussi à implémenter l'addition ainsi que la soustraction.

Après cela, j'ai décidé d'y ajouter la multiplication entre deux nombres. J'ai réalisé cela en commençant par la réalisation des tests (TDD), comme le professeur nous l'avait recommandé, et j'ai trouvé cela beaucoup plus simple que prévu.

Pour la multiplication, je n'avais pas tout de suite compris que dans : 

```bash
multiply: anInteger
```

anInteger représente en fait le paramètre que notre méthode prend en entrée, ce qui m'a fait perdre un peu de temps.

J'ai donc décidé par la suite de réaliser le tutoriel ProfStef présent directement dans Pharo ainsi que de suivre le cours de préparation présent dans le Git (j'en suis pour l'instant au module 0) avant de réaliser l'exercice sur FlagCountry pour ne plus perdre de temps comme precedemment.

Je n'ai pas encore fait DSL par manque de temps, mais je compte le faire plus tard, j'ai cependant fini FlagCountry.

Concernant le module 0, je n'ai pas pu tout voir, mais je me suis surtout concentré sur des points qui me paraissent importants, et notamment sur la partie des blocks.
J'en ai compris qu'un bloc est, comme il est dit dans le cours, une sorte de méthode anonyme (de ce que j'ai compris, anonyme car elle n'a pas de nom comme une méthode normale) qui est délimitée par [ ]. Le code y est stocké et peut être exécuté en utilisant value.


### HomeWork

1) 

Voici les méthodes que j'ai implémentées pour challenger mes connaissances sur le dispatch :

Pour myFalse : 

```bash
And: aConstantBlockClosure 
	^ self.

Or: aConstantBlockClosure 
	^ aConstantBlockClosure value.
	
ifTrue: True ifFalse: False
	^ False.

pipeOperator: aBoolean 
	^ aBoolean value.
```

Pour myTrue :

```bash
And: aConstantBlockC 
	^ aConstantBlockC value.
	
Or: aConstantBlockClosure 
	^ self.
	
ifTrue: aBoolean ifFalse: aBoolean2 
	^ aBoolean.
	
pipeOperator: aBoolean 
	^ self.
```

Quand j'utilise des value, c'est parce que dans mes tests j'avais utilisé des blocs.

2)

Tous mes exemples ont bien fonctionné, sauf pour le ifTrue:ifFalse: de myFalse quand j'ai utilisé des blocs (j'avais mis value dans la méthode), je ne sais pas pourquoi cela ne marchait pas.

3)

Ce que j'ai pu voir, c'est qu'aucun if else n'a été utilisé, contrairement à ce que j'aurais pu faire quand je débutais en programmation, mais c'est bien l'objet lui-même qui décide quoi faire (ici, si c'est l'objet true, ce sera la méthode qui lui est associée qui va être utilisée).

4)

J'ai découvert cela l'année dernière grâce au cours de COO (et notamment grâce aux design patterns qui n'utilisent pas de if else, comme le pattern Strategy par exemple) et au cours de génie logiciel.


