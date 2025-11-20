# Olivia
## Practice mutation
1. Starting with code coverage
Code coverage : 79.59%
Uncovered methods : 10
Partially covered methods : 5
On peut augmenter le coverage en testantles méthodes non testées (10) et en ajoutant des tests sur des méthodes partiellement couvertes (5).
Le coverage permet de savoir quel pourcent du code est exécuté et donc voir quelles méthodes sont testées et si elles sont toutes testées.
On ne peut pas savoir si la qualité des tests est correcte, car on peut avoir des tests verts qui ne traitent pas des bugs.

2. Mutating UUID
36% des mutants ont été tués mais 80% du code est couvert -> cela veut dire que des tests ne couvrent aucun mutant, ou des tests ne sont pas de bonne qualité car il peut y avoir des bugs.
563 mutants vivants.
- Réaliser des tests pour chaque mutant : écrire un test vert - analyser le code et modifier une partie du code - lancer le test (il doit être rouge)
- Ajouter des tests pour tester chaque cas.
- Vérifier les asserts
Il est important d'avoir un coverage élevé (entre 70% et 100%) et un score de mutation de 100% pour connaitre quelle partie de notre code n'est pas testéee et quels tests attrapent des bugs afin de pouvoir minimiser les bugs et de traiter tous les cas de tests.
