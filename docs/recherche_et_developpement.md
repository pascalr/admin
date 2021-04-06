## Notes

Pas de portes pour l'instant. Simplement une tablette de rangement (au plancher) et une tablette de travail.

Pas de caméra pour l'instant. Mettre les pots a des endroits pré-déterminé. (L'objectif est de faire de la pate a muffin le plus rapidement possible)

## Bras robotique

### Mouvement vertical

J'utilise un contrepoids au lieu d'un moteur avec réducteur irréversible.

Je laisse ca comme c'est présentement parce que je n'utilise pas de porte présentemment et c'est correct comme ca pour faire des muffins. <span style="background-color: yellow">Dans la prochaine version, mettre les contrepoids sur les cotés.</span>

Ca prendrait quand meme un moteur un peu plus gros pour aller plus vite. Ce n'est pas grave pour l'instant.

#### Avantages

- <span style="background-color: yellow">Avec un réducteur irréversible, si le bras descends et s'accote sur un tablette, du lousse va s'accumuler sur le cable et ca va etre l'enfer...</span>
- Ce que j'utilise présentemment fonctionne. Le remplacer ne veut pas dire que ca fonctionne. Peut-etre des problemes inconus.
- Moins énergétique.
- Moins dispendieux.

#### Désavantages

- Plus encombrant.

#### Avec vis sans fin (Deprecated, voir avantages et désavantages ci-dessus)

Le systeme pour soulever est un cable et une poulie et non un sprocket et une chaine parce que c'est probablement moins cher et plus silencieux.

Les deux poulies de chaque coté sont solidaires a l'arbre.

L'arbre pourrait etre creux, mais ca risque d'etre trop de trouble. Donc un arbre plein.

Les paliers utiliserait des bearings et un support imprimer en 3D pour l'instant. L'arbre sera sablé lentement jusqu'a ce qu'il possede le bon diametre.

**TODO: Acheter un micrometre pour mesurer le diametre de l'arbre precisement pour monter des bearings.** <br>
https://www.canadiantire.ca/en/pdp/mastercraft-micrometer-set-0581200p.html


 

**Quelle sorte de moteur?**

Je veux un moteur qui ne fait pas trop de bruit (pas de brosses), 1/10 HP, 120V AC avec un réducteur irréversible (vis sans fin) pour aller a une vitesse finale de 70 a 280 RPM. Axe a 90deg, parce que je suppose que c'est moins cher pour un reducteur a vis sans fin.

#### Moteur requise

Je veux un moteur **120 V**. Sans contrepoids, la puissance du moteur est élevée. Le power supply ne pourra pas suffir.

Le gearbox doit etre **irréversible**! Probablement un worm gear.

##### Force
Le volume actuel d'acier du contrepoids est de 36" * 0.25" * 6.25" == 56.25 po<sup>3</sup>.<br>
Densité de l'acier: 0.285 lb/po<sup>3</sup><br>
Donc le contrepoids actuel pese a peu pres <b>16 lb</b>, <b>7.25 kg</b> ou **72 N**.

##### Travail

La distance a effectuer est de **2 m** ou **78.75 po**.<br>
Le travail est donc de 72 N * 2 m == **144 J**.<br>

##### Puissance

La distance a effectuer prend **4 secondes**.<br>
La puissance est donc de 144 J / 4 s == **36 W** ou **0.05 HP**.<br>

##### Avec facteur de sécurité

Pour le prototype, je veux un facteur de sécurité de 2 parce que le poids pourrait facilement augmenter.<br>
Alors, on veut un moteur de **1/10 HP**.

##### Vitesse du moteur

Supposons une **poulie** d'un **diametre** de **2.625 po** (**circonférence 8.25 po**).
Le moteur doit tourner **9.5 tour** pour effectuer la distance totale de **78.75 po**. Pour le faire en **4 secondes**, il doit tourner a pres de **2.5 tr/s** ou **140 RPM**.


## TODO

Étape de fabrication du robot: (Note: Pour chaque étape, faire dans la simulation en premier)

1. L'armoire de la simulatino n'est plus la meme que celle que j'ai presentement.

Comment fabriquer le robot?



Faire des beaux graphes:

https://gojs.net/latest/learn/index.html
