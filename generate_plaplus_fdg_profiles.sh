#!/bin/bash

python tiertime_material_profile_maker.py --copy-from PLA --name CUSTOM --manufacturer CUSTOM --temperature 205 --bed-temp 0 --density 1.24 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.1 --line-width 0.4 0.4 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.15 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.2 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.1 --line-width 0.4 0.4 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.15 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.2 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name 205PLA+ --manufacturer eSun/FDG --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.1 --quality normal esun_plaplus_fdg_profile_205.fmd

python tiertime_material_profile_maker.py --copy-from PLA --name CUSTOM --manufacturer CUSTOM --temperature 210 --bed-temp 0 --density 1.24 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.1 --line-width 0.4 0.4 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.15 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.2 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.1 --line-width 0.4 0.4 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.15 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.2 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name 210PLA+ --manufacturer eSun/FDG --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.1 --quality normal esun_plaplus_fdg_profile_210.fmd

python tiertime_material_profile_maker.py --copy-from PLA --name CUSTOM --manufacturer CUSTOM --temperature 215 --bed-temp 0 --density 1.24 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.1 --line-width 0.4 0.4 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.15 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.2 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.1 --line-width 0.4 0.4 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.15 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.2 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name 215PLA+ --manufacturer eSun/FDG --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.1 --quality normal esun_plaplus_fdg_profile_215.fmd

python tiertime_material_profile_maker.py --copy-from PLA --name CUSTOM --manufacturer CUSTOM --temperature 220 --bed-temp 0 --density 1.24 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.1 --line-width 0.4 0.4 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.15 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.2 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.1 --line-width 0.4 0.4 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.15 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.2 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name 220PLA+ --manufacturer eSun/FDG --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.1 --quality normal esun_plaplus_fdg_profile_220.fmd

python tiertime_material_profile_maker.py --copy-from PLA --name CUSTOM --manufacturer CUSTOM --temperature 225 --bed-temp 0 --density 1.24 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.1 --line-width 0.4 0.4 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.15 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.2 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.1 --line-width 0.4 0.4 0.47 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.15 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.2 --line-width 0.4 0.4 0.55 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name 225PLA+ --manufacturer eSun/FDG --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.1 --quality normal esun_plaplus_fdg_profile_225.fmd
