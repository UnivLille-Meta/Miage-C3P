# Rapport semaine 3 :

Voici : les notes que j'ai pris en regardant les lectures : 

Le Double dispatch :
•	Retirer les conditionnel 
•	Base du pattern visitor

Le double dispatch, c’est assez malin car le message connais très bien le type du receveur, et peut se servir de cette propriété pour faire des choix ! (au lieu d’utiliser le conditionnel ) :
Stone >> vs: anElement 
^ anElement playAgainstStone 

Paper >> playAgainstStone 
^ #paper

Quand l’objet aStone recoi le vs, on connais déjà le type de l’objet, par contre on ne connais pas le type du paramètre, et justement on va nous servir du faite qu’un message connais toujours le type de l’objet receveur, pour connaitre le type du paramètre initial !
On définit donc dans chacune des clase stone, paper, Scissor , 3 fonctions playAgainstStone, playAgainstPaper et playAgainstScissor et ces méthode nous renverra le résultat escompter pour le versus !
Respectivement sauf la méthode de jouer contre le même objet, qui elle renvoie vers la même méthode mais de la méthode définie dans la bonne classe car pas du même type !

En fait on dis double dispatch car on a deux types de message dans ces classe le premier qui oriente vers le bon type (en l’occurrence vs) et le second qui retourne le bon code a rendre ou exécuter en fonction du type 

dans la deuxième vidéo on a vue que ca ne devait pas forcement être symétrique comme dans le jeu pierre feuille ciseaux ! 
on a décomposer la classe GameView en plusieurs autre classes qui un type de wall, puis dans chacune on implémenter une bonne version de la methode draw one 


module 7-8	
super est le receveur (tout comme self) mais ma methode lookup commence a un endroit diffèrent (est dynamique)


j’ai aussi vu aussi comment fonctionne les tests, voici un exemple : 
testAdditionner
    | calculatrice |
    calculatrice := Calculatrice new.
    self assert: (calculatrice additionner: 2 avec: 3) equals: 5
