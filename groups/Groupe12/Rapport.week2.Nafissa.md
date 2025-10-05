<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
</head>
<body>

<h1>Module 1 – Understanding messages</h1>

<h2>1. Booleans</h2>

<p>Pour ce module, j’ai commencé avec les Booléens. J’ai réalisé le premier exercice et appris à implémenter la méthode <strong>not</strong> dans les classes <strong>True</strong> et <strong>False</strong>. J’ai aussi compris que <strong>true</strong> et <strong>false</strong> sont des instances des classes correspondantes.</p>

<h3>Implémentation de <code>not</code> :</h3>
<pre>
True >> not
    ^ false

False >> not
    ^ true
</pre>

<h3>Méthode Or (<code>|</code>) :</h3>

<ul>
    <li><strong>Dans la classe False :</strong> on retourne toujours l’argument.</li>
</ul>
<pre>
false | anything    "→ anything"
</pre>

<ul>
    <li><strong>Dans la classe True :</strong> on retourne toujours le receveur (<code>^self</code>).</li>
</ul>
<pre>
true | anything     "→ true"
</pre>

<p>Exemple pratique dans le Playground : (photo)</p>

<p>J’ai appris que l’envoi de message dépend de la méthode à exécuter dans la classe concernée, ce qui permet d’éviter les <strong>if</strong> explicites.  
La hiérarchie de classes permet le <strong>dispatch automatique</strong> : si l’objet ne possède pas la méthode, elle est cherchée dans la superclasse.  
L’envoi de message est extensible : on peut ajouter de nouvelles classes avec leurs propres méthodes pour le même message sans modifier l’ancien code.</p>

<hr>

<h2>2. Héritage (Inheritance)</h2>

<p>Dans ce module, j’ai appris que l’héritage permet de réutiliser le code des superclasses sans le réécrire, et de spécialiser ou modifier seulement ce qui change (le “delta”).</p>

<p>Exemple : la classe <strong>Dog</strong> hérite de la classe <strong>Animal</strong>.  
Pour changer le comportement de <strong>Dog</strong>, on ne touche pas à <strong>Animal</strong>, on redéfinit uniquement le comportement dans <strong>Dog</strong>.</p>

<h3>Exemple pratique dans Pharo :</h3>

<p>J’ai défini une classe <strong>Light</strong>, avec une méthode <code>turnOn</code> :</p>
<pre>
Light >> turnOn
    ^ 'The light is on'
</pre>

<p>J’ai ensuite créé deux sous-classes : <strong>RedLight</strong> et <strong>GreenLight</strong>, chacune avec sa propre implémentation :</p>
<pre>
RedLight >> turnOn
    ^ 'The red light is on'

GreenLight >> turnOn
    ^ 'The green light is on'
</pre>

<p>Lorsque l’on envoie le message <code>turnOn</code> à une instance, l’objet décide lui-même quelle méthode exécuter, sans avoir besoin de vérifier le type avec des <s

<h3>Héritage des variables et du comportement</h3>

<ul>
    <li><strong>Variables d’instance :</strong> héritées au moment de la définition de la classe.  
        Exemple : <br>
        <em>Rectangle</em> → variables <code>width</code>, <code>height</code><br>
        <em>RedRectangle</em> → hérite de Rectangle et ajoute <code>color</code>.  
        Résultat : RedRectangle possède <code>width</code>, <code>height</code> et <code>color</code>.
    </li>
    <li><strong>Comportement (méthodes) :</strong> hérité au moment de l’exécution.  
        Si une méthode n’existe pas dans la sous-classe, elle est cherchée dans la superclasse.
    </li>
</ul>

</body>
</html>
