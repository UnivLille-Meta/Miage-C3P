# Challenges

This list presents challenges. There are either in Microdown/Foliage or in Bloc. 
Each group will have to take one or two challenges and work on it. 

- Microdown is a markdown language and its set of tools (generator for HTML/LaTeX) and others.
It is used by Pillar (the compilation chain) and Foliage (a static web generation system)
- Games in Bloc. Myg is a group of games developed on Bloc

For each challenge you will have to 
- present the existing design and situation
- propose a solution to the challenge

## Existing design

Here are some suggestions
- what are the packages?
- what are the classes / hierarchies?
- what is the core? important classes?

## Microdown Challenges

You should work on one Warm up exercises

### Warm up
  - https://github.com/pillar-markup/Microdown/issues/963
  - https://github.com/pillar-markup/Microdown/issues/966  

### Challenge: Support for hiding corrections

Imagine the file Chapter1/File1.md 

```
		```exercice&anchor=exfoobar
               Foo >> bar
				some code
				more code
				even more code
                  ```
```

We want that the document is transformed into 

```
## Chapt
@Chap1

		```exercice
               Foo>> bar
			… Your code …
              ```
```

and that another file `Chapter1/File1Solutions.md` is generated with the 	

```
  	 	Here is the solution of the code *@exfoobar@* in Chapter *@Chap1@*
  		```
        Foo>> bar
			some code
			more code
			even more code
        ```

```

- TocBuilder.


## Foliage Challenges

## Myg Challenges

Myg uses the Bloc new graphics library. It is loaded by default in Pharo 14.

You can find resources on Bloc at:
- https://www.github.com/SquareBracketAssociates/booklet-graphics
- https://books.pharo.org/booklet-ASimpleMemoryGameInBloc/2024-06-05-ASimpleBlocTutorial.pdf

The project https://github.com/Ducasse/Myg defines several games: Sokoban, Miner, Takuzu.
The project https://github.com/Ducasse/2023-SameGame/ defines a same game. 

### Sokoban Challenges

- Teleport title. Given two teleport tiles, implement teleport so  that when the player move it, teleports the player to another wrap tile.
- Counting moves and push. Introduce the display of moves.
- Numbered Target. Introduce number on the target and make sure that the box should be moved in order on the target.
- Paired Target/Box. Introduce pairs of target/box where each box can only go on a target. A version can mix paired and unpaired boxes.


### SameGame Challenges

https://sokoban.dk/sokoban-variants/

- MultiColor. Introduce a kind of tile that matches all the colors.
- Cycling colors. The tile will change its color in a circle (red -> blue -> yellow -> red) after each action.
- Kill the line. When clicked, it should eliminate the line.
- Kill the column. When clicked, it should eliminate the column. 


