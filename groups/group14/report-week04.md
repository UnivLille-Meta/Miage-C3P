# Olivia
## Template method
Le design pattern **template method** permet de définir une méthode de base dans la classe mère et de redéfinir des comportements de l'algorithme dans les sous-classes.
Par exemple, nous avons une classe _Character_ qui va implémenter la méthode _play_ :
```
Character >> play
	
	^(self move , self collectObjects )
```
Cette méthode appelle les méthodes _move_ et _collectObjects_ qui vont retourner des messages. Ces méthodes ne sont pas créées dans la classe _Character_ mais dans les sous-classes _Witch_ et _Knight_.
```
Knight >> move
	
	^'The knight rides a horse.'.

Knight >> collectObjects
	
	^'The knight collect flags.'.

Witch >> move
	
	^'The witch flies on a broom.'.

Witch >> collectObjects
	
	^'The witch collects potions.'.
```
Quand la méthode _play_ sera appelée, elle retournera le message correspondant à l'objet de référence.
```
| witch knight |
witch := Witch new.
knight := Knight new.

witch play.              "renvoie le message 'The witch flies on a broom.The witch collects potions.'"
knight play.             "renvoie le message 'The knight rides a horse.The knight collect flags.'"
```
Nous pouvons imaginer ajouter une autre Character, par exemple Pirate, qui se déplace en bateau et qui collecte des trésors, sans devoir modifier les méthodes déjà existantes. 
Le **template method** permet d'éviter d'avoir plusieurs méthodes dont la logique et la structure sont les mêmes mais que certains comportements diffèrent.

[Lien github Exemple template method](https://github.com/olivia-lang/template-method)

# Julien
## Template Method

Template Method est un design pattern est catégorisés comme un Behavioral patterns c'est à dire qu'il s'occupent des algorithmes et de la responsabilités entre les objets.

Le but de ce pattern est d'avoir un algorithme dans la classe mère, mais laisser les sous classes rédéfinir certaines méthodes pour changer le comportement/résultat de l'algorithme tout en ne changeant pas la structure de l'algorithme.

J'ai écris un programme pour présenter simplement ce pattern

Nous avons la classe Language, dans celui-ci nous avons une méthode talk qui est notre template method avec notre algorithme
```
Language >> talk
	^self greeting,' ',self howAreYou.
```
Ces méthodes ne sont pas défini dans notre classe Language( Comme si je simulais des méthodes abstraites). Pour informations on pourrait avoir des méthodes avec des retour par défault.

Nous avons deux sous classes France et Japan qui implementent toutes les deux greeting et howAreYou
```
France >> greeting 
	^'Bonjour'

Japan >> greeting 
	^'Konnichiwa'

France >> howAreYou
 ^'comment tu vas ?'

Japan >> howAreYou
 ^'Genkidesuka'
```

Maintenant si nous appelons la méthode talk nous aurons des comportements différents selon l'objet (Mais la structure de l'algorithme reste le même).

```
Japan new talk -> Konnichiwa Genkidesuka
France new talk -> Bonjour comment tu vas ?
```

[Lien github_Template_Method_Language](https://github.com/Frontaz1/Template-Method-Language).

# Lan
## Hook and Template

Template Method Design Pattern is a behavioral pattern that defines the skeleton of an algorithm in a base method while allowing subclasses to override specific steps without altering its overall structure. It’s like a recipe: the main steps remain fixed, but details can be customized for variation.
For example, I have a programme Noodles. In Noodles, I have **Abtract class Noodles** and **2 Concrete Classes Pho and BunBo**

The skeleton here is the method makingNoodles. It has 3 actions: **ingredients**, **cook** and **plate**

```



[Link github Hook and Template] (https://github.com/LaCoir/HookAndTemplate)
