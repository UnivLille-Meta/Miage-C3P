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

---

# Obede

## SUPER and SELF exercise

- Creating 3 classes : `A`, `B` and `C`.
- The class `A` has 2 methods : `bar` and `foo`

```smalltalk
ClassA >> bar
    ^self foo

ClassA >> foo
    ^10
```
- The class B inherits ClassA and has one method : bar

```smalltalk
ClassB >> bar
    ^super bar + self foo
```
- The class C inherits ClassB and has one method : foo

```smalltalk
ClassC >> foo
    ^50
```
- Testing in the playgroung

```smalltalk
|a|

a := ClassA new.
Transcript show: a bar.   "=> 10"

a := ClassB new.
Transcript show: a foo.   "=> 10"

a := ClassC new.
Transcript show: a foo.   "=> 50"
```

## Flag exercise

- Testing in the playgroung somes codes
  
```smalltalk
|c|

c := RSCanvas new.

blueBox := RSBox new

size:80;
color: #blue.

redBox := RSBox new
size:80;
color: #red.

c
	add: blueBox;
	add: redBox.
	
blueBox translateBy: 40@20.

c
```

---

# Jean-Alexis

I tried to represent a company hierarchy and his system to calculate salaries.

So first I define the main class : the basic Employee and his methods.

```smalltalk
Employee >> baseSalary
	^ 1000

Employee >> salary
	^ self baseSalary
```

Here the salary methods returns the baseSalary, but later we can imagine adding a coefficient to decrease or increase it.

Then, the manager (which inherits the Employee class) who earn the current salary of an employee plus the base one.

```smalltalk
Manager >> salary
	^ super salary + self baseSalary
```

I use the self baseSalary because we could use this methods for the highter hierarchy since it's the same calculating system, we'll just have to change the value.

That's the case here with the Director (which inherits the Manager class) :

```smalltalk
Director >> baseSalary
	^ 5000
```

Now we have all the employees in the company we can calculate their salary :

```smalltalk
| employee manager director |

employee := Employee new.
Transcript show: employee salary.
"It should return 1000"

manager := Manager new.
Transcript show: manager salary.
"It should return 2000 (1000 returned by Employee (super) salary + 1000 returned by Employee baseSalary (self cause Manager don't have a method baseSalary so it takes the inherited one) )"

director := Director new.
Transcript show: director salary.
"It should return 10000"
```

For the last one, it take the inherit salary methods cause Director dosn't have one, so the result should be Employee (super from the method class [Manager]) salary plus the baseSalary of the Director (because the self represents the initially instantiated class. So technically it call self baseSalary + self baseSalary wich is not very logical but it's just for the example.

I also did the DSL exercise about Dice game. I wrote until the DieHandle roll method and I tried to add the Integer method extension but It doesn't worked. Actually when I create a protocol with the "*Dice" it tell me that the '*Something" annotation reserved for class Exension. I search on the web how to do it but I didn't found anything (you can tell me I don't now how to search I already know it !).

---

> Watching videos for the next module
    

    

