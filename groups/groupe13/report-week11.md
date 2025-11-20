## Gautam Demeulemeester
Cette semaine j'ai effectué l'exercice Mutation Testing.

J’ai commencé par mesurer la couverture de tests de la bibliothèque Network-UUID à l’aide de DrTest.
J’ai constaté que la couverture était relativement élevée, mais ne suffisait pas à garantir une bonne qualité des tests.
Il faudrait ajouter d’autres tests pour augmenter la couverture.

![mutationgautam](img/mutation Gautam.png)

J’ai ensuite lancé une analyse sur les classes UUID et UUIDGenerator.
Le mutation score obtenu était d’environ 37%, en ajoutant UUIDTest, puis UUIDGeneratorTest, le score a augmenté clairement.

J’ai ensuite lancé Mutalk sur la librairie Artefact. J'ai remarqué que la sélection aléatoire de mutants donne des résultats utilisables beaucoup plus rapidement.

Cette semaine j'ai également avancé un peu sur notre projet Sokoban (beaucoup d'exploration de code) et lu le module 9 "Module 9: About Inversion of control / Registration
".
