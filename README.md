# tiertime_material_profile_maker
Python script for generating a custom material profile .FMD file for TierTime 3d Printers.

The current Mac OS X version of UP Studio allows you to _import_ new material profiles, but it does not allow you to _create_ new profiles. This script is an attempt at a workaround for that.

```
usage: tiertime_material_profile_maker.py [-h] [--template-file TEMPLATE_FILE]
                                          --template {ABS,ABS+,PLA,TPU,CUSTOM}
                                          --name NAME --manufacturer
                                          MANUFACTURER
                                          [--temperature TEMPERATURE]
                                          [--bed-temp BED_TEMP]
                                          [--diameter DIAMETER]
                                          [--density DENSITY]
                                          [--shrinkage SHRINKAGE SHRINKAGE SHRINKAGE]
                                          [--printer {default,up_mini_2}]
                                          [--nozzle-diameter {0.2,0.4,0.6}]
                                          [--layer-height LAYER_HEIGHT]
                                          [--speed {fine,superfast,fast,normal}]
                                          [--withdraw WITHDRAW]
                                          [--peel-ratio PEEL_RATIO]
                                          [--line-width LINE_WIDTH LINE_WIDTH LINE_WIDTH]
                                          [--scan-speed SCAN_SPEED SCAN_SPEED SCAN_SPEED]
                                          [--send-ratio SEND_RATIO SEND_RATIO SEND_RATIO]
                                          [--temp-bias TEMP_BIAS TEMP_BIAS TEMP_BIAS]
                                          [--retraction-speed RESTRACTION_SPEED]
                                          output

positional arguments:
  output                The filename for the new custom material .fmd file

optional arguments:
  -h, --help            show this help message and exit
  --template-file TEMPLATE_FILE
                        Optional alternative .FMD file to use as the source
                        template for customization
  --template {ABS,ABS+,PLA,TPU,CUSTOM}
                        Built-in Tiertime material to base this on: ABS, ABS+,
                        PLA or TPU
  --name NAME           Material name, e.g. "PLA+"
  --manufacturer MANUFACTURER
                        Manufacturer name, e.g. "eSun"
  --temperature TEMPERATURE
                        Base extrusion temperature of meterial
  --bed-temp BED_TEMP   Print bed temperature
  --diameter DIAMETER   Material diameter
  --density DENSITY     Material density
  --shrinkage SHRINKAGE SHRINKAGE SHRINKAGE
                        Material shrinkage percentage
  --printer {default,up_mini_2}
                        Single printer that these customizations will be
                        applied to
  --nozzle-diameter {0.2,0.4,0.6}
                        Single nozzle diameter that these customizations will
                        be applied to
  --layer-height LAYER_HEIGHT
                        Single layer height that these customizations will be
                        applied to
  --speed {fine,superfast,fast,normal}
                        Single print speed these customizations will be
                        applied to
  --withdraw WITHDRAW   Extrusion withdraw/retraction distance in mm
  --peel-ratio PEEL_RATIO
                        Peel ratio for raft and supports, from 0 to 100
  --line-width LINE_WIDTH LINE_WIDTH LINE_WIDTH
                        Line width in float [outline, infill, support]
  --scan-speed SCAN_SPEED SCAN_SPEED SCAN_SPEED
                        Scan speed in int [outline, infill, support]
  --send-ratio SEND_RATIO SEND_RATIO SEND_RATIO
                        Send ratio in float [outline, infill, support]
  --temp-bias TEMP_BIAS TEMP_BIAS TEMP_BIAS
                        Temperature bias in int [outline, infill, support]
  --retraction-speed RESTRACTION_SPEED
                        Speed of withdraw/retraction in mm/s
```