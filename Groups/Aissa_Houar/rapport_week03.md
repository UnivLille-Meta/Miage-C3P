# Rapport -- Création d'un navigateur de pays avec les drapeaux en Pharo

## 1. Objectif de l'exercice

L'objectif de cet exercice était de créer une interface graphique permettant de parcourir les pays du monde et d'afficher leurs informations, notamment leur nom, leur code et leur drapeau.

J'ai utilisé Pharo avec Spec pour créer l'interface graphique et Roassal pour afficher la carte du monde.

## 2. Réalisation

J'ai commencé par créer la classe `EarthCountryBrowser`, qui hérite de `SpPresenterWithModel`.

J'ai ajouté plusieurs composants : une liste déroulante pour afficher les pays, un champ de texte pour afficher le code du pays et un composant image pour afficher son drapeau.

Ensuite, j'ai créé la méthode `flagForCountryCode:` pour récupérer les drapeaux depuis le site FlagCDN à partir du code du pays.

J'ai utilisé `ZnClient` pour envoyer une requête HTTP, puis `ImageReadWriter` pour convertir les données PNG en image.

J'ai également créé les méthodes `showFlag:` et `onCountrySelected:` pour afficher automatiquement le drapeau et le code du pays sélectionné.

Pour gérer les interactions entre les composants, j'ai utilisé la méthode `connectPresenters`.

Enfin, j'ai ajouté un composant Roassal avec `newRoassal` pour afficher la carte du monde dans l'interface.

## 3. Difficultés rencontrées

J'ai rencontré quelques difficultés lors de l'implémentation, notamment avec le chemin du fichier `world.svg` et certaines méthodes manquantes dans les classes.

J'ai également eu des problèmes lors de l'affichage des drapeaux et de l'intégration de Roassal dans l'interface.

J'ai résolu ces problèmes en vérifiant les chemins des fichiers, en ajoutant les méthodes nécessaires et en testant progressivement le code dans Pharo.

## 4. Ce que j'ai appris

Cet exercice m'a permis de mieux comprendre la création d'interfaces graphiques avec Spec et l'utilisation de Roassal pour afficher des visualisations.

J'ai également appris à récupérer des images depuis Internet avec des requêtes HTTP et à relier les composants d'une interface pour actualiser les informations selon les actions de l'utilisateur.
