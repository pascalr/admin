v 20130925 2
C 40000 40000 0 0 0 title-B.sym
B 46500 43600 1700 6000 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 47500 49700 9 10 1 0 0 0 1
TB6600
C 47100 44000 1 0 0 connector2-1.sym
{
T 47300 45000 5 10 0 0 0 0 1
device=CONNECTOR_2
}
C 47100 45300 1 0 0 connector4-1.sym
{
T 48900 46200 5 10 0 0 0 0 1
device=CONNECTOR_4
}
C 47100 47200 1 0 0 connector6-1.sym
{
T 48900 49000 5 10 0 0 0 0 1
device=CONNECTOR_6
}
C 49500 43900 1 0 1 12V-plus-1.sym
C 49200 44400 1 0 0 gnd-1.sym
L 48800 44200 48800 43900 3 0 0 0 -1 -1
L 48800 43900 49300 43900 3 0 0 0 -1 -1
L 49300 44700 48800 44700 3 0 0 0 -1 -1
L 48800 44700 48800 44500 3 0 0 0 -1 -1
T 49000 46400 9 10 1 0 0 0 1
bleu
T 49000 46100 9 10 1 0 0 0 1
rouge
T 49000 45800 9 10 1 0 0 0 1
brun
T 49000 45500 9 10 1 0 0 0 1
blanc
C 49100 48800 1 0 0 gnd-1.sym
C 49900 48100 1 180 0 in-1.sym
{
T 49900 47800 5 10 0 0 180 0 1
device=INPUT
T 49900 47800 5 10 1 1 180 0 1
refdes=PIN7 - DIR
}
C 49900 47500 1 180 0 in-1.sym
{
T 49900 47200 5 10 0 0 180 0 1
device=INPUT
T 49900 47200 5 10 1 1 180 0 1
refdes=PIN6 - STEP
}
L 48800 47700 48800 47900 3 0 0 0 -1 -1
L 48800 47900 48700 47900 3 0 0 0 -1 -1
L 48700 47900 48700 48100 3 0 0 0 -1 -1
L 48700 48100 48800 48100 3 0 0 0 -1 -1
L 48800 48100 48800 48300 3 0 0 0 -1 -1
L 48800 48300 48800 48500 3 0 0 0 -1 -1
L 48800 48500 48700 48500 3 0 0 0 -1 -1
L 48700 48500 48700 48700 3 0 0 0 -1 -1
L 48700 48700 48800 48700 3 0 0 0 -1 -1
L 48800 48700 48800 48900 3 0 0 0 -1 -1
L 48800 48900 48800 49100 3 0 0 0 -1 -1
L 48800 49100 49200 49100 3 0 0 0 -1 -1
C 51000 46100 1 0 0 2phase-stepper-1.sym
{
T 51200 47900 5 10 0 0 0 0 1
device=2PHASE-STEPPER-4LEADS
T 51000 47700 5 10 1 1 0 0 1
refdes=U?
}
T 49600 46400 9 10 1 0 0 0 1
brun I
T 49600 46100 9 10 1 0 0 0 1
jaune I
T 49600 45800 9 10 1 0 0 0 1
brun
T 49600 45500 9 10 1 0 0 0 1
jaune
N 49300 48000 48800 48000 4
N 49300 47400 48800 47400 4