
# Ce que j’ai appris

Cette semaine, j’ai révisé l’ensemble des cours . J’ai notamment revu le fonctionnement de `self` et `super`, les design patterns (Singleton, Composite, Visitor, etc.), ainsi que les différences entre les variables d’instance et les variables partagées etc.

J’ai également révisé les notions d’encapsulation, d’héritage, de délégation, de couplage et de double dispatch, ainsi que les autres concepts abordés pendant les cours pour mieux comprendre les principes étudiés et de consolider mes connaissances.

**Je tiens à vous remercier pour ces cours, qui m’ont vraiment permis de voir les choses d’une autre façon et de mieux comprendre les principes de la programmation orientée objet**

# Partie TP

Concernant les TP, j’ai rencontré un problème technique avec mon image Pharo, mais j’ai réussi à le résoudre et à reprendre mon travail.

## TP Chess

J’ai avancé sur le *Refactor piece rendering* : j’ai nettoyé le code qui choisit la lettre à afficher pour chaque pièce, en remplaçant les conditions imbriquées par deux approches différentes : le double dispatch (la pièce et la case se demandent mutuellement l’information) et le table dispatch (une table associe directement chaque pièce et couleur à sa lettre).

Le double dispatch respecte mieux l’encapsulation (chaque pièce porte sa propre donnée) , tandis que le table dispatch centralise tout au même endroit mais oblige la case à connaître toutes les classes de pièces

## Liens vers les TP réalisés

- **TP Chess :** [tp_chess](https://github.com/AbdellaouiHajar1/tp_chess.git)
- **TP MyCounter :** [Mycounter](https://github.com/AbdellaouiHajar1/Mycounter.git)
- **TP Dés :** [tppharo_Des](https://github.com/AbdellaouiHajar1/tppharo_Des.git)
- **TP Flags :** [tppharo_flags](https://github.com/AbdellaouiHajar1/tppharo_flags/tree/master)
