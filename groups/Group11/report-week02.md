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
