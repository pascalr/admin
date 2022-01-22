## Routine

1. Vendredi: Backup Admin, Hedacuisine, IMAGES TOO!

# IMAGES

Accumuler les photos sur IStock et payer pour 750 photos pour 400$ (Avoir 20% off à travers unsplash ou autre?)
Avant de passer trop de temps dessus, lire le User Agreement: https://www.istockphoto.com/legal/license-agreement
https://www.istockphoto.com/photo/freshness-pumpkin-soup-gm859053324-141898373?utm_source=unsplash&utm_medium=affiliate&utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fpumpkin-soup&utm_term=pumpkin%20soup%3A%3Asearch-aggressive-affiliates-v1%3Aa

Prendre une image de petits pains. Même recette que les grands pains.
Après ma première paie, magasiner des images!

Images belle, mais à essayer les recettes je ne sais pas si c'est bon:
1. https://www.pexels.com/photo/a-close-up-shot-of-cooked-potatoes-and-asparagus-on-a-metal-tray-7059460/
1. https://www.pexels.com/photo/basil-leaves-and-avocado-on-sliced-bread-on-white-ceramic-plate-1351238/
1. https://www.istockphoto.com/photo/freshly-prepared-egg-salad-sandwich-gm471412597-20447331?utm_source=unsplash&utm_medium=affiliate&utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fegg-salad-sandwhich&utm_term=egg%20salad%20sandwhich%3A%3Asearch-aggressive-affiliates-v1%3Ab
1. https://www.istockphoto.com/photo/healthy-wholegrain-bread-sandwich-gm886186166-246115135?utm_source=pixabay&utm_medium=affiliate&utm_campaign=SRP_image_noresults&referrer_url=http%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Ftuna%2520salad%2520sandwhich%2F&utm_term=tuna%20salad%20sandwhich
1. Ajouter le lien des images IStock aux recettes.

# DATA

1. Soupe aux nouilles et brocoli 
1. La courge poivrée, linker à des recettes de soupe, de courge farcies et de graines.
1. Sandwhich au thon. Tuna salad sandwhich
1. Sandwhich aux oeufs. Egg salade sandwhich
1. Soupe aux nouilles et brocoli
1. Purée de courge poivrée
1. Pour avoir du contenu facilement, prendre des recettes en anglais et les traduire en français?
1. Faire un pain et le peser. 650g?
1. Une recette de tarte au sucre sans oeuf.
1. Ajouter la recette d'abaisse de tarte précuite (juste copier coller ce que j'ai écrit pour tarte au sucre)
https://www.ricardocuisine.com/recettes/4817-pate-brisee-de-base
1. Ajouter les versions de tofu poulet au beurre et de boulette de pois chiches...
1. Plein de conversions: https://www.recettesquebecoises.com/conversionsdet
1. Pâte feuilleté et pâte sablé. Link les recettes de pâtes entres elles.
Densités:
https://www.aqua-calc.com/page/density-table/substance/cornstarch-coma-and-blank-upc-column--blank-039978015839
1. https://www.bbc.co.uk/food/ingredients/a-z/a/1#featured-content
1. https://www.homebaking.org/glossary/
1. Traduire les recettes de Cookie&Kate en français.

https://www.alexa.com/siteinfo/coupdepouce.com
https://www.alexa.com/siteinfo/cookieandkate.com

https://www.bakeinfo.co.nz/facts/bread/science-of-bread-making

# ARTICLES

1. Écrire un article à quel point c'est n'importe quoi les unités... voir: https://en.wikipedia.org/wiki/Cup_(unit)
1 metric cup: 250 mL. 1 US cup: 236.5 mL. 1 US legal cup: 240 mL.
Ajouter units/index.html?
1 australian tablespoon == 20 mL
1 dessertspoon == 10 mL
1 old Canadian cup == 227 mL
1 japanese cup == 200 mL

1. Créer un article qui explique que les recettes publiques seront toujours disponibles. Même si le site n'existe plus, il est possible de télécharger le site et de le rouler localement. Donner le lien github. Et donner même comment le rouler. Dans le README du lien github, expliquer comment rouler le site localement.

1. Peaufiner l'article de pois chiches. Remettre les images que j'avais. Link la recette de boulettes de pois chiches à l'article de pois chiches.

# Pour rerelease le static:

# WEBSITE MVP

# Autres planifications

# UPGRADE TO rails 7 en fds???

1. Print. Share. Download.

1. Est-ce que Recipe#Show est encore utile? Seulement BookRecipe#Show et RecipeKind#Show non??? Oui c'est encore utile parce qu'une recette n'appartient pas nécessairement à un livre. Toutefois, je pense que pour que la recette soit publique, elle doit être associé à un livre. Dans le site public, on peut seulement voir RecipeKind#Show et BookRecipe#Show.

1. Dans pages, afficher l'auteur à côté du nom de la recette, et afficher les étoiles comme il le faut, comme avant.

1. Le truc à droite l'afficher en bas quand l'écran est petit.

1. Mettre un cadenas à côté des recettes privé dans le sidebar du livre.

1. RecipeKind n'affiche pas les pages? Il affiche tout le temps qu'il n'y a pas de recettes??? Fix le bouton Voir les recettes similaire...

1. Dans la barre de recherche, voir des livres, des catégories (RecipeKind) et les recettes de l'utilisateur courrant. Quand il y a un utilisateur courrant, linker à sa recette du RecipeKind dans le show du RecipeKind.

# LATER

1. Dans la futur application sur téléphone, pouvoir seulement regarder, et aussi pouvoir prendre en photo vos recettes. Après tu peux aller sur l'ordinateur et les rentrer. Idéalement un algorithme qui essaie de détecter le texte sur la photo aussi...

1. Category au lieu de RecipeKind partout? /categories...

