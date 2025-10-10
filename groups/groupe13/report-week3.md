## Gautam Demeulemeester

Cette semaine j'ai terminé le kata sur le Rover. Mon Rover est capable de recuperer une suite d'instruction et d'effectuer les mouvements demandés.
Voici un exemple d'utilisation de super reprenant le tp sur les dés, supposons DieHandle sous-classe de Die:

```
Die >> roll
    ^ faces atRandom.

DieHandle >> roll
    ^ super roll * 3
```

Lors de l'appel à roll sur un DieHandle, la méthode va chercher le roll de Die grace au super et faire x3 sur le lancé au hasard
J'ai également lu les PDFs et je n'ai pas de questions.

## Heddi Abdelkader

Cette semaine, j’ai commencé par des katas simples (factorielle, puissances, ...) pour bien assimiler : envoi de messages, tests unitaires et usage du Transcript.

J'ai aussi bien travaillé sur le mécanisme de lookup avec lequel j'avais du mal et ainsi bien comprendre comment Pharo recherche une méthode dans la classe de l’objet puis dans ses superclasses.

J’ai vu une implémentation sans conditionnelle de l’opérateur logique & dans les classes True et False.

Enfin, j’ai appliqué ces notions dans des petits projets comme un compte bancaire (exercice que j'ai pu générer à l'aide de chatgpt) pour pratiquer en plus d'avoir quasiment terminé le kata rover.

Pour finir, j'ai une question sur le lookup que je vous poserai en début de séance.
