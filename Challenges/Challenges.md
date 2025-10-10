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
Microdown is a markup language. It integrates with the pillar compilation chain.

It is the basis for
- Slides 
- Books in PDF
- Books on the web
- Documentation 
- Web page generation

We will learn about the Visitor, document model, optionally parsing.
We want to improve the testing of the books and the support for the book writers.

Microdown is a markup language compatible with a subset of markdown. 
It is used by the Pharo community to produce slides, booklets, and documentation. 
Microdown heavily uses Visitors. 
The repository is at 

```
https://github.com/pillar-markup/microdown
```

#### Loading

Pay attention to follow the loading instructions to **develop** Microdown as defined on the readme on the project. You should execute them else you may have problems since a different version of Microdown 
preloaded in Pharo may conflict with the version you will load. 

#### Generating a plain text TOC

Define a simple Visitor that will generate a text. For example

```
vis := SimpleTOCGenerator new.
vis visit: (Microdown parse: miniDoc)
vis contents
>

'
Microdown
Architecture
  Visitors
  A builder
'

#### Controlling the level

Now we can also want to only show sections whose nested in higher than a certain level.

```
vis := SimpleTOCGenerator new.
vis showOnlyAbove: 1.  
vis visit: (Microdown parse: miniDoc)
vis contents
>

'
Microdown
Architecture
'

#### Showing numbers

Now we may want to get the TOC numbered

```
vis := SimpleTOCGenerator new.
vis showOnlyAbove: 1.  
vis numbered.
vis visit: (Microdown parse: miniDoc)
vis contents
>

'
1 Microdown
2 Architecture
'
```
#### Producing Microdown

Now we would like to be able to produce Microdown text that represents the TOC.
This solution should use the textual builder.

```
vis := SimpleTOCGenerator new.
vis showOnlyAbove: 1.  
vis visit: (Microdown parse: miniDoc)
vis contents
>

'
# Microdown
# Architecture
'
```

#### Supporting Link

Now we would like to be able to create a link (for example in HTML) from the TOC to the file.
In such a case we need to have an object representing a TocEntry.
This entity will be able to hold a link to file or an URL

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



### Other Microdown Challenges

You can find some other challenges such as the Book Sanitizer  in 
http://github.com/pillar-markup/BookTester

## Myg Challenges

Myg uses the Bloc new graphics library. It is loaded by default in Pharo 14.

You can find resources on Bloc at:
- https://www.github.com/SquareBracketAssociates/booklet-graphics
- https://books.pharo.org/booklet-ASimpleMemoryGameInBloc/2024-06-05-ASimpleBlocTutorial.pdf

The project https://github.com/Ducasse/Myg defines several games: Sokoban, Miner, Takuzu.
The project https://github.com/Ducasse/2023-SameGame/ defines a same game. 

### Sokoban Challenges

https://sokoban.dk/sokoban-variants/

- Teleport title. Given two teleport tiles, implement teleport so  that when the player move it, teleports the player to another wrap tile.
- Counting moves and push. Introduce the display of moves.
- Numbered Target. Introduce number on the target and make sure that the box should be moved in order on the target.
- Paired Target/Box. Introduce pairs of target/box where each box can only go on a target. A version can mix paired and unpaired boxes.


### SameGame Challenges
There is an implementation of SameGame. 

- MultiColor. Introduce a kind of tile that matches all the colors.
- Cycling colors. The tile will change its color in a circle (red -> blue -> yellow -> red) after each action.
- Kill the line. When clicked, it should eliminate the line.
- Kill the column. When clicked, it should eliminate the column. 


