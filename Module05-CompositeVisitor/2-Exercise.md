# Visitor Exercises

## Warmup: Composite

Implement a file system following in a composite style.
The file system will have three main classes: `FSEntry`, `FSFile` and `FSDirectory`.
`FSFile` represents a file and a string as contents.
`FSDirectory` represents a directory and has a list of children.
`FSEntry` is an abstract superclass of both classes defining a name, like that both files and directories have a name.

Implement `searchByName: aString` in the composite in a recursive way.
Make sure that starting the search in a node searches in the indirect children too.
Do not forget to write tests.

You have many options here. Take a decision and implement one.
- search for the first element that is found
- search for all elements that match the name
- if a directory has a (indirect) children with the same name, do you return the parent or the child?

## Other

Extend the previous exercise with:
 - add `searchByContents:` that will search for files that contains in their contents the searched string
 - change the existing searches to match a prefix, using `beginsWith:`. How could you avoid repeating code to do this change in a single place?
 - add `path` that returns the path of an entry. Remember that the path is a string that indicates the path from the root. E.g., `/usr/bin/data.bin`

## Visitor

Reimplement the previous using a visitor.

> Things to think about: what are the changes that are needed in the model?

Implement a new visitor computing the `size` of a file entry, where a directory size is the sum of the size of its children, and the size of a file is the size of its contents in number of characters.

> Things to think about:  Did you need to change your model to implement it?

Extend the previous model with two new kind of nodes:
- symlinks: it's an entry that represents an alias to another entry.
- zip files: it's an entry that works like a file and a directory at the same time.

> Things to think about: How does this change the structure of your visitor? Can you slightly change the design to make it backwards compatible somehow?
