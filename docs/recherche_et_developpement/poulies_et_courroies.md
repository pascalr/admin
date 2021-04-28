## Processus de sélection de courroie

1. Déterminer la puissance de sortie désirée
Je veux essayer 5 fois plus fort qu'avant (axe A et axe T), je crois que c'est amplement suffisant.

1. Déterminer la vitesse de sortie désirée
Avec un ratio 5 fois plus élevé qu'avant (25 au lieu de 5), la vitesse semble être parfait pour bien profiter de la vitesse du stepper, de sa précision.

1. Faire des calculs

Avant, j'avais des moteur Nema 17 à 0.46 N.m avec un ratio de 5.
Si j'ai 2 fois 5:1 comme ratio, je vais avoir un couple de 2.3 N.m. pour la seconde courroie.

1. Déterminer la puissance de moteur requise

Nema 17 à 0.46 N.m

1. ...

Bon, je crois que ça me prend une courroie HTD3 pour la 2e courroie. Je vais donc utiliser HTD3. 6mm pour la première et 10mm pour la seconde.

## Allowable Working Tension

(Per 1 inch of belt width) (diviser par 2.54 pour 10mm par exemple)
(Neoprene)

MXL: 80N
XL: 125N
HTD_3mm: 285N
HTD_5mm: 454N
HTD_8mm: 792N
GT3_2mm: 111N
GT3_3mm: 507N
GT3_5mm: 712N
GT3_8mm: 1690N
T_2.5mm: 312N
T_5mm: 930N
T_10mm: 1800N

The GT3 belt has a virtually identical performance as the GT2. They're the same size, are available in the same widths, and have matching tooth profiles. Both belts match to the same pulleys which means there is no need to go back and redesign or rework any component. Changing from GT2 to GT3 is seamless.

T2.5mm est plus fort que HTD3mm?! Pcq Urethane w/Steel Cords? Mais il y a beaucoup moins de choix sur le site de SDP/SI, donc je vais aller avec HTD3mm.

NOTE: For thinner belt widths, less than 1", the tension must be derated since the tension cords on the sides are not complete loops

Source: https://www.sdp-si.com/PDFS/Technical-Section-Timing.pdf

## ...

Je pense utiliser des courroies HTD 3M.

Add a little J.B.Weld to your pulleys
or couplers to stop loosening set screws.

Have a D shaft stepper motor but have
a keyed shaft pulley? Match them up
by pouring in some J.B.Weld.

To pull apart, just use a standard gear
puller.

https://www.steppermotorcanada.ca/steppermotorcanada_011.htm

SDP-SI semble être le fournisseur principale pour les courroies.

## Les 3 types de construction de courroie

**M**: Courroie ouverte (pas une boucle fermée)
**V**: Épissé et **soudé** pour les applications de transport (**50% de la résistance**)
**BFX**: Vraiment infini pour les application de transmission de puissance (extrudées sans soudure)

## Les sortes de courroies

In Openscad document: // 1=MXL 2=40DP 3=XL 4=H 5=T2.5 6=T5 7=T10 8=AT5 9=HTD_3mm 10=HTD_5mm 11=HTD_8mm 12=GT2_2mm 13=GT2_3mm 14=GT2_5mm

TODO: Faire un tableau.

MXL est similaire à GT2 on dirait.

Description des types de courroies: https://www.sdp-si.com/products/belts.htm
https://www.sdp-si.com/products/details/timing-belt-detail.php

**MXL:**
-Trapézoïdale
-Tension de travail (Nylon Covered, Fiberglass Reinforced, Neoprene from SDP-SI) (72 N par mm de largeur)

HTD3: (Nom enregistré de la compagnie Gates) (Curvilinear tooth profile)
GT2: (Nom enregistré de la compagnie Gates)
FHT:
T-Series:
40 D.P. Series: Trapézoïdale
**Principales selon Fanchon**
MXL: 2.032mm, XXL: 3.175mm, XL (extra légère): 5.08 mm, L (légère): 9.525 mm, ...

Sources:
MXL: https://www.sdp-si.com/D265/PDF/D265P1003.pdf
Fanchon

## Informations

Les moteurs Nema 23 possède un couple de 143 oz-in (1 N.m) jusqu'à 438 oz-in (3.1 N.m).

Courroies 10mm: 320N tension max (160N type V)
Courroies 15mm: 510N tension max (255N type V)
Courroies 25mm: 900N tension max (450N type V)

Nombre de dents minimum: 16.

La distance où que la force est appliquée selon le nombre de dents de la poulie:
(Plus la poulie est petite, plus la force sur les dents sera élevée pour le même couple moteur)

16 dents: 15.28 mm
25 dents: 23.87 mm
40 dents: 38.20 mm
60 dents: 57.30 mm

Pour un couple de 1 N.m, la force sur les dents est donc de:

16 dents: 65.4 N (1/0.01525)
25 dents: 41.9 N (1/0.02387)
...

Pour un couple de 2 N.m, la force sur les dents est donc de:

16 dents: 130.8 N (2/0.01525)
25 dents: 83.8 N (2/0.02387)
...

Une courroie de 10 mm est donc suffisant pour un petit moteur Nema 23 ou pour un Nema 17 geared 5.18:1 (très limite par contre 130N vs 160N).
6mm le serait probablement aussi pour nema 23, mais je veux un bon facteur de sécurité pour être safe...

Sur SDP/SI, j'ai working tension: 285N pour 1". C'est 112N pour 10mm, et non 160N...

Bon... 15mm pour être safe...

Pour l'axe vertical, si j'utilise un moteur nema 23 plus puissant, je devrai prendre une courroie plus large.

## Calculs de longeur de courroie

Utiliser un site en ligne pour faire le calcul comme celui ci:
https://www.omnicalculator.com/physics/belt-length

La formule est compliquée:
Belt length = ((DL + DS) * π / 2) + (DL - DS) * arcsin((DL - DS) / 2L) + 2 * √(L2− 0.25 * (DL - DS)2)

## Questions à répondre:

- Quelle largeur de courroie?
- Quelle longeur de courroie pour les courroies fermé comme pour l'axe T ou l'axe vertical ou les autres axes.
- Quelle largeur de poulie? (15mm pour 15mm ça fonctionne? ça serait mieux 16mm pour 15mm right?
- Combien de nombre de dents? (Poulie linéaire, petite poulie, grande poulie pour axe vertical?)

## Sources

- https://www.tyma.eu/pdf/elatech-htd-3m-timing-belts.pdf
