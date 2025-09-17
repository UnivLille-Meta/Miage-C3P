

(1) Extension sur Integer : dés de jeu / 在 Integer 上扩展骰子方法

Code / 代码

Integer >> D: aInteger
    | handle |
    handle := DieHandle new.
    1 to: self do: [ :i | handle addDie: (Die withFaces: aInteger) ].
    ^ handle

Integer >> D20
    ^ self D: 20

Prévision / 预期
2 D20 devrait créer un handle contenant deux dés à 20 faces.
2 D20 应该生成一个包含两个 20 面骰子的句柄。

Résultat / 结果
Effectivement, 2 D20 diceNumber retourne 2。
确实返回了 2。


(2) Somme de handles / 骰子句柄的相加

Code / 代码

DieHandleTest >> testSumming
    | handle |
    handle := 2 D20 + 3 D10.
    self assert: handle diceNumber equals: 5.

Prévision / 预期
Le handle doit contenir 5 dés au total.
句柄里应该一共有 5 个骰子。

Résultat / 结果
Le test passe, donc le résultat est correct.
测试通过，说明结果正确。


---

(3) self et super / self 与 super 的区别

Code / 代码

Object subclass: #A
A >> hello
    ^ 'Hello from A'.

A subclass: #B
B >> hello
    ^ 'Hello from B'.

B >> callSuper
    ^ super hello.

Prévision / 预期

(B new) hello → "Hello from B".

(B new) callSuper → "Hello from A".


Résultat / 结果
C’est bien ce qui se passe.
结果和预期一致。


---

(4) Identité d’objets / 对象同一性

Code / 代码

a := Object new.
b := a.
c := Object new.

a == b. "true"
a == c. "false"

Prévision / 预期
Seuls deux noms qui pointent sur le même objet donnent true.
只有指向同一个对象的变量才会返回 true。

Résultat / 结果
Le test confirme cette idée.
测试验证了这一点。

(5) Dice handle avec D: — résultat inattendu / 用 D: 创建骰子时出现预期外结果

Code / 代码

Integer >> D: aInteger
    | handle |
    handle := DieHandle new.
    1 to: self do: [ :i | handle addDie: (Die withFaces: aInteger) ].
    ^ handle

然后我写了一个测试：

DieHandleTest >> testD1
    | handle |
    handle := 1 D: 6.
    self assert: handle diceNumber equals: 1.

Prévision / 预期
我以为 1 D: 6 会返回一个包含 1 个 D6 骰子的句柄。
Je pensais que 1 D: 6 allait retourner un handle avec un seul dé à 6 faces.

Résultat / 结果
运行时我得到的却是 错误：MessageNotUnderstood: SmallInteger>>D:。
En réalité, j’ai eu une erreur : MessageNotUnderstood: SmallInteger>>D:.

Pourquoi ? / 为什么？
因为我一开始把 D: 方法放在了 DieHandle 里，而不是 Integer 类的扩展里，导致 1 D: 6 找不到这个方法。
Parce que j’avais défini la méthode D: dans la classe DieHandle au lieu de l’extension de Integer, donc 1 D: 6 ne trouvait pas la méthode.

Réflexion / 反思
这个错误让我意识到：

想要 2 D20 这种语法，方法必须写在 Integer 类上。

而且要放在协议 *Dice 中，不然包管理时会丢失。


Cette erreur m’a appris que :

Pour que la syntaxe 2 D20 marche, la méthode doit être sur Integer.

Elle doit être placée dans le protocole *Dice pour être sauvegardée correctement.



Pour compléter le travail, j’ai aussi cherché des explications et des exemples sur Internet, ce qui m’a aidé à confirmer mes résultats et à corriger mes erreurs de compréhension.
在完成作业的过程中，我还在网上查找了相关的资料和示例

