# Report - Alli Rayane
pour cette semaine, j'ai etablis mes devoirs autour des cours mis a dispostions et du KATA debuté en classe.
## Objects vs Data
Cette parite  explique la différence fondamentale entre les objets et les structures de données. Un objet doit être une entité riche en comportements qui encapsule sa propre logique, et non pas un simple conteneur de données. L'exemple comparatif entre les classes Point en Java et en Pharo illustre parfaitement ce concept : en Java, Point se limite essentiellement à des getters/setters, tandis qu'en Pharo, Point propose une interface étendue avec des méthodes comme distanceTo: ou rotateBy: qui embarquent la logique métier. Cela nous montre bien la bonne interpretation du sens objet en pharo.
 La leçon principale est qu'une bonne API d'objet favorise la réutilisation et évite la duplication de code dans les clients.

## Singleton
Ce pattern est présenté comme souvent mal compris et mal utilisé. Son intention réelle est de garantir qu'une seule instance d'une classe existe à un moment donné, et non pas simplement de fournir un accès global pratique. Le polycopié souligne les pièges, comme le fait de redéfinir la méthode new, et explique la différence entre uniqueInstance (vrai singleton), default (instance par défaut) et current (instance mutable). Un test acide est proposé : si l'ajout d'une variable d'instance rend le singleton inutile, c'est qu'il était utilisé comme une variable globale déguisée. Les singletons posent également des problèmes pour les tests unitaires, le tous et de savoir leur rendre leur etat d'origine à la fin du test.

##  Decorator

Ce pattern offre une alternative souple à l'héritage pour ajouter des responsabilités à un objet de manière dynamique. Un décorateur enveloppe un objet le "décoré" et doit implémenter la même interface que lui, permettant une utilisation transparente par le client. L'exemple des flux (Streams) en Pharo montre comment des décorateurs peuvent composer des fonctionnalités (comme la conversion des fins de ligne dans l exemple montré). L'avantage principal est la modularité et la composabilité, mais le pattern exige que tous les décorateurs partagent la même API que l'objet de base et n'est pas adapté si les responsabilités ajoutées nécessitent une interface différente.

## kata 
pour ce qui du kata il ma semblé intuitif de modifié l'initialize qui usé d'un super bien que notre classe Roover n'a pas de classe parents donc de variable a herité:

<img width="286" height="192" alt="image" src="https://github.com/user-attachments/assets/8fb4088a-5167-468a-85bd-bbc67f447c2c" />

apres parcours de notre class j'ai pus observé qu'il nous manqué un test afin de s'assurer de la delimitation de notre grille d'où le test suivant: 

<img width="310" height="151" alt="image" src="https://github.com/user-attachments/assets/04e0846e-9a62-4323-bac4-ce2de1303fd4" />


# Report - Ait ali Ilyas

## Mon travail sur Roover

J'ai modifié le programme du roover pour qu'il ne puisse plus sortir de la grille. Avant, quand je faisais avancer le rover, il se déplaçait sans vérifier où il allait. Maintenant, à chaque déplacement, je vérifie si la nouvelle position est bien à l'intérieur de la zone autorisée.


Ce changement était important car il empêche le rover de se perdre en dehors de la zone de communication. Quand le rover tente d'aller trop loin, je le fais rester sur place au lieu de sortir de la grille.

![Capture](Screen/PharoScreenshot.png)

Pour m'assurer que ma modification fonctionnait correctement, j'ai un testé le cas où le rover essaie de sortir par le bord gauche de la grille. Grâce à cela, j'ai pu confirmer que le rover reste bien bloqué au bord au lieu de disparaître hors de la zone sécurisée.

 j'ai ajouté une vérification dans la méthode move qui contrôle les coordonnées avant de les mettre à jour. Cette amélioration rend le rover plus fiable et mes tests me permettent de vérifier en permanence que tout fonctionne comme prévu.


## Module : hooks

J'ai ensuite regardé les vidéos du module sur les patrons de conception et les hooks. Les vidéos m'on ptermis de mieux comprender le princpipe et le templates associès.



