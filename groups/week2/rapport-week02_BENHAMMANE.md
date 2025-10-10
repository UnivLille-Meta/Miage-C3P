Rapport - Message Dispatch Practice

j’ai travaillé sur l’envoi de messages (message dispatch) en Pharo et j’ai testé quelques petits programmes pour mieux comprendre comment ça fonctionne.

1. Pratique du message dispatch

J’ai écrit des exemples simples pour voir comment Pharo envoie les messages aux objets et comment ils répondent.

Exemple 1 : envoi de message à un objet
'Hello' size. "→ 5"
'Hello' reverse. "→ 'olleH'"

Observation : les messages ont fonctionné comme je m’y attendais. Chaque objet a exécuté la méthode correspondante.

Exemple 2 : message non défini
'Hello' uppercase. "→ erreur"

Observation : j’ai reçu une erreur parce que la méthode uppercase n’existe pas sur les chaînes dans cette version de Pharo.
Correction de mon hypothèse : j’ai vérifié la documentation et j’ai trouvé que la méthode correcte est asUppercase.

'Hello' asUppercase. "→ 'HELLO'"

Exemple 3 : envoi de message à un objet custom
Object subclass: #Dog
instanceVariableNames: 'name'.
Dog>>bark
^'Woof!'.
dog := Dog new.
dog bark. "→ 'Woof!'"

Observation : ça a fonctionné exactement comme prévu. Le message bark a été envoyé à l’objet dog et il a répondu correctement.

Ce que j’ai appris :

Les objets exécutent la méthode correspondant au message qu’ils reçoivent.

Si le message n’existe pas, Pharo lève une erreur.

Il est important de vérifier le nom exact de la méthode dans la documentation ou via l’inspecteur.
