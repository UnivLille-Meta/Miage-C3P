
# ALLI Rayane 

Au cours de cette semaine,j'ai poursuivi  la mise en œuvre du LRUCache afin de saisir un maximum d'information sur le reverse engineering. Voila le bilan des information que j'ai pût en retirer:

1. Compréhension et analyse comportementale

La première étape a consisté à saisir la signature comportementale du système. En étudiant les interactions entre les opérations d’accès et de mise à jour, j’ai pu identifier les points de décision critiques, notamment la différence entre un hit et une insertion. Cette analyse m’a aidé à comprendre comment une politique de cache s’implémente concrètement, et à observer les impacts directs sur les performances et la cohérence des données.

2. Approche méthodologique

cet exercice m’a appris à ignorer stratégiquement les détails secondaires, afin de me concentrer sur le cœur fonctionnel du mécanisme. J’ai également utilisé les références de classe pour retrouver les véritables cas d’usage et éviter les fausses pistes. Cette approche m’a permis de distinguer les appels significatifs des faux positifs.

3. Apports en reverse engineering

D’un point de vue reverse engineering, cette étude m’a permis de confirmer que les opérations INSERT et EVICT constituent des points d’analyse universels pour comprendre le comportement d’un cache. J’ai également constaté qu’environ 80 % de la compréhension globale provient de 20 % du code réellement analysé. Enfin, cet exercice m’a appris à maîtriser l’art du focus : savoir quand approfondir un point et quand le reporter dans un backlog d’analyse pour éviter de se disperser.


cette exercice etait interssant et me sera bien utile pour le KATA chess 
