#!/bin/bash

python tiertime_material_profile_maker.py --copy-from PLA --name CUSTOM --manufacturer CUSTOM --temperature 195 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --scan-speed 21 42 42 --aspeed 250 250 250 --nozzle-diameter 0.4 --line-width 0.4 0.4 0.4 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name PLA_MINI --manufacturer 195@Tiertime --printer up_mini_2 --scan-speed 21 42 42 --aspeed 250 250 250 --nozzle-diameter 0.2 --line-width 0.2 0.2 0.2 tiertime_pla_mini_profile.fmd

rm custom.fmd