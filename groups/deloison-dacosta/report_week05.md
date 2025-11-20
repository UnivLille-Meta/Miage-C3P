# Report Week 5

# Antonin DELOISON

## Homework

This week, I watched videos on Double Dispatch and Visitor. I realise the first version of Paper Stone Scissors and Die.

In the kata, we chose ‘Implement more gaming strategies’. We created a strategy design pattern with AbstractGamingStrategy in the strategy subclass and exported the base strategy from MyPlayer: RandomGamingStrategy.

```mermaid
%% LR = Left to Right
classDiagram
direction LR

%% --- Hiérarchie à gauche ---
    class AbstractGamingStrategy{
        #play(aPlayer) // abstract
    }

    class RandomGamingStrategy {
        #play(aPlayer)
    }

    class MyPlayer {
        ...
        ...
        // Unchanged
        ...
        ...
    }

    MyPlayer --> AbstractGamingStrategy : possess
    AbstractGamingStrategy <|-- RandomGamingStrategy
````

My first task is to create an offensive strategy, the objective of which is to capture as quickly as possible. It is called: OffensiveGamingStrategy.


```mermaid
%% LR = Left to Right
classDiagram
direction LR

%% --- Hiérarchie à gauche ---
    class AbstractGamingStrategy{
        #play(aPlayer)  // abstract
    }

    class RandomGamingStrategy {
        #play()
    }

    class OffensiveGamingStrategy {
        #play()
        #legalMoves(aPlayer)
        #kingIsInCheck(aPlayer)
        #executeRandomMoveFrom(aCollection)for(aPlayer)
    }

    class MyPlayer {
        ...
        ...
        // Unchanged
        ...
        ...
    }

    MyPlayer --> AbstractGamingStrategy : possess
    AbstractGamingStrategy <|-- RandomGamingStrategy
    AbstractGamingStrategy <|-- OffensiveGamingStrategy
````

Now we have a second strategy, which is to capture as soon as possible.
I have a lot of questions about testing, because we can't create a Game, and without that, we can't retrieve the player's pieces.

I'm testing by copying the MyPlayer class to another environment and modifying the pieces method.


## Difference Between LRU and LFU

LRU (Least Recently Used) removes the item that was accessed the longest time ago, prioritizing recency of use.
LFU (Least Frequently Used) removes the item accessed the fewest times, prioritizing frequency of use.

They improves performance when we need to often access at the datas.


## Giving a quick look of the project

The main methods is :

-  at:ifAbsentPut: This method returns the cached value if present, or computes, inserts, and caches a new value if absent.

-  at:put: Forces the key/value pair to be stored in the cache. If the value already exists, it is replaced.

- addWeight: Manages how much the cache ‘weighs’ and triggers eviction if the limit is exceeded.

- removeKey:ifAbsent: Is used to explicitly remove an entry from the cache.

I focus my code analysis on the main methods, to understand the goals of LRUCache class.

The exemple add the prime number in the cache, if it not exist already.

## From a user perspective: Understanding incomping dependencies

There 424 sendors of at:ifAbsentPut: but only 21 calls are for the LRUCache at:ifAbsentPut:, this is the test LRUCachetest

## Implementor’s Hat: Inserting entries in the cache

We can ignore :

- self critical:
- Class details / "grayed classes"
- Minor comments about rechecking the key after the block

We focus on :

- 2 ifAbsent: block


The evict method is call in addWeight.

# Matéo DA COSTA

## Double dispatch, child’s play

To understand **double dispatch**, I first followed the MOOC and tried to implement it on my own.  
Here’s what I initially came up with:

```smalltalk
vs: anElement

	^ anElement crushedBy: self
```
```smalltalk
crushedBy: aStone

	^ #paper
```
After watching the explanation video, I realized that the argument was unnecessary instead, I needed to return the **Paper** instance itself.  
Here’s my corrected version:

```smalltalk
vs: anElement

	^ anElement crushed
```
```smalltalk
crushed

	^ #paper
```

This implementation is a symmetrical **double dispatch**, but it’s important to note that it can also be asymmetrical depending on how interactions are defined between objects.

## Ding Dong, here comes the Visitor

In the MOOC, I watched the explanation of the **Visitor design pattern** for the implementation of arithmetic expressions in Pharo.  
This design pattern relies on double dispatch and is used when you have the same object that can be visited by different kinds of other objects, and this object doesn’t behave the same way depending on which object visits it*.

In other words, when you need to perform many different actions on the same structure while respecting the Open Closed Principle so the **Visitor** design pattern is the right solution.

Here’s how I understood how it works:

- First dispatch: the element being visited (e.g., Plus, Number, Times) sends its own specific message.  
- Second dispatch: the visitor (e.g., Evaluator, Printer) executes the correct logic depending on the class of the element being visited.

*Source:* [Pharo Advanced Design MOOC — Visitor Pattern](https://rmod-pharo-mooc.lille.inria.fr/AdvancedDesignMooc/Videos/M06_S4.mp4)

## Exercise: Common Cache Algorithms

### LRU (Least Recently Used)

This algorithm replaces the least recently used cache line.  
The idea is to keep recently accessed data, following the *principle of locality*.  
Every access to the cache lines is recorded, which makes this algorithm costly in terms of list processing operations.  
This cost grows exponentially with the number of cache ways a critical aspect in embedded systems.

Several implementations exist.  
One simple approach uses an N×N triangular matrix to represent access order.

📚 *Source:* [Wikipedia — LRU (Least Recently Used)](https://fr.wikipedia.org/wiki/Algorithme_de_mise_en_cache#LRU_(Least_Recently_Used))

### **LFU (Least Frequently Used)**

While LRU tracks recency of access, LFU tracks frequency.  
It replaces the least frequently used cache line.  

However, LFU can suffer from cache pollution: lines that were frequently used in the past but are no longer accessed may still remain in the cache.  
A common improvement is to add an aging policy, so that after a certain time, an old line becomes eligible for replacement.

*Source:* [Wikipedia — LFU (Least Frequently Used)](https://fr.wikipedia.org/wiki/Algorithme_de_mise_en_cache#LFU_(Least_Frequently_Used))