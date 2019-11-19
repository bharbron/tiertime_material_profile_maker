#!/bin/bash

python tiertime_material_profile_maker.py --copy-from PLA --name PLA220 --manufacturer Tiertime --temperature 220 pla220.fmd
python tiertime_material_profile_maker.py --copy-from PLA --name PLA215 --manufacturer Tiertime --temperature 215 pla215.fmd
python tiertime_material_profile_maker.py --copy-from PLA --name "PLA*" --manufacturer Tiertime --temperature 210 pla210.fmd
python tiertime_material_profile_maker.py --copy-from PLA --name PLA205 --manufacturer Tiertime --temperature 205 pla205.fmd
python tiertime_material_profile_maker.py --copy-from PLA --name PLA200 --manufacturer Tiertime --temperature 200 pla200.fmd
python tiertime_material_profile_maker.py --copy-from PLA --name PLA195 --manufacturer Tiertime --temperature 195 pla195.fmd
python tiertime_material_profile_maker.py --copy-from PLA --name PLA190 --manufacturer Tiertime --temperature 190 pla190.fmd