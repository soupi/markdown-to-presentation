Markdown to presentation
========================

A simple tool for creating presentations from markdown files.


License
=======

md2p is licensed under BSD3 license. This refers to `src/Main.hs` and `output/js/present.js` files.

**Note:** any other content is not a part of md2p and is not licensed by it.

Example
-------

- [Source](https://github.com/soupi/markdown-to-presentation/blob/gh-pages/input/Example.md)
- [Result](http://soupi.github.io/markdown-to-presentation/)


How To Use:
------
1. Create a Markdown file and seperate slides with `---` (html's `<hr>` tag)

2. Use _md2p_ tool (haskell compiler and cabal needed to compile md2p) to create an HTML file from your Markdown and place it in the output folder

You can also use any other md2html converter. just add the following to the html:
```html

<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/github.css">
<link rel="stylesheet" type="text/css" href="highlight/styles/solarized_light.css"> <!-- Or your preferable syntax highlight theme -->

<script src="js/jquery-1.11.0.min.js"></script>
<script src="highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<script src="js/present.js"></script>
```

Actually, you can omit everything except:
```html
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/present.js"></script>
```

but then styling is up to you.

How to Install md2p:
-------------------
use cabal to download dependencies and install md2p
```
cabal update && cabal install
```


Packages and Libraries used to create m2p:
------------------------------------------
- [markdown](http://hackage.haskell.org/package/markdown) - for markdown to html conversion
- [highlight.js](https://highlightjs.org/) - for syntax highlight
- [a slighty modified github.css](https://gist.github.com/andyferra/2554919) - for styling
