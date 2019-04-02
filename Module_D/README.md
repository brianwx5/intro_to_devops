# Computer Science and Scripting

## Introduction

Software development in any form obeys the laws of: mathematics and it's more niche friend computer science.

Unfortunately we're not working to be mathematicians, we're working toward devops engineering.

Therefore we're going to introduce high level  concepts that will help you to write more 
efficient code

I want to highlight why this module is important before we proceed. 

As someone employed to produce, to engineer, it's important 
to hone your craft.

If you want to work for Google, Facebook, or any top tech company you need
a fundamental grasp of computer science topics, such as what we're about to explore. 

Simply because problems we solve may not inherently be new conceptually and sometimes already have mathematically
provably efficient solutions

Or building upon prior knowledge can help you arrive at a novel solution to a new problem. 

Anyone that tells you "data structures and algorithms are not important" is a fool, at the very
least they can serve as problem solving exercises to expand your programming prowess.

Getting off of my soap box (haha), let's continue.

## Section I - Complexity

We're going to revisit ``algorithmic complexity``, in Big O notation check out the chart below:

![Alt text](./resources/map.png?raw=true)



At a high level, ``algorithmic complexity`` can help engineers estimate how "long" a 
``function`` or ``method`` will take to execute over time as an input increases.


``Functions`` or ``methods`` directly correspond to their respective counterparts in a programming languages, we
used both names to help alleviate ambiguity. 


## Section II - Basic Algorithmic Analysis

Consider this ``Python`` code

```python
servers = ["127.0.0.1", "127.0.0.2", "127.0.0.3"]

def getFirstItem(list):
    return list[0]
    
print(getFirstItem(servers))
```

It takes a ``collection``as an input, more specifically in ``Python`` a ``list``

``Collections`` like ``lists`` are ``array based data structures`` and the algorithmic complexity
of accessing an index of an array is generally ``O(1)``

If we refer back to our chart in the introduction section we can see that ``O(1)`` has the minimum slope
as an input increases over time.

Consider this ``Python Code``

```python
servers = ["127.0.0.1", "127.0.0.2", "127.0.0.3"]

def getFirstNItems(list, n):
    if n >= 0:
        return list[0:n]
    
print(getFirstNItems(servers, len(servers) - 1))
```

Now we're returning a ``slice`` of the ``list``, specifically index ``0`` to index ``2``

**Can you guess the algorithmic complexity of getFirstNItems?**

If you answered ``O(1)`` you would be correct, generally access of any indicies of an array
is a ``constant time`` or ``O(1)``

## Section II - Coffee Break

You might have a few questions so far and it's okay!

1. What does ``O(1)`` mean?
2. Why is ``array`` index access ``O(1)``?
3. Why does this matter anyway?



Let's say that generally it takes ``1 second`` for your program to do xyz, and xyz's complexity is ``O(1)``

``1 second`` * ``O(1)`` ~= 1 second

Let's say that generally it takes ``1 second`` for your program to do xyz, and xyz's complexity ``O(n)``
where ``n = 10``

Remember that  ``n`` corresponds to the input size of the ``function``

``1 second`` * ``O(n)`` when ``n = 10`` ~= 10 seconds

We can see that the estimated execution time of the function xyz increases as it's input ``N`` increases.



Question 1 is answered, in that ``O(1)`` is constant time, regardless of input size

Question 2 is a little more verbose, please visit this (link)[]

Question 3 is answered above, in that we can see which algorithms run "faster"


## Section II - Computational Complexity

