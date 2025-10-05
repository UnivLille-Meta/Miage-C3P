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

<p>Lorsque l’on envoie le message <code>turnOn</code> à une instance, l’objet décide lui-même quelle méthode exécuter, sans avoir besoin de vérifier le type avec des <strong>if</strong>.</p>

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


<h2>3. Inheritance and Lookup: Self - Understand lookup once for all</h2>

<p>Le message sending en Pharo se fait en 2 etapes:</p>
<ol>
  <li><strong>Lookup</strong> : Pharo cherche la méthode correspondant au message dans la classe de l’objet.
    <ul>
      <li>Si la méthode n’existe pas dans la classe, la recherche remonte dans les <strong>superclasses</strong>.</li>
    </ul>
  </li>
  <li><strong>Execution</strong> : La méthode trouvée est exécutée sur <strong>l’objet récepteur</strong>.</li>
</ol>
<p>L’objet décide lui-même quelle méthode exécuter : c’est le principe du <strong>“Do not ask, tell”</strong>.</p>

<h3>Exemple pratique avec Light</h3>

<pre>
// Classe de base
Object subclass: #Light
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Demo'

Light >> turnOn
    ^ 'The light is on'

// Sous-classes
Light subclass: #RedLight
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Demo'

RedLight >> turnOn
    ^ 'The red light is on'

Light subclass: #GreenLight
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Demo'

GreenLight >> turnOn
    ^ 'The green light is on'
</pre>

<p>Lorsque l’on exécute :</p>

<pre>
| red green generic |
red := RedLight new.
green := GreenLight new.
generic := Light new.

red turnOn.      "→ 'The red light is on'"
green turnOn.    "→ 'The green light is on'"
generic turnOn.  "→ 'The light is on'"
</pre>

<h2>Comprendre <code>self</code> en Pharo</h2>

<h3>1️Que représente <code>self</code> ?</h3>
<p>
<code>self</code> est une référence à l’objet courant qui reçoit le message. 
En Java, <code>self</code> correspond à <code>this</code>.
</p>

<h3>2️Comment une méthode est recherchée lorsqu’un message est envoyé à <code>self</code> ?</h3>
<p>
Lorsque l’on envoie un message à <code>self</code> : 
<ul>
<li>La méthode est recherchée d’abord dans la classe de l’objet courant.</li>
<li>Si elle n’est pas trouvée, la recherche remonte la hiérarchie d’héritage jusqu’à ce qu’elle soit trouvée ou jusqu’à la classe racine <code>Object</code>.</li>
<li>Une fois trouvée, la méthode s’exécute avec <code>self</code> toujours référant à l’objet initial.</li>
</ul>
</p>

<p><strong>Pratique :</strong> J’ai pratiqué en classe avec les méthodes <code>bar</code> et <code>foo</code> sur les classes <code>A</code> et <code>B</code>.</p>

<pre><code>Object subclass: #A [
    A >> foo
        ^ 50

    A >> bar
        ^ self foo
]

A subclass: #B []

"Exemple d'utilisation"
aB := B new.
aB bar.  "Résultat : 50, car bar envoie le message foo à self (l'objet aB), et la méthode foo est recherchée dynamiquement dans B puis A"
</code></pre>

</body>
</html>
