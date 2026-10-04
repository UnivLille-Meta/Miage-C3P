# Rapport de la semaine 4


J’ai révisé d'autres notions importantes de Pharo..


## 1. Éviter les tests de nil

J’ai appris que nil représente l’absence de valeur , veut dire rien . c'est ce qu'il y a dans une variable quand on n'a rien mis dedans.
nil ne sait rien faire : si on lui envoie un message, ça plante.
donc il faut souvent vérifier avec ifNil: ou ifNotNil: avant d’utiliser le résultat.

Pour éviter cela, plusieurs solutions sont possibles :

- Retourner une valeur vide par ex #() pour une collection ou un 0 pour un nombre;
- bien initialiser les variables dans initialize
- utiliser Null Object, qui remplace nil par un objet qui ne fait rien, on cree une classe qui a les memes méthodes que la vraie classe, mais ses méthodes ne font rien et on la met par défaut à la place de nil.
- utiliser une exception lorsque la situation représente une vraie erreur.

L’idée principale est d’éviter d’avoir des tests de nil partout dans le programme. un message agit comme un meilleur if; au lieu de tester avec  if, on envoie un message et c'est lobjet qui sait quoi faire selon sa classe.

---

## 2. L'initialisation paresseuse 

J’ai aussi appris le principe de lazy initialization.

normalement on remplit les variables dans initialize pour qu'elles ne soient jamais nil. mais parfois préparer une variable prend du temps ou on ne va peut-être jamais s'en servir , dans ce cas on peut attendre de la remplir seulement quand on en a besoin: c'est le lazy.
on laisse la variable à nil au début, on ne la remplit pas dans initialize.
on ne lit jamais la variable directement : on passe toujours par un accesseur : il vérifie si la variable est nil. Si oui il la remplit puis il la renvoie. Sinon, il la renvoie directement.
 x ^ x ifNil: [ x := 0 ]


## 3. Le Visitor

Le problème : on a des objets (par ex Number, Plus, Times) et on veut faire plusieurs opérations dessus (évaluer, afficher...).
Si on met toutes les opérations dans les classes des objets :les classes deviennent énormes ; on mélange plusieurs responsabilités ;pour ajouter une nouvelle opération il faut modifier toutes les classes.

### Solution : le Visitor

Avec le Visitor, chaque opération est placée dans une classe différente. chaque visiteur sait quoi faire pour chaque type d'objet (visitNumber:, visitPlus:, visitTimes:), les objets n'ont qu'une seule méthode à ajouter : acceptVisitor: qui dit au visiteur :voilà qui je suis 
cest le mécanisme de double dispatch : 1er envoi : objet acceptVisitor: visiteur. L'objet se présente.
 ET 2e envoi : l'objet appelle la bonne méthode du visiteur (ex : visitPlus:).
on choisit la bonne méthode sans aucun if.



pour le TP Chess, j’ai réalisé deux katas : corriger les règles de déplacement du pion et empêcher les coups qui mettent son propre roi en danger ; pour la suite, je vais continuer avec les katas suivantes.
