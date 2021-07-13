puts "Voici une feuille de calcul pour le bras robotique."
puts "--- DONNÉES ---"
humerus_length = 6.25
forearm_grip_length = 3.0 + 0.125 + 3.125 + 0.75 + 2.375
forearm_clear_length = 3.0 + 0.125 + 3.125 + 0.75 + 3.25
gripper_width = 6.0
# Présentemment, l'angle minimal est de 60.0. C'est très mauvais pour prendre des trucs dans la porte.
# En éloignant le moteur il est theoriquement possible d'avoir un angle de 35, disons 40 pour être safe
min_angle = 40.0 # The minimum angle between the humerus and the forearm
puts "humerus_length=#{humerus_length}in"
puts "forearm_grip_length=#{forearm_grip_length}in"
puts "forearm_clear_length=#{forearm_clear_length}in"
puts "gripper_width=#{gripper_width}in"
puts "min_angle=#{min_angle}degrees"
puts "--- CALCULS ---"
puts "reach=#{humerus_length+forearm_grip_length}in"
puts "humerus_length_for_perpendicular_grip_door=#{forearm_grip_length/Math.cos(min_angle*Math::PI/180.0)}" # Based on the min_angle
puts "=#{}"
puts "=#{}"
puts "=#{}"
