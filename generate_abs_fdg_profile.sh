#!/bin/bash

python tiertime_material_profile_maker.py --copy-from ABS --name FDG --manufacturer Tiertime/ABS@240 --temperature 240 --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.1 --scan-speed 21 42 42 --send-ratio 0.92 1 0.9 --line-width 0.4 0.4 0.47 --aspeed 1000 1000 1000 --withdraw-length 6 tiertime_abs_fdg_profile.fmd
