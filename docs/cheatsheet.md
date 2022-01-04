# Rails

variable = "default" unless local_assigns[:variable]
content_tag(:div, content_tag(:p, "Hello world!"), class: "strong")

# Vanilla JS

document.addEventListener("DOMContentLoaded", function(event) { 
})

var data = JSON.parse(document.getElementById("data").dataset.recipe)

document.createElement("div");
node.appendChild(textnode);

var elem = document.getElementById('elem-id')
document.querySelectorAll('[data-autocomplete-url]');
for (const elem of elements) {
}
elems = document.getElementsByClassName("inner-link");
for (var i = 0; i < elems.length; i++) {
  let elem = elems[i]
}

elem.style.transform = 'translateX(10px)'
elem.addEventListener("click", function() {/* content */});

elem.dataset.autocompleteUrl

for (let i = 0; i < choices.length; i++)


# JQuery
var elem = $('#elem-id')
elem.css("transform", "translateX(10px) !important")
elem.click(function() {/* content */});
$.get(url, function(data) {
  console.log("data:", data)
});
elem.append($("<ul><li>one</li><li>two</li><li>three</li></ul>")) // append a element created on the fly

# css

Combinators: ' ', '>', '+', '~'
Grouping with comma.
https://www.w3schools.com/Css/css_combinators.asp

opacity: 0.5;

width: calc(100% - 20px;)

/*To center an item*/
width: 400px;
transform: translateX(calc(50vh - 50%));

padding: 25px 50px 75px 100px; /* top, right, bottom, left */
padding: 25px 50px 75px; /* top, right and left, bottom */
padding: 25px 50px; /* top and bottom, right and left */
padding: 25px; /* all four */

Astuce: Au lieu de mettre des trucs inline (par exemple h1 ou h2 avec un icone à côté),
mettre les trucs dans un conteneur flex. Cela permet de faire des choses qui ne sont pas permises
avec inline. Par exemple, le width et le height je crois.

The owl. Je ne maîtrise pas encore ca...
#user-recipe-list > * + * {
  margin-bottom: 1.5rem;
}

## links
Un search field, quand tu cliques dessus il passe de 130px à width: 100%; Quand tu enlèves il redevient normal.
https://www.w3schools.com/howto/howto_css_animated_search.asp




# HOW TO DO THINGS:

## Centering

## A CSS tooltip
<p>Here we have some
  <span tabindex="0" data-descr="collection of words and punctuation">text</span> with a few
  <span tabindex="0" data-descr="small popups that appear when hovering">tooltips</span>.
</p>
span[data-descr] {
  position: relative;
  text-decoration: underline;
  color: #00F;
  cursor: help;
}
span[data-descr]:hover::after,
span[data-descr]:focus::after {
  content: attr(data-descr);
  position: absolute;
  left: 0;
  top: 24px;
  min-width: 200px;
  border: 1px #aaaaaa solid;
  border-radius: 10px;
  background-color: #ffffcc;
  padding: 12px;
  color: #000000;
  font-size: 14px;
  z-index: 1;
}

