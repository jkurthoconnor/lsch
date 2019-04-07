# LS Exercises: [Front-End Development with JS: DOM ...](https://launchschool.com/exercise_sets/70756443)


## Problem 1:

Go over the two HTML snippets. HOw many nodes will the resulting DOM tree have?

A) https://codepen.io/launchschool/pen/BJXoby/


B) https://codepen.io/launchschool/pen/PEMPLY/

### Solution:

Snippet A:
```html
<div>
  <p>Then press the <em>Draw</em> button</p>
</div>
```

When 'fixed' by the browser for validity, becomes

```html
<html>
  <head></head>
  <body>
    <div>
      <p>Then press the <em>Draw</em> button.</p>
    </div>
  </body>
</html>
```
A)  11 nodes. In addition to the obvious element nodes, the two text nodes in the <p> and the one text node in the <em></em>, there is an empty text node between the opening of <div> and the opening of <p>; there is another empty text node between the closing </p> and the closing </div>


Why no empty text nodes between <body> and <div>, or </div> and </body>?


Snippet B:
```html
<div><p>Then press the <em>Draw</em> button</p></div>
```

When the above is corrected by the browser it becomes:
```html
<html>
  <head>
  <body>
    <div><p>Then press the <em>Draw</em> button</p></div>
  </body>
</html>
```

B) 9 nodes. There are no empty text nodes.


## Problem 2:

How many direct and indirect child nodes does each parent node --starting with the element with an id of `1` --have in the DOM generated by the following HTML:

```html
<div id="1">
  <h1 id="2">Hello, <em id="3">World</em></h1>
  <p id="4">
    Welcome to wonderland. This is an
    <span id="5">awesome</span> place.
  </p>
  <a href="#" id="6"><strong id="7">Enter</strong></a>
  <div id="8"><p id="9"><a href="#" id="10">Go back</a></p></div>
</div>
```

### Solution:

```
<div id="1">: 9 child nodes
  empty; h1; empty; p; empty; a; empty; div; empty
  <h1 id="2">: 2 child nodes
    text; em;
    <em id="3">: 1 child node
      text
  <p id="4">: 3 child nodes
    text; span; text
    <span id="5">: 1 child node
      text
  <a id="6">: 1 child node
    strong
    <strong id="7">: 1 child node
      text
  <div id="8">: 1 child node
    p;
    <p id="9">: 1 child node
      a;
      <a id="10">: 1 child node
        text 
```

### Further Exploration

Write code that returns the number of direct and indirect child nodes for a given parent node as an array.

```javascript
// sample output
> childNodes(1);
= [9, 12]
> childNodes(4);
= [3, 1]
> childNodes(9);
= [1, 1]
```


### Solution: (Partial)

```html
<html>
  <head>
    <script>
function childNodes(id) {
  var parent = document.getElementById(id);
  var children = parent.childNodes;

  return [children.length, countAllChildren(children)];
}

    function countAllChildren(nodeList) {
      var total = 0;

      // recursively walk through each node, send its count to 
      // total


    }

    </script>
  </head>
  <body>
    <div id="1">
      <h1 id="2">Hello, <em id="3">World</em></h1>
      <p id="4">
        Welcome to wonderland. This is an
        <span id="5">awesome</span> place.
      </p>
      <a href="#" id="6"><strong id="7">Enter</strong></a>
      <div id="8"><p id="9"><a href="#" id="10">Go back</a></p></div>
  </body>
</html>

```

## Problem 3:

Write a JavaScript function that takes an element's id and returns the DOM tree of the element in a two-dimensional array. The first subarray contains the element and its siblings, the second contains the parent of the element and its siblings, so on and so forth, all the way up to the "grandest" parent. Assume that the grandest parent is the element with an id of "1". Use the following HTML and test cases to test your code:

