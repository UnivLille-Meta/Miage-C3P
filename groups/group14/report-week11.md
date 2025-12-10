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

# Julien
## Practice mutation
https://github.com/avl-univ-lille/testing/blob/2024/practice/1-mutation.md
Réponse exercice : 
1.
On remarque que notre code sur le package  Network-UUID est couvert à 77.55% avec 11 méthodes non couvertes ainsi que 5 partiellement(on passe dedans mais pas toutes les lignes)
On peut donc augmenter le coverage en testant ces 11 méthodes et en couvrant les lignes non couvertes des 5 méthodes partiellement testés.
2.
36% de mutation score
563 mutants vivant
•	On peut améliorer le code coverage en couvrant du code pas couvert ou en ajoutant des tests(manque d’assert)
•	réaliser des test pour chaque mutant
Oui les deux sont utiles, code coverage et mutant score les deux sont important pour avoir une image globale de la solitdité de nos tests.

# Lan
## Practice mutation
- Code coverage: 83.33%
- Uncovered methods: 2
1. Starting with code coverage
- Partically covered method: 0
- Improve Coverage: Add unit tests for the 2 uncovered methods to ensure all lines are executed.
- High coverage only means the code was executed, not that it was verified. We can have 100% coverage with tests that contain no assertions (checking nothing), meaning bugs can still exist easily.
2. Mutating UUID
100 mutation score. 0 mutation alive.
- The gap exists because tests execute the code but lack strong assertions. To bridge the gap we must improve the assertions.
- Mutation Score is more precise
- Both are useful. Coverage is fast and cheap, mutation is slow and expensive.
