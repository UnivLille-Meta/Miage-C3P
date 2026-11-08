# Rapport de la semaine 5

J'ai étudié d'autres notions importantes de Pharo concernant la conception orientée objet.

## 1. La délégation et l'héritage

J'ai appris la différence entre l'héritage et la délégation, qui permettent tous les deux de réutiliser du code mais de manière différente.

L'héritage permet à une classe de récupérer les comportements d'une autre classe. Par ex on crée plusieurs sous-classes de TextEditor par ex FastFormatingTextEditor pour un formatage rapide, SlowFormatingTextEditor pour un formatage lent mais précis et NullFormatingTextEditor pour ne rien faire. Le problème est que si on utilise uniquement l'héritage, il devient difficile de changer de comportement pendant l'exécution du programme. De plus, si on a beaucoup de comportements différents, le nombre de sous-classes peut devenir très important.

Avec les conditions (if), on garde un seul TextEditor mais la méthode format devient grande et il faut la modifier à chaque nouveau formatage.


La délégation permet de résoudre ce problème. Au lieu de mettre tous les comportements dans la classe TextEditor, on lui ajoute une variable d'instance formatter. La classe `TextEditor` délègue alors le formatage à l'objet `formatter`, qui sait comment réaliser cette opération. On peut ainsi remplacer facilement un formatteur par un autre pendant l'exécution.

L'idée principale est que l'héritage représente une relation « est un » (*is-a*), tandis que la délégation représente une relation « possède un » (*has-a*). On peut même utiliser les deux ensemble : les différents formatteurs héritent de `Formatter`, mais `TextEditor` délègue le travail au formatteur choisi. Cette solution correspond au pattern **Strategy**.

## 2. Le couplage et l'encapsulation

J'ai aussi appris que le couplage représente le niveau de dépendance entre les classes. Plus une classe dépend des détails internes de plusieurs autres classes, plus le code devient difficile à modifier, à réutiliser et à tester. L'encapsulation consiste à cacher les détails internes d'un objet et à communiquer avec lui à travers des méthodes.

Pour réduire le couplage, plusieurs principes sont possibles :

- **Law of Demeter** : un objet doit communiquer principalement avec ses amis directs et éviter les longues chaînes de messages. Par exemple, au lieu que `Car` accède directement au carburateur à travers le moteur, elle demande simplement au moteur d'accélérer.
- **Move Behavior Close to Data** : le comportement doit être placé dans la classe qui possède les données nécessaires pour réaliser ce comportement.
- **Feature Envy** : c'est lorsqu'une classe utilise trop les données ou les méthodes d'une autre classe. Dans ce cas, il peut être préférable de déplacer le comportement vers la classe concernée.
- **Waves of changes** : cela arrive lorsqu'une petite modification dans une classe entraîne des modifications dans plusieurs autres classes à cause de leurs dépendances.

L'idée principale est que chaque objet doit s'occuper de ses propres données et fournir des méthodes simples aux autres objets, sans exposer tous ses détails internes. Cependant la Law of Demeter n'est pas une règle absolue : c'est une heuristique qu'on utilise pour réduire les dépendances sans créer trop de méthodes intermédiaires inutiles.


Dans le Kata 3, on a effectué des tests aléatoires pour vérifier que le plateau d’échecs les déplacements des pièces et le parseur FEN fonctionnent correctement dans différentes situations.  
