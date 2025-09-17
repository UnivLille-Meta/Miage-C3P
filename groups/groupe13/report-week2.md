## Gautam Demeulemeester
Cette semaine je me suis consacré au tp DSL avec les lancés de dés. Le cours en début d'heure de jeudi dernier m'a permis de mieux comprendre le principe d'heritage en Pharo.

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