Watch the video below from 2:45 through the end.

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/YoZPTyGL2IQ/0.jpg)](https://www.youtube.com/watch?v=YoZPTyGL2IQ&feature=youtu.be&t=174)


## Section II - Recap

We should have established a basic understanding of how different algorithims scale
to an input

Certain algorithms perform better or worse as an input's size increases

In addition, effective ``data structure`` utilization can enable more efficient algorithms
for specific operations


## Section III - Data Structures

What is a data structure?

An `array`, a `list`, a `hashmap`, a `linked list`, a `stack`, a `queue`, an `object` are all
examples of ``data structures``.

A `data structure` is an entity whose purpose is to store data

We're going to analyze a function that essentially does the same thing, but swap data structures

Let's take a look at this snippet of ``Python``

```python

l = [0, 1, 2, 99.0, 118.0, 200.315, 75, 64, 22]

def find_max_cpu_util(cpu_list):
 max = 0
 for c in cpu_list:
  if max < c:
   max = c			
 return max 
 
print(find_max_cpu_util(l))

200.315
```

We're defining a `list` whose variable name is 'l'

This `list` contains integer and double data types that correspond to ``CPU Utilizaition``

The function `find_max_cpu_util` will loop through each element of the `list` and attempt
to find the largest element 

## Section III - Activity I - Analyze a Function - List
#### What is the algorithmic complexity of the function`find_max_cpu_util`?

Let's take this step by step together:

- What input does the function take?
    - A `list` and remember, they are ``array based``
- What does the function do?
    - It loops through each element of the input `list` and attempts to find the maximum number 
- What are some of the best case situations for this function's execution?
    - The `list` is sorted and the maximum element is either the first or last index
    - The `list` has a size of 0, therefore the function will return immediately with 0
	- The `list` has a size of 1, therefore the function iterates the `list` once
- What are some of the worst case situations for this function's execution?
    - The `list` that's passed to the function isn't actually a `list` and the function yields an error
    - The maximum element is the last index, but you didn't know that upfront
    - The maximum element is the last index, you didn't know, and the list is extremely long, potentially millions of elements

Wow that's some good information so far, good work!

So far we know that, our worst case situation is the maximum element of the list is last, 
but we didn't know that (we can say that it's unsorted) and potentially the list is huge.

Generally, this is what `algormithic complexity` in Big O notation measures, 
**the worst case run time of an algorithm.**


Let's take that definition and apply it, we know our list is of size ``n`` 

Where 
``n`` equals the size of `l` and `l = [0, 1, 2, 99.0, 118.0, 200.315, 75, 64, 22]`

``len(l)`` would yield 9, because we have 9 elements in the `list l`

`n` equals the length of `l`, therefore `n = 9`

So far so good? 

We know that accessing an element of an `array` is `O(1)` or constant time,
for our function we're actually accessing **each** element of the `list` to determine
whether we've found the maximum value or not

Generally, if we notice that an algorithm is accessing **each and every** element of a collection, a collection
being a list, array, tree, something that hold multiple elements. 

We initially can think
hey this might be `O(n)` where `n` is the size of the collection. 

We might be wrong once we look at the nitty gritty of the algorithm, but that's okay
we can be wrong, but we have to take the time and analyze to make sure we eventually come up with
the correct answer

Full circle the function ``find_max_cpu_util`` is for sure `O(n)` in the worst case, because
we would have to loop until the end of the collection to find the max element.

## Section III - Activity II - Analyze a Function - Binary Trees

