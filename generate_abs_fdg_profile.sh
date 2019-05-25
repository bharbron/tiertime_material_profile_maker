#!/bin/bash

python tiertime_material_profile_maker.py --copy-from ABS --name CUSTOM --manufacturer CUSTOM custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.1 --line-width 0.4 0.4 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.15 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.2 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.1 --line-width 0.4 0.4 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.15 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.2 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name ABS_FDG --manufacturer Tiertime/FDG --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.1 --quality normal tiertime_abs_fdg_profile.fmd
