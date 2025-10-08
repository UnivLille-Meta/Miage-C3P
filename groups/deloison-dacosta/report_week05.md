

























































# Report Week 5

# Antonin DELOISON

## Homework

This week, I watched videos on Double Dispatch and Visitor. I completed the first version of Paper Stone Scissors and Die.

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

