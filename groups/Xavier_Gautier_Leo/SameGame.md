## Myg: SameGame Challenges

### Link to the repository
https://github.com/LeoDefossez/Myg

### What are the objectives ?
**Originals challenges**
- Count the number of selection / display the number of killed tiles. 
- MultiColor. Introduce a kind of tile that matches all the surrounding colors.
- Cycling colors. The tile will change its color in a circle (red -> blue -> yellow -> red) after each action.
- Kill the line. Introduce a kind of tile that when clicked, it should eliminate the line.
- Kill the column. Introduce a kind of tile that when clicked, it should eliminate the column.

**Our own challenges**
- [Make different grid size](#ajout-dune-customization-de-la-taille-du-plateau)
- Create other strategies of game initialisation
- Add a stop condition on the game
- Make skins to change appearances
- Making a serialisation/deserialisation for games, and offer the possibility to replay new games
- Saving a board and replaying it (Different strategies of game generation)
- History of moves and time travel
- Score for game 
- A leaderboard of scores
- New game mode:
  - infinite blocs
    - limited number of moves
    - Limited time
- When no more moves available make an announcement
- highlight chain of blocs when cursor is on it (Like a mode)
- Add a type of box that give more points
- make grayed UI for some moves, so that the user has to remember the board
- Make a rarity for blocs, and the rarity modify the scores

### Ce que l'on a fait
> Durant tout le projet, on a décidé d'ajouter nos feature sur des branches, et de créer un pull request pas feature.  
> C'est pourquoi Chacun des liens que nous fournissons est un lien vers une pull request, ce qui permet de comprendre facilement comment chacune des feature a été ajoutée.

#### Refactoring des null states
**Auteur : Léo Defossez**  
> https://github.com/LeoDefossez/Myg/pull/3
> https://github.com/Ducasse/Myg/pull/37
> In SameGame, all states inherited from a null state.
> It means that technically, every state is a null state.
>
> I propose another hierarchy, with an abstract state as the parent of every other states (Included the null state)

#### Ajout d'une customization de la taille du plateau
Auteur : Xavier Moyon  
https://github.com/LeoDefossez/Myg/pull/1  
// TODO


