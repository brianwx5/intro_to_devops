# Computer Science and Scripting


## Section I - Introduction

We're going to revisit ``algorithmic complexity``, check out the chart below:

![Alt text](./resources/map.png?raw=true)



At a high level, ``algorithmic complexity`` can help engineers estimate how "long" a 
``function`` or ``method`` will take to execute over time as an input increases.


``Functions`` or ``methods`` directly correspond to their respective counterparts in a programming languages, we
used both names to help alleviate ambiguity. 

Resources 

- [Carnegie Melon](https://www.cs.cmu.edu/~adamchik/15-121/lectures/Algorithmic%20Complexity/complexity.html)


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

### Section II - Coffee Break

You might have a few questions so far and it's okay!

1. What does ``O(1)`` mean?
2. Why is ``array`` indicies access ``O(1)``?
3. Why does this matter anyway?



Let's say that generally it takes ``1 second`` for your program to do xyz, and xyz's complexity is ``O(1)``

``1 second`` * ``O(1)`` ~= 1 second

Let's say that generally it takes ``1 second`` for your program to do xyz, and xyz's complexity ``O(n)``
where ``n = 10``

Remember that N corresponds to the input size of the ``function``

``1 second`` * ``O(n)`` when ``n = 10`` ~= 10 seconds

We can see that the estimated execution time of the function xyz increases as it's input ``N`` increases.



