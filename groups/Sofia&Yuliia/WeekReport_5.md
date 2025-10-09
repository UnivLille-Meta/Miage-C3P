Weekly Report5

Yuliia LOS:

This week I studied several presentations about Double Dispatch and the Visitor Design Pattern. These topics helped me understand how to design clean, extensible, and object-oriented systems without using many if statements.

Double Dispatch means that a program chooses the right method depending on both objects — the one that sends the message and the one that receives it. This technique lets two objects decide together what to do. For example, in the Stone–Paper–Scissors game, each object knows how to play against another:

Stone >> vs: anElement

   ^ anElement playAgainstStone

If the argument is Paper, it will call Paper >> playAgainstStone which returns #paper, meaning that paper wins. The same logic works for Scissors or Stone, and we can even extend the game with new elements like Lizard or Spock without changing the old code.

Another example was about adding numbers using Double Dispatch. The idea is to handle different combinations like Integer + Float, Float + Fraction, etc., without conditions. Each number class knows how to interact with the others:

Integer >> + aNumber
   
   ^ aNumber sumWithInteger: self

and

Float >> sumWithInteger: anInteger
   
   ^ addf(self, asFloat(anInteger))

This way, the correct operation is chosen automatically based on both types.

Then I learned about the Visitor Design Pattern, which also uses Double Dispatch. Visitor separates operations from the objects they work on. For example, in an expression like 1 + (3 * 2), we can use a Printer visitor to print it or an Evaluator visitor to calculate the result. Each expression element (Number, Plus, Times) only needs to implement:

acceptVisitor: aVisitor
   
   ^ aVisitor visitPlus: self

This makes it easy to add new operations (like “evaluate” or “pretty-print”) without modifying the original expression classes.

From these lessons, I understood that sending messages is a key idea in Pharo — it’s how we make choices in a pure object-oriented way. Double Dispatch and Visitor make programs more modular and easier to extend.

All the information was taken from the course materials on the website: https://advanced-design-mooc.pharo.org/

I also continued working on my Chess project this week.


