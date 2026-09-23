# Rapport hebdomadaire semaine 2

 
## 1. Exercices de préparation

Cette semaine, j’ai travaillé sur les exercices de préparation.

J’ai regardé les deux vidéos sur `self` et `super`. Elles m’ont permis de mieux comprendre leur fonctionnement :

- `self` désigne toujours l’objet qui a reçu le message ;
- `super` ne change pas le receveur ;
- `super` change uniquement l’endroit où commence la recherche de la méthode.

J’ai également réalisé les exercices **Flag/Country**.

----------------------------------------------------------------------------------------

J'ai regardé aussi la vidéo de yourself, j'ai compris que yourself permet de retourner l'objet lui-même après l'avoir configuré avec plusieurs messages .

Par exemple :

```
Person new
    name: 'Nour';
    age: 21;
    yourself
```

Ici on crée une nouvelle personne, puis on lui donne le nom Nour et l'âge 21. A la fin, yourself retourne cette meme instance de Person, avec les valeurs qui ont été enregistrées dedans. On récupère donc un objet Person représentant Nour, agée de 21 ans. 

## 2. Pratique du message dispatch

Pour pratiquer le message dispatch, j’ai créé plusieurs classes liées au paiement : `Payment`, `CardPayment` et `PremiumCardPayment`.

J’ai d’abord testé un appel avec `self`. La méthode `description` était définie dans `Payment` :

```
description
    ^ self method
```
et CardPayment redéfinissait :
```
method
    ^ 'card'
```
En exécutant :
```
CardPayment new description
```
j’avais prévu que le résultat serait 'card', et c’était bien le cas.

J’ai compris que self représente toujours le receveur réel, ici une instance de CardPayment. Le message method est donc recherché à partir de cette classe et la méthode CardPayment >> method est exécutée.

J’ai ensuite testé super avec :
```
parentMethod
    ^ super method
```
Ici, le résultat était 'generic payment', car super commence la recherche de la méthode dans la classe parente Payment.

L’exemple le plus intéressant était :
```
parentDescription
    ^ super description
```
alors que Payment >> description contenait :
```
description
    ^ self method
```
En exécutant :
```
CardPayment new parentDescription
```
j’avais prévu que le résultat serait 'card', et c’était bien le cas.

Cela m’a permis de comprendre que super change seulement le point de départ de la recherche de méthode, mais ne change pas le receveur. Dans description, self reste donc l’objet CardPayment.

Enfin, avec une troisième classe PremiumCardPayment, j’ai testé :
```
PremiumCardPayment new parentDisplay
```
J’avais prévu que le résultat serait 'premium card', et le résultat était bien celui-ci.

Cela m’a confirmé que même lorsqu’un appel passe par super, le receveur reste le même. Un appel suivant avec self est donc dispatché dynamiquement à partir de la classe réelle du receveur, ici PremiumCardPayment.

Ces tests m’ont permis de mieux distinguer les rôles de self, super et du message dispatch.
