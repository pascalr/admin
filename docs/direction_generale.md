# Mission

Encourager les gens à manger de manière plus éco-responsable.

- Un site de recette avec des recettes éco-responsables.
- Un armoire de cuisine intelligente qui évite le gaspillage alimentaire
- Suggestions de recettes avec des aliments du garde-manger qui sont plus écologiques
- Transformation d'aliments primaires à la maison

# Vision (6 mois)

Commencer à vendre des armoires. Distribuer le plan sur internet pour que le monde puisse déjà commencer à fabriquer leur propres armoires. Avoir un design fonctionnel qui confirme les dimensions de l'armoire. La simulation doit être capable d'aller chercher et d'aller porter tous les pots. Avoir un design semblant fonctionnel de bras robotique en vrai. Travailler sur la pince surtout... Commencer à faire de la publicité peu à peu. Idéalement, avoir démarré la compagnie par actions. Avoir un site en ligne et publier une recette par semaine.

# Planification (PRIORITÉ: Vidéo)

1. BACKUP
1. UNE RECETTE PAR SEMAINE. PLANIFIER DANS LE CALENDRIER UN MOIS À L'AVANCE.
1. RÉPONDRE PEU À PEU AUX QUESTIONS PAR ÉCRIT

1. Aller au canac acheter un 1X5X8 et cosses d'aluminium

1. Un thème récurrant. Les ingrédients en version fraîche ou bien en version déshydratés. Offrir les 2 recettes? Soupe aux patates. Soupe aux patates express. Quand il est inscrit express ça veut dire qu'au moins 1 des ingrédients est déshydraté. Dans les instructions de la recette: _Voir aussi la version rapide: Soupe aux patates express_ ou bien _Voir aussi la version avec des ingrédients frais: Soupe aux patates_ Dans la version express mettre les haricots cuits?

1. Tenir le cable tray vertical en place.
1. Lumières dans l'armoire (https://www.amazon.ca/Govee-Upgraded-Dimmable-Daylight-Flexible/dp/B07V46H7YL/ref=sr_1_4?dchild=1&keywords=white+led+strip+lights&qid=1630604006&s=hi&sr=1-4)
1. Vider l'armoire et la remplir de pots pour pouvoir prendre des photos et des vidéos.
1. Gripper
1. LES MAUDITS CÂBLES ÉLECTRIQUES... (Thêta de -120 à 120 et alpha de -170 à 170?)
1. Plus de poids sur le contrepoids.
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

# Recettes
https://en.wikibooks.org/wiki/Cookbook:Sauces
https://en.wikibooks.org/wiki/Cookbook:Recipes
https://foodgawker.com/page/2/
https://www.findingvegan.com/
http://www.tastespotting.com/

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

