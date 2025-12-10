# Rapport – Module 4 : Qualite des tests 

## Objectif
Évaluer la qualité des tests du projet Chess avec la bibliothèque MuTalk sur Pharo 12,
afin de mesurer la solidité réelle des tests au-delà du simple taux de couverture.

## Principe
Le mutation testing cree de petites erreurs (mutants) dans le code :
- Si un test échoue ---->> le mutant est tué.
- Si le test passe ---->> le mutant survit.
  - Le score de mutation = mutants tués ÷ mutants totaux.
  - Un score élevé indique une suite de tests efficace.
 

## Expérimentation
### Analyse sur :

```
testCases := { ChessBoardTest. PieceMovementTest }.
classesToMutate := { ChessBoard. Piece. MoveValidator }.
```
Résultat initial : 42 % de mutants tués.
Après ajout de tests négatifs et de cas limites (ex. roque, promotion, mouvements illégaux), le score est monté à 68 %.

## Constats
- Une forte couverture ne signifi pas forcément de bons tests.
- Les mutant survivant révèlent les comportements non vérifies.
- Les tests faibles se concentrent souvent sur l’état, pas sur le comportement.
- Pour aller plus vite : limiter les mutants ou stopper dès la première erreur.


 `La qualité des tests indique à quel point les tests prouvent que le code fonctionne bien et qu’ils échouent quand il faut.`

## Mutation testing
C’est un outil concret pour mesurer cette qualité.
Il insère volontairement de petites fautes (mutants) dans le code et observe si les tests les détectnt.
- Si les tests échouent ----->> ils sont efficaces.
- Si les tests passent ----->> ils sont trop faibles ou incomplets.


## Conclusion
Le mutation testing complète la couverture :
- il mesure la capacité des tests à détecter les erreurs.
