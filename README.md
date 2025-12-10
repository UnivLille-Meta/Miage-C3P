This is the repository of the MIAGE C3P lectures done by S. Ducasse and G. Polito

contact: stephane.ducasse@inria.fr / guillermo.polito@inria.fr

Discord channel: https://discord.gg/Wy9eVpGzUm

## Modules

In this course, you will learn the following topics.

- **Module 01: Test introduction.** Unit testing. Fixtures, stimuli, assertions. Test-driven development (TDD). Extreme TDD.
- **Module 02: OOP refresh.** Classes and methods. Method lookup. Polymorphism. `self` and `super`.
- **Module 03: Reverse engineering.** Exploring an existing code base. Analysing source code. Abstracting details. Looking for documentation outside and inside the project. Tests as documentation.
- **Module 04: Test Quality.** Mutation Analysis. Mutation Score. Equivalent mutants. Analysing surviving mutants.
- **Module 05: Hook and templates.** Hooking behavior using inheritance. Template methods. Overrides and `super` sends.
- **Module 06: Double dispatch.** Single vs. multiple dispatch. Message sends as choices. Double choices. Symmetrical and non-symmetrical double dispatch.
- **Module 07: Visitor.** Extracting operations from class hierarchies. Double dispatch as extension mechanisms. Recursion revisited.
- **Module 08: Composite.** Modelling complex tree-like structures using classes. Recursion revisited 2.
- **Module 09: Inheritance.** Subclassing vs. subtyping. Inheritance vs. composition.
- **Module 10: Types.** Dynamic vs. static message binding. Overrides vs. overwrites. The role of inheritance and interfaces in polymorphism.

## Course Material

All slides, videos, and tutorials are available in (or linked from) this repository.

- Pdfs and videos are hosted under https://advanced-design-mooc.pharo.org

## Course Contract

This course proposes a series of teorical lectures and practical exercises.
Modules are divided in weeks, each in a different folder, and you will find the theory and practice in that folder.
To pass this course you will need to:
 - pass the exams (see [Calendar.md](Calendar.md))
 - do at minimum **all** the homework in the exercises (file Exercises.md in each folder)
 - watch all the videos of the lectures not done during the lectures (yes there are videos for 99% of the support)
 - write (short) weekly reports to tell us your activity. Remember, focus on the important things, and show us that you are learning.

### Each week

During the lectures:
- Do the exercises
- Ask questions if needed, we are there for that!
- Work on your projects

At home:
- Prepare the following lecture: Watch the lectures (videos, slides)
- Ideally, come with questions
- Write your report

### Make a group

Some of the activities during the course require group organization.
For example, this is the case for the practical project.

Make group of max 3 persons and come to us, you will be assigned a unique group identifier.
Each group will have a directory inside the [Groups](Groups) folder.
Put inside your group folder
 - a file with your full names and emails
 - all your activity and reports
 
Make recurrent pull requests to update it.

For example, imagine that Jeanne D'arc and Tintin LeBelge are together in a group called RevolutionX.
They create a directory RevolutionX

```
Groups
    - Group1
        - members.md (names and emails)
        - report-week01.md (one section for Jeanne, one for Tintin)
        - report-week02.md (one section for Jeanne, one for Tintin)
```

### Grading

You are going to be graded on
- Exam 1 (individually)
- Exam 2 (individually)
- Weekly Reports (individually)
- Practical Project (in group)
- **Bonus:** Getting contact with the community to ask questions and help (discord, mailing lists).

Your final grade will be a weighted average of all these grades.

## FAQ

### Solving SSH problems in Git/Github

Make sure you have correct configured you authentication setup
- If you want to use SSH authentication
    - set up your SSH keys with a recent encryption, check github's instructions
- upload your public keys to github
    - If you want to use HTTPS authentication (or not do the SSH setup)
    - change Icebergs setting, "Metacello Integration" with the value HTTPS
    ![imagen](https://user-images.githubusercontent.com/708322/197169064-c6bf0bd2-762c-4bbe-b48c-daedb2d3aeef.png)
	- create an access token to be able to push (and make sure of giving it permissions by ticking the check boxes)

