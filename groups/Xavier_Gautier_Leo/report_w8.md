# Week XXXX report

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
> ### Module 5
> #### Composite
> Le composite est un design pattern simple, qui représente des structures récursives d'objets.  
> Un exemple illustrant facilement la chose est le système de stockage d'un ordinateur, étant soit un dossier, soit un fichier (Avec plusieurs types de fichiers).  
> Dans cette représentation un fichier est un nœud pouvant contenir d'autres composite, et un fichier est une feuille.  
> 
> #### State 
> Ce pattern est aussi plutôt simple, il permet de définir comment agira un objet en fonction de son état.  
> Son état est réifié en un objet, et chacun de ses états se connaissent entre eux, dans l'objectif de pouvoir altérnés.  
> Un exemple que j'aime utiliser est :  
> Pour un téléphone, en fonction de son état, allumé ou éteint, en appuyant sur le bouton d'allumage. S'il est en état éteint, son état deviendra allumé, s'il est allumé son état deviendra éteint.  
> 
> #### Command 
> Je trouve celui-ci plus complexe, car je ne l'ai jamais appliqué.  
> Il permet de réifier des commandes qu'un objet va devoir effectuer, cela permet de réduire les conditionnelles, mais aussi d'offrir à ces commandes la puissance qu'offre un langage objet.  
> C'est-à-dire leur offre la possibilité d'être sous classés, ou décorés etc... Et donc permet à un objet d'agir différemment en fonction de la commande que l'on lui offre.  
> Par exemple imaginons une voiture télécommandée, on pourrait lui donner une commande Move, qui serait initialement déplacement de 10cm, on peut étendre cette commande move, pour lui demander un déplacement de 15cm.
> 
> #### Delegation vs Héritage
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
> Ceci est un pattern que j'aime beaucoup, car il permet de réduire les conditionnelles (Et avoir bien plus direct).  
> L'idée est simple : Au lieu d'utilisé nil/null, on crée notre propre objet null.  
> 
> Cet objet aura la même API que l'objet qu'elle remplace, il l'implémentera de façon neutre, c'est-à-dire que l'envoie de message sur cet objet ne doit avoir aucun effet.  
> 
> #### Turning procedure to objects and fluid API
> J'ai regroupé ces deux vidéos, car elles consistent toutes deux à créer un objet pour réifier une procédure/méthode.  
> L'idée consiste simplement à créer un objet paramétrable, ce qui permet de définir ou non certain argument de la méthode. Cela permet de ne pas avoir un nombre combinatoire de méthodes dû à l'argument pouvant être très nombreux.  
> 
> C'est un design que j'appliquais déjà sans réellement le réaliser, car je n'aime pas devoir multiplier ma méthode ou passer des arguments par défaut, j'ai donc déjà tendance a réifié les longues méthodes.
> 
> ### Module 9
> #### Coupling and encapsulating
> Le principe principal est d'appliquer le comportement au plus proche des données, dans la limite du raisonable, pour qu'en cas de modification, seuls les dépendences directes soient impactés.
> 
> #### Class methods and registration
> Introduit la possibilité d'une superclasse de choisir qu'elle sous classe instantié à l'aide de la méthode allSubClasses.  
> Mais ceci est couteux en cas de grande hiérarchie, et toujours recalculé.  
> Une autre option est de tenir une liste dans la super classe, et la remettre à jour à chaque ajout de sous classe, mais le problème est que le développeur doit penser à les ajouter, ce qui est source d'erreurs.  
> La dernière solution consiste à l'initialisation de la classe de s'ajouter dans un mécanisme d'enregistrement, pour ne pas avoir à chaque fois à query sur les sous classes. Ce design apporte de la modularité, mais de la complexité. 
> 
> 

## Gautier Louvier
> TODO
>
> 

## Xavier Moyon
> TODO
> 
> 