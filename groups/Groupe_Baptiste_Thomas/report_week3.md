# DEVINCK Thomas

## Mars Rover extension

Avec baptiste nous avons choisi de se partager deux extension du kata, nous avons continuer sur le kata fais en cours.Le but est de finir ce kata 2 dès possible car cela nous permet de manipuler Pharo.

Baptiste travaille sur 'Natural 1-based numberging' pour ma part je m'occupe de 'Rover should not get over the grid border.

### Rover should not get over the grid border.

J'ai rajouter un test qui permet de s'assurer que le Roover ne sort pas de la grille 

```
testExitGrid
	| r |
	r := Roover new.
	r gridSize: 3@3.
	r interpretInit: '1 1 W'.
	r move.
	self assert: r x equals: 1.
```

et j'ai ensuite modifié la méthode move pour mettre à jour x et y uniquement si le déplacement reste compris entre 1 (borne minimale de la grille) et le maximum défini par gridSize.
J'ai rencontré un problème car dans initialize la gridSize n'est pas défini donc ca faisait planter le code avec l'erreur "X was sent to nil" j'ai donc ajouter une vérification de l'existence de gridSize dans move. Le Roover ne peut pas sortir du plateau uniquement si la grille est initialisée, sinon il se déplace librement

Ce qui me donne :

```
move
	| p |
	p:= self direction move: x@y.
   gridSize ifNotNil: [
        (p x between: 1 and: gridSize) ifTrue: [ x := p x ].
        (p y between: 1 and: gridSize) ifTrue: [ y := p y ].
    ] ifNil: [
        x := p x.
        y := p y.
    ].
	
```

Voici le Git sur lequel les modifications ont été aportées : https://github.com/thomasdvck/Roover

## Pour cette semaine : 

En plus de cette fonctionnalité, j'ai regardé les vidéos concernant le module HookAndTemplate

Voici une conclusion pour chaque vidéo : 

#### Vidéo (M03_S1) An introduction to design patterns : 
    Les design patterns sont des solutions réutilisables à des problèmes récurrents en COO. Ils offrent un vocabulaire commun et améliore la modularité. Il existe 3 grands types (Creational,structural and behavioral). Cependant, ils ne sont pas une solution universelle et doivent être appliqués en tenant compte de leur intention et des compromis associés.

#### Vidéo (M03_S2) Message sends are plans for Reuse :
    L'envoie de messages à self crée des hooks pour que les sous-classes puissent modifier ou élargir le comportement sans dupliquer le code. Cela permet une meilleure lisibilité du code mais également une meilleure flexibilité et adaptabilité.

#### Vidéo (M03-S3) Hooks and Template: One of the cornerstones of OOP : 
    Dans cette vidéo de ce que j'ai compris, le design pattern Hooks and Template est un design pattern comportemental qui a une template method qui définit un algorithme avec des hooks (point ou les sous classes peuvent personnaliser et élargir le comportement) cela permet de réutiliser le code et de l'adapter sans à avoir de duplication.

#### Vidéo (M03_S4) Using well asString and printString: A Pharo code idiom
    Dans cette vidéo de ce que j'ai compris, printString et asString permettent d'obtenir une représentation textuelle d'un objet. Il est recommandé de les utiliser dans printON: et de passer par print: au lieu de créer des flux intermediaire afin d'éviter les objets inutiles et de rendre le code plus lisible et plus performant.

#### Vidéo (M03_S5) Global to parameter :
    Dans cette vidéo de ce que j'ai compris,
    il est important de remplacer les variables globales par des paramètres ou des variables d'instance car les variables globales compliquent les tests et réduise l'adaptabilité.


# Delisle Baptiste 

    Pour le rapport de cette semaine, nous avons continué le kata en ajoutant des extensions. L'extension que j'ai ajouté est la feature : Natural 1-based numbering. 
    Pour cela, j'ai modifié ces méthodes : 

        initialize

            super initialize.
            direction := North new.
            x := 1.
            y := 1

        testMove

            | r |
            r:= Roover new.
            r move.
            self assert: r x equals: 1

        testDefaultRooverPositionIsAtOneOne

            | r |
            r := Roover new.
            self assert: r x equals: 1.
            self assert: r y equals: 1.

        testInterpretDirection

            | r |
            r := Roover new.
            r interpretDirection: 'MMRMM'.

            self assert: r x equals: 3.
            self assert: r y equals: 3.
            self assert: r direction equals: East new

    J'ai également regardé les vidéos et lu les pdf, voici les choses à retenir pour chacun d'entre eux : 

        - M3-1 – Introduction aux Design Patterns:
            Dans ce cours, on présente ce que sont les design patterns : des solutions récurrentes à des problèmes de conception communs dans la programmation orientée objet. Le cours insiste sur le fait que les patterns sont des abstractions de design, pas des implémentations fixes, et qu’ils permettent de créer un vocabulaire partagé pour parler des architectures. Il met aussi en garde : ce n’est pas une panacée — les patterns peuvent complexifier un système s’ils sont mal utilisés.
            
        - M3-2 – “Self Sends Are Plans for Reuse”  
            Dans ce cours, j’ai pu mesurer l’importance du principe selon lequel les envois de messages à self ne sont pas neutres, mais constituent des points d’extension structurels. En découpant les comportements en petites méthodes appelées via self, on crée des hooks naturels où les sous-classes peuvent injecter des variantes sans dupliquer le code. Cela favorise la réutilisabilité, rend le code plus testable, et rend explicite l’architecture des décisions de design.

        - M3-3 – Hook & Template (Hook and Template Method Pattern)
            Ce cours détaille le patron Template Method (méthode modèle) et le concept de hooks. L’idée est de définir une méthode « squelette » qui appelle plusieurs hooks (méthodes à personnaliser). Les sous-classes peuvent redéfinir ces hooks pour modifier certaines étapes sans changer la structure globale. Le cours montre aussi comment self envoie un message pour définir un hook, et illustre cela via des exemples comme printString / printOn: ou la méthode copy / postCopy.
        
        - M3-4 – Gestion de l’affichage texte / Streams / printString & asString
            Ce module aborde les idiomes de codage en Pharo pour produire des représentations textuelles d’objets. Il recommande d’éviter de créer des objets intermédiaires inutiles et de privilégier l’utilisation de printOn:, printString ou asString de façon efficace. Le cours montre comment streamContents: fonctionne pour construire des chaînes à partir d’un flux, et comment éviter des constructions redondantes qui génèrent des flux temporaires.
        
        - M3-5 - From Global To Parameter
            Dans ce cours, on remet en question l’usage abusif des variables globales (ou du pattern Singleton) dans le code. Il présente le cas de Transcript (le flux de log global dans Pharo) et suggère une approche plus modulaire : rendre ce flux configurable, le passer en paramètre ou encapsuler un flux dans chaque objet. On y voit les avantages : meilleure testabilité, modularité, contrôle des dépendances, et éviter les effets de bord liés aux globals.
