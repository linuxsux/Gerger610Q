#!/bin/bash

source $1/amber22/amber.sh

parmchk2 -i ligand_files/PPO.mol2 -f mol2 -o ligand_files/PPO.frcmod
parmchk2 -i ligand_files/GGC.mol2 -f mol2 -o ligand_files/GGC.frcmod

cd Prep_environment
$1/amber22/bin/tleap -f PPO.in
$1/amber22/bin/tleap -f GGC.in
$1/amber22/bin/tleap -f complex.in
cd ..

ambpdb -p TXS-gerger.prmtop -c TXS-gerger.inpcrd > TXS-gerger_solvated.pdb
