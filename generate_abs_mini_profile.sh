#!/bin/bash

python tiertime_material_profile_maker.py --copy-from ABS --name CUSTOM --manufacturer CUSTOM --temperature 250 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --layer-thickness 0.1 --aspeed 1000 1000 1000 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --layer-thickness 0.15 --aspeed 1000 1000 1000 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --layer-thickness 0.2 --aspeed 1000 1000 1000 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --layer-thickness 0.1 --quality normal --scan-speed 30 30 30 --joggle-speed 30 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --layer-thickness 0.1 --quality fine --scan-speed 18 18 18 --joggle-speed 18 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --layer-thickness 0.1 --quality fast --scan-speed 33 33 33 --joggle-speed 33 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --layer-thickness 0.15 --quality normal --scan-speed 30 30 30 --joggle-speed 30 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --layer-thickness 0.15 --quality fine --scan-speed 18 18 18 --joggle-speed 18 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --layer-thickness 0.15 --quality fast --scan-speed 33 33 33 --joggle-speed 33 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --layer-thickness 0.2 --quality normal --scan-speed 31 31 31 --joggle-speed 31 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --layer-thickness 0.2 --quality fine --scan-speed 25 25 25 --joggle-speed 25 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --layer-thickness 0.2 --quality fast --scan-speed 58 58 58 --joggle-speed 58 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name ABS_MINI --manufacturer 250@Tiertime --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.15 --quality fine tiertime_abs_mini_profile.fmd

rm custom.fmd
