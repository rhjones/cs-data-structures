# Data Structures and Algorithms

In high-level languages such as Ruby and JavaScript, we don't have to think about exactly where and how to allocate memory for storing things like arrays and hashes, or what algorithms are used to traverse these data structures when we need to find or change a value. These low-level concerns are usually not relevant to modern web development, but knowing the basics is considered a hallmark of a good programmer, and the concepts frequently come up in interview questions.

Since Ruby and JavaScript are the two languages you know best right now, we will be implementing some low-level data structures and algorithms in these languages, even though **normally there would be no practical reason to do this.** It's important to understand that we are re-inventing the wheel to an extreme degree here.

(instructor note: examples branch incomplete, [see old repo](https://github.com/ga-wdi-boston/wdi_11_cs_topics_old) for additional code)

## Linked Lists

Low-level arrays (as implemented in C or C++) are contiguous blocks of memory made up of many "cells", each of which contains a value. The one-block-of-memory approach makes accessing arbitrary values fast and easy, but it means that you have to know in advance how many array elements you want. Expanding arrays is an expensive operation that involves reserving a new block of memory and copying all the existing elements into it.

To solve this problem, the **linked list** was created. Each "value" within a linked list is actually an object that contains two things: the value itself, and a reference to the "next" element in the list. Adding a new element is as simple as reserving the memory space for that element, and pointing the "next" reference of what was previously the last element to the new element.

### Exercise

Implement a `LinkedList` class in Ruby or JavaScript. **Do not use arrays or hashes,** or any of the built-in data types for that matter. Your class should be capable of the following:

* Append a new value to the end of the list
* Prepend a new value to the beginning of the list
* Find whether a given value is in the list
* Insert a new value after a given value in the list
* Remove a given value from the list (warning: tricky!)
* Find the length of the list
* Implement `to_s` or `toString` to return all values in the list

You may want to create a secondary class to represent the list elements themselves, since each consists of two pieces of data. However, make sure not to expose these objects to the user of your linked list.

Question: What is the big-O time of these methods? What is the big-O of the equivalent methods on a traditional low-level array?

### Extra Challenges

These can be attempted in any order &ndash; they are not dependent on each other.

* Create a method to iterate through each value in the list. In Ruby you'll need to accept a block and use `yield`; in JavaScript you'll need to accept a callback function like `forEach` does on arrays.

* Create a method that reverses the list. It can either return a new reversed list and leave the existing one alone, or reverse the existing list in-place. Or try doing both!

* Upgrade your linked list to a **doubly-linked list**. In this variant of the linked list, each element holds references to both the "next" element and the "previous" element. You may find that it's much easier to remove a specific value from this kind of list.

* Done-to-death interview question: Suppose you have a linked list that has been "corrupted" such that the links form a loop &ndash; if you tried to iterate through it, you'd keep going forever. Devise an algorithm that, given the first element of a linked list, would detect whether the list contains a loop.

## Stacks and Queues

Stacks and queues are basically variants of the linked list that are optimized for certain operations. Usually all of these operations take O(1) time and space.

The **stack** typically only supports two operations: *push*, which adds a new element to the end of the list, and *pop*, which removes and returns the element at the end of the list. There is no mechanism for getting the length or accessing elements other than the last one. There is sometimes a *peek* operation, which returns the element at the end of the list without removing it (this doubles as a way to determine whether the stack is empty).

The **queue** likewise only supports two operations: *enqueue*, which adds a new element to the beginning of the list, and *dequeue*, which removes and returns the element at the end of the list. As with the stack, there is no mechanism for getting the length or accessing elements other than the last one.

### Exercise

Implement a `Stack` and a `Queue` in Ruby or JavaScript. As before, do not use any of the built-in data types. If you wrote a "linked list element" class for the last exercise, you should be able to reuse it as-is.

Question: What kinds of algorithms or applications would be well-suited to stacks or queues?

## Binary Trees

Both arrays and linked lists suffer from poor lookup and insertion performance: Finding a specific value, or inserting a new value at an arbitrary position, require O(n) time. **Tree** data structures, of which the **binary tree** is one, can improve the performance of these operations (at the expense of others).

Each "value" within a binary tree is actually an object that contains three things: The value itself, and references to a "left" node and a "right" node. The first value inserted into the tree becomes the "root" node. The second value is inserted either to the "left" or the "right" of the root node, depending on how its value compares to the root node's value. Subsequent values are likewise inserted to the left or right of some existing node in the tree based on value comparisons.

Note that this algorithm requires all values inserted into the tree to be **unique** and **comparable** &ndash; for any given value, you should be able to say for sure that it is either "less than" or "greater than" any other value. If you have duplicate values, or your values are of different types (e.g. strings and integers) or otherwise cannot be compared, they cannot be stored in a binary tree.

### Exercise

Implement a `BinaryTree` class in Ruby or JavaScript. As before, do not use any of the built-in data types. Your class should be capable of the following:

* Add a new value to the tree
* Find whether a given value is in the tree
* Remove a given value from the tree (warning: tricky!)
* Implement `to_s` or `toString` to return all values in the tree

Question: What is the big-O time of these methods? How do they compare to the equivalent operations on an array or linked list?

### Extra Challenges

These can be attempted in any order &ndash; they are not dependent on each other.

* Create a method to iterate through each value in the tree. In Ruby you'll need to accept a block and use `yield`; in JavaScript you'll need to accept a callback function like `forEach` does on arrays.

* Upgrade your binary tree to a **hash tree**: instead of storing only a value for each node, store a *key* as well. Perform insertions and deletions based on the key, and add a method to retrieve the value associated with a key. (This might remind you of the built-in `Hash` class in Ruby. This is how some other languages implement hashes, but Ruby does it using a non-tree data structure called a **hash table**.)

* Note that if the values inserted into the tree go in one "direction" much more frequently than another (e.g. they all go to the "left"), the tree can become "unbalanced". A completely unbalanced tree performs no better than a linked list. In this case we want to "rebalance" the tree, that is, rearrange its nodes to minimize the number of connections needed to access any given node. How might we do this?

## Binary Search

Binary search is an algorithm, not a data structure. It's a highly efficient way to find a value within a sorted array (note "sorted" implies that all elements can be compared and are of the same type).

[See this file](https://github.com/ga-wdi-boston/wdi_1_ruby_lab_methods/blob/master/lab5_search.md) for an exercise involving binary search.
