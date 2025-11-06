# REPORT WEEK 2

## Toky Sandratra 

### What I've done this week :
> - Reviewing *intersection of collections* problem from the last test
> - Diving into Test-Driven-Development by practicing with some examples
>
------
### 1- Reviewing last test with intersection of collections
```
|set1 set2 inter |
set1 := Set new.
set1 add:1.
set1 add:3.
set1 add:5.

set2 := Set new.
set2 add:5.
set2 add:2.
set2 add:1.

inter := Set new.

set1 do:[:i|
	(set2 includes:i)
	ifTrue:[inter add:i]
].

Transcript open.
inter do:[:i| Transcript show:i;cr].
```
> The code above creates three local variables `set1`, `set2`, `inter`
> - `set1/2` :  two collections( **Set**) from what we've got to find the intersection
> - `inter` :  saves the elements which are the intersection of the two sets
>   
> Module used from the lecture :
> - `includes:` : iterators
> - `do:` : loops
---
### 2- Diving into TDD with some examples : 
- Create TestCount :
  ```
  TestCase << #CounterTest
	slots: {};
	package: 'Counter'
  ```
- Create method testCount :
  ```
  testCount
	" 	Initial state : Count is not initialized 
		Action : set count to 2
		Check : get count should be 2
	"
	self assert: (Counter new count:2) count equals: 2
  ```
- `Red` => 3 errors appeared to prevent from passing the test to green :
  > So I created a new class `Counter` and a getter and a setter of the variable `count` :
  - Class `Counter` :
    ```
    Object << #Counter
  	  slots: { #count };
  	  package: 'Counter'
    ```
  - Setter `count: anInteger` :
    ```
    count: anInteger 
	    count := anInteger
    ```
  - Getter `count` :
    ```
    count
	    ^ count
    ```
- `Green` => the test turned green so I tested some new methods as `testIncrement` and `testDecrement` and so on ...
---
## Summary :
I red the lectures on `module` `1-2` and practicing `Loops` , `Iterators` and `TDD`.
    
  
  

