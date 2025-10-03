# Homework 2
## Douha Agouni 
## Practice message dispatch
- In the package Dice, we have two classes Die and DieHandle, both of them contain a method roll : 
- Die >> roll
    ^ faces atRandom 
- DieHandle >> roll 
 ^ (dice collect: [ :each | each roll ]) sum.
 - In every time, we call one of the methods, the system will search and execute the right one even if they have the same name, like in the videos we "let the receiver decide"
 
