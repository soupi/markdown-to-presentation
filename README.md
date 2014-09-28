Markdown to presentation
========================

A simple tool for creating presentations from markdown

How To:
------
1. Create a Markdown file and seperate slides with '---' (html's <hr> tag)

2. Use m2p tool (haskell compiler and cabal needed to compile m2p) to create an HTML file from your Markdown and place it in the output folder

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

Actually, you can omit everything but:
```html
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/present.js"></script>
```

but then styling is up to you.

Packages and Libraries used to create m2p:
------------------------------------------
- [markdown](http://hackage.haskell.org/package/markdown)
- [highlight.js](https://highlightjs.org/)
- [a slighty modified github.css](https://gist.github.com/andyferra/2554919)
