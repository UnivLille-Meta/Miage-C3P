# Rapport Semaine 4

## Ce que j'ai fait

J'ai avancé sur le projet Chess en me concentrant sur les mouvements des pions, j'ai réécrit mes tests d'une meilleure manière et j'ai implémenté le blocage des pions quand un autre pion se trouve devant lui.
J'ai commencé à implémenter l'attaque.

Dans mes nouveaux tests, j'ai placé un pion sur une case vide d'un plateau vide puis j'ai regardé ses moves légaux et je les ais comparé avec les moves attendus. Ce pattern de test a été répété pour les autres moves comme les attaques et le move "En Passant".
Pour implémenter le blocage de pion j'ai simplement retiré la condition pour qu'un pion puisse avancer lorsqu'il est en face d'un pion d'une autre couleur.
