# Rapport - Semaine 1

J’ai suivi le tutoriel du ProfStef afin de me familiariser avec l’environnement de développement Pharo.
J’ai ensuite créé le package MyCounter, puis la classe Counter. J’ai ajouté le commentaire de la classe ainsi que la première méthode d’accès et le setter count. J’ai testé le fonctionnement de l’objet dans le Playground en lui attribuant la valeur 7 à l’attribut count et en vérifiant le résultat avec print.
J’ai ensuite implémenté la méthode increment ainsi que sa classe de test. J’ai procédé de la même manière pour la méthode decrement, en créant également le correspondant afin de vérifier leur bon fonctionnement.
Enfin, j’ai enregistré mon travail avec Iceberg en effectuant un commit. 

Cependant, après avoir effectué le commit, Pharo s’est arrêté (shutdown). Lorsque j’ai relancé Pharo et essayé de récupérer mon commit avec un fetch, je ne retrouvais pas le commit que j’avais effectué. En essayant de refaire le commit, Iceberg m’indiquait cependant que le commit existait déjà. J’ai donc rencontré une difficulté liée à la synchronisation et à la récupération de mon commit après l’arrêt de Pharo.
