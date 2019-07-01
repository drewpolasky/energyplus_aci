-- -*- lua -*-
------------------------------------------------------------------------
-- energy plus
------------------------------------------------------------------------

help([[
EnergyPlus™ is a whole building energy simulation program that engineers, architects, and researchers use to model both energy consumption—for heating, cooling, ventilation, lighting and plug and process loads—and water use in buildings.
]])

-- Whatis description
whatis('Description: Energy Plus building modeler')
whatis('url: https://energyplus.net/')


local energyplus = [==[
/usr/bin/singularity run --app energyplus ~/work/sw/singularity/drewpolasky-energyplus_aci-master-latest.simg  "$@";
]==]

local runenergyplus = [==[
/usr/bin/singularity run --app runenergyplus ~/work/sw/singularity/drewpolasky-energyplus_aci-master-latest.simg "$@";
]==]

set_shell_function("energyplus",energyplus,energyplus)

set_shell_function("runenergyplus",runenergyplus,runenergyplus)





