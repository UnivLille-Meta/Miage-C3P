# Adil

## Classes
```smalltalk
Vehicle>>drive
    ^ 'The vehicle drives.'

Car>>drive
    ^ drive, ' But faster!'  "Inherits from Vehicle"

Motorbike>>no method drive and inherits from Object
```

## In Playground

```smalltalk
v := Vehicle new.
v drive.   "→ 'The vehicle drives.'"

m := Motorbike new.
m drive.   "→ 'Instance of Object did not understand #drive'"

"We need to make Motorbike a subclass of Vehicle"
```

```smalltalk
c := Car new.
c drive.   "→ Error: message sent to nil (infinite recursion)"
```

## Correction:

```smalltalk
Car>>drive
    ^ super drive, ' But faster!'   "→ 'The vehicle drives. But faster!'"
```

or:

```smalltalk
test
    ^ self drive, ' But faster!'
```

> I used `self` because in Pharo, especially in the Playground, writing `drive` alone would be interpreted as accessing a variable, not calling a method.
> Correct assumption and have information only with Pharo alone with Playground


## Obede

###SUPER and SELF exercise

- Creating 3 classes : A, B and C,

- The class A has a 2 methods : bar and foo

'''ClassA>>bar
    ^self foo
ClassA>>foo
    ^10'''

- The class B inherits ClassA and has one method : bar
'''ClassA<<ClassB
    ClassB>>bar
        ^super bar + self foo

The class C inherits ClassB and has one method : foo
ClassB<<ClassC
    ClassC>>foo
        ^50'''

- testing in the playground
'''|a|

a := ClassA new.

Transcript show: a bar

>>>>10

a := ClassB new.

Transcript show: a foo

>>>>10

a := ClassC new.

Transcript show: a foo

>>>>50'''

- Super refers to the receiver of the message (just like self)
- The method lookup starts in the superclass of the class containing the super
- expression
- Super is static and Self is dynamic




        
    

    

