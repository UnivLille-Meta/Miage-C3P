## Myg: SameGame Challenges

### Link to the repository
https://github.com/LeoDefossez/Myg

### What are the objectives ?
**Originals challenges**
- [Display the number of killed tiles](#Display-the-number-of-killed-tiles)
- [MultiColor. Introduce a kind of tile that matches all the surrounding colors](#MultiColor-bloc) 
- [Cycling colors. The tile will change its color in a circle (red -> blue -> yellow -> red) after each action](#Cycling-colors-bloc)
- [Kill the line. Introduce a kind of tile that when clicked, it should eliminate the line](#Kill-the-line-bloc)
- [Kill the column. Introduce a kind of tile that when clicked, it should eliminate the column](#Kill-the-column-bloc)

**Our own challenges**
- [Make different grid size](#ajout-dune-customization-de-la-taille-du-plateau)
- [Score for game](#Score-for-game)
- [Create other strategies of game initialisation](#Create-other-strategies-of-game-initialisation)
- [Create other strategies of points calculations](#Create-other-strategies-of-points-calculations)
- [Add a "bomb box" that destroy the 8 tiles around itself](#Add-a-bomb-box-that-destroy-the-8-tiles-around-itself)
- [Add a stop condition on the game](#Add-a-stop-condition-on-the-game)
  if no combination done (Then game won't be playable)/Create an announcement (Below the score bar) that say when the game end
  - Make a list of stop condition that can be activable or not
    (Time limit, Move limit)
- Make skins to change appearances
- [Making a serialisation/deserialisation for games](#Making-a-serialisationdeserialisation-for-games)
  - offer a bunch of default games to play 
  - offer the possibility to replay last game
  - History of moves and time travel
- A leaderboard of scores
- New game mode:
  - infinite blocs
  - make grayed UI for some moves, so that the user has to remember the board
- highlight chain of blocs when cursor is on it
- Add a type of box that give more points (Like a decorator ?)
- Make a rarity for blocs, and the rarity modify the scores

**Addition of design only**
- [Richer parametrisation of same game](#Richer-parametrisation-of-same-game)
- [Add a registry for states](#Add-a-registry-for-states)

### Organisation
> Durant tout le projet, on a décidé d'ajouter nos feature sur des branches, et de créer une pull request par feature.  

#### Display the number of killed tiles
**Auteur : Léo Defossez**
> https://github.com/LeoDefossez/Myg/pull/11
> Une explication détaillée est disponible sur la pull request.  
> Celle-ci fait suite à l'ajout de [Score for game](#Score-for-game), dans lequel je ne pensais pas pouvoir modifier le nombre de box tués sur le dernier coup.  
> Sur cette pull request, j'écris que je me suis rendu compte qu'il existait une interdépendence entre SGGame et SGBoard.  
> J'ai alors profité de celle-ci pour afficher le nombre de box tués au dernier coup.  

#### MultiColor bloc
**Auteur : Léo Defossez**
//TODO

#### Cycling colors bloc
**Auteur : Léo Defossez**
//TODO

#### Kill the line bloc
**Auteur : Gautier Louvier**
//TODO

#### Kill the column bloc
**Auteur : Gautier Louvier**
//TODO

#### Refactoring des null states
**Auteur : Léo Defossez**  
> https://github.com/LeoDefossez/Myg/pull/3
> https://github.com/Ducasse/Myg/pull/37  
> In SameGame, all states inherited from a null state.
> It means that technically, every state is a null state.
>
> I propose another hierarchy, with an abstract state as the parent of every other states (Included the null state)

#### Ajout d'une customization de la taille du plateau
**Auteur : Xavier Moyon**  
https://github.com/LeoDefossez/Myg/pull/1  
// TODO

#### Score for game
**Auteur : Léo Defossez**  
> https://github.com/LeoDefossez/Myg/pull/6  
> Ajout d’une barre au-dessus du jeu décrivant le score total à gauche et le score du dernier coup à droite.
> Ce comportement est donc ajouté par la classe `SGScoreElement`.
>
> Il est actuellement prévu d’afficher également le nombre de blocs cassés lors du dernier coup (aussi à droite), mais un problème de conception dans le jeu m’empêche d’ajouter cette fonctionnalité simplement pour l’instant.
> L’issue suivante décrit ce problème : https://github.com/LeoDefossez/Myg/issues/4
>
> `SGScoreElement` est mis à jour à l’aide d’un announcer qui s’active lorsque le score change, de la même façon que l’interface des box est mise à jour lorsque leur état change.
>
> Voici la nouvelle fenêtre de jeu  
> <img src="img/SameGame/UIScore.png" alt="img" width="50%">
>
> J’introduis également quelques refactorings pour nettoyer le code :
> - `SGBoard >> hitBoxOnx: x y: y` dupliquait le code de `SGBoard >> hitBox: aBox`. J’ai donc modifié la méthode `hitBoxOnx:y:` pour qu’elle utilise `hitBox:`.
> - `SameGame class >> gameWithSize:` size n’ouvre plus de fenêtre pour lancer le jeu, mais renvoie simplement une instance de `SGGame`, ce qui facilite le debugging.
>

#### Create other strategies of game initialisation
**Auteur : Gautier Louvier**  
//TODO

#### Create other strategies of points calculations
**Auteur : Gautier Louvier**  
//TODO

#### Add a "bomb box" that destroy the 8 tiles around itself
**Auteur : Xavier Moyon**  
// TODO

#### Add a stop condition on the game
**Auteur : Gautier Louvier**  
//TODO

#### Making a serialisation/deserialisation for games
**Auteur : Xavier Moyon**  
// TODO

#### Richer parametrisation of same game
**Auteur : Léo Defossez**
> https://github.com/LeoDefossez/Myg/pull/13  
> Ici je refactor simplement la classe principale du jeu `SameGame`.  
> Je déplace une grande partie de la logique du côté instance, pour offrir une meilleure paramétrisation, et ajouter plus facilement nos features.  

#### Add a registry for states
**Auteur : Léo Defossez**
> https://github.com/LeoDefossez/Myg/pull/12  
> Ici, je crée une classe `SGStateRegistry`, qui permet simplement de récupérer tous les différents states existant.  
> J'utilise uniquement la méthode `subclasses` lors de l'initialisation de l'objet, ce qui réduit le nombre de querry sur le système.  
> J'en ai aussi profité pour rendre les stratégies d'initialisation de SGBox, plus simple et modulaire à l'aide de cet objet.  
