# REPORT WEEK 4 / HOMEWORK IN MODULE04-ReverseEngineering

## Toky Sandratra 

### What I've done this week : (Extras about language)
> - Reviewing  `Class`, `Message` and `super` by practicing with some examples
> - Reading `Double Dispatch` module
>
------
### 1-  Reviewing  `Class`, `Message` and `super`
> Creating a Class `Person` with its methods
```
Object << #Person
   slots: { #name. #age };
   package: 'MyApp'.

Person >> initialize
   name := 'Unknown'.
   age := 0.

Person >> name: aName
   name := aName.

Person >> age: anAge
   age := anAge.

Person >> introduce
   Transcript show: 'Hi, my name is ', name, ' and I am ', age asString, ' years old.'; cr.
```
> Now we create the subclass Student with its methods
```
Person << #Student
   slots: { #studentId };
   package: 'MyApp'.

Student >> initialize
   super initialize.   "Call the method initialize of the Super Class Person"
   studentId := 0.

Student >> studentId: anId
   studentId := anId.

Student >> introduce
   super introduce.   "Call the version of Super Class of Person"
   Transcript show: ' My studentID is ', studentId asString; cr.
```
> Now we test in Playground :
```
Transcript open.

toky := Student new.
toky name: 'Toky'.
toky age: 23.
toky studentId: 12345.

toky introduce.

```
> Result : 
>
> Hi, my name is Toky and I am 23 years old.
> My studentID is 12345
---
### 2-  Reading  `Double Dispatch` module
What I got are :
- `Dispatch` means which methods should be used according the type of the object
- `Single dispatch` : normally an object knows what it has got to do
- `Double dispatch` : two objects should work together to decide the result. ( e.g : the mini-game : StonePaperScissors)
- We use Double dispatch to `avoid` many `if` and `case` in the code.
---
## Summary :
I red the lectures on `module` `6` about double Dispatch and practicing `Super` , `Class`, `Message`
    
  
  
