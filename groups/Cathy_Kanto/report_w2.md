Rapport de Travaux Pratiques en Pharo : CATHY KENGLE

    TP 1 – Jeu de dés

        Création de la classe Die (hérite de Object) avec :

        initialize (faces par défaut = 6)

        faces, faces:, roll (utilise atRandom de Number).

        Classe DieHandle avec :

        initialize (stocke les dés dans un OrderedCollection).

        addDie:, diceNumber, roll, et surcharge de l’opérateur +.

        Extensions d’Integer pour écrire un DSL (D6, D20, D:).

        Tests unitaires (TestCase) pour valider Die et DieHandle.

      Utilisation de : OrderedCollection, atRandom, opérateurs comme messages (+), et TDD avec TestCase.

    TP 2 – Affichage de drapeaux

        Classe EarthCountryBrowser (hérite de SpPresenterWithModel) avec :

        initializePresenters, defaultLayout, connectPresenters.

        Presenters utilisés : SpDropListPresenter, SpTextInputPresenter, SpImagePresenter.

        Fonction flagForCountryCode: :

        Téléchargement via ZnClient (get:).

        Conversion PNG → Form avec ImageReadWriter formFromStream:.

        Fallback avec (BorderedMorph new extent: 80@50) asForm.

        Méthode onCountrySelected: : met à jour le drapeau (flagPresenter image:) et la forme SVG (RSCanvas, asRSShape).

     Utilisation de : Spec2 (UI), Zinc HTTP Components (ZnClient), Roassal (RSCanvas) et ImageReadWriter.

        Conclusion

        Ces TPs m’ont permis de manipuler :

        Collections, opérateurs et extensions de classes (DSL avec Integer).

        Spec2 pour construire une interface (DropList, Image, Layouts).

        Zinc pour les requêtes HTTP.

        Roassal pour afficher les formes SVG.

        ImageReadWriter pour transformer des octets PNG en Form.

    👉 Codes disponibles :

    Drapeaux : https://github.com/PierretteKengle/TPFlagCathy/tree/master/FlagCathy 

    Jeu de dés : https://github.com/PierretteKengle/DIcePharo 
