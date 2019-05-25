#!/bin/bash

python tiertime_material_profile_maker.py --copy-from PLA --name 235 --manufacturer ColdPull --temperature 235 cold_pull_235.fmd
python tiertime_material_profile_maker.py --copy-from PLA --name 280 --manufacturer ColdPull --temperature 280 cold_pull_280.fmd
python tiertime_material_profile_maker.py --copy-from PLA --name 110 --manufacturer ColdPull --temperature 110 cold_pull_110.fmd
python tiertime_material_profile_maker.py --copy-from PLA --name 90 --manufacturer ColdPull --temperature 90 cold_pull_90.fmd