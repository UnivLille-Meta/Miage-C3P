# Ce que j’ai appris

## Visitor
Le **Visitor** est un pattern qui sépare les actions (calculer, afficher, exporter…) des objets sur lesquels elles s’appliquent. Chaque action devient une classe visiteur, et les objets se contentent d’accepter un visiteur. Grâce au double dispatch (`acceptVisitor:` → `visitXXX:`), on arrive à la bonne méthode sans aucun `if`. Il est facile d’ajouter une nouvelle action, mais pénible d’ajouter un nouveau type d’objet.

## Initialisation paresseuse
En cas de gros calcul, on laisse la variable à `nil` et on ne la calcule qu’au premier usage, toujours via la méthode `self maVariable` et jamais en lisant la variable directement, pour ne jamais exposer `nil`.

## Le problème de `nil` en Pharo
`nil` est un objet normal, mais le renvoyer force chaque client à écrire des tests `ifNil:`, `ifNotNil:` ou `isNil`. Ces tests se propagent partout.

### Solutions proposées
1. **Objet polymorphe** → renvoyer une collection vide ou 0 au lieu de `nil`.
2. **Initialisation correcte** → mettre les variables d’instance dans un état valide dès la création.
3. **Null Object** → remplacer l’absence par un objet qui comprend les mêmes messages mais ne fait rien.
4. **Exception** → pour un cas vraiment anormal, interrompre l’exécution au lieu de renvoyer un code d’erreur.

## Problème rencontré
L’image Pharo ne voulait plus s’ouvrir. Un crash pendant un commit Iceberg avait corrompu le fichier `.image`.

### Solution
Restaurer les fichiers source avec `git restore`, puis importer le dépôt dans une nouvelle image Pharo saine.

---

# Ce que j’ai fait

- **Fuzz the board** : J’ai généré des positions FEN et des coups aléatoires pour tester le moteur, puis testé les parseurs FEN et PGN avec des entrées invalides pour montrer les bugs.

## Tâche en cours
Implement more bot gaming strategies
