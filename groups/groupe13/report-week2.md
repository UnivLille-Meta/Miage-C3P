## Gautam Demeulemeester
Cette semaine je me suis consacré au tp DSL avec les lancés de dés. Le cours en début d'heure de jeudi dernier m'a permis de mieux comprendre le principe d'heritage en Pharo.
Je travaillais avec deux class Die representant un dé et DieHandle une poignée de dés. Ces deux classes contenant une méthode roll représentant le lancé :
```
Die >> roll
    ^ faces atRandom.
```
```
DieHandle >> dice
    ^ dice.

DieHandle >> roll
    ^ dice inject: 0 into: [:sum :die | sum + die roll ].
```
L'utilisation de roll m'a permis de comprendre comment fonctionne l'héritage en Pharo bien que je ne soit pas encore arrivée à la fin du TP. Les résultats obtenus étaient fidèles à ce que j'attendais. \n
J'ai également lu les pdf demandés mais je n'ai pas de questions pour l'instant.



## Heddi Abdelkader 

J'ai créé une hiérarchie de formes géométriques pour tester ma compréhension du dispatch :

```pharo
Shape >> describe
    ^ 'Aire: ', self area asString

Rectangle >> area
    ^ width * height

Circle >> area  
    ^ 3.14159 * radius * radius

"Test avec collection polymorphe"
shapes := {rectangle. circle}.
shapes do: [:shape | Transcript show: shape describe].
```
### Ce qui a fonctionné comme attendu :

    * Le polymorphisme : chaque forme calcule son aire différemment

### Ce qui était différent :

    * J'ai d'abord oublié d'utiliser self dans describe ce qui m a causé des erreurs

    * j'ai appris que La méthode subclassResponsibility existe déjà en Pharo pour les classes abstraites

### Préparation pour la semaine prochaine

J'ai lu les slides sur le reverse engineering.

Ce travail preparatoire m'a fait comprendre la puissance du "Tell, don't ask".
Au lieu de conditionnelles complexes, on délègue à l'objet approprié.
Le code devient plus clair et extensible.
