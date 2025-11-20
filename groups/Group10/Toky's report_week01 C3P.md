### Toky's report week01 C3P
*I'm new and I have just arrived this week so I did not have enough time to do many things about what I have missed 

* I installed PHARO and testing some codes as conditions, class 
---
```
'Toky' asUppercase.    "=> 'TOKY'"
(1 to: 5) sum.         "=> 15"
* conditions
| age |
age:= 23.
(age>= 18) ifTrue ['Majeur'] ifFalse ['Mineur'.].
*class
Object subclass: #Personne
   instanceVariableNames: 'nom age'
   classVariableNames: ''
   poolDictionaries: ''
   category: 'MonApp'.

Personne >> presentation
   ^ 'Je m’appelle ', nom, ' et j’ai ', age asString, ' ans.'.
```

* And I take a look and watch video as : TDD 
