# Report Week 2

# Antonin DELOISON

First, I start by review all the videos about dispatch, super and self.

Next, I carried out a small project on animals, consisting of subclasses of animals and a parent class Animal that have a common method. The aim is to test different ways of reusing a method from the parent class. [Git](https://github.com/antonindeloison/PharoProjects/tree/main/Animals)

First example : Use self 

```
Animal >> parler
    ^ 'Je suis un animal.'.

Dog >> parler
    ^ 'Woof.'.

Animal >> crier
    ^ self parler , ' !!!'.
`````

```
Dog new crier.   "result: 'Woof. !!!'"
````

Here we can see that self works perfectly. The Dog class does not have a crier method, so it looks up the parent, finds the method and applies the target's parler method, in this case the parler method of Dog.

Second example : Use super

````
Animal >> parler
    ^ 'Je suis un animal.'.

Cat >> parler
	^ super parler , ' et je dis Miaou !'.
`````

````
Cat new parler.  "result: Je suis un animal. et je dis Miaou !"
`````

Here, the lookup method will start in the superclass, Animal. The content of the superclass method will be retrieved, returned to the receiver (Cat), then concatenated with the rest of the message.

During this example, I did not encounter any particular problems.

This example is popular, but it is very easy to understand and therefore allows you to focus on the concept being studied.

Before the next one, concerning Kata, I'm going to get ahead with reading the rest of the lessons, so I'm going to study reverse engineering and realize the flag project.