# REPORT WEEK 6

## Toky Sandratra 

### What I've done this week :
> - Diving into `double dispatch` by practicing with `RockPaperScissorsLizardSpock`
>
------
### 1- Diving into `double dispatch`
- A test which failed ( RED )
```
testPaperIsWinning
	self assert: (Paper new playAgainst: Stone  new) equals: #paper
```
- A simple code which make the test passed (GREEN)
  - In the Paper class I added :
  ```
  playAgainst: anItem
  	^ anItem playAgainstPaper
  ```
  - And in the Stone class I added :
  ```
  playAgainstPaper
  	^ #paper
  ```
- A test which failed ( RED )
```
testSpockIsWinning2
	self assert: (Spock new playAgainst: Scissors  new) equals: #spock
```
- A simple code which make the test passed (GREEN)
  - In Spock class I added : 
  ```
  playAgainst: anItemn
	  ^ anItemn playAgainstSpock
  ```
  -  In Scissors I added :
  ```
  playAgainstSpock
	  ^ #spock
  ```
---
## Summary :
- I did the implementation of `RockPaperScissorsLizardSpock` with TDD (Test Driven Development). 
- Double Dispatch concept helped to avoid using `if` conditions .    
  
  
