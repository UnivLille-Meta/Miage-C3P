# Rapport semaine 1

## Hammed ABASS

Cette première semaine a été consacrée à l'installation et à la mise en place de Pharo. Sous Linux, ce n'est pas forcément intuitif ; j'ai mis un certain temps à obtenir un env utilisable.

L'interface demande un vrai changement d'habitudes. J'ai multiplié les mauvaises manipulations et j'ai finalement passé plus de temps à me repérer dans l'environnement qu'à écrire du code. J'ai même envisagé d'écrire un serveur [LSP](https://microsoft.github.io/language-server-protocol/) pour travailler depuis VSCode. J'ai finalement choisi de rester dans Pharo, que je considère comme partie prenante de l'apprentissage.

J'ai réalisé l'exercice Counter (`count`, `increment`, `decrement`, `initialize`, `printOn:`, `startingAt:`) ainsi que les tests associés.

Sur `self == super`, je comprends qu'il s'agit du même objet. `super` ne désigne pas une autre instance.

Je n'ai pas encore réalisé le DSL ni FlagCountry.

---

## Julie LIM

Cette semaine, j'ai installé et configuré Pharo et réalisé le tutoriel Counter.

J'ai créé la classe Counter avec les méthodes `count`, `increment`, `decrement`, `initialize`, `startingAt:` et `printOn:`.

J'ai également créé les tests associés avec `CounterTest`.

J'ai appris à :

- créer des classes et méthodes dans Pharo
- utiliser les côtés instance side et class side
- écrire et lancer des tests
- utiliser un Playground
