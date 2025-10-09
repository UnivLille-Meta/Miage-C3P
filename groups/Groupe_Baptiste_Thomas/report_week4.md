# DEVINCK Thomas

Pour cette semaine le travail maison demandé étant réduit, avec baptiste nous avons continué le kata 2 afin de prendre encore mieux en main pharo.

J'ai également regardé les deux pdf par rapport au reverse engineering.

De ce que j'ai compris, comme il est de plus en plus fréquent de devoir travailler sur  un système ancien possiblement mal documenté, avec un mauvaise architecture. Le reverse engineering est une méthode permettant d'obtenir une vision plus claire et structurée du système ancien dont nous n'avons aucune connaissance mais également d'envisager des modifications sur des choses mal produites .

Le reverse engineering combine des analyses statique (dépendances, composant ...) et dynamique ( test, execution ... ), Le but n'est pas de tout comprendre direct mais de partir d'une vue d'ensemble et d'analyser les grandes parties, les relations etc avant de rentrer dans les détails. Ca peut aussi permettre de repérer des choses à améliorer en faisant du refacto. Mais il faut toujours faire attention à présever le fonctionnement du projet.

Le reverse engineering va vraiment etre important pour le projet chess car il va nous permettre d'analyser le projet déja existant et de voir des choses qu'on penserais pouvoir améliorer.




# DELISLE Baptiste

Pour cette semaine, j'ai lu les pdf concernant le reverse engineering, voici des résumés : 

1. Basic on Reverse Engineering

Ce document introduit le reverse engineering logiciel : comprendre un système existant, souvent mal documenté. On y distingue les approches statiques (code, dépendances) et dynamiques (exécution, traces). La méthode conseillée : commencer par une vision globale (architecture, acteurs majeurs, dépendances), puis descendre dans les détails. Plusieurs techniques sont proposées : analyser les tests, repérer les points d’entrée, suivre l’exécution ou refactorer pour mieux comprendre.

2. Reverse Engineering LRU

Cet exemple applique le reverse engineering sur une implémentation de cache LRU (Least Recently Used). Le but est d’identifier les classes clés, leur rôle et leurs interactions. L’analyse montre comment les objets collaborent pour gérer l’ajout, la suppression et la mise à jour d’éléments en cache. Cela illustre concrètement la démarche : observer l’architecture, suivre le flot d’exécution et reconstruire une compréhension claire du design.