```html
<!doctype html>
<html>

<head>
  <title>Tracing the DOM Tree</title>
</head>

<body>
  <article id="1">1
    <header id="2">2
      <span id="3">3
        <a href="#" id="4">4</a>
      </span>
    </header>
    <main id="5">5
      <section id="6">6
        <p id="7">7
          <span id="8">8
            <strong id="9">9
              <a href="#" id="10">10</a>
            </strong>
          </span>
        </p>
      </section>
      <section id="11">11
        <p id="12">12
          <span id="13">13
            <strong id="14">14
              <a href="#" id="15">15</a>
            </strong>
          </span>
        </p>
        <p id="16">16
          <span id="17">17
            <strong id="18">18
              <a href="#" id="19">19</a>
            </strong>
          </span>
          <span id="20">20
            <strong id="21">21
              <a href="#" id="22">22</a>
            </strong>
          </span>
        </p>
      </section>
    </main>
    <footer id="23">23
      <p id="24">24</p>
    </footer>
  </article>
</body>

</html>

```
> domTreeTracer(1);
= [["ARTICLE"]]
> domTreeTracer(2);
= [["HEADER", "MAIN", "FOOTER"], ["ARTICLE"]]
> domTreeTracer(22);
= [["A"], ["STRONG"], ["SPAN", "SPAN"], ["P", "P"], ["SECTION", "SECTION"], ["HEADER", "MAIN", "FOOTER"], ["ARTICLE"]]


### Solution:

```javascript
function domTreeTracer(id) {
  var theDom = [];
  var currentGen = document.getElementById(id);
  var parentGen = currentGen.parentNode;

  while (currentGen.nodeName !== 'BODY') {
    var generation = Array.prototype.slice.call(parentGen.children);
    var genTags = generation.map(function (sib) {
      return sib.nodeName;
    });

    theDom.push(genTags);
    currentGen = parentGen;
    parentGen = currentGen.parentNode;
  }


  return theDom;
}
```

## Problem 4:


Implement a function, sliceTree, that is "similar" to the Array.prototype.slice method, but this time for a DOM tree. The sliceTree function takes two arguments: the start index which is the parent node's id attribute and, the end index which is the innermost child node's id attribute. The function returns an array of tagNames. Take note of the following when implementing the sliceTree function:

    - It's similar to slice but different in the sense that slice isn't inclusive on the right hand side.
    - The end index doesn't have to be the id of the "innermost" child node as some of the examples suggest.
    - Only consider element nodes.
    - Only the child elements of the body element are sliceable.
    - If the id attribute of the start or end index is not in the DOM, return undefined.
    - If the slice is not feasible — there's no path connecting the element at the starting index to the ending index — return undefined.

Use this html:

```html
<!doctype html>
<html>

<head>
  <title>Tree Slicing</title>
</head>

<body>
  <article id="1">1
    <header id="2">2
      <span id="3">3
      <a href="#" id="4">4</a>
    </span>
    </header>
    <main id="5">5
      <section id="6">6
        <p id="7">7
          <span id="8">8
          <strong id="9">9
            <a href="#" id="10">10</a>
          </strong>
        </span>
        </p>
      </section>
      <section id="11">11
        <p id="12">12
          <span id="13">13
          <strong id="14">14
            <a href="#" id="15">15</a>
          </strong>
        </span>
        </p>
        <p id="16">16
          <span id="17">17
          <strong id="18">18
            <a href="#" id="19">19</a>
          </strong>
        </span>
          <span id="20">20
          <strong id="21">21
            <a href="#" id="22">22</a>
          </strong>
        </span>
        </p>
      </section>
    </main>
    <footer id="23">23
      <p id="24">24</p>
    </footer>
  </article>
</body>

</html>

```

### Solution:

```javascript
function sliceTree(start, stop) {
  start = String(start);
  stop = String(stop);

  if (!(document.getElementById(start) && document.getElementById(stop))) {
    return undefined;
  }

  var current = document.getElementById(stop);
  var domSlice = [current.tagName];

  while (current.id !== start) {
    current = current.parentElement;

    if (current.tagName === 'BODY') {
      return undefined;
    }

    domSlice.unshift(current.tagName);
  }

  return domSlice;
}
```

