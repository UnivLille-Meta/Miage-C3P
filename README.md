This is the repository of the MIAGE C3P lectures done by S. Ducasse

- Contact: stephane.ducasse@inria.fr
- Discord channel: https://discord.gg/MqP32ZB29


## Testimonies

"J'ai personnellement trouvé le cours très intéressant et rafraîchissant. C'est sûrement le cours où j'ai appris le plus de choses depuis le début de mes études supérieures.
J'ai surtout trouvé que c'était le cours avec le plus de valeur unique \(des "cours" tutos pour faire des requêtes SQL ou apprendre du JS c'est bien, mais je pourrais en trouver une vingtaine en 2 clics...\)" [Miage 2023]

"J'ai trouvé ça très intéressant, beaucoup plus que prévu ! je regrette de ne pas m'y être mis plus tôt. J'ai enfin l'impression de vraiment faire de la POO ! Ou à l'inverse je me rends que je n'en faisais pas vraiment..." - Anonymous, 2019

## Extra material
From 2026/27 on, the lectures went from 48 hours to 24. 
Therefore, we drastically cut the contents. The clever and curious (Hermione like) students can find all the extra material on the same repository in the '2025' branch.

## Lecture preparation

This year you will have to prepare for the lectures in advance!
- Do not show up in the lectures without having done the preparation described in ModulePreparation-01. We evaluate that you should spend around 10 to 12 of concentrated hours on this.  You can find help on the discord channel and encouraged to ask for help.
- You must know how to define a test!
- You must know how to commit code on github.


## Modules

In this course, you will learn the following topics.

- **Module 01: Test introduction.** Unit testing. Fixtures, stimuli, assertions. Test-driven development (TDD). Extreme TDD.
- **Module 02: OOP refresh.** Classes and methods. Method lookup. Polymorphism. `self` and `super`.
- **Module 05: Hook and templates.** Hooking behavior using inheritance. Template methods. Overrides and `super` sends.
- **Module 06: Double dispatch.** Single vs. multiple dispatch. Message sends as choices. Double choices. Symmetrical and non-symmetrical double dispatch.
- **Module 07: Visitor.** Extracting operations from class hierarchies. Double dispatch as extension mechanisms. Recursion revisited.
- **Module 08: Composite.** Modelling complex tree-like structures using classes. Recursion revisited 2.
- **Module 09: Inheritance.** Subclassing vs. subtyping. Inheritance vs. composition.

## Course Material

All slides, videos, and tutorials are available in (or linked from) this repository.

- Pdfs are hosted under [https://rmod-files.lille.inria.fr/DesignCoffeeClub/](https://rmod-files.lille.inria.fr/DesignCoffeeClub/)
- Videos are hosted [http://rmod-pharo-mooc.lille.inria.fr/AdvancedDesignMooc/](http://rmod-pharo-mooc.lille.inria.fr/AdvancedDesignMooc/).
- The official website [https://advanced-design-mooc.pharo.org](https://advanced-design-mooc.pharo.org)


## Course Contract

This course proposes a series of theoretical lectures and practical exercises.
A week is in a dedicated folder, and you will find the theory and practice in that folder.

To pass this course, you will need to:
- Pass the exam (see [Calendar.md](Calendar.md))
- Do at minimum **all** the homework in the exercises (file Exercises.md in each folder)
- Watch all the videos of the lectures not done during the lectures
- Write (short) weekly reports to tell us your activity. Remember, focus on the important things, and show us that you are learning.


### Make a group

Some of the activities during the course require group organization.
For example, this is the case for reporting and presentations.

Make your groups and create a folder inside the [Groups](Groups) directory.
Choose a name for your group and use that as folder name.

Put inside your group folder
 - a file with your full names and emails
 - all your activity and reports
 - make recurrent pull requests to update it.

For example, imagine that Milou and Tintin are together in a group called MiTin
They create a directory MiTin

```
Groups
    - MiTin
        - members.md (names and emails)>
        - report-week01.md (one section for Milou, one for Tintin)
        - report-week02.md (one section for Milou, one for Tintin)
```


## FAQ

### Solving SSH problems in Git/Github

Check your github connection without Pharo. 
- If you use HTTPS store your unique token!
- Better use SSH

Make sure you have correct configured you authentication setup
- If you want to use SSH authentication
    - set up your SSH keys with a recent encryption, check github's instructions
- upload your public keys to github
    - If you want to use HTTPS authentication (or not do the SSH setup)
    - change Icebergs setting, "Metacello Integration" with the value HTTPS
    ![imagen](https://user-images.githubusercontent.com/708322/197169064-c6bf0bd2-762c-4bbe-b48c-daedb2d3aeef.png)
	- create an access token to be able to push (and make sure of giving it permissions by ticking the check boxes)
