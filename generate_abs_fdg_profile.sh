#!/bin/bash

python tiertime_material_profile_maker.py --copy-from ABS --name CUSTOM --temperature 240 --manufacturer CUSTOM custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --aspeed 250 250 250 --joggle-speed 5 --send-ratio 0.92 1 0.9 --nozzle-diameter 0.4 --layer-thickness 0.08 --line-width 0.4 0.4 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --aspeed 250 250 250 --joggle-speed 5 --send-ratio 0.92 1 0.9 --nozzle-diameter 0.4 --layer-thickness 0.1 --line-width 0.4 0.4 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.08 --quality fine --scan-speed 21 42 42 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.1 --quality fine --scan-speed 21 42 42 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name FDGABS --manufacturer 240@Tiertime --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.08 --quality fine abs_fdg.fmd

rm custom.fmd
