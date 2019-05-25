#!/bin/bash

python tiertime_material_profile_maker.py --copy-from PLA --name HOT --manufacturer ColdPull --temperature 235 cold_pull_hot.fmd
python tiertime_material_profile_maker.py --copy-from PLA --name MAX --manufacturer ColdPull --temperature 280 cold_pull_max.fmd
python tiertime_material_profile_maker.py --copy-from PLA --name COLD --manufacturer ColdPull --temperature 90 cold_pull_cold.fmd