## Problem 5:


Write a function that colors a specific generation of the DOM tree. A generation is a set of elements that are on the same level of indentation. We'll be using a "styled" version of the following HTML for this exercise to better visualize the generations. You may use the .generation-color class to color the specific generation. You can assume that only non-negative integers will be provided as arguments. Following are some sample output to help you test your code:

```html


<!doctype html>
<html>

<head>
  <title>Coloring</title>
  <link href="style.css" rel="stylesheet">
</head>

<body>
  <article id="1">1
    <header id="2">2
      <span id="3">3
        <a href="#" id="4">4</a>
      </span>
    </header>
    <main id="5">5
      <section id="6">6
        <p id="7">7
          <span id="8">8
            <strong id="9">9
              <a href="#" id="10">10</a>
            </strong>
          </span>
        </p>
      </section>
      <section id="11">11
        <p id="12">12
          <span id="13">13
            <strong id="14">14
              <a href="#" id="15">15</a>
            </strong>
          </span>
        </p>
        <p id="16">16
          <span id="17">17
            <strong id="18">18
              <a href="#" id="19">19</a>
            </strong>
          </span>
          <span id="20">20
            <strong id="21">21
              <a href="#" id="22">22</a>
            </strong>
          </span>
        </p>
      </section>
    </main>
    <footer id="23">23
      <p id="24">24</p>
    </footer>
  </article>
</body>

</html>
```

### Solution:
```javascript

function colorGeneration(n) {

  var gen = 1;
  var parents = Array.prototype.slice.call(document.body.children);
  var applyClass;
  var children;

  if (n < 1) return;

  while (gen < n) {
    children = [];
    
    parents.forEach(function (node) {
      var nextGen = Array.prototype.slice.call(node.children);
      nextGen.forEach(function (node) {
        children.push(node);
      });
    });                     // won't null enter? some nodes have no children
                            // A: no. without children, the call would 
                            // return an empty list; since then there's 
                            // nothing to iterate over, the empty never is
                            // pushed int the children array
    gen += 1;
    parents = children;
  }

  applyClass = children || parents;

  applyClass.forEach(function (child) {
    child.classList.add('generation-color');
  });
}
```

## Problem 6:


Write a function that takes two element ids as arguments and swaps the positions of the elements represented by the ids. The function returns true for valid swaps and undefined for invalid. To put the focus on the node swapping functionality, you can assume that nodes will have a value for the id attribute and two arguments will always be provided. Use the following HTML and sample codes to test your output:

```html
<!doctype html>
<html>
  <head>
    <title>Node Swap</title>
  </head>
  <body>
    <div id="1">
      <div id="4"></div>
      <div id="5">
        <div id="6"></div>
      </div>
    </div>
    <div id="2"></div>
    <div id="3">
      <div id="7"></div>
      <div id="8"></div>
      <div id="9"></div>
    </div>
  </body>
</html>
```


_Invalid Swaps_

// at least one of the id attributes doesn't exist
> nodeSwap(1, 20);
= undefined

// at least one of the nodes is a "child" of the other
> nodeSwap(1, 4);
= undefined
> nodeSwap(9, 3);
= undefined

_Valid Swaps_

// one swap
> nodeSwap(1, 2);

```html
<!doctype html>
<html>
  <head>
    <title>Node Swap</title>
  </head>
  <body>
    <div id="2"></div>
    <div id="1">
      <div id="4"></div>
      <div id="5">
        <div id="6"></div>
      </div>
    </div>
    <div id="3">
      <div id="7"></div>
      <div id="8"></div>
      <div id="9"></div>
    </div>
  </body>
</html>
```

// multiple swaps
nodeSwap(3, 1);
> nodeSwap(7, 9);

