## Module 2: Tests
Les vidéos et les PDF que j’ai regardés et lus (de M2‑1 à M2‑3) m’ont aidé à comprendre à quel point les tests unitaires et la Test Driven Development (TDD) sont importants pour développer des applications fiables, surtout avec Pharo.


### 1- Ce que j’ai compris sur les tests unitaires
J’ai compris que les tests servent à vérifier que le code fonctionne comme prévu, et qu’ils permettent de détecter rapidement les bugs ou effets secondaires quand on modifie le code.

Un test unitaire se fait en trois étapes :
1. Créer un contexte
2. Stimuler le code
3. Vérifier le résultat
J’ai aussi compris la différence entre :

-Succès : le test passe.

-Échec : une assertion est fausse.

-Erreur : une exception inattendue se produit.

J’ai compris qu’il est important de réutiliser le contexte des tests avec setUp pour éviter de répéter du code et faciliter l’évolution des tests.

### 2- Ce que j’ai compris sur la TDD 
Avec la TDD, on écrit d’abord les tests avant le code.
-On commence par écrire un test rouge qui échoue car la fonctionnalité n’existe pas encore.

-Ensuite, on écrit juste assez de code pour que le test devienne vert.

-On relance tous les tests pour s’assurer qu’aucun autre test n’est cassé.

#### J’ai vu l’exemple du Counter :

On écrit un test qui fixe une valeur et la lit (count: et count).

Au début le test échoue (rouge).

Puis on crée les méthodes dans la classe et le test passe (vert).

#### J’ai aussi compris pourquoi écrire le test avant le code est utile :

Cela permet de spécifier clairement ce qu’on attend du code.


-Enfin, on peut refactorer le code tout en gardant les tests verts.

## Mon expérience pratique avec le kata Rover

En classe, avec Melissa et Célia, nous avons travaillé sur le kata Rover.

On a commencé par regarder la classe Rover et les tests fournis dans RoverTest. Ensuite, nous avons implémenté toutes les méthodes : moveForward, turnLeft et turnRight pour toutes les directions (N, S, E, W).

Pendant qu’on codait, on a créé des tests supplémentaires pour vérifier certains cas limites, par exemple quand le rover est au bord du plateau. Après avoir fini, on a exécuté tous les tests et tout est passé au vert, ce qui m’a vraiment rassurée que notre code fonctionnait correctement.

#### Grâce à cette activité, j’ai :

Mieux compris la TDD, en voyant comment écrire les tests avant de coder.

Vu que les tests sont très utiles pour éviter les erreurs et garantir que le code continue de bien fonctionner même après des modifications.

Appris à travailler en groupe, à partager le travail et à collaborer pour résoudre les problèmes.