1. Ajouter un calendrier? Version précédente (était dans Recipes#show):
<% if user_signed_in? %>
  <% machine = current_user.machines.first_or_create %>
  <div class="collapse" id="calendar">
    <%= render partial: "meals/calendar", locals: {recipe: @recipe, machine: machine, meals: machine.meals.includes(:recipe) } %>
    <div style="height: 10px;"></div>
  </div>
<% end %>

# END LATER

1. Un encadré Recette de la catégorie:
              Boulette de pois chiche (23 recettes)
              Les boulettes de pois chiches sont une recette
              végétarienne à base de pois chiches, chapelure,
              œufs et assaisonnements. En savoir plus...
1. Un encadré Tiré du livre...

1. Au lieu de faire un éditeur pour la page couverture du livre, rédiger un article qui explique comment faire une page couverture avec un logiciel de dessin très simple en ligne.

1. Une application sur le téléphone pour visionner nos recettes.

Mettre les images de livre à la même auteur. Les largeurs peuvent varier. Dans le sidebar, la hauteur varie. Quand côte à côte, la largeur varie.

Books use AJAX.

Montrer à Céline.

Ajouter un truc rechercher à mes recettes.

Recettes devrait afficher le carrousel de recette. Le menu d'acceuil, devrait afficher un carrousel de livre, puis le carrousel de recettes.

Book show pourrait être un recipe carrousel? Ça serait mieux que le gros plan sur la page couverture...

Quand est-ce que je veux aller sur un livre vs quand est-ce que je veux voir des catégories et comparer?

Si j'ai la recette dans mon livre, je veux aller sur la recette de mon livre.
Si je vais sur un livre d'un ami, un livre featured ou un livre quelquonque, je suis sur le livre.
Si je cliques n'importes où d'autre et fais quoique ce soit d'autres, je ne veux rien à faire avec les livres.

Je veux que les livres soient plus un truc perso, une liste perso, que tu peux partager avec tes amis.

Si user vient d'un lien => Livre
Si user vient d'un moteur de recherche => Catégories

Ouin, mais j'aimerais quand même ça voir d'où est-ce que ça vient? À propos de l'auteur.. si j'aime une recette, je suis tenter d'aller voir les autres recettes simillaires...

Quand je clique sur une recette, si j'ai cette recette dans un de mes livres, aller sur la recette dans mon livre. Sinon, si la recette vient d'un livre d'ailleur, aller sur la recette dans lequel le livre viens. Si la recette ne vient pas d'un livre? 

Books require JS.

To users: Add a description to the recipe (image and small text):
Find existing description. Create new description.

Openeats: https://github.com/qgriffith-zz/OpenEats???

- Add registerEditor inside a useEffect(() => {}, []) Wait a little to make sure it works, then remove all the previous shit.

- Ajouter un encadré qui dit d'où ce que la recette vient. Aussi trouvé dans le livre... Le user doit être l'auteur du livre et de la recette?

- Ajouter les livres en vedettes dans la page d'acceuil.
<h2>Livres en vedettes</h2>
<h2>Recettes publics</h2>

- Change data-step to first in Step. Fix the JSON...

!!!!!!!UTILISER DES PARTIALS POUR RENDER LE JS DES MODELS... BEAUCOUP DE DUPLICAT, QUAND JE RAJOUTE DES FIELS CA FUCK TOUT!!!!!!!!!

Renommer Book theme à Book layout. Quand c'est des BookLayout de heda cuisine, appeler ça des templates.

Ne pas partager les images des utilisateurs (sauf si l'utiliseur donne le droit)
Ne pas pargager les BookLayout. Un utilisateur ne peux pas cloner un layout d'un autre. De toute façon, on veut que ce soit original et différent les layout!

Planification 8-9 janvier:
- Ajouter plusieurs formats aux livres.
- Deprecate all fields not used anymore because using JSON now.
- Add recipe_id attribute to ingredients. Or no. There was a way to share attributes. Find out how to pass attributes from the parent (recipe) down to the children...
C'est affreux d'avoir à faire gon.recipe = recipe...
OU ENCORE MIEUX! Est-ce que le children est capable d'aller chercher ses parents? Et là il pourrait trouver l'attribut qu'il requiert. Il monte jusqu'à temps qu'il trouve de type 'recipe-body'.
- Les images dans la recherche font beaucoup trop de call à la database. Inline dans json...
- Plus important: images.
- DELETE AWS S3!!!
- Images de recette dans les livres. (Image fullscreen vertical, Image halfscreen horizontal)
- Images de page couverture des livres
- Un compte utilisateur devrait pouvoir uploader une image par recette. Il devrait aussi pouvoir uploader plusieurs images pour le livre.
- Un compte admin devrait pouvoir uploader UNE ou plusieurs images par RecipeKind.
- https://github.com/biola/punching_bag/blob/master/lib/punching_bag/acts_as_punchable.rb (med.increment!(:screener_viewed) https://dev.to/evanrpavone/view-counter-rails-6-3amh)
- Tiptap should not read anything from gon. Or it should be done in another way...

Truc à travailler plus tard:
- Page d'erreur
- Subdomain for heroku (il faut que je paie par contre pour avoir https si je me souviens bien...)
- Alias pour les food (Gérer par équivalence. Parce que idéalement, seulement le data de 1 oignon, oignon hâché, émincé, en poudre et autre sont des équivalents. alias est un équivalent 1 pour 1)
- Food data
- Fr/CA, Fr/FR
- Bilingue
- Gérer les unicodes tel que ½ et œ
- Commentaires aux recettes

Securité:
- Enlever html des attributes qui peuvent être mass assigned pour tout. (Seulement un admin peut l'assigner?) (Idéalement rouler le code javascript sur le serveur, mais il faudrait que je ne suis pas trop bon là dedans. Idéalement un truc node.js qui lit dans la database et qui update les html selon les json.

Avec javascript, pouvoir dérouler page par page d'un livre a l'infini (loader lorsqu'on arrive sur la page). Sans javascript, lire page par page.

2022-01-07T01:10:33.401175+00:00 app[web.1]: #<Fog::Errors::Error: B2 credentials are required, please use b2_account_id and b2_account_token or b2_key_id and b2_key_token>

<link rel="stylesheet" media="all" href="/themes/<%= @book.theme.id%>/stylesheet" />

1. Je devrais être capable facilement de convertir les recettes française que Céline m'envoit en recette québécoise.

1. Pour que le HTML soit plus similaire au JSON, faire <div data-type='link-model'></div> pour chaque type. (En remplaçant 'link-model' par le type) Ça serait plus facile à parser et cela me permettrais d'avoir les même attributs en HTML qu'en JSON (au lieu de faire data-... que je ne veux pas avoir en JSON...)

1. Le site est dédié pour les chefs amateurs et non les chefs professionels. Le site ne supporte pas les livres privés pour l'instant en tout cas.

1. Sur la page d'acceuil, tout en haut, il pourrait y avoir un décompte un jour. Nombre de recettes: Nombre de livres: 

1. Metaprogramming in ruby (je ne me rapelle plus du use case, mais je voulais faire ça à un moment donné): https://www.bigbinary.com/learn-rubyonrails-book/rails-macros-and-metaprogramming

1. Dans un menu pour admin, ajouter un bouton qui execute une fonction javascript. La fonction prend une liste de toute les recettes. Une par une, elle télécharge les recettes, les insérère dans l'éditeur et sauvegarde le texte lorsque c'est différent. Devrait se faire lorsqu'il y a des modifications dans le code ou bien dans le data (des foods qui sont créer (des liens))
1. TRÈS TRÈS DANGEREUX LA MANIÈRE QUE LE TEXTE DES RECETTES SONT HANDLE POUR L'EDIT. FAIRE DES TESTS PARCE QUE JE POURRAIS TOUT PERDRE. S'ASSURER D'AVOIR DES BACKUPS AUSSI.
1. UPDATE TOUT LES TEXTES DES RECETTES. Mais je n'aime pas trop ça c'est dangereux. Quand je fais ça, être très très sûr que je n'affecte rien. Il va falloir que je fasse des tests pour ça. Aussi, obligé un backup avant de updater tous les textes.

1. Le site statique pourrait ajouter l'information nécessaire pour la user navbar en js. Ouin, mais ça appelerait le site dynamique à chaque fois pour voir si l'utilisateur est connecté...
(Garder dans des cookies l'information du compte et partager les cookies avec le site statique???)
1. Simplement appeler le lien à droite Mon compte, lorsque l'utilisateur est sur le site statique?

1. Mettre le thumbnail des images inline dans le json des recettes pour la recherche?

1. Quand l'écran est petit, affiché un icone de personne au lieu de l'addresse email de l'utilisateur.

1. Remove the Image index view. Well keep as is, but a user should not need it.

1. As seen in the book...

1. Ajouter un boolean aux RecipeKinds. Featured. Seulement les recettes qui sont featured sont dans le home page. Et seulement celles là sont sauvegardées. Les autres images sont sure Cloudfare images?
(Cloudfare pages max fize count == 20 000)... J'aimerais avoir tout les thumbs sur git aussi au moins... pour la barre de recherche en haut... Ça va être long avant que j'aie 10 000 recipe kind de toute façon... À 12K en moyenne, c'est 120Mb, c'est rien...
/images/thumbs/...
/images/featured/
Toutes les autres sur Cloudfare images.

1. Pouvoir ajouter des ingrédients qui ne sont pas dans la liste!!!

1. Pouvoir créer une nouvelle recette à partir du livre.

1. Ajouter une liste (wishlist). UserRecipeWish

1. ENLEVER FUCKING AWS...

1. TODO: Add links color to themes.

1. TODO: <Recipe> en js qui fait comme _recipe_body avec Rails

1. Drag and drop les recettes pour les placer dans un certain ordre.

1. Set Title font size as %? This way I can scale easy?

1. JS forms. Pass a record. model should be a record. Inside the record, add class_name. If you modify the record, does it modify gon? Yes it does so this works!

1. Pouvoir rajouter des catégories aux livres. Par exemple, Gâteaux, Biscuits, Muffins...

1. Dessiner ce que je veux pour les livres.

1. Par défault, créer deux livres de bases par utilisateurs. Mes favoris. Et mes envies.

1. When books works, remove user recipes. I believe they are deprecated.

1. Toujours afficher (1 de 3) en premier, et non (3 de 3).

1. Ne pas garder les variantes d'images sur AWS, juste l'original.

1. TODO: A path builder in js. Path.recipe_kinds_path. Qui reproduit ce qui est fait en rails. Le générer dynamiquement selon les routes pourrait être nice!

1. Remove unnecessary fields. For recipe especially. I am confused. Text is used.

1. REPUBLIER SUR HEDA CUISINE. COMME CA M'ASSURER QUE JE N'AI PAS FAIT DE BETISE AVEC GON PAR EXEMPLE.

1. Idéalement, renommer RecipeKind to Recipe. Et Recipe to RecipeVersion. Peut-être ne pas faire cette modification dans le back-end, parce que je n'ai pas envie, mais la faire dans le front end. Ce que j'ai dit serait ce que c'est pour l'utilisateur. OU PAS. Un utilisateur crée une recette. Il s'en fout que se soit une version ou pas...

1. It's very dangerous. If I make a mistake that erase something in the recipe (a <span> of some sort) I lose the info...

1. Link to recipe kinds.

1. Pouvoir ajouter des liens vers des aliments.

1. Fuck off. Pas de descriptions inutiles. Des biscuits à l'avoine sont des biscuits à l'avoine... Ou pas je peux au moins linker à la nourriture...

1. Sur Github pour proposer des sortes de recettes?

1. Ajouter KindIngredient aux kinds? Comme ça quand on cliques sur un ingrédient on voit les kinds?

1. Si l'apparence d'une recette ou la composition d'une recette est unique, elle a droit à son RecipeKind. Mais il faut une photo!

1. Link to food inside descriptions.

1. Pouvoir choisir le type de la recette dans le edit et voir le changement live

1. Quand je suis dans une grande catégorie, pour voir les pages, afficher l'image dans la recette, avec préparation et cuisson à côté, comme avant. Peut-être afficher le petit format au lieu du gros.

1. Quoi faire avec les images de recettes qui ne sont pas une catégorie en tant que telle?

1. Soupe nouilles et brocolis n'est pas une RecipeKind en tant que telle, todo: delete

1. Québec vs France. Granola. Barre tendre vs barre de céréale. Dans l'éditeur, pouvoir ajouter des traductions: {fr-CA: barre tendre; fr-FR: barre de céréale}

1. Use CDN to serve images?

1. TODO: Show recipe_kind_path => Show recipe kind when there are no recipe. Otherwise, show the most popular recipe of the kind first.

1. Ajouter un score aux recettes? +1, -1?

1. https://www.bakeinfo.co.nz/facts/bread/science-of-bread-making

1. Ce qui pourrait être intéressant, c'est que les gens modifies comme ils veulent tout. Et un algorithme avec un peu de hand-curated content prend le meilleur de tout et combine ça en quelque chose d'uniforme pour tout le monde.

1. Article Comment faire un gâteau?
1. Article Lexique.

1. Ajouter des notes et ajouter des références d'une belle manière.

1. Rendre mon compte utilisitateur pas admin.

1. Un éditeur pour les articles aussi. Celui là le faire purement en ProseMirror.

1. Faire des images d'outils. Des images de bols, de cuisinière, ...

1. Remove Tiptap and only use ProseMirror
1. Keyboard shortcut to see bubble toolbar. Enter? (Do this after having removed Tiptap?)

1. https://www.comparecuisine.com
1. Focuser sur la comparaison de recettes. Faire une recettes de 5 manières différentes et écrire mes commentaires.
1. Dans les commentaires, quand quelqu'un n'aime pas une recette, montrer c'est quel recette que eux autres ils préfèrent.

1. Offrir un forfait à 2$ par mois pour ne pas avoir de publicité. Ceux qui ne payent pas. Pas de publicité non plus. Tu paies pour ne pas donner de publicité à tout le monde. Merci!

1. Faire des comparaisons de recettes. Trouver 5 recettes différent par exemple de muffin aux bleuets et les évaluer.

1. Drag and drop change le recipe item nb dans les instructions.

1. add food-id to food links in order to be able to add a popup with a description when hovering the ingredient
1. Mouse over food shows image and short description of food.

1. Don't recalculate getHTML() every 5 seconds.

1. Limit recipe text size. All sizes for that matter.

1. Un format simplifié avec seulement les instructions. Possibilité du format détaillé aussi avec des images.

1. Un tableau pour les paramètres des recettes.



1. <ol start="5">
https://stackoverflow.com/questions/4615500/how-to-start-a-new-list-continuing-the-numbering-from-the-previous-list

1. Offrir de télécharger les recettes au format JSON.

1. Ne pas mettre name et locale dans le content parce que c'est un must et ça ferait laid...

https://cooklang.org
https://news.ycombinator.com/item?id=28997309

1. Open database of recipes.

1. Un interface pour éditer les recettes graphique. Et un interface pour éditer les recettes version texte.

// This is a comment
{locale: fr}
{cookingTime: 10} // Cooking time in minutes
{cookingTime: 1hour} // Cooking time in english
{cookingTime: 1heure} // Cooking time in english
{note: 1} // Replace: Show something
{linkNote: 1}
{1} // Ingredient 1
{(1 c. à table)} // A quantity
{(2)} eggs // A quantity
{1,2}
{1,3-5}
{1,2,(1/2 t de farine)}
- 1 t de farine // Tous valide
- 1 t, farine // Tous valide
- 1 t farine // Tous valide
- 1, oeuf
/ Paragraph in italic
$ Title
$$ Subtitle
$$$ Sub-subtitle


1. L'aide pour les instructions serait un Modal. Comme ça j'aurais amplement de place pour donner toute mon information. Est-ce qu'on peut scroller un modal?

1. Faire le live preview comme du monde. Parse le texte et générer un arbre.

<IconButton aria-label="delete">
  <DeleteIcon />
</IconButton>

1. Status bar at the bottom.

1. Avec styled components de react rajouter un style à field pour qu'il soit un tout petit peu séparer.

1. Cacher les conversions tant qu'elles ne sont pas parfaites... Les mettres nul si ce n'est pas bon, et quand c'est nul ne pas utiliser.
1. Courge poivrée n'a pas le bon poids...

1. JS. Quantity

1. Transition sur le width quand tu appuis sur ajouter un commentaire.

1. Change le drag and drop pour être avec mon custom react.

1. Pouvoir créer un ingrédient même si le food n'existe pas. Ajouter raw_food.

1. Une fonctionnalité pour pouvoir copier coller une liste d'ingrédient.

1. Un logo

1. Les images les prendres en haute définition peut-être pour pouvoir faire des livre de recettes? Faire une belle mise en page. En même temps une belle mise en page pour imprimer des recettes.

1. J'aimerais que quand le monde l'utilise, le feeling soit que c'est genre une application à toi et que tu as full de control. As peut-être pouvoir customiser l'interface?

1. Est-ce que ça serait possible genre une belle one page application et tout ce fait en wysiwig avec ton livre de recette?

1. Mon livre de recette. Le monde créerait leur propre livre de recette dans le fond. Il y aurait un page au début avec l'index des recettes. P. 1, P. 2. Vendre des skins, des designs de livres de recettes.

1. Scaleway au lieu de Heroku?
Contre: Backup db. More work. Less full scale ready.
https://www.scaleway.com/en/stardust-instances/ 

1. Kind devrait être Category. Et Kind devrait être la description générale d'une recette.
1. Je crée une recette. J'inscris le nom de la recette. Ça me propose des kinds de recette. J'inscris celle qui est la plus proche. Ehh ça doit être un exact match sinon ça ne fonctionne pas? Oui ça peux fonctionner. Modifier un peu encore mon affaire. En revenir un peu plus à comme avant? Je suis pas mal en train de revenir à comme avant là...

1. Bon pas mal comme maintenant, mais rajouter un model RecipeKind. Kind c'est AbstractKind. Les utilisateurs ne peuvent pas créer de RecipeKind. Si elle n'existe pas, elle n'existe pas c'est tout, elle ne pourra pas être publique. Moi je vais voir ensuite les recettes qui n'ont pas de RecipeKind, et je vais peut-être être capable de les regrouper.

1. OSTI QUE C'EST COMPLIQUÉ... Ah mettons que je vais une tarte fraises et bleuts. Qu'est-ce que je veux qui se passent? Ah, elle peut être pour plusieurs peut-être? Tarte aux fraises et tartes aux bleuets?

1. FUCK OFF. Le RecipeKind doit être un EXACT MATCH (ou bien un synonyme, donc un RecipeKind aurait plusieurs noms possibles). Donc tarte aux fraises et bleuets n'apparait pas dans les versions de tartes aux fraises.

1. Mais oui je veux que tartes aux fraises et bleuets apparaissent dans tartes aux fraises et dans tartes aux bleuets.
1. Mais son image ne sera ni celle de tarte aux fraises, ni celle de tarte aux bleuets. Elle n'aura pas d'image tant qu'elle n'aura pas une image spécifique à elle. Une image de tarte aux fraises et aux bleuets.

1. Maintenant Purée de patates et épinard.

1. Ah, peut-être qu'il y a des main RecipeKind. Par exemple, Tarte aux fraises. Tartes aux bleuets. Ensuite, il y a des RecipeVersions. Tarte aux fraises et bleuts. Et il y a des Recipe.
1. Une Recipe belongs_to a RecipeVersion.
1. A RecipeVersion has_and_belongs_to_many RecipeKind.
1. A RecipeKind belongs to a RecipeCategory and has_many RecipeVersion.

1. À quoi sert RecipeVersion?
1. À rien.

DONT CHANGE ANYTHING UNTIL I AM SURE. KEEP RECIPES AS IS!!!

1. Ok, si une recette n'est pas un exact match avec un RecipeKind synonyme, alors l'interface de présentation va être différent.
1. On va te demander, cette recette là est-elle une sous catégorie d'une catégorie?
1. Oui, tarte aux fraises et bleuets est une sous-catégorie de tarte aux fraises.
1. Quel sera l'interface. Dans le fond, on veut voir la recette en bas comme normale. Et en haut, on vera, Cette recette est une sous-recette
de tartes aux fraises et de tartes aux bleuets.
Tartes aux fraises et aux bleuets

Catégories:

Tarte aux fraises | Tarte aux bleuts (Voir les images avec le nom de la catégorie en dessous)

1. Demander à mom la recette de gaufres.

1. Pouvoir supprimer les références.

1. Ajouter une description dans les recettes. Placeholder: Qu'est-ce qui démarque cette recette des autres versions? (optionel)

1. Le pluriel est un cas très rare. Seulement utile pour faire pluralize. L'enlever des traductions et les mettres dans une une table à part peut-être. Analyser ça...

1. Changer les versions sans reloader la page.

1. Mes recettes favorites. Une seule liste puis drag and drop. Modifier directement dans l'interface! Rajouter avec js des handle et enable de drag and drop. Ajouter un field pour ajouter des recettes.

1. Modifier la recette en WYSIWYG?

1. Right now, it is easier to have both the dev website and the static website. At some point though, serve everything on the static website client side. The dev website would only be a database.
1. By loading a single script on the static site, am I able to handle devise login?
1. TANT QUE MON SITE N'EST PAS TRÈS AVANCÉ ET BIEN TESTÉ, SÉPARER LA VERSION DEV ET STATIQUE. COMME ÇA MA VERSION STATIQUE EST BONNE. JE PEUX LA VALIDER CORRECTEMENT.

1. People can login into the BETA beta.hedacuisine.com in order to create recipes. edit.hedacuisine.com

1. Laisser au monde la possibilité de créer des recettes

1. Pas de pluriel à 1.001

1. Pouvoir changer la région entre France et Québec. Ajouter la région US avec des tasses à 236 mL ou bien 240 mL?

1. Description boulette de pois chiches et trempette chaudes aux artichauts.

1. Ajouter mes propres commentaires dans les recettes.

Ah, le pain... si simple, mais si bon! Pas surprenant que c'est l'aliment le plus consommé au monde! Faire son pain à la maison, c'est encore meilleur. L'odeur et le goût d'un pain tout juste sorti du four sont difficiles à battre!

C'est une délicieuse recette végétarienne qui n'a rien à envié aux boulettes de viande. Un très bon aliment à manger avec des pâtes, des sous-marins ou des pains pitas. Un moyen simple et gourmand de rajouter des protéines à vos pâtes alimentaires!

Lorsqu'on est invité chez des gens, c'est notre valeur sûre! C'est rapide à faire, tellement bon et parfait pour être partager! Simplement servir avec du pain ou des pitas.

1. Faire 1 heure de contenue. Mettre de la musique. Écrire de belles descriptions pour les recettes déjà sur le site. Jusqu'à 11:34.

1. Être sur google
1. Trouver des endroits pour faire de la publicité pour mon site.
1. Demander l'opinion des gens, ce qu'ils en pensent

1. Écrire de belles descriptions pour toutes les recettes visibles, avec sources. Développer un guide.

1. Utiliser le lin

1. Spell checker.

--------

1. Un jour peut-être. Ajouters des images pour les outils. Mettre les contenants, la cuisinière et le four aussi dans les outils. Ça pourrait être beau je crois.

1. Ajouter un hashtag aux sections, #description, et c'est ainsi que les sections sont référencées. article: ###; section: description

1. Des références correct. Par exemple celle ci: http://gdt.oqlf.gouv.qc.ca/ficheOqlf.aspx?Id_Fiche=8361931, pour la farine.

1. Add extension to images in the database. ext: ".json"

1. TODO: Cache recipes.json

1. Only have variants for images that are recipe images. Add a boolean to images to know if they can be used for a recipe.

L'avantage des sections des articles et des séparer les articles en plus petits morceaux. Cela facilite la traduction et le référencement.

1. Pouvoir recompiler une seule page.

1. Quand je compile, regarder toutes les recettes publiques et m'écrire les warnings.

1. Quand je focus le search, cacher le menu, changer la largeur de l'input (avec une transition comme ça ça fait une belle animation), remplace la loupe par X pour enlever le texte.

1. Pouvoir mettre des images verticales?

1. Utiliser un vrai truc d'autocomplete pour le search en haut...

1. Faire du beau css. Utiliser des variables en scss. Faire ça clean mon truc de search.

1. Enlever les 2 trucs différents pour la navbar, c'est mauvais comme design.

1. Garder juste 2 chiffre significatif. Voir la longeur du chiffre. Regarder le chiffre suivant. Arrondir .1, .2 et .3 à 0, .4, .5 et .6 à .5, .7, .8, .9 à 1

1. TODO: Handle les alias de nom de recettes. Pâtes à tarte, croûte à tarte...

1. dropbox sync images

1. amandes n'est pas au singulier...

1. en

1. Ne pas modifier le nom des recettes en expressions pour l'instant. S'assurer que ça fonctionne bien pour les foods en premiers.

1. Remove FoodRecipe. Remove Tasks.

1. Ajouter about aux images

1. Ajouter four dans les outils. C'est pratique parce que ainsi tu peux filtrer les recettes qui ne nécessitent pas le four. Mais ça fait bizarre de marque four. Marquer cuisinière aussi? Je ne sais pas...

1. Search autocomplete use JSON file.

1. Ajouter une section Détails entre Instructions et Commentaires? Et là marquer le lien vers la recette originale? Ça me prendrait plus de détails à inscrire que seulement la source originale... Ah peut-être par qui aussi que ça été modifié? Quel utilisateur a ajouté la recette? La date de création. La date de dernière modification.

1. Des outils facultatifs (par exemple un coupe-pâte dans la recette de tarte au sucre version 3.

1. Pouvoir naviguer la barre de recherche avec le clavier.

1. Ajouter au règle de bonne recette: Inscrire toutes les étapes dans la recettes, incluant de couper les ingrédients.

1. Imprimer

1. Different font in dev than in prod. Dev seems to be the problem because if I comment out the url in application.scss, it is the same.

1. Hey pour les contents creators ça pourrait être cool: On traduit automatiquement vos recettes pour 10 pays! (Québec, France, ...) Ça serait hot!

1. J'aimerais arrondir le 3e chiffre significatif au demi près. 120, 125 et 130. 1.2, 1.25, 1.3.

1. Un espace insécable entre la quantité et l'unité.

1. Clean HTML. Minimize layout HTML.

1. Trouver un autre nom de domaine qui focus entièrement sur les recettes.

Quoi faire avec mes paies: Rembourser dettes, acheter 750 images, heroku toujours up (7$ par mois)

Je veux que les versions soient permanentes. Comme ça tu te rappelles que tu manges de la lasagne (ver 21)
Je veux que tu puisses remplacer le nom de ta versions plus tard. Par exemple (selon Pascal). OUIN JE NE SAIS PAS...
Quand tu crées une nouvelle recette, si le nom de la version est vide, son (ver nb) est calculé.
Si (original) et (selon Pascal) existe déjà, quel devrait être le numéro de la version?
Si une recettes est une version d'un autre, et tu décides de l'enlever et de la mettre une recette à part entière avec un nouveau nom, tu fais quoi de la version?

Image 	The URL of the image for your object. It should be at least 600×315 pixels, but 1200×630 or larger is preferred (up to 5MB). Stay close to a 1.91:1 aspect ratio to avoid cropping.

Plus tard:
edit.hedacuisine.com -> aqueous-fortress, ça me prends SSL par contre, 7$/mois pour heroku
Que les utilisateurs peuvent modifier les recettes par eux même. 7$/mois pour heroku

1. Comment planifier une recette:
Questions:
1. Choisir une date pour cuisiner.
1. Une de vos recettes ou découvrir une nouvelle recette?
1. Idéalement afficher un circularie avec les ingrédients en rabais.
1. Quel ingrédient dans la recette?
1. C'est pour manger de quand à quand la recette? Le jour même? Pour plusieurs jours? Pour congeler? Pour le lendemain?
1. Suggestions de recette.
1. J'aime ou je n'aime pas (swipe à droite ou swipe à gauche)

1. Add to my recipes. Quand une version est dans tes recettes. Afficher cette version en premier. Écrire un avertissement. Vous avez été redirigé de ... parce que cet version est dans vos recettes. Voir la l'autre version.


https://developers.google.com/search/docs/beginner/seo-starter-guide
https://developers.google.com/search/docs/advanced/structured-data/recipe
https://developers.google.com/search/docs/advanced/structured-data/breadcrumb

1. https://news.ycombinator.com/item?id=28879461
mongol
Yes I know what you mean. I think there should be a site that realizes that there are many variants of well known dishes, and they should be categorized as that. Very rarely is there an original, true recipe that is the pristine source for the dish. So when I search bearnaise sauce, I should not get a recipe, I should get a general description, kind of like a Wikipedia page. And then below that, all the different recipes, that can be contributed like on a wiki. Each recipe should have a feedback mechanism so the best ones gets upvoted.
EXACTLY WHAT I WANT TO DO!

1. Recettes similaires en bas des recettes.

1. On every post on hacker news about recipes. Comment about my own website!

1. Trouver des recettes sur google qui sont là en anglais, mais qu'il y a rien ou presque rien en français!

1. Images ALT

1. Make sure all of the pages on your site are reachable through links, and that they don't require an internal search functionality to be found.

1. Users will occasionally come to a page that doesn't exist on your site, either by following a broken link or typing in the wrong URL. Having a custom 404 page that kindly guides users back to a working page on your site can greatly improve a user's experience. Consider including a link back to your root page and providing links to popular or related content on your site. You can use Google Search Console to find the sources of URLs causing "not found" errors. 

1. Sitemap, une fois que parfait et SEO est là
1. 404

1. Plusieurs servings possible. Pain (650 g),  Petit pain (65 g). Offrir un dropdown avec les possibilités.

1. Outils pour planifier des repas. En haut voir le calendrier, en bas, voir les recettes, avec le search. Voir les rabais les la semaine et browse par catégories selon les rabais de la semaine. Par exemple, chou fleur, ou tofu, etc.

1. https://linkchecker.github.io/linkchecker/

1. Ajouter un boolean. Densité validé? ou bien enlever la densité de tous les trucs que ce n'est pas encore fait.

1. Faire ta propre chapelure assaisonnée à l'italienne 

1. Essayer avec d'autres browsers.

1. Plusieurs photos par recettes. Boulettes de pois chiches. Dans pâtes, dans soumarins, etc.

1. Arrondir les valeurs à 1% près.

1. Alias de food. Sucre devrait être un alias pour sucre granulé.
1. L'huile fait référence à huilde de soja, parce que c'est l'huile la plus commune après l'huile de palm, donc c'est l'huile la plus utilisé par Mr et Mme tout le monde. Un alias pour huile de soja?
1. Sel == sel de table
1. Poivre, poivre noir, poivre noir moulu, poivre moulu

1. Application pour t'aider à déterminer quoi manger. Il y a une liste de catégories, tu cliques dessus, puis tu fais gauche droite pour les recettes. Chou-fleur, gauche droite, ... Tu sélectionnes et tu ajoutes à ton calendrier.

1. DNS: Quand le DNS redirigeait vers heroku, dans Namecheap, j'avais Redirect domain: Source URL: Wildcard redirect; Destination URL: https://aqueous-fortress-30634.herokuapp.com/

1. Enter goes to recipe.

1. Dont show raw ingredients. Otherwise it does not work for scaling. Only figure out what exactly the raw ingredient was (unit, volume or weight?)

1. Ingrédient principal aux recettes.
1. Français & anglais
1. Valeurs nutritives des aliments

1. Ajouter tofu dans la recette de tofu poulet au beurre.

1. Don't allow unitary foods in database to not have a unit weight

1. AUTOCOMPLETE ID!!!!!

1. TODO: Photo sur AWS, rajouter le lien vers l'origine de la photo si sur internet. Rajouter l'auteur de la photo pour le créditer si possible.

1. Dans le edit, quand une recette est une variante, barré tout les choses qui sont pris de la recette de base et que ce soit claire que ça ne peut pas être modifié. Mais avoir un bouton et pouvoir faire: Make this recipe independent. Et là ça va te demander un nom unique, une image, ...

1. Variantes: Heda, Ricardo, ...

1. Peut-être en revenenir à recipe group? Ça serait le fun de voir par exemple Pain à hamburger, et là pouvoir changer les versions. Ou juste pain. Et là voir les versions avec les ingrédients.

RecipeGroup. Has many recipes. L'affaire c'est qu'on dirait qu'il existe 2 types de modifications. Il y a des recettes qu'on veut qui soit à part entière. On veut aussi des recettes qui ne sont que des légères modifications. Tu enlève un ingrédient, tu en remplaces un et tu en ajoutes un autre.

Un RecipeGroup serait un autre type. C'est un type abstrait qui regroupe d'autres recettes. Par exemple, tu as:

- Pain
  - Pain à hamburger
    - Pain à hamburger
    - Pain brun à hamburger
  - Pain blanc
  - Pain brun
  - Pain de grains entiers

RecipeGroup: Name, et liste de recipes. That's it.

A recipe can belong to one and only one RecipeGroup?

Ok pour végétarien tu fais quoi?

breadcrumbs

Pain > Pain blanc

OK NON. Pas de recipe group. Des tags peut-êtres. Et là des articles. Des articles pour le pain, pain à hamburger, pain à hotdog. Et dans l'article, avoir une list de recette que je peux naviguer
comme je veux faire présentement.

_recipe_list_full.html.erb

5 recettes de pains à hamburger (20 variantes)

1. Ok. Quoi faire pour les recettes?
Instruction #1 / Instruction #2 / Instruction #3 / Créer ma version
Il pourrait y avoir plein de types d'instructions différent. Avec Heda. À la main. À la machine à pain. Au four. À la cuisinière. Avec un thermomix...
Au lieu d'instruction est-ce que ça pourrait être version? Directement là? Et là ça affecte les ingrédients en haut? Ça serait le fun que ce soit des recettes complètement différente?

Au lieu de faire RecipeGroup, avec des recettes. Simplement faire. RecipeVariation. Et là ça référence une recette, mais avec des petites modifications de plus. Je pense que ça fait plus de sens niveau base de données.

RecipeVariation: instructions:text, ingredients??? how???...

1. Plusieurs instructions possibles par recette. Pour le pain: À la main, à la machine à pain. Cuire quelque chose: Au four, Sur la cuisinière, Au four à micro-onde. ET SANS OUBLIER. Avec Heda
NOOOONNNN PAS PLUSIEURS INSTRUCTIONS... JUSTE POUVOIR RAJOUTER DES TABS DANS LE TEXTE DE RECETTE.

1. Pouvoir incorporer un article dans la page d'une recette? Par exemple l'article du pain dans la recette du pain? Juste après et une table des matières juste avant pour montrer qu'il y a de quoi plus bas? Nahhhh, probablement juste une référence. Dire une phrase qui pique l'intérêt, puis dire voir l'article sur le pain pour plus de détails. Et tout au long rajouter des références. Par exemple, pétrir la pâte pointe vers la section pétrir la pâte.

1. Mettre le site en ligne cette semaine (est-ce que c'est mauvais pour le SEO de changer une page, est-ce que mon SEO sera recalculée?)
1. Simulation contrôle le bras robotique
1. Simulation voit la caméra
1. Pétrir la pâte!!!
1. Faire un sitemap
1. EN
1. Des articles et des previous d'articles.
1. Des images dans les articles.
1. Images on Firebase???
1. Static site on firebase???

Pour ou contre site static:

Pour:
1. Site très rapide.
1. Site pourrait déjà fonctionner et être disponible rapidement (pas de délais de heroku).
1. Si je fuck production par accident, ça n'affecte pas le site static.
1. Coûte beaucoup moins cher.
1. Pouvoir releaser toute de suite une recette à la fois. Commencer à voir du traffic! Je pourrais envoyer une query à hedacuisine pour voir le nombre de page vue.

Contre:
1. Quoi faire avec la fonctionnalité de search??? (Juste pas de search pour l'instant?) (Tant que le site est petit, je pourrais tout loader déjà dans la page de search et simplement cacher ce qui ne correspond pas)
1. Devoir constamment build le site static.
1. Devoir constamment vérifier que le site static est correct (quoique je devrais le faire constamment encore plus pour le site de production (à chaque push))
1. Ça serait le fun si les utilisateurs pourrait déjà contribuer... (FAIRE UNE SIGNUP PAGE QUI DIT QUE LE SITE N'EST PAS ENCORE PRÊT ET PRENDRE LES ADDRESSES COURRIELS DES GENS POUR LEUR DIRE QUAND LE SITE SERA PRÊT???) Oui commencer avec ça... Si il y a beaucoup d'intérêt, alors peut-être rendre le site publique avec data publique. Peut-être aussi acheter hedacuisinebeta.com? Ou bien myheda.com? Ouin mes rendus là les gens veulent partager les recettes...

1. Recipe substitutions

1. Commencer avec une recette parfait en ligne sur github pages. Boulette de pois chiches.
1. Substitution fromage parmesan avec levure alimentaire.
1. Substitutions substitutions... FoodSubstitution(explicit: boolean)
1. Pour les ingrédients qui ont des recettes, ajouter l'option: Voir la recette.

1. FIXME: Conversions between g and kg will not work! I am not taking into factor the unit_value of the unit in my ratio in food.implicit_conversions. FIX Quantity.ratio()...

1. 1 recette par 2 semaines parfaite avec références aux articles pour plus de détails.

1. Combine image editor with hedacuisine.

1. Essayer d'utiliser Amazon S3...

1. Un quart et un huigtième nécessite un déterminant... Ajouter 1 tomate. OK. Ajouter 1/2 tomate. OK. Ajouter 1/4 de tomate! Ajouter 1/8 de tomate! Ajouter 1/4 d'une tomate? Ajouter 1/8 d'une tomate?

1. Au lieu de multiplier la recette par un nombre, y aller avec le nombre de portions. Par exemple 12 muffins. Et là mettre un slider que tu te déplaces dessus. Tu peux choisir.

1. Imprimer les cables drums plus large. Calculer la bonne longueur. S'assurer qu'il reste bien de chaque côté.

1. SUBSTITUTION: "1" / tête d'ail / "8" gousse d'ail...... original_quantity...... substitute_quantity, les deux sont en version 1... ou 2 c. à table...
Prendre la valeur du substituer (ici tête d'ail) et le multiplier par la valeur calculé du ratio entre la vrai quantité et la quantité du truc substitué.

1. Food are either basic, which requires a lot of information, or they are substitute to something. Or maybe add a FoodData?

1. Upgrade bootstrap to bootstrap 5

1. Email notifications pour le calendrier repas du lendemain

1. Un boolean pour les substitutions pour savoir si c'est une substitution exact ou pas. Par exemple, lait de soja n'est pas une substitution exact avec lait d'avoine. Mais gousse d'ail est une substitution exacte pour ail hâché.

1. [image#1] link
1. [image#1,"what to show???"] link
1. [=image#1] show this image
1. [section#1] link to this section
1. [=section#1] show the title of this section with a link to the section
1. [article#1] link to this article
1. Link les ingrédients aux articles sur le site internet.
1. Vegan, végétarien, Gluten-free
1. Gluten-free logo
1. TODO: Handle un ingrédient utiliser à plusieurs endroit. 4 c. à table d'huile. {(1 c. à table,1),3-5}
1. {(1)},{(1 t)},{(1 L,1)}
1. Lien vers tremper les pois chiches.
1. TODO: Offrir la possibilité de spécifier le poids de ta courge butternut.
1. Dans le fond, le site internet, développer une plateforme pour des recettes. Idéalement des bloggeurs pourrait l'utiliser pour leur propre recette? Le problème c'est que j'aimerais que les recettes du site respecte un format en particulier... Les règles par contres doivent être respecté.
1. Des FoodSubstitution food:references substitute:references ratio:float et des IngredientSubstitution. Pareil comme FoodSubstitution, mais recipe specific.
1. Laisser l'utilisateur choisir le nom d'ingrédient qu'il préfère quand il y en a plusieurs.
1. Pouvoir substituer les ingrédients en cliquant sur le crayon avec un carré autour. Le faire avec ail. Gousse d'ail, Tête d'ail, Ail écrasé, Ail émincé, Ail hâché, Poudre d'ail. Dans le dropdown faire une flèche sur le côté avec les substitutions possibles. Les instructions de la recettes ne seront pas modifié, mais ce n'est pas grave. Offrir à l'utilisateur la possibilité de changer les instructions. Dans le fond, lorsque l'utilisateur clique sur une substitution, ce qui se passe est qu'une recette est créer pour l'utilisateur si elle n'existe pas déjà (2e modification). Et cette recette est enregistrer selon les modification. Dans le fond, la recette est dupliqué et les changements se font sur la recette dupliqué.
1. Pour montrer que c'est possible de substituer des ingrédients, ajouter une flèche rouge qui pointe vers le truc pour pouvoir modifier les ingrédients.
1. Compiler le site internet statique. Les utilisateurs connectés utilisent le site internet en ligne. Les utilisateurs non connectés regardent la version statique compilé. Pour compiler, télécharger la base de donnée. Rouler le site localement en mode production. Crawler mon propre site internet.
1. Si jamais les utilisateurs peuvent créer du contenu, faire très attention à la sécurité. Par exemple, éviter html_safe. Sanitize properly.
1. Valider recette de pain à la main
1. Faire des liens vers les notes.
1. Un calendrier sans machine?
1. Une image du numéro de version à rajouter par dessus les images des recettes. Peut-être une étoile en rouge avec une écriture jaune? Ver 2, Ver 3, ...
1. Au lieu de Appareils dans la barre en haut, mettre un dropdown avec les machines de l'utilisateur actuel. Quoi mettre lorsque l'utilisateur n'en a pas? Comment atteindre le calendrier?

1. Image editor garder correctement toutes les images actuelles (rsync? dropbox) En fait je pense enlever image-editor et l'intégrer à hedacuisine serait le best. je ne sais pas comment faire par contre pour hoster les images.

1. Enlever la colle du gripper au millieu. Juste à gauche et à droite. Même pas en haut et en bas.

1. Application pour ne plus avoir à réfléchir sur quoi faire pour soupe? What's for supper? Qu'est-ce qu'on soupe?

1. Sabler la tablette
1. Switch pour détecter la porte est bien fermée.

1. Ajouter des références aux articles. Par exemple, pourquoi faire tremper les pois chiches de 8 à 24h [*...pois_chiches#Trempage des pois chiches]

{} == substitution
{1} un chiffre == nom de l'ingrédient
{1.0} un float == une quantitée
{-1-8} une liste avec les ingrédients (lorsque c'est la première choses d'une phrase et/ou lorsque que le truc commencent par un tiret
{d1} déterminant plus le nom de l'ingrédient
{_1} == juste le nom de l'ingrédient, pas la quantité
fuck les déterminants lorsqu'il n'y a pas d'unité? ça devient compliqué pour les traductions et ça n'apporte strictement rien.
c'est ben plus simple de simplement marqué le nom de l'ingrédient dans la recette. au pire utiliser {_1}, mais ça pourrait être cool si on veut que ce soit un lien. Mais pour un lien idéalement utiliser []
% pour substitution peut-être aussi
= add(10) => fonction comme dans excel
/ Hello => paragraphe en italic

1. Dans le truc de recherche rajouter le logo, sans gluten, végane, végétarien, à la droite des versions...


1. Un thème récurrant. Les ingrédients en version fraîche ou bien en version déshydratés. Offrir les 2 recettes? Soupe aux patates. Soupe aux patates express. Quand il est inscrit express ça veut dire qu'au moins 1 des ingrédients est déshydraté. Dans les instructions de la recette: _Voir aussi la version rapide: Soupe aux patates express_ ou bien _Voir aussi la version avec des ingrédients frais: Soupe aux patates_ Dans la version express mettre les haricots cuits?
1. Rajouter version:integer à une recette. Validate uniqueness name AND version

1. Cable 25"+2X(56")+2X(2"[pour la boucle]) == 141" (moins 2" parce que ça adonne de même) == 139"! FIXME: 2 tours au lieu de 1...
1. Tenir le cable tray vertical en place.
1. Lumières dans l'armoire (https://www.amazon.ca/Govee-Upgraded-Dimmable-Daylight-Flexible/dp/B07V46H7YL/ref=sr_1_4?dchild=1&keywords=white+led+strip+lights&qid=1630604006&s=hi&sr=1-4)
1. Vider l'armoire et la remplir de pots pour pouvoir prendre des photos et des vidéos.
1. Gripper
1. LES MAUDITS CÂBLES ÉLECTRIQUES... (Thêta de -120 à 120 et alpha de -170 à 170?)
1. Grant application
1. Faire la partie du bas que je veux faire pour mettre l'ordinateur et le vise. Comme ça cela va pouvoir être caché. Finir de câblé pour pouvoir remmener des boites de trucs chez mes parents.
1. Prendre de belles photos de ma machine (en fds avec le gros soleil en plein jour)
1. Simuler avoir été à l'épicerie. Mettre sur le comptoir par batch les pots qui était dans la liste d'épicerie.
1. Faire une belle page web de fabrication de l'armoire de cuisine avec le modèle 3D, un peu comme celui de Shanty 2 Chic.
1. Tous les mouvements fonctionnels (refaire les roues verticales, plus de jeu horizontal, vrais gear pour axe T, plus de jeu B)
1. App login into website
1. Ne pas passer à travers les tablettes
1. Des câbles électriques plus flexible
1. Beau boitier électrique (protocase), bien câblé, bouton power et lumière power.
1. Page d'acceuil de vente (pour chaque section, rajouter un Pour en savoir plus >, une page qui montre les calculs derrière ce qui est dit ou en parle d'avantages)
1. Axe B: Addosser le gear box du moteur correctement dans la boite. (Creuser un petit peu vis à vis les trous qui dépassent)
1. Caméra
1. Vendre à 1 client. Vendre des locations, parce que le produit risque de changer. (Boulangerie, Prêt-à-cuisiner, petite boutique de nourriture, ...)
1. Être capable de reach partout (2/4 coins de chaque tablette)
1. Un moyen de fixer la machine à l'armoire en haut
1. Homing system
1. Continuer la simulation du bras robotique pour pouvoir le programmer, aller chercher les ingrédients, puis verser des aliments grossiers, puis faire des muffins.

# Planification (Mettre le site en ligne)
1. d' pour les h aspirés? huile surtout...
1. Bonne densité des ingrédients
1. Le pluriel des unités lb/lbs, tasse/tasses.
# Pas prioritaire
1. Sign in should remember what page
1. Modification d'une recette (duplication)
1. Enlever une recette du calendrier ajoutée par erreur.
1. Quoi faire quand les ingrédients n'ont pas d'unités? Mettre du sel. Mettre de l'oignon. Mettre de la coriande. Mettre des cubes de boeufs au goûts. Mettre du thym. Trop compliqué, le faire manuellement en texte...
1. Add show_ fraction to RecipeIngredients (quand raw_ quantity détecte une fraction, setter le flag automatiquement)
1. TODO: Faire des test pour les pretty... que ça rajoute les préposition correctement dans toutes les langues. Il y a beaucoup de cas. C'est le genre de truc parfait pour des tests.
1. Allow user to create recipes.
1. Be able to create a recipe with a food not in the database
1. Pouvoir ajouter des commentaires aux recettes. / au début pour que ce soit en italique!
1. Un éditeur WYSIWIG pour les recettes.
1. Rajouter masculin et féminin pour les noms ou bien laisser les mettres manuellement?
1. FoodName food:references language:references value aspire:boolean feminine:boolean
1. Comment gérer les versions des recettes? RecipeGroup comme avant? Un UserRecipe refère à une Recipe et/ou à un RecipeGroup?
1. Enlever le truc de c'est quoi qu'il y a des différent à l'intérieur, et offrir la version simplement avec un chiffre. Ou bien un nom d'utilisateur. Dans la barre de recherche, tu sélectionnes le groupe et ensuite tu sélectionnes sur le côté (un peu comme un menu normal d'un UI d'application d'ordinateur) la version que tu veux. Poulet au beurre (Ricardo). Mais fuck poulet au beurre (Condiments en poudre). À la place, quand c'est une recette du site et non une recette d'un utilisateur ou d'un site d'ailleurs, indiqué (ver 2). Pas de version quand il n'y en a juste une. Donc pour poulet au beurre, on a: Poulet au beurre, Poulet au beurre (Ricardo), Poulet au beurre (ver 2). N'importe qui peut créer sa recette! Mais l'image reste la même, celle du groupe. Le groupe sert surtout à avoir une image et lier les recettes du même truc entre eux. Ne pas marqué Poulet au beurre (Ricardo). Marqué un nom entre parathèse seulement quand la recette viens d'un utilisateur.
1. Units by language, wait no because I want to be able to convert c. à table to table spoons...
1. Mes recettes favorites ou Ajouter à ma liste.
1. Mes amis (voir le menu de mes amis)
1. Rajouter une note aux RecipeIngredient? (pelées et coupées en cube), ... (broyées)
1. FoodGroups. Huile. Bouillon. Lait. Pain.
1. Handle generic Foods which are supersets of other foods. Bouillon can be Bouillon de légume, Bouillon de poulet, etc... Huile... Huile neutre...
1. Dans la recherche et les listes, seulement montrer la version de recette la plus populaire.
1. Comment gérer les options d'ingrédients dans la recette??? (Commentaire à côté des ingrédients?)
1. You can pin an item in the grocery list so it is always there even if you clear (for example fruits&vegetables, eggs and milk)
1. Pouvoir hierarchisé dans un arbre les recettes.
1. Acheter un backdrop pour les photos
1. Trouver un format de bouteille liquide
1. Pagination des recettes sur le site internet
1. Ajuster le site internet pour les téléphones mobiles. Mettre la barre de recherche en dessous du menu.
1. Rajouter les trous borgnes à l'armoire et faire des screenshots pour le manuel d'assemblage. Couleur différente pour chaque type de morceau? Mettre dans les screenshots les mesures.
1. Un jour remplacer les bushings ou mettre des bearings à la place pour le mouvement vertical.
1. Trouver shipping mondial kits de robot
1. Faire une soumission chez une firme de génie conseil pour un produit final qui peut se vendre sur kickstarter
1. Ajouter toutes les valeurs nutritives des ingrédients.
1. Démarrer l'entreprise officiellement. Puis contacter des médias et essayer de faire parler de l'entreprise
1. Faire un article qui parle de mes cables drums. C'est cool et de toute façon un compétiteur bien antit ne ferait pas pareil. Ça serait probablement coulé en alu à la place ou avec des chaînes.

# Mission

Encourager les gens à manger de manière plus éco-responsable.

- Un site de recette avec des recettes éco-responsables.
- Un armoire de cuisine intelligente qui évite le gaspillage alimentaire
- Suggestions de recettes avec des aliments du garde-manger qui sont plus écologiques
- Transformation d'aliments primaires à la maison pour sauver de l'argent

# Vision (6 mois)

Commencer à vendre des armoires. Distribuer le plan sur internet pour que le monde puisse déjà commencer à fabriquer leur propres armoires. Avoir un design fonctionnel qui confirme les dimensions de l'armoire. La simulation doit être capable d'aller chercher et d'aller porter tous les pots. Avoir un design semblant fonctionnel de bras robotique en vrai. Travailler sur la pince surtout... Commencer à faire de la publicité peu à peu. Idéalement, avoir démarré la compagnie par actions. Avoir un site en ligne et publier une recette par semaine.



# Recettes
Substitutions: http://www.foodsubs.com/Garlic.html
https://www.passionrecettes.com/voirRecette-equivalence-pour-1-gousse-d-ail-17653.html
https://recipes.fandom.com/wiki/Recipes_Wiki
https://www.lacuisinedejeanphilippe.com/recettes/
https://en.wikibooks.org/wiki/Cookbook:Sauces
https://en.wikibooks.org/wiki/Cookbook:Recipes
https://foodgawker.com/page/2/
https://www.findingvegan.com/
http://www.tastespotting.com/
https://www.recettesquebecoises.com/conversionsdet
https://chefcuisto.com/cuisine/recettes-quebecoises/
https://www.recettes.qc.ca/
https://www.zeste.ca/sections/recettes/styles-culinaires/cuisine-quebecoise
http://qc.allrecipes.ca/recettes/quebecoise-recettes.aspx
https://www.coupdepouce.com/cuisine/idees-repas/dossier/recettes-quebecoises
http://recettes-quebecoises.qc.ca/
https://www.troisfoisparjour.com/fr/chroniques/top-10-des-recettes-quebecoises/
https://www.ricardocuisine.com/
https://www.alimentsduquebec.com/fr/blogue/recette-100-quebec
https://www.boblechef.com/fiches-recettes
https://www.loouniecuisine.com/fr/recettes/plats-principaux/tofu-magique/
http://www.quebecuisine.ca/
http://www.lesgourmandisesdisa.com/
https://listedeblogs.blogspot.com/    (une centaine de blogs)
https://www.restaurantalma.com/

## Recettes écologique
1. Hamburger avec n'importe quelle boulette végé
1. Hotdog avec n'importe quelle boulette végé
1. Pâté chinois végé (hâchis parmentier végé) (prmentier végé)
1. Chili végé
1. Riz avec truc végé plus sauce (tofu poulet au beurre)
1. Pâte avec boulettes de pois chiches ou autres végé
1. Salade
1. Salade de pâte
1. Boulangerie
1. Dessert
1. Pantry recipes
1. Gruau
1. Chickpea recipes, red-kidney beans recipe
1. Soupe aux patates!!!
1. Crèmes (crème de champignon, crème de poireau)
1. Soupes
1. Potages
1. Ragouts
1. Riz sauvage
1. Crêpes
1. Pain de viande végane
1. Pâté style tourtière végé
1. Saucisses véganes
1. Simuler n'importe quelle viande de manière végane

# Financement
1. Shuttleworth fondation: https://shuttleworthfoundation.org/apply/form/
150 000$-350 000$
1. Soutien au projet d'innovation - Investissement Québec - https://www.economie.gouv.qc.ca/bibliotheques/programmes/aide-financiere/programme-innovation/soutien-aux-projets-dinnovation/
30% à 50%
1. **Programme d'aide à la recherche industrielle (PARI)** CONTRIBUTIONS NON REMBOURSABLES - https://nrc.canada.ca/fr/soutien-linnovation-technologique/soutien-financier-linnovation-technologique-pari-cnrc
1. Si vous collaborez avec plusieurs partenaires pour la réalisation de projets tels que la robotique de pointe, l'apprentissage automatique, l'impression 3D et l'Internet des objets, vous pourriez bénéficier d'un remboursement pouvant aller jusqu'à 44,4 % des coûts admissibles de projets dont la valeur se situe entre un million $ et 20 millions $. https://www.ngen.ca/fr/

# Business model

1. Même business model que Farm Bot. Open source. Vendre des kits et des composantes.
1. Faire de l'argent sur les commandes automatiques d'épiceries. (L'épicerie nous paie 1% pour qu'on fasse affaire avec eux) (approcher les épiceries du Québec)

## Armoire

J'ai 22.375" de pronfond de disponible. La porte en prend 3.5+0.25=3.75. Il reste 18.75". On enlève 12", il reste 6.75"

Pin sélect 1"X4"X (6' ou 8' ou 10' ou 12') (72", 96", 120", 144")
4 X 54"
10 X 14"

**4X 6'**: 56,14 = 70 vs 72" => PARFAIT!
**1X 8'**: 14,14,14,14,14,14 = 84 vs 96" => PAS SI PIRE!

14,28,42,56,70,84,98,112,126

## Contrepoids

Le contrepoids pourrait utilisé un eyebolt, mais les filets doivent se rendrent tout en haut pour pouvoir serrer le poids de chaque côté. Je ne sais pas si ça existe... Souvent, seulement la moitié est en filet.

## Étau
1. Essayer de fabriquer le vise pour qu'il soit indépendant. Pas de trous dans le plywood (sauf peut-être les fils électriques. Ça serait pas mal plus clean. C'est pas grave si ça prends beaucoup de place. De toute façon le robot a besoin d'un espace pour déposer les couvercles. Donc simplement mettre le moteur vers le mur. Et le robot déposera sur le couvercle qui cache le moteur.

## Version à vendre

1. 6" de large au lieu de 7"
1. Arbre T 5/8" au lieu de 1/2"
1. Bearings pour l'axe vertical
1. Bushings pour où qu'il ne peut pas y avoir de bearing comme 3 sur le gripper

## Homing

J'aimerais que le homing se fasse sans limit switch. Simplement en le déplaçant manuellement à sa maison et avec la caméra pour axe B.

## Câbles électriques

Pour les LEDs, voir le petit papier avec lequel ça venait.
Du 22 solid serait donc probablement correct.

Ce que j'ai besoin:
- Câble moteur 2.8A pour axe B et axe X.
- Câble moteur 1A pour axe R.
- Câble moteur 1.7A pour axe A et axe T.
- Câble moteur 4.0A pour axe Y.
- Câble shielded pour encodeur du gripper mobile
- Câble shielded pour encodeur du gripper fixe

Ce que j'ai présentemment:

- 8 brins AWG 22 stranded

Ce que je voudrais:

La charte que j'ai trouvé est très, très conservatrice. Elle suggère 5.9A pour AWG 14, et dans une maison c'est 15A... Pour mon AWG 22, elle suggère 0.92A. Donc 15/5.9 * 0.92 == 2.34A. C'est suffisant pour les axes A et T, mais ce n'est pas l'idéal pour les NEMA 23, surtout Y. Pour du AWG 18, c'est 2.3A. 15/5.9*2.3 == 5.85A. C'est amplement suffisant pour tout. Pour vendre la machine, j'utiliserais quand même un plus gros conducteur pour axe Y. Ça me prendrait du AWG 16 pour être safe à 3.7A. AWG 15 donne 4.7A.

J'aimerais des 4 conducteurs pour les moteurs.

https://electrical-engineering-portal.com/motor-wiring-guidelines

Avec shield ou sans shield?
Les gens semblent dire avec shield. 
Toutefois, un shield doit être branché au deux extrémités sinon c'est inutile.
Je le branche sur quoi sur le moteur?
https://en.wikipedia.org/wiki/Talk%3AShielded_cable#Grounding_at_both_ends

Stranded Wire 4C/18 AWG - CSA - FT4 - 600V - Grey - Sold by meter
Appeler Addisson électronique au cas où ils n'ont pas en stock et seulement à Montréal.


Multi-Stranded Wire Cable - 4C/18AWG - Shielded - FT4 - Gray - Sold by Meter
SKU: 162409  | # MOD: 92248-21
vs
SKU: 162773  | # MOD: 74-319 

Fuck off, pas shielded. Shielded de quoi? Ça servirait à quoi?
Je ne veux même pas de limit switch de toute façon.

SKU: 600846
MOD: 73-134
Deca cables, stranded wire - 4 conductors - 18 AWG - shielded - FT4, GREY - SOLD BY METER

Pour l'axe R je pourrais utiliser un câble électrique plus petit à 2 conducteur, en fait idéalement à 6 conducteurs?

Longeurs:
AWG 22 4 conducteurs multi-brins: (R, J(fixe))
AWG 18 4 conducteurs multi-brins: (B, X, Y, A, T)

**Ça me prend à peu près 3.5m par axe pour être safe, donc pour X, Y, T, A, B acheter 17.5m, ben 20m de 4 conducteurs 18 AWG stranded**

**Utiliser le conducteur shielded que j'ai déjà pour l'encodeur, 5m**

**Acheter AWG 22 à AWG 18 2 conducteurs pour gripper mobile et fixe, 5m**

Il y a l'air d'y avoir beaucoup de conducteur pour le capteur du moteur. Attendre de voir.

## Détails et progrès des grandes lignes

#### Installation mouvement horizontal:

1. Installer la partie supérieure avec les deux plaques de métal et les deux essieus avec les roues.
1. Installer le support à cable track
1. Préinstaller le moteur
1. Déposer le chariot sur la track horizontal
1. Installer l'arbre 1/2" (1 bearing, **puis poulie et courroie**, puis 1 autre bearing)
1. Ajuster la tension de la courroie avec la position du moteur.
1. Insérer la partie inférieure sur le bearing
1. Insérér les deux essieus à travers les roues. (Il faudrait des washers de l'autre côté de la roue et non des nuts sinon ça va être chiant...)

### Mouvement vertical

**Attente Poulie HTD 3M 16T et poulie HTD 3M 72 dents et courroie**

80"/2.625"/3.1416 ~= 10. 1 tour de plus pour que ça tienne == 11.

### Bras

Le moteur que j'ai acheté doit prendre obligatoirement une autre poulie pour tendre la courroie parce que les trous dans le gearbox sont trop près du centre...

On veut idéalement un ratio de 20, niveau vitesse, ça semble avoir ben de l'allure. Le gearbox vient avec un ratio de 5.18. Il manque ~= 3.8. 16 dents à 48 dents serait acceptable je crois.

Pulley petite: HTD 3M: 16 dents
Pulley grande: HTD 3M: 48 dents (45.08mm)? Essayer un peu plus si possible...

htd 3m pulley 48t:
https://www.aliexpress.com/item/33045886787.html?spm=a2g0o.productlist.0.0.65ab6e146jUH8H&algo_pvid=bb5671f6-42f3-49ef-a7cd-521b62574e76&algo_expid=bb5671f6-42f3-49ef-a7cd-521b62574e76-1&btsid=0b0a555f16195533225846334efdc5&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_

#### Poignet

Qu'est-ce que je veux changer de mon poignet présentement?

- La manière que c'est attaché à l'humérus.
- La vitesse du moteur. (Utiliser un moteur Nema 23.)
- Le recouvrir pour que ce soit beau
- Possibilité d'utiliser seulement de l'aluminium au lieu du plastique pour pouvoir utiliser un four un jour.
- Il y a du matériel inutile en bas il me semble
- Il est quand même long...
- Les pinces ne sont pas belles, trop épaisses... (aluminium, bushings...)
- Le bruit de la worm gear (essayer avec de la lubrification?
- La worm gear devrait être idéalement être dans un bain d'huile dans un truc hermétique
- Les gears de la pinces en nylon
- Je trouve que c'est trop connecté présentement... J'aimerais séparé la pince du reste

Un moteur Nema 17 plus long pour l'axe B ou un moteur nema 23?

Comment faire pour que le moteur soit bien situé?

Il y a plusieurs manières possibles de rattacher le skelette dans le poignet:
- Un Y (souder un U à une tige droite)
- Une plate soudée à la tige vissée au bearing hub
- Comme présentemment
- Plier la tige 1/2" et mettre les bearings dans l'humérus (mais idéalement non parce qu'on veut que l'humérus soit le plus mince possible pour passer en dessous.

#### Installation

1. Attacher la poulie au top du poignet
1. Insérer la poulie et le top du poignet au dessus de shaft avant les bearings
1. Insérer les bearings sur le shaft
1. Glisser le support à bearings sur les bearings.
1. Attacher le support à bearings au top du poignet
1. Attacher le tube carré et le shaft bêta au support à bearings
1. Attacher le couvercle au support à bearings

#### Axe A

Calcul de l'angle minimal:

Poignet: 1.875"
Humérus: 6.25"
Main jusqu'au milieu de la pince pour prendre: 6.25"
Main jusqu'à la fin de la pince pour prendre: 7"
Donc, présentement, 14.375" de reach pour prendre des pots

À 90 degré, la distance la plus grand est de 6.25" en Z pour l'humérus plus 3" en Z pour la largeur de la pince. Aussi, 1.875" pour le poignet en X et 7" en X pour la main jusqu'à la fin de la pince.
Z: 9.25", X: 8.875", pythagore: 12.82", 1.55" (14.375 - 12.82), ce n'est pas assez

À 60 degré,
Poignet doit mesurer 3.125". Calcul avec thêta à 120 degré pour que ce soit plus simple.
Reach == 6.25" + 3.125" + 6.25" == 15.625"
-3.125" en Z pour l'humérus (sin(30)*6.25") plus 3.125" pour le poignet et 7" pour la main jusqu'à la fin == 7" en Z.
6.25" * cos(30) == 5.41" en X + 3" en X pour la largeur de la pince
Z: 7", X: 8.41", pythagore: 10.94"; 15.625" - 10.94" == 4.69", c'est suffisant! Mes plus gros pots mesure 4.375"

#### Axe B

Quel devrait être le ratio? Présentemment c'est super lent. Idéalement 2 fois plus rapide.
Présentemment c'est 1:60. Acheter 1:30. Ou bien 1:40? 1:40 pour être safe, je ferai plus plus tard au pire. Je veux être sûr que ça fonctionne...

Acheter rod 12mm, je crois que je ne suis pas capable de percer les gears que je veux acheter... Mais ça va me prendre un ou deux bearings 12mm aussi... maudit...

Pour ce qui est de la worm gear, je crois acheter 6mm et je vais sabler 0.35mm du shaft nema 23...

### Gripper

Essayer avec le moteur 12V que j'ai présentemment avant d'en acheter un autre. Sur amazon ça l'air d'être disponible. Mais bon, ça m'en prend un quand même plus fort que celui présentement je crois...

Un moteur avec DC avec gearbox à worm gear pour être par en haut et pour être plus sécuritaire (irréversible)

Le moteur actuel makeblock DC motor 37mm possède un ratio de 90. Cela correspond à un RPM de 50. Avec un torque de 4.5 Kg.cm à 40 RPM avec charge.

Utiliser des ressorts pour maintenir une pression sur les pots même en perte de courant?

Le moteur force pour ouvrir les pinces. Le moteur utilise un gearbox à worm gear pour être irréversible.

Parce que je vais staller les moteurs, utiliser un moteur et gearbox surpuissant et le rouler à 50% de la capacité?

Possiblement utiliser une clutch?

Pas de spring, la force varie et il n'y a pas assez d'espace pour contenir le ressort non étiré...

Un câble d'acier avec un bowden?

Je pense ce que j'aimerais, c'est simplement que le matériel de la pince soit élastique. Ainsi, tu sers et entre le contact initial et la fin, la base de la pince avance encore de quelques millimètres et il se développe un tension. Le moteur cesse de tourner lorsqu'il cesse de tourner haha. Il pourrait détecter qu'il ralentit et ainsi éviter de staller. À voir.

Peut-être acheter 2 moteurs? Comme ça si je brule le premier en le stallant ben faire plus attention avec le second!

Ça me prends des gears plus solides aussi...

DUAL SHAFT POUR POUVOIR LIRE LA VITESSE QUE ÇA TOURNE EN ARRIERE!!!

Bon je prends un moteur plus fort et je le ferai rouler à plus petite capacité. Mais là prendre un RPM plus élevé que 40 RPM parce qu'il va tourner moins vite parce que je vais lui donner moins de courant?

Gears en nylon?!

Acheter le 80 RPM pour être plus safe?

Shaft 15mm ou 33mm? Idéalement ça serait genre 20-22mm

WOW!!! Il existe des encodeurs qui sont genre tenus en étant soudé au connecteur du moteur! Intelligent!

https://www.amazon.ca/-/fr/engrenage-bo%C3%AEtier-r%C3%A9duction-encodeur-autobloquant/dp/B073S5GM6Q/ref=sr_1_9?__mk_fr_CA=%C3%85M%C3%85%C5%BD%C3%95%C3%91&dchild=1&keywords=dc+motor+worm+gear&qid=1620399857&sr=8-9

#### Autre

**TODO: Fabriquer le skelette et valider que la déflection est de moins de 2mm pour la charge maximale**

Est-ce que je dois rajouter de la tension dans les bearings pour qu'il y ait moins de jeu comme Dan Gelbart disait? (preloader les bearings?)

**Waiting skeleton validation**  Le design actuel est présentement un peu trop grand (14"). J'ai déjà enlevé 0.75" inutile au bout (pots plus petit maximal). Je peux enlever un peu plus sur l'humérus. Ça risque juste d'être plus difficile faire stage multiple pour une poulie...

J'utilise un nema 17 pour T et A. Au pire j'achèterai des Nema 17 plus long, plus fort 0.6 N.m au lieu de 0.4 N.m. Pour B je ne sais pas. Il y a même des 0.71 N.m!

L'axe du mouvement T doit etre centré en Z pour pouvoir tourner le bras pour éviter qu'il accroche quoi que ce soit. Toutefois, il n'est pas obligé d'etre centré en X.

C'est correct de ne pas être centré, mais le problème c'est que je dois avoir suffisament d'espace pour le diamètre de la grande poulie...

Vue d'ensemble:
1. Conception d'un squelette
1. Conception de moteur et de réducteur
1. Conception d'un boitier et d'un système pour les câbles

Mon problème principal présentemment est le manque de rigidité. Je dois mettre un arbre plus grand pour l'arbre. (https://www.engineering.com/calculators/beams.htm)
2 kg à 12" ~= 4.5 lbs à 12"
mais il y a aussi le poids du bras. Disons 10 lbs à 12" pour être safe.
0.5" au lieu de 0.375" est **3.16 fois** plus rigide
Le tube de 0.706" est **5 fois** plus rigide que 0.375"
0.625" est **7.72 fois** plus rigide que 0.375"

0.625" it is! Je ne serai pas capable de le percer par contre...

C'est quoi les problèmes que j'essaie de résoudre:
1. Dans un vrai bon design il faudrait que je moule des composantes en aluminium (Fondrémy)
1. L'humérus n'est pas assez rigide (souder???)
1. L'avant bras n'est pas dans le même axe que le bras (c'est un problème?)
1. Où passer les fils?
1. Ne pas tourner le moteur autour de l'engrenage, tourner l'engrenage
1. Je veux pouvoir tourner plus avec l'axe A, aller en-dessous du bras avec l'avant-bras
1. Diminuer la hauteur du bras (humérus) (la courroie en haut au lieu d'en bas? Les fils électriques eux.

Améliorer le design actuel pour avoir plus de rigidité. Avec le nouveau design de l'armoire, j'ai moins de restriction en hauteur. Donc mettre le mouvement T au dessus des autres mouvements.

#### Une idée

Rendre le garde du haut optionnel et non structurel, il y aurait 2 pillow block de chaque coté et un grand tube qui lui sert de structure entre les cotés. A la limite le garde serait optionnel et servirait seulement de faire beau et de cacher le moteur. Le moteur serait accrocher d'un des cotés (cotés opposé au cable track pour que ses fils puissent descendre en bas)

### Simulation et bras robotique aller chercher les ingrédients pour des muffins (3 semaines)

### Simulation et bras robotique verser des aliments grossiers (riz, macaroni, légumineuses, ...) (3 semaines)

## TODO list de petits trucs du quotidien

1. Quel moteur pour le mouvement T et A? Nema 23 ou Nema 17? Nema 17 avec gearbox probablement
1. Faire le mouvement T avant de trop faire le mouvement horizontal
1. Calculer quelle courroie qui est nécessaire pour mon moteur nema 23.
1. Acheter timing belt et timing pulley axe horizontal
1. Un minimum de 1 mm a l'intérieur de l'objet pour que ce soit consideré une collision
1. Rajouter une bordure en sur les cotés pour s'assurer que les pots ne soit jamais inaccessible pour le robot.

## Focus

TODO: Quand je rentre trop dans les détails, par exemple quand je fais trop de programmation et je veux tout améliorer en programmation, prendre du recul et faire autre chose. Revenir dessus la semaine d'apres au pire. Keep it simple, stupid.

J'ai beacoup divagué. J'aime bien ce que j'avais marquer il y a longtemps sur mon vieux site internet de cuisine avant de divaguer et de vouloir tout faire:

### Robot

Ce site internet n'est pas seulement un site de référence pour trouver des recettes. C'est aussi la bibliothèque officielle de base du robot qui cuisine Heda.

##### Fonctionnalités
- Range la nourriture en rentrant de l'épicerie.
- Fais l'inventaire des quantités d'ingrédients restants.
- Avertit à propos des dates de péremptions des ingrédients.
- Sors tous les ingrédients nécessaires à une recette.
- Fais des mélanges en versant les quantités nécessaires.
- Range les pots une fois la recette terminé.

##### Comment ça marche?

Heda utilise des pots sur lesquels ont été apposée une étiquette sur le couvercle pour les identifier.


Idées
-----

### Présentation web des recettes

Faire un index des recettes avec une vue similaire a Netflix: Des catégories avec carroussel d'image de recettes. Je postpone faire ca parce que les images ca coute cher en bande passante. Faire ca pour les themes (grande catégories) sur hedacuisine.com.

### Idées non classées

Ce que j'aimerais, c'est vendre 50\$ aux clients pour leur donner la
chance de réserver leur place pour acheter la machine. C'est un petit
montant qui n'engage pas trop à quelque chose et encourage mon projet.
De plus, pour aller voir des investisseurs après c'est génial d'avoir
une liste de client déjà intéressé. Je pourrais même faire une mini
campagne kick-starter qui offre seulement d'être sur la liste et
peut-être d'autres petits trucs:

-   plans d'armoire, mais ça idéalement j'aimerais les donner

J'énumère tout ce que le produit final va avoir, à quel prix, et je dis
que si jamais les caractéristiques changent, nous communiquerons avec
vous et nous vous rembourserons le montant investit si vous n'êtes pas
satisfait des changements.

La campagne servirait surtout à confirmer le marché au lieu de demander
du financement parce que le produit va nécessité encore plusieurs années
avant d'être à point et nous n'osons pas vendre tout de suite .
Probablement qu'une autre campagne de financement suivra.

L'objectif est simplement de 20 clients, donc 1000\$.

Le prix de vente à 10 000\$ (armoire de cuisine exclut) est un prix de
vente pessimiste que l'on sait que l'on peut respecter en fabricant et
vendant les appareils en petite quantité. Il se peut que nous vous
offrons l'appareil à un prix de vente plus faible selon l'intérêt et la
capacité de production.

En tant que nos premiers clients, vous nous aidez grandement et nous
souhaitons vous récompenser\*.

Hiérarchie
----------

Je serais CEO, mais je déléguerais beaucoup de chose au COO. Je pourrais
passer du temps dans l'atelier à faire ce qui me rend heureux.

TODO: Établir ce que la hiérarchie de l'entreprise serait.

Ce que j'aimerais c'est une hiérarchie le plus plat possible.
Idéalement, que des responsables. Et le titre que tu as dépends de ton
ancienneté. Un peu comme dans l'armée. Responsable =&gt; Chef d'équipe
=&gt; ... =&gt; Directeur =&gt; ...

## Hauteur de l'armoire du prototype.

Axe vertical de 5' seulement?

**Avantages**

- Plus économique
- J'ai déja les tiges pour le contrepoids
- Plus facile d'acces
- Pas tres difficile a changer (simplement remplacer le tube et les deux tiges)
- Moins encombrant
- Mon prototype risque d'encore changer
- Je ne sais pas encore a quelle taille le couper présentemment
- Je n'ai pas besoin de plus pour faire mes muffins

**Désavantages**

- Cela ne teste pas le jeu maximal (ca plirait 50% de plus, mais au pire on agrandit le tuyau)
- Cela est moins bon et se montre moins bien.

## Un jour

- Checker pour imprimer en 3d du nylon (enclosure et hotend température élevé ou nylon qui s'imprime a plus faible température)
- Essayer de chauffer la surface du TPU pour le lisser.
- Retaining ring pour le bearing de la main. Nécessite un tour pour faire deux encoches sur le shaft. Il ne devrait pas se déplacer, le bearing est rentré press-fit, mais bon, ça serait mieux.
- Exosquelette au lieu de squelette
1. Mettre les bearings dans l'humérus au lieu de les mettre dans le poignet, nécessite un exosquelette pour soutenir les bearings, ça serait simple de passer les fils électrique dans l'humérus, ah fuck off pour l'instant ça marche mon affaire de toute façon j'ai fini mon design et même presque tout imprimé... à faire avec la prochaine version en aluminium. Je ne sais même pas si c'est une bonne idée. Si tu regardes les robots SCARA normal, leur humérus est vraiment mince. Tu veux que l'humérus soit mince parce que l'avant bras passe un peu en dessous.
- As you might guess, the rated ampacities are just a rule of thumb. In careful engineering the voltage drop, insulation temperature limit, thickness, thermal conductivity, and air convection and temperature should all be taken into account.

## Utopie

Acheter:
- Scie a métal a ruban horizontale
- Un tour a métal
- Une plieuse de tole
- Une imprimante 3D avec enclosure, hotbed en vitre et hotend tout en métal pour etre capable d'imprimer du nylon a haute température

Au lieu d'un gros montant à vendre, offrir une location, comme ça ça n'engage à rien et c'est un montant bien moins élevé pour le client. 200$ par mois. Au lieu d'un employé, c'est rien! Ou 400$-500$ par mois au début et ça inclut le support technique pour que l'appareil fonctionne 24h/24, 7jours/7. Fuck vouloir tout faire moi-même, avoir un seul client donnerait énormément de crédibilité à la compagnie. Et oui ne pas vendre la machine, seulement la louer, comme ça ça me fait un revenu tout le temps. Je dois supporter le coût initial de la machine par contre... Ne pas charger au client les moments où l'appareil est en panne au début.



 La différence entre le 17HS4401 et le 17HS4401S est que la couleur du boîtier est différente, d'autres paramètres sont les mêmes. 
 
 J'aimerais ça y aller petit à petit et vendre juste quelques petits trucs au lieu de trop gros au début et d'attirer la compétition... C'est moins ALL-IN aussi...
 
 **EST-CE QUE MA PINCE EST CAPABLE DE PRENDRE LES POTS DANS LES COINS?!?!?!**
Au pire faire un accotoire pour empêcher les pots d'aller sur le côté?

Essayer de faire une armoire étanche pour le bruit. Ça serait cool pour le blender aussi. Pour ce qui est de l'humidité de l'évier de ma mère, ben intégrer un déshumidificateur plus tard avec l'évier.

## Thank you

Thank you to all the recipes websites I took inspiration from!
Thank you for everyone who ever contributed to linux!
Thank you to everyone who made a programming library free and open source!
Thank you for the design of a pretty pantry!
https://www.youtube.com/watch?v=bZO3Vk5jI5k
https://howtomechatronics.com/projects/scara-robot-how-to-build-your-own-arduino-based-robot/
Thank you to so many others who helped me in one way or another!
Thank you to the speed run community who thought me that by keep working really hard on something I can achieve what I want. It also thought me that progressions are slow. So I was not discouraged at first at every improvement which I thought was still missing a lot because in my book, I was taking 0.01 second of a record and I was proud. We can always do better we just once we know where the bar is. (example de sauter le plus haut possible de mon prof aussi, aussi moins de 3h le marathon)




Avantages et inconvénient d'avoir un compétiteur:
Avantages:
Donne de la crédibilité au projet
Demande de financement plus facile?

Désavantages:
Perte d'une part de marché
Perte d'être la première marque mise sur le marché

Au lieu de Heda, possiblement, bâtir la marque autour de Robot garde-manger, Pantry robot.

I would not mind if there were competitors, but what would be my competitive advantage?

Patents? - I don't want that... Fuck lawyers...
First to market? I am sick of hiding and being alone, I want to show what I am doing to the world!
Armoire de cuisine?

Hey ça serait cool que je protège le nom Heda comme compagnie, et que l'armoire s'appelle ensuite une armoire de cuisine de type ou de style Heda. Une armoire Heda. Laisser tout le monde appeler ça comme ça. N'importe qui aurait le droit même d'en fabriquer et d'en vendre sous le nom générique une armoire Heda. Ça créerait de la publicité autour du nom Heda.

Simulation robotique? Sure, j'aurais de l'avance dans la simulation. Je voudrais quand même peut-être avoir un blog d'articles qui parle de faire de la robotique avec Godot pour me faire de la publicité en même temps. Idéalement, le faire sur une page github d'un plugin de robotique que j'ai créé.

Les recettes? Vraiment pas...

Design mécanique? Ouin pas tant parce que le produit final devra être beaucoup plus travaillé. En plus, idéalement je voudrais que ce soit du open-hardware. Je voudrais simplement vendre des kits...<

**On ne veut pas garder tout le temps les même pots pour les mêmes ingrédients. Parce que cela impliquerait que tu as besoin de 2 pots par ingrédients, ou bien d'attendre qu'il soit vide avant de pouvoir le remplir. Aussi, c'est pas l'idéal pour quand tu dois le remplir.**

1. Au lieu de voir la vise comme une grande main qui tient un pot, voir ça comme deux petit bras qui serre le pot.


# Blog
Non je ne veux pas être une personallité publique... Je ne tolère pas assez la critique.
1. Faire un screenshot de plusieurs language de programmation et faire voter le monde lequel est le plus beau ESTHÉTIQUEMENT seulement. Personnellement quand j'entends parler sur Hacker News d'un nouveau language de programmation, la première chose que je regarde c'est est-ce qu'il est beau ou pas? Ensuite si je le trouve beau j'en apprends davantage. Peut-être rendre le code dans une autre langue pour que ce soit du guiberish pour que les gens n'ait pas tendance à vouloir voter selon l'efficacité du language de programmation. Juste un mini sample. Par exemple:
class Zazoo
  @foo = 10
  @sdf = 20
end
...


Hi,

I believe I would be an ideal candidate because I have experience developing products working on the backend and frontend in early-stage startups.

I am a quick learner and autonomous so you can trust me to get the job done without constant supervision.

I am looking for a short term full time job or long term part time job so I can continue working on a startup of my own. The 2 months contract you mentionned would be perfect for me.

If you have any questions, please don't hesitate to contact me by email or phone as written in my CV.

Thank you!

Pascal



Madame, Monsieur,

J'ai vu sur le site de Jobillico que vous cherchiez un candidat en enseignement pour le programme d'électromécanique. Je pense que je serais un bon candidat parce que j'ai de l'expérience dans le métier et je suis particulièrement doué au niveau académique.

J'ai eu la chance d'acquérir diverses expériences dans l'industrie. J'ai travaillé dans un atelier de réparation, dans une usine de meuble et j'ai travaillé en équipe sur la route. Je pourrais bien former les élèves pour les préparer à entrer sur le marché du travail parce que je connais toutes les facettes du métier d'électromécanicien.

Du point de vue académique, j'adore apprendre la théorie et j'adore partager mes connaissances avec les autres. Je travaillerais fort pour rendre mes cours accessibles à tous. Aussi, j'ai obtenu mon propre diplôme en électromécanique en 2016. Je suis donc encore à jour avec le matériel du cours à donner.

J'aimerais beaucoup avoir la chance d'être dans la banque de candidats même si vous n'avez pas beaucoup de disponibilités pour l'instant. Je suis flexible et très ouvert à faire du remplacement sur demande.

Je suis disponible pour retourner aux études pour pouvoir obtenir cet emploi. J'avais commencé un baccalauréat en génie mécanique que j'aimais bien. Malheureusement, après mon premier stage, j'ai découvert que ce n'était pas un métier pour moi. Mais je retournerais aux études sans hésiter pour obtenir cet emploi d'enseignant dont j'ai toujours rêvé.

Je vous prie de recevoir mes sincères salutations,
Pascal





 comme main d'oeuvre supplémentaire pour des petites et grandes entreprises
  La théorie est mon point fort. J'ai beaucoup de chance d'avoir de la facilité à l'école.
