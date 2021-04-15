## Aujourd'hui/Demain

1. Acheter un disque dur externe pour faire des backups de mes databases.
1. Backup de la base de donnée de Admin à tous les jours! (De toutes les bases de données en fait)
1. Commencer closer mon cours

## Grandes lignes

### Nouveau plan

1. Backup de la base de donnée de Admin à tous les jours!
1. Mouvement horizontal
1. Mouvement vertical
1. Mouvement R, B, A, T
1. Simulation et bras robotique aller chercher les ingrédients pour des muffins (3 semaines)
1. Simulation et bras robotique verser des aliments grossiers (riz, macaroni, légumineuses, ...) (3 semaines)

**Objectif:** Profiter au maximum de mon appartement tant que je l'ai. Faire la recherche de financement plus tard. Je ne voulais pas fabriquer mon produit sans savoir que je peux le vendre, mais ce n'est plus le cas. Au pire, j'utilise la machine moi-meme pour faire et vendre des aliments transformés zéro-déchets.

### Autre - Quoi faire quand je suis en attente

1. Faire une liste d'achats à Faire sur le site de Admin. (Enlever achats.md, il est tout croche, ça prend un tableaux) (Une liste comme chez Logiflex dans Excel)
1. Rentrer mes dépenses dans admin (Supplier, ...)
1. Faire un dashboard dans admin (qui afficherait quoi??? pas prioritaire)

### Ancien plan

1. <strike>Demande de brevet (2 semaine)</strike>
1.  Une page de vente (page d’accueil) sur mon site internet (1 semaine) [En attente de l'acception du dépot de brevet]
1.  Modèle d'affaires (1 semaine) [En attente que mon cours termine]
1.  Peaufiner mon site internet (MVP) et le rendre publique (1 semaine) [En attente de l'acception du dépot de brevet]
1.  Trouver des clients et/ou des investisseurs (1 semaine)
1.  Fabriquer une belle armoire de cuisine (2 semaines)
1.  Développer une dizaine de bonnes recettes en exemple (2 semaine)
1.  Faire une vidéo publicitaire de cuisine (1 semaine)
1. Démarrer l'entreprise officiellement.
1. Contacter des médias et essayer de faire parler de l'entreprise
    (1 semaine)
1. Financement participatif. Vendre des réservations à 50$.
1. Faire mon bras robotique

## Détails et progres des grandes lignes

### Mouvement horizontal

- Acheter des tiges filetées 8mm (En attente que les bearings soit commandé...)
- Acheter écrous 8mm (En attente que les bearings soit commandé...)
- Acheter un peu de washers 8mm? (attendre de voir si nécessaire)
- **Concevoir le lien entre le mouvement vertical et le mouvement horizontal**
- Déterminer et acheter de la tole plus épaisse pour les cotés  (attendre que ce soit nécessaire, pour l'instant c'est correct avec ma petite tôle)
- Imprimer les supports de la track a cable
- Imprimer le support du moteur
- Percer ou imprimer ou acheter 2 poulies pour nema 23 (HTD3M?, je veux une **BF** et non AF) Au lieu d'engrenage, je pourrais utiliser des courroies synchrone partout? Pour laxe vertical aussi
(https://www.steppermotorcanada.ca/steppermotorcanada_011.htm)

**En attente de la meche 18mm pour fabriquer les 2 plaques sur les cotés. J'ai l'acier.**

**En attente des bearings et du TPU pour faire les roues.**

### Mouvement vertical

- Essayer d'imprimer des mini bushings pressed fit dans mes poids déja coupé (changer plus tard, 4 bushings max, pas 2 bushings par plate...)
- Diminuer le bruit du weight stack
- Installer les contrepoids de chaque cotés
- Acheter une tige 3/8 supplémenaire (demander s'ils ont du cold rolled steel?)
- Checker pour imprimer en 3d du nylon (enclosure et hotend température élevé ou nylon qui s'imprime a plus faible température)
- Tourner les drums du bras robotique de sens (vers l'intérieur)
- Percer les trous pour les cables d'acier dans le bois et dans le plastique
- Au lieu d'engrenage, je pourrais utiliser des courroies synchrone partout? Pour laxe vertical aussi
- Acheter 4 écrou 18mm NF ?

80"/2.625"/3.1416 ~= 10. 1 tour de plus pour que ça tienne == 11.


#### Une idée

Rendre le garde du haut optionnel et non structurel, il y aurait 2 pillow block de chaque coté et un grand tube qui lui sert de structure entre les cotés. A la limite le garde serait optionnel et servirait seulement de faire beau et de cacher le moteur. Le moteur serait accrocher d'un des cotés (cotés opposé au cable track pour que ses fils puissent descendre en bas)

### Mouvement R, B, A, T

Améliorer le design actuel pour avoir plus de rigidité. Avec le nouveau design de l'armoire, j'ai moins de restriction en hauteur. Donc mettre le mouvement T au dessus des autres mouvements.

- Commencer le nouveau design

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


