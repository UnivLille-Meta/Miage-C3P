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
