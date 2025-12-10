Résumé: 

    Aujourd’hui, j’ai appris à implémenter le double dispatch en Pharo à travers le jeu Pierre–Feuille–Ciseaux.
    Le but était de déterminer le gagnant sans utiliser de conditions (if, case, etc.).

Contenu appris

    Le simple dispatch sélectionne une méthode selon le receveur du message.

    Le double dispatch envoie deux messages successifs :

      vs: au premier objet

      playAgainst... au second objet

    Ce mécanisme permet de décider le résultat selon les deux objets.

Réalisation

    J’ai créé trois classes : Stone, Paper et Scissors, ainsi qu’une classe de test StonePaperScissorsTest.
    Les tests unitaires valident que :

    Stone bat Scissors

    Paper bat Stone

    Scissors bat Paper

    Deux objets identiques font #draw (égalité)

    Tous les tests ont réussi dans Pharo Test Runner.

Lien GitHub
    Dans le module6, vous y trouverais un dossier pierre-feuille-cisceau.

https://github.com/PierretteKengle/MODULE6 