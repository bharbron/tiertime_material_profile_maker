#!/bin/bash

python tiertime_material_profile_maker.py --copy-from ABS --name CUSTOM --manufacturer CUSTOM --withdraw-length 6 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.1 --send-ratio 0.92 1 0.9 --line-width 0.4 0.4 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.15 --send-ratio 0.92 1.05 0.9 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.2 --send-ratio 0.92 1.05 0.9 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.1 --send-ratio 0.92 1 0.9 --line-width 0.4 0.4 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.15 --send-ratio 0.92 1.05 0.9 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.2 --send-ratio 0.92 1.05 0.9 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name ABS_MINI --manufacturer Tiertime --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.15 --quality fine tiertime_abs_mini_profile.fmd

rm custom.fmd
