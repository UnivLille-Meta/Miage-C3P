### Week 03

#### Louis

#### 1. Activités réalisées

* **Lectures :** Analyse et étude des documents PDF de la semaine 4.
* **Refactoring du code (Échecs) :** Séparation de la classe/entité `Pion` en deux entités distinctes : `Pion Noir` et `Pion Blanc`.
  > **Note technique :** Seuls les pions ont été séparés, car ce sont les seules pièces dont la logique de déplacement diffère selon la couleur (sens de déplacement sur l'échiquier). Pour toutes les autres pièces, la logique reste identique, peu importe la couleur.

---

#### 2. Réflexion et Cahier des Charges (*Kata Home-Made*)

J'ai posé les premiers jalons et je travaille actuellement à la rédaction du cahier des charges pour un *kata* personnalisé. Voici les fonctionnalités prévues :

1. **Sélection du mode de jeu :**
   * Demander au joueur s'il souhaite affronter un autre joueur ou un ordinateur.
   * Si l'ordinateur est sélectionné, demander le niveau de difficulté (échelle de 1 à 15).

2. **Gestion des tours et de l'interface :**
   * Implémenter la logique d'alternance des joueurs.
   * Supprimer le bouton "Play" ou l'associer directement à la gestion du timer / horloge de jeu.

3. **Intégration d'un moteur de jeu (IA/Bot) :**
   * Transcrire l'état actuel de la partie au format **FEN** (*Forsyth-Edwards Notation*).
   * Envoyer la chaîne FEN via une **API** à un bot externe chargé de calculer et retourner le meilleur coup suivant.
   * Adapter le niveau de l'IA selon la sélection initiale du joueur.
  
   
Tout le code produit cette semaine se trouve dans [ce repos](https://github.com/Muzaraigne/Chess)
