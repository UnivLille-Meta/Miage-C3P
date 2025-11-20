# Week 8 report

# Sommaire

- [Léo Defossez](#léo-defossez)
- [Gautier Louvier](#Gautier-Louvier)
- [Xavier Moyon](#Xavier-Moyon)

## Léo Defossez

> Notes :  
> Les homeworks à faire sur le cours de la semaine 7 était "Practice message dispatch".  
> Seulement, j'ai déjà réalisé cet homework la semaine dernière (par erreur de ma part).  
> Ce que j'ai donc fait cette semaine est de regarder toutes les vidéos du module 5 et 9 de l'advanced mooc.
> 
> ### Travail sur SameGame
> 
> Cette semaine, nous avons commencé à réaliser des challenges sur SameGame.  
> https://github.com/LeoDefossez/Myg/tree/Add-score-to-UI.  
> J'ai ajouté durant la partie un compteur avec le score total, et le score du dernier coup.  
> Actuellement un compteur est prévu pour le nombre de blocs cassé, mais il est difficile à ajouter sans casser l'architecture.  
> C'est pourquoi pour ne pas produire de conflit avec le travail de Xavier et Gautier, j'ai laissé cette modification à plus tard et j'ai ouvert une issue à ce sujet.
> https://github.com/LeoDefossez/Myg/issues/4
> 
> ### Module 5
> 
> #### Composite
> 
> Le composite est un design pattern simple, qui représente des structures récursives d'objets.  
> Un exemple illustrant facilement la chose est le système de stockage d'un ordinateur, étant soit un dossier, soit un fichier (Avec plusieurs types de fichiers).  
> Dans cette représentation un fichier est un nœud pouvant contenir d'autres composite, et un fichier est une feuille.  
> 
> #### State
> 
> Ce pattern est aussi plutôt simple, il permet de définir comment agira un objet en fonction de son état.  
> Son état est réifié en un objet, et chacun de ses états se connaissent entre eux, dans l'objectif de pouvoir altérnés.  
> Un exemple que j'aime utiliser est :  
> Pour un téléphone, en fonction de son état, allumé ou éteint, en appuyant sur le bouton d'allumage. S'il est en état éteint, son état deviendra allumé, s'il est allumé son état deviendra éteint.  
> 
> #### Command
> 
> Je trouve celui-ci plus complexe, car je ne l'ai jamais appliqué.  
> Il permet de réifier des commandes qu'un objet va devoir effectuer, cela permet de réduire les conditionnelles, mais aussi d'offrir à ces commandes la puissance qu'offre un langage objet.  
> C'est-à-dire leur offre la possibilité d'être sous classés, ou décorés etc... Et donc permet à un objet d'agir différemment en fonction de la commande que l'on lui offre.  
> Par exemple imaginons une voiture télécommandée, on pourrait lui donner une commande Move, qui serait initialement déplacement de 10cm, on peut étendre cette commande move, pour lui demander un déplacement de 15cm.
> 
> #### Delegation vs Héritage
> 
> L’héritage permet de définir différentes manières d’agir pour un objet en fonction de son type.  
> La délégation, elle, consiste à confier certaines actions à un objet externe.
> 
> L’avantage de l’héritage, est que cela crée une hiérarchie claire, et que toutes les informations nécessaires pour exécuter une action se trouvent directement dans l’objet.  
> Cependant, dès que l'on veut ajouter une nouvelle action impactant cette hiérarchie, le nombre de classes peut vite exploser.  
> De plus, changer de stratégie devient compliqué, car cela revient instancié un nouvel objet, qui au runtime peux être complexe.
> 
> La délégation, au contraire, garde chaque action indépendante. On évite donc de multiplier les classes inutilement.  
> On peut aussi changer dynamiquement de stratégie sans toucher à l’objet principal, simplement en remplaçant l’objet auquel on délègue.  
> Cependant, l'objet délégué pourrait avoir besoin d'information présente dans l'objet principal, ce qui implique que l'objet principal doit pouvoir lui fournir, ce qui peut poser des problèmes de sécurité ou de conception dans certains cas.  
> 
> #### Null pattern
> 
> Ceci est un pattern que j'aime beaucoup, car il permet de réduire les conditionnelles (Et avoir bien plus direct).  
> L'idée est simple : Au lieu d'utilisé nil/null, on crée notre propre objet null.  
> 
> Cet objet aura la même API que l'objet qu'elle remplace, il l'implémentera de façon neutre, c'est-à-dire que l'envoie de message sur cet objet ne doit avoir aucun effet.  
> 
> #### Turning procedure to objects and fluid API
> 
> J'ai regroupé ces deux vidéos, car elles consistent toutes deux à créer un objet pour réifier une procédure/méthode.  
> L'idée consiste simplement à créer un objet paramétrable, ce qui permet de définir ou non certain argument de la méthode. Cela permet de ne pas avoir un nombre combinatoire de méthodes dû à l'argument pouvant être très nombreux.  
> 
> C'est un design que j'appliquais déjà sans réellement le réaliser, car je n'aime pas devoir multiplier ma méthode ou passer des arguments par défaut, j'ai donc déjà tendance a réifié les longues méthodes.
> 
> ### Module 9
> 
> #### Coupling and encapsulating
> 
> Le principe principal est d'appliquer le comportement au plus proche des données, dans la limite du raisonable, pour qu'en cas de modification, seuls les dépendences directes soient impactés.
> 
> #### Class methods and registration
> 
> Introduit la possibilité d'une superclasse de choisir qu'elle sous classe instantié à l'aide de la méthode allSubClasses.  
> Mais ceci est couteux en cas de grande hiérarchie, et toujours recalculé.  
> Une autre option est de tenir une liste dans la super classe, et la remettre à jour à chaque ajout de sous classe, mais le problème est que le développeur doit penser à les ajouter, ce qui est source d'erreurs.  
> La dernière solution consiste à l'initialisation de la classe de s'ajouter dans un mécanisme d'enregistrement, pour ne pas avoir à chaque fois à query sur les sous classes. Ce design apporte de la modularité, mais de la complexité. 

## Gautier Louvier :

> ## Delegation vs. Inheritance :
> 
> Cette semaine, l'analyse a porté sur la comparaison de différentes approches de conception logicielle pour gérer des algorithmes interchangeables (par exemple, différentes méthodes de formatage de texte). L'objectif était de comprendre les avantages et inconvénients de **l'Héritage** par rapport à la **Délégation** (s'apparentant au Design Pattern "Strategy").
> 
> ### Critères d'Évaluation :
> 
> Les solutions ont été évaluées selon trois axes principaux :
> 
> 1. **Coût d'Ajout :** La facilité d'intégration d'un nouvel algorithme dans le système.
> 
> 2. **Modularité (Packaging) :** La possibilité de développer et déployer les algorithmes séparément les uns des autres.
> 
> 3. **Dynamicité (Dynamic Switch) :** La capacité du système à changer d'algorithme pendant l'exécution (au runtime).
> 
> *(Une approche naïve, comme **une classe unique avec des conditionnels** (if/else ou switch), a été écartée car bien qu'elle permette la dynamicité, elle échoue sur l'ajout et la modularité : tout est compilé ensemble et la modification d'un algo impose de tout re-tester et re-déployer.)*
> 
> ---
> 
> ### 1. L'Approche par Héritage :
> 
> Cette approche utilise la création de sous-classes pour implémenter chaque variation d'algorithme.
> 
> - **Avantages :**
>   
>   - **Facilité d'Ajout :** L'ajout d'un nouvel algorithme est relativement simple ; il suffit de créer une nouvelle sous-classe qui hérite du comportement de base.
>   
>   - **Identification :** Permet de bien identifier les abstractions et les points d'extension communs.
> 
> - **Inconvénients :**
>   
>   - **Manque de Dynamicité :** L'approche est fondamentalement **statique**. Le comportement est fixé à la compilation (par le type de la classe). Pour changer de comportement, il est nécessaire de créer une **nouvelle instance** d'une sous-classe différente.
>   
>   - **Risque d'Explosion Combinatoire :** Si plusieurs axes de variation existent (ex: formatage ET compression), la hiérarchie des classes peut devenir exponentielle, complexe et difficile à maintenir.
> 
> ---
> 
> ### 2. L'Approche par Délégation (Pattern Strategy) :
> 
> Cette approche consiste à "composer" la classe principale (ex: `Editeur`) avec un objet distinct (le "délégué", ex: `Formateur`) qui gère l'algorithme. La classe principale délègue l'exécution de la tâche à cet objet.
> 
> - **Avantages :**
>   
>   - **Haute Dynamicité :** C'est le point fort majeur. On peut changer l'algorithme à tout moment pendant l'exécution, simplement en fournissant un nouvel objet délégué à la classe principale (souvent via un "setter").
>   
>   - **Excellente Modularité :** Les algorithmes (les "stratégies") sont totalement découplés de la classe principale. Chaque stratégie est une classe séparée, facilitant les tests, la maintenance et le déploiement séparé.
>   
>   - **Facilité d'Ajout :** L'ajout de nouveaux algorithmes est facile : il suffit de créer une nouvelle classe implémentant l'interface du délégué.
> 
> - **Inconvénients :**
>   
>   - **Couplage de Données :** L'objet délégué (le `Formateur`) doit souvent accéder à des données de la classe principale (le `Contenu`) pour fonctionner. L'API de la classe principale doit être conçue pour "ouvrir" cet accès de manière propre et sécurisée.
>   
>   - **API Uniforme :** L'interface de délégation doit être bien pensée pour couvrir tous les besoins des algorithmes, ce qui peut ajouter une légère complexité initiale.
> 
> ---
> 
> ### 3. Conclusion :
> 
> Le choix entre l'Héritage et la Délégation dépend fortement du contexte et du besoin de flexibilité :
> 
> - **L'Héritage** est utile pour une **extension incrémentale** du comportement (créer une nouvelle "sorte" de chose), mais il reste **statique**.
> 
> - **La Délégation** est supérieure lorsqu'on a besoin d'une **flexibilité d'exécution (runtime)** et d'une forte modularité. Elle permet de changer le "comment" une action est réalisée sans changer l'"qui" la réalise.
> 
> Chaque approche a ses compromis, et le bon choix dépend des besoins spécifiques de flexibilité et de modularité du système à concevoir ou à modifier.
> 
> ## About coupling and encapsulation :
> 
> ### La Loi de Demeter :
> 
> En complément de la délégation, nous avons analysé la **Loi de Demeter (LoD)**. L'objectif principal de ce principe est de **réduire le couplage** entre les objets. L'idée est qu'un objet devrait avoir une connaissance limitée des autres objets, en ne "parlant qu'à ses amis immédiats".
> 
> #### Le Principe :
> 
> Une méthode `m` d'un objet `O` ne devrait envoyer des messages (appeler des méthodes) qu'aux objets suivants :
> 
> - L'objet `O` lui-même (`self`)
> 
> - La classe parente (`super`) ou sa propre classe
> 
> - Ses propres variables d'instance
> 
> - Les arguments/paramètres passés à la méthode `m`
> 
> - Un objet qu'elle crée elle-même (ex: `Thing new`)
> 
> Elle doit **éviter** d'appeler des méthodes sur un objet qui est le *résultat* d'un autre appel (sauf `self`).
> 
> > **Violation typique (le "Train Wreck") :** `self.getVoiture.getPneu.getFabricant.getNom`
> > 
> > Ici, l'objet `self` est fortement couplé à la structure interne des classes `Voiture`, `Pneu` et `Fabricant`.
> 
> ---
> 
> #### Avantages :
> 
> - **Faible Couplage :** C'est l'avantage principal. Si l'implémentation de la classe `Pneu` change, seule la classe `Voiture` est impactée, mais pas notre objet initial.
> 
> - **Maintenance Facilitée :** En limitant les "connaissances" d'une classe, on évite les **changements en cascade** à travers toute l'application lorsqu'une structure interne est modifiée. L'infrastructure reste masquée.
> 
> ---
> 
> #### Limites et Concessions :
> 
> Comme tu l'as très bien noté, une application trop stricte de la LoD peut avoir des effets inverses :
> 
> - **Prolifération de "Wrappers" :** Si on suit la loi aveuglément, on peut se retrouver à écrire de nombreuses **méthodes "passe-plat"** (ex: `self.getNomFabricantPneu` dans `Voiture`). Cela alourdit les API et peut masquer la logique métier.
> 
> - **Difficulté sur Objets Complexes :** Dans des systèmes complexes, il est parfois difficile de respecter la loi à 100% sans sacrifier la clarté.
> 
> ---
> 
> #### Conclusion sur la LoD :
> 
> La Loi de Demeter n'est pas une règle absolue, mais un **indicateur de conception** (un "code smell" si elle n'est pas respectée).
> 
> Il faut trouver un **équilibre** (une concession) entre le désir d'un couplage faible et le besoin d'une API claire et compréhensible. L'objectif est de l'utiliser pour **rapprocher les méthodes des données** qu'elles manipulent de manière cohérente, sans créer une complexité inutile.
> 
> ---
> 
> ## Composite :
> 
> Le design pattern composite peut être utiliser quand une action doit être réaliser dans une structure en arbre. Qui peut être récursive car la structure peut contenir soit directement des feuilles ou d'autre arbres, ect . . . 
> 
> Il va suivre la même API, mais avec des méthodes supplémentaire pour gérer plusieurs type de feuille en aillant de quoi les ajouter, supprimer , itérer sur eux avec la méthode de l’API.
> 
> On voit bien la force de ce pattern car en suivant la même API et en implémentant une structure possiblement récursive qui reste modulaire et pourrait être remplacer ou modifier simplement.
> 
> J'ai réaliser l'exercice de celui ci dans ce repo : [Commit Exercice Composite](https://github.com/fgogow/ExercicePharoM1Miage/commit/93ff5609ce1826c76cf46e1deb2774270aa6274a)
> 
> ---
> 
> ## Visitor :
> 
> Le visiteur n’est au courant que de la super classe sur laquelle se base sur le composite
> 
> Il a besoin d’une structure adaptée pour pouvoir faire ses opérations sur la classe visé et pour se greffer sur celle ci.
> 
> Il faut donc adapter le domaine : Le domaine soit donc avec pour chaque classe “acceptVisitors” et gérer ce qu’il doit recevoir. Il renvoie au visiteur passer en paramètre pour lui dire “ok tu es un visiteur appel cette méthode de ton côté pour réaliser la partie logique avec ton implémentation et ce contexte en paramètre”
> 
> J’ai réalisé la force du visiteur quand j’ai réaliser l’exercice sur celui ci.
> 
> Disponible ici : [Commit Exercice Visitor (suite exo composite)](https://github.com/fgogow/ExercicePharoM1Miage/commit/dc2760b0dc5a7882db44f32fe9864bec16cb77fa)
> 
> Double dispatch : grâce à lui, on peut aller “visiter” une méthode qui accepte le visitor et qui lui dit “voila maintenant que tu sais mon contexte, tu envoie ce message sur ton implémentation de ta méthode” Toute la logique et les actions réel sont dans le visiteur. On suit toujours le tell dont ask.
> 
> Il est donc extremement facile d'ajouter ou d'enlever un visitor quand le domaine a était adapté en conséquence. 



## Xavier Moyon

> ### SAME GAME
> 
>  Cette semaine sur le SameGame j'ai travaillé sur l'ajout d'un nouvel item multicolor. Afin d'intégrer au mieux cet item j'ai notament rajouter un nouveau state et rajouter un double dispatch afin d'appeller la bonne méthode de propagation en fonction de l'état d'une case. 
> 
> ### Avoid Null Check
> 
> Concernant les null check, on peut les éviter en fournissant des valeurs par défaut ou des éléments vide (par exemple une liste vide ou en entier de valeur 0 ou 1, a voir en fonction des cas). Cela permet d'alleger le code. Ensuite, pour les cas plus compliqué on peut créer un NullObject, c'est un objet ayant normalement une instance (Singleton) avec des méthodes "mockée".
> 
> En fonction des situations le NullObject est à éviter. Par exemple si la classe contient beaucoup de méthodes ou que l'implémentation de la méthode du null object n'est pas évidente.
> 
> Une autre alternative peut-être de lever des exceptions mais il faut donc que le client soit prêt à la recevoir.   
> 
> ### Composite
> 
> Le design pattern composite permet de representer des arborescences. Chaque élement à une API commune (`draw` par exemple). Il y a des éléments dit "feuilles" ces éléments représentent en général la fin d'une branche. 
> Tout cela permet d'appeller la méthode `draw` (de mon exemple) pour n'importe quelle élément de mon arborescence.
> 
> ### Visitor
