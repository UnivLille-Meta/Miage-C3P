# Rapport Week 2 Hajar

## What I did
- **Step 6: Country** : Réalisation de l'application de carte interactive des pays. Extraction des tracés SVG depuis `world.svg`, manipulation graphique avec Roassal et conception de l'interface avec Spec2 (`EarthCountryBrowser`).
- **Lecture Preparation** : Visionnage des vidéos et lecture des supports de cours (M0 et M1) sur le modèle objet, la syntaxe Pharo et les types de messages.

## What I did not
- **Practice message dispatch** : Pas encore fait. Je dois encore écrire mes propres exemples de code pour tester mes connaissances sur le dispatch et répondre aux 4 questions d'analyse.

## Difficulties & Solutions
- **Manipulation du SVG et Spec2** : L'adaptation des chemins vectoriels issus du fichier SVG vers les formes Roassal et la liaison avec la liste déroulante ont demandé un temps d'adaptation, notamment sur le cycle de vie des *presenters*. L'utilisation de l'inspecteur a permis de corriger les erreurs de typage et de bien brancher l'affichage du drapeau.

# Rapport Week 2 Anas

---

## Ce que j'ai fait

* **Exercice Country Flag:** Réalisation de l'application interactive pour les pays. J'ai analysé les contours du vecteur du pays et les données du fichier « world.svg » via « XMLDOMParser », j'ai créé le domaine « EarthMapCountry », « EarthMap » et j'ai affiché la carte du monde avec Roassal.

* **Spec UI:** J'ai créé l'interface utilisateur de l'application « EarthCountryBrowser » basée sur Spec avec un menu déroulant généré dynamiquement pour récupérer et afficher les images des drapeaux depuis le CDN.

* **Étude M3:** J'ai revu les vidéos et le matériel de lecture M3-1 à M3-5 concernant les piliers de la POO et les les meilleures pratiques.

## Ce que je n'ai pas fait

* **Projet chess:** Je n'ai pas encore commencé à travailler sur le projet de chess.

## Difficultés et solutions

* **Environnement et syntaxe:** J'ai rencontré quelques problèmes avec l'environnement du navigateur système, comme des erreurs de syntaxe dues à la notation `>>` dans la documentation et des erreurs "sélecteur inconnu".  **Solution:** J'ai appris à distinguer le côté instance du côté de la classe, comment générer automatiquement les getters/setters et à organiser les méthodes dans des protocoles.
