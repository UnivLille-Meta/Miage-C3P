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

## Kata2

Sur le rover :
- j'ai ajouté toutes les directions pour l'action moveForward, turnRight et turnLeft
- Ajout de variable ymax et xmax pour controler les effets de bord
- Ajout de la lecture de tous les character RLM dans la méthode moveString : aString
- Ajout de l'action moveBack
- Ajout de la méthode recording qui permet de sauvegarder tous les mouvement du rover dans une liste

=> Pour tous ces features il y'a au moins un test associés

Problème pour la méthode recording je n'arrive pas a faire valider en vert mon test malgrès que je récupère bien une liste avec tous les mouvements.

[Lien github_rover](https://github.com/Frontaz1/Kata-Group2_Lan_Julien).

# Lan
## Hook and Template

Template Method Design Pattern is a behavioral pattern that defines the skeleton of an algorithm in a base method while allowing subclasses to override specific steps without altering its overall structure. It’s like a recipe: the main steps remain fixed, but details can be customized for variation.
For example, I have a programme Noodles. In Noodles, I have **Abtract class Noodles** (the skeleton) and **2 Concrete Classes Pho and BunBo** (subclasses of Noodles)

In **Noodles**, I have the method **makingNoodles**. It has 3 actions: **ingredients**, **cook** and **plate** (the hooks)
### Object >> Noodles
```
Noodles >> makeNoodles "this method returns 3 methods ingredients, cook and plate in order"
	 ^ (self ingredients, String cr "break the line",
       self cook , String cr,"break the line"
       self plate)

Noodles >> ingredients
	^ 'Prepare: Noodles, brooth, meat, vegetables. '

Noodles >> cook 
	^'Cook broth'

Noodles >> plate 
	^'Ladle into bowls over noodles and pile on toppings'

```
Test in the Playground
```
(Noodles new) makeNoodles.
"=> Prepare: Noodles, brooth, meat, vegetables.
Cook broth.
Ladle into bowls over noodles and pile on toppings"
```
Then, I made 2 subclasses **Pho** and **BunBo** of **Noodles**, which inheritant 3 methods **ingredients**, **cook** and **plate**, but change the recipes
### Noodles >> Pho
```
Pho >> ingredients
	^ 'Prepare: Pho rice noodles, beef broth, beef, herb'
Pho >> cook 
	^ 'Cook beef bones as broth for 6 hours, mix with spices'
Pho >> plate
	^'Add cooked rice noodles, meat, vegetables in a bowl. Ladle hot broth over the top.'
```
Test in the Playground
```
(Pho new) makeNoodles.
"=> Prepare: Pho rice noodles, beef broth, beef, herb.
Cook beef bones as broth for 6 hours, mix with spices.
Add cooked rice noodles, meat, vegetables in a bowl. Ladle hot broth over the top."
```
### Noodles >> BunBo
```
BunBo >> ingredients
	^'Prepare: Pork broth, shrimp paste, pork, beef and crab meatballs, vegetables, other seasoning '

BunBo >> cook
	^'Cook pork broth for 3 hours, add shrimp paste, nuoc mam and other seasoning'

BunBo >> plate
	^'Add cooked rice noodles, meat, vegetables in a bowl. Ladle hot broth over the top. Eat with banana flowers and herbs'
```
Test in the Playground
```
(BunBo new) makeNoodles.
"=> Prepare: Pork broth, shrimp paste, pork, beef and crab meatballs, vegetables, other seasoning. Cook pork broth for 3 hours, add shrimp paste, nuoc mam and other seasoning.
Add cooked rice noodles, meat, vegetables in a bowl.
Ladle hot broth over the top. Eat with banana flowers and herbs
```
The **Pho** and **BunBo** have customized the super methods to make their own recipes!

### [Link github Hook and Template] (https://github.com/LaCoir/HookAndTemplate)