```html
<!doctype html>
<html>
  <head>
    <title>Node Swap</title>
  </head>
  <body>
    <div id="3">
      <div id="9"></div>
      <div id="8"></div>
      <div id="7"></div>
    </div>
    <div id="2"></div>
    <div id="1">
      <div id="4"></div>
      <div id="5">
        <div id="6"></div>
      </div>
    </div>
  </body>
</html>
```

### Solution:

```javascript
function nodeSwap(id1, id2) {
  var ele1 = document.getElementById(id1);
  var ele2 = document.getElementById(id2);
  var swapNodes = [ele1, ele2];
  var validRequest = function() {
    var i;
    if (!(swapNodes[0] && swapNodes[1])) return false;

    for (i = 0; i < swapNodes.length; i += 1) {
      var nodeParent = swapNodes[i].parentNode;
      var comparison = i > 0 ? swapNodes[0] : swapNodes[1];

      while (nodeParent.tagName !== 'BODY') {
        if (nodeParent.id === comparison.id) return false;
        nodeParent = nodeParent.parentNode;
      }
    }

    return true;
  }();

  if (!validRequest) return undefined;

  var ele1Parent = ele1.parentNode;
  var ele2Parent = ele2.parentNode;
  var mark1 = document.createElement('SPAN');

  ele1Parent.insertBefore(mark1, ele1);
  ele2Parent.insertBefore(ele1, ele2);
  ele1Parent.insertBefore(ele2, mark1);
  mark1.remove();

  return true;
}
```

## Problem 7:


Implement a function that converts the DOM, starting from the body, to nested arrays. Each element in the DOM is represented as ["PARENT_TAG_NAME", [children]] where children are elements as well and as such follow the same format. When an element has no children, it's represented as ["PARENT_TAG_NAME", []]. For instance, if the HTML doesn't have any elements inside the body, the result array would be: ["BODY", []]. Likewise, if the HTML only has a div element as its content, the result array would be: ["BODY", [["DIV", []]]].

Go over the examples below to better visualize how the DOM is represented as nested arrays.

example1
<!doctype html>
<html>
  <head>
    <title>Nodes to Array</title>
  </head>
  <body>
    <header id="1"></header>
    <main id="2"></main>
    <footer id="3"></footer>
  </body>
</html>

example1-output
> nodesToArr();
= ["BODY",[["HEADER",[]],["MAIN",[]],["FOOTER",[]]]]

// OR

= ["BODY", [
    ["HEADER", []],
    ["MAIN", []],
    ["FOOTER", []]]]

example2
<!doctype html>
<html>
  <head>
    <title>Nodes to Array</title>
  </head>
  <body>
    <header id="1"></header>
    <main id="2">
      <div></div>
      <div></div>
    </main>
    <footer id="3"></footer>
  </body>
</html>

example2-output
> nodesToArr();
= ["BODY",[["HEADER",[]],["MAIN",[["DIV",[]],["DIV",[]]]],["FOOTER",[]]]]

// OR

= ["BODY", [
    ["HEADER", []],
    ["MAIN", [
      ["DIV", []],
      ["DIV", []]]],
    ["FOOTER",[]]]]

example3
<!doctype html>
<html>
  <head>
    <title>Nodes to Array</title>
  </head>
  <body>
    <div id="1">
      <div id="4"></div>
      <div id="5">
        <div id="6"></div>
      </div>
    </div>
    <div id="2"></div>
    <div id="3">
      <div id="7"></div>
      <div id="8"></div>
      <div id="9"></div>
    </div>
  </body>
</html>

example3-output
> nodesToArr();
= ["BODY",[["DIV",[["DIV",[]],["DIV",[["DIV",[]]]]]],["DIV",[]],["DIV",[["DIV",[]],["DIV",[]],["DIV",[]]]]]]

// OR

= ["BODY", [
    ["DIV", [
      ["DIV", []],
      ["DIV", [
        ["DIV",[]]]]]],
    ["DIV", []],
    ["DIV", [
      ["DIV", []],
      ["DIV", []],
      ["DIV", []]]]]]