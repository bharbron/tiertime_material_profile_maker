#!/bin/bash

python tiertime_material_profile_maker.py --copy-from ABS --name CUSTOM --temperature 240 --manufacturer CUSTOM custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --send-ratio 0.92 1 0.9 --nozzle-diameter 0.4 --layer-thickness 0.1 --line-width 0.45 0.35 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --send-ratio 0.92 1 0.9 --nozzle-diameter 0.4 --layer-thickness 0.15 --line-width 0.47 0.37 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --send-ratio 0.92 1 0.9 --nozzle-diameter 0.4 --layer-thickness 0.2 --line-width 0.5 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --send-ratio 0.92 1 0.9 --nozzle-diameter 0.4 --layer-thickness 0.1 --line-width 0.45 0.35 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --send-ratio 0.92 1 0.9 --nozzle-diameter 0.4 --layer-thickness 0.15 --line-width 0.47 0.37 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --send-ratio 0.92 1 0.9 --nozzle-diameter 0.4 --layer-thickness 0.2 --line-width 0.5 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name ABSTEST --manufacturer Tiertime@240 --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.1 --quality fine test_profile.fmd

rm custom.fmd
