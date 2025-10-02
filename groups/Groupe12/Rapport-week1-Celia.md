Rapport Pharo
Collections et itérateurs 
Les collections servent à stocker et manipuler des données de plusieurs façons.
Pharo offre plusieurs types de collection:

Array - tableau basique
OrderedCollection - liste dynamique
Set - éléments uniques
Dictionary - associations clé-valeur 

La façon d'itérer sur les collections n'est pas comme en java par exemple avec des for ou des while (boucles) mais par des messages envoyés à ces collections, il en existe plusieurs comme do collect select reject etc qui permettent de modifier ou raccourcir par exemple les collections.

Conditions en Pharo : 
J'ai pu comprendre qu'en Pharo, on utilise pas de if/else comme dans d'autres langages, mais on instancie plutôt une condition ( par exemple nb < 78) puis on utilise des méthodes ifTrue ou ifFalse pour exprimer ce qui doit etre executé dans les deux cas. Donc on comprend qu'ici les booléens sont comme des objects et on y applique ces deux méthodes. 


Les classes et méthodes ; 
Pharo se repose sur son system browser et c'est lui qui permet de créer une classe et d'ajouter des méthodes au fur et à mesure par exemple on a une classe : 
Object subclass: #Etudiant
    instanceVariableNames: 'nom prenom dateNaissance filiere'
    classVariableNames: ''
    package: 'UniversitéDeLille'


Façons de coder avec Pharo : 
Méthodes courtes - Maximum 5-10 lignes
Un seul niveau d'indentation - Éviter les imbrications profondes
Noms explicites
Une seule responsabilité - Une méthode = une tâche
Pas de comparaisons booléennes - obj isValid au lieu de obj isValid = true