I didn't want to get into how to implement a tree from scratch, therefore
our tree reference is via [anytree](https://pypi.org/project/anytree/)

For the test code to work you need to install anytree for Python, but don't worry about it right now

``pip install anytree``

First let's define a `Binary Tree` 

A `Binary Tree` is " is a tree data structure in which each node has at most two children, which are referred to as the left child and the right child."


**Binary Tree**

![Alt text](./resources/bt.png?raw=true)


For our purposes we're using a special `Binary Tree` called a `Binary Search Tree`
where, dun dun dun, it's "optimized" for searching!


**Binary Search Tree**

![Alt text](./resources/bst.png?raw=true)


Based on the definitions of a `Binary Tree` and a
`Binary Search Tree` can you spot the differences in their figures?

If you thought, well there are different values in the true you are correct.

But, beyond that, if we inspect the ``Binary Search Tree``

8 is what we would consider the root node, or the start of the tree (yeah its upside down)
it's right child is 10 and left child is 3.

3's right child is 6 and left child is 1

6's right child is 7 and left child is 4

**What's the pattern here?**

The `right child` is **larger** than it's `parent node` or `root node`
and the `left child` is **smaller** than it's `parent node` or `root node`

Hmm, it looks like the data is sorted in a particular way, but why does it matter?

Let's take a look at this snippet of ``Python`` 
```python
from anytree import Node, RenderTree, AsciiStyle

def find_max_cpu_util_tree(root_node):
    current_node = root_node
    while True:
        if current_node.is_root and len(current_node.children) > 0:
            current_node = current_node.children[0]
        else:
            if current_node.is_leaf:
                return current_node
            elif len(current_node.children) > 0:
                current_node = current_node.children[0]


root = Node(99.0)

root_rc = Node(99.5, parent=root)
root_lc = Node(1, parent=root)

rrc_rc = Node(100, parent=root_rc)
rrc_rc_rc = Node(101, parent=rrc_rc)

print(RenderTree(root, style=AsciiStyle()).by_attr())

print(find_max_cpu_util_tree(root))

```

Output:
```
99.0
|-- 99.5
|   +-- 100
|       +-- 101
+-- 1
Node('/99.0/99.5/100/101')
```

I'm sorry if that snippet was a little verbose and ugly.

The gist of the snippet before we execute the function is that we're setting up a ``Binary Search Tree``

If we look at the output we can see that the `root node` is 99.0; 
it's `left child` is 1, and it's `right child` is 99.5

The `right child` of 99.5 is 100, and the `right child` of 100 is 101

Now that we have the tree set up, all we have to do is `traverse right` (traverse means **to go** or **to iterate**) until we can't and that will
be the **maxiumum element**

## Section III - Activity II - Coffee Break- Binary Trees

That was a lot to say a little, if you're sitting reading this right now thinking "so all you had to do was
go to the right"

Yes, you are correct. This is an example of effective ``data structure`` use

It's more complicated to set up and use a ``tree`` versus a ``list``

But, you see it's a little easier to do certain operations, one of which is `searching`

Let's compare go fourth and compare efficiency!

## Section III - Activity III - Compare Getting Maximum Element from List versus Binary Search Tree 

If you made it here, thank you for pushing through, we're almost done this section.


We know that the `list` implementation of the `get max` function is `O(n)` because we have to touch each individual element
before we can make a determination

`O(n)` isn't bad when `n` is 1 or 100, but what if it's 1 billion, jeez that's a lot.

I'm going to tell you out right, searching for an element in a `BST` is `O(log n)`

Let's do a quick recap of `logarithms` and review the `BST` to understand why

---

What is a `logarithm`?

A [`logarithm`](https://www.mathsisfun.com/algebra/logarithms.html) in simple terms answers the question:

"How many of one number do we multiply to get another number?" (via mathisfun.com)

If that's a little weird, it's okay here's an example.

"How many 2s do we multiple to get 256 "

Well, 256 is 2 raised to the power 8 and log base 2 (256) = 8

`Logarithms` have various other properties, please feel free to explore those on your own

---

Alright so we know at the very least there's a relationship between exponents and logarithms

We also know that in a `Binary Tree` each node can have two children at most, therefore
at each level beyond the root level within a `Binary Tree` can expand `x^2` where `x` is the number of nodes 
at the current level.

Let's look at the figure below: 

![Alt text](./resources/bst.png?raw=true)

We can see at the level where 3 and 10 reside (they are indeed on the same level)

3 has two children and 10 has one. 10 could have two children, but it doesn't.

Let's use our formula and check if it makes sense, if 3 and 10 are on the same
level, then `x` is 2 because there are two `nodes`

`x^2` when `x` is 2 yields 4, it seems like that matches up with our statement that 3
and 10 could potentially have two children each.

---

...

...

--- 

...


***

**Resources**

- [Carnegie Melon](https://www.cs.cmu.edu/~adamchik/15-121/lectures/Algorithmic%20Complexity/complexity.